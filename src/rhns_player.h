#pragma once

#include "rehlds_interfaces.h"

#define MAX_PLAYERS 32

enum client_auth_kind {
	CA_UNKNOWN = 0,
	CA_STEAM,
	CA_HLTV,
	CA_NOSTEAM
};

class CRHNSPlayer {
private:
	int m_Id;
	IGameClient* m_pClient;
	client_auth_kind m_AuthKind;

public:
	void init(IGameClient* cl);
	void clear();
	IGameClient* getClient() { return m_pClient; }
	void authenticated(client_auth_kind authkind);
	const char* GetSteamId();
	client_auth_kind GetAuthKind() { return m_AuthKind; }
};

extern CRHNSPlayer g_Players[MAX_PLAYERS];

extern void Renosteam_Players_Init();
extern CRHNSPlayer* GetPlayerByUserIdPtr(USERID_t* pUserId);
extern CRHNSPlayer* GetPlayerByClientPtr(IGameClient* cl);
