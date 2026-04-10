Return-Path: <linux-arm-msm+bounces-102712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP+XKJsv2WkOnQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 19:12:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB203DAEFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 19:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6ACD53005AC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 17:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4701218ADD;
	Fri, 10 Apr 2026 17:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H2mTnqkV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDD73DFC77
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 17:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775841046; cv=none; b=DNOw3Yt5r8DmFdNM5nvog2JuWP2b9GrkcMEf3jCYB6ZbRXpDmA1eOOaGsn7dM/AptEKggX4HHfzRGjOidjDvp8pdZJRTYvKzv9iwKVcVFtaOUcibQyZwpQ/UUavMec0nhXjv9VcNvfxlMfQAHcgKe+sarnbd+U28kohWg3Ir1Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775841046; c=relaxed/simple;
	bh=eStU3i7xbyOQ/8mrBlXosGPOz2LATtGTCKZTSHKcY5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MV2oJ0x9ZE/y3Ci8g3MmoAW3WBu/wBQcO6T8YDPn/r5uXcyLqJM6yPEXY5DhO2Mu9ICddpev7POzVxJ6XWAYQgcGEd9rhlrjB/iH7cLaFEYGLqVackTc0k47nf8wLCLrOzw8xXSnQi9NqjFXKqt+z2AJF471tW/JSrdc2o7FU3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H2mTnqkV; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 38AAAC5C1A5;
	Fri, 10 Apr 2026 17:11:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5A19603F0;
	Fri, 10 Apr 2026 17:10:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D2A210450077;
	Fri, 10 Apr 2026 19:10:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775841034; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=F1NfZqIejbtKCh+NaPP95bKnLVDVR4KaSEjAHJAWrvc=;
	b=H2mTnqkVE9iX/NoE/W02infw9hN/6+HTpEprCljrFAK8/Kz9ir1+nuyiXxumzVDnJdi8Hl
	MROsh3dTvTXTj5fPx+tgSh67l3i5TAQUZuKA5AIKMc79Ol5ot8LNWXGUsOZJJzv3e92i1Z
	2i3PPDKL0M9JkWGe0Q2stiPisUdBVEGGslXZKbhEAV7JltNgC/+yODJTx7X/RFi2DDSji7
	BcY5Dw+Ux8JerCwkqhl9oQR6L6P1GzkgmGAX7MGDxESJoNNC3k5ZZpG497fVs2eV7Qe5hT
	y4FT+Nzg1dDxGl8kidsDZL4Y2yUPkuUKUfuJF1ObmQ6Dzk7/2zCF65iqp5aMRg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH net] net: phy: qcom: at803x: Use the correct bit to disable extended next page
Date: Fri, 10 Apr 2026 19:10:20 +0200
Message-ID: <20260410171021.1277138-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102712-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1FB203DAEFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As noted in the blamed commit, the AR8035 and other PHYs from this
family advertise the Extended Next Page support by default, which may be
understood by some partners as this PHY being multi-gig capable.

The fix is to disable XNP advertising, which is done by setting bit 12
of the Auto-Negotiation Advertisement Register (MII_ADVERTISE).

The blamed commit incorrectly uses MDIO_AN_CTRL1_XNP, which is bit 13 as per
802.3 : 45.2.7.1 AN control register (Register 7.0)

BIT 12 in MII_ADVERTISE is wrapped by ADVERTISE_RESV, used by some
drivers such as the aquantia one. 802.3 Clause 28 defines bit 12 as
Extended Next Page ability, at least in recent versions of the standard.

Let's add a define for it and use it in the at803x driver.

Fixes: 3c51fa5d2afe ("net: phy: ar803x: disable extended next page bit")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
Some further driver cleanup can be done to remove the use of
ADVERTISE_RESV, but the macro is uapi now so it'll have to stay.

 drivers/net/phy/qcom/at803x.c | 2 +-
 include/uapi/linux/mii.h      | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 338acd11a9b6..023c1fe0cd14 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -524,7 +524,7 @@ static int at803x_config_init(struct phy_device *phydev)
 	 * behaviour but we still need to accommodate it. XNP is only needed
 	 * for 10Gbps support, so disable XNP.
 	 */
-	return phy_modify(phydev, MII_ADVERTISE, MDIO_AN_CTRL1_XNP, 0);
+	return phy_modify(phydev, MII_ADVERTISE, ADVERTISE_XNP, 0);
 }
 
 static void at803x_link_change_notify(struct phy_device *phydev)
diff --git a/include/uapi/linux/mii.h b/include/uapi/linux/mii.h
index 39f7c44baf53..61d6edad4b94 100644
--- a/include/uapi/linux/mii.h
+++ b/include/uapi/linux/mii.h
@@ -82,7 +82,8 @@
 #define ADVERTISE_100BASE4	0x0200	/* Try for 100mbps 4k packets  */
 #define ADVERTISE_PAUSE_CAP	0x0400	/* Try for pause               */
 #define ADVERTISE_PAUSE_ASYM	0x0800	/* Try for asymetric pause     */
-#define ADVERTISE_RESV		0x1000	/* Unused...                   */
+#define ADVERTISE_XNP		0x1000  /* Extended Next Page */
+#define ADVERTISE_RESV		ADVERTISE_XNP /* Used to be reserved */
 #define ADVERTISE_RFAULT	0x2000	/* Say we can detect faults    */
 #define ADVERTISE_LPACK		0x4000	/* Ack link partners response  */
 #define ADVERTISE_NPAGE		0x8000	/* Next page bit               */
-- 
2.49.0


