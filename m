Return-Path: <linux-arm-msm+bounces-119205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U4qTEcVdV2rqKQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:15:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC5E75CD5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:15:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=lCC8LRuq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119205-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119205-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 939603016B44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BB1353A93;
	Wed, 15 Jul 2026 10:15:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557BB43E4A8
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:15:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110522; cv=none; b=iCW6djORMHvLf2595nVTthrWD7IsiJXlNyy88CVJMaYcglBUZ4zZm4virLGGSqTCWQcJ5PZwacAt86jQLdBmWvACtT05JWJR45q6ukqF5bkrC4cMTSYrbhrtQjD6y2ShYBns1SpTNAR6LozYNMNLJiRWSr3GNfxtSTuqVD5MPxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110522; c=relaxed/simple;
	bh=KkuGd+d8gm2IYS/fTqDghHxK4JS2j1Y2Pxjjj99KUVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nLLRDCiuJjgSHW9g3dOsUAgZmlN6SBvqMNw2SaNOAyMSfshyBbw6j4XMtfeK2BUOzuqWg67s7xLyKw20l4u872AvqU4yW5p3J/96GGFHPTYxMkmvDdCgOiLhY11IKoxQPfzN2xgjctvmTTggmpuXyZCkv9Vsm0Z3vahMrhnoi1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lCC8LRuq; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 353334E40DDB;
	Wed, 15 Jul 2026 10:15:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE5466035C;
	Wed, 15 Jul 2026 10:15:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2134B11BD3BB3;
	Wed, 15 Jul 2026 12:15:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784110511; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=6nZorEMvp7MChNt8EprrNo5x6LonYT52L40mYo/flmA=;
	b=lCC8LRuqbqhF5+67zjnMiKX/JXW/dsD2ubzbGTG69nwblfYueupfLfmAAdWVmdtQsRTGMp
	WHZASHShIpSqBhCKJqR7v6znY3535VIfSjn0yuGsnuJTZYaA0K6zpum2jOFV+PV0wiuJyJ
	18CK63MEltNNUkXaySSOU6Mg3Wgrq9P75dlWRtODqCj9tEFTTQCJ/8rfK+TCYn89SBYwDf
	FDAE2MJpUv8kvvhl7RV/6EOzbbCBFo4dZhQgrBPpo5hUiHokY3FQBMXcQUSJTZSo2ZMNXz
	KXWq/Gwfey9KScx3SQBfMUMjMpViH3YYwQglZqj76Px1ngrZ9UV66NHcWwNHfw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH net-next] net: phy: at803x: Use a helper to check for phy reset existence
Date: Wed, 15 Jul 2026 12:13:54 +0200
Message-ID: <20260715101355.88536-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119205-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,armlinux.org.uk,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux@armlinux.org.uk,m:hkallweit1@gmail.com,m:maxime.chevallier@bootlin.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thomas.petazzoni@bootlin.com,m:linux-arm-msm@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[maxime.chevallier@bootlin.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:from_mime,bootlin.com:mid,bootlin.com:email,bootlin.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAC5E75CD5D

The at803x family of devices are subjected to an errata that requires
hard-reseting the PHY upon link change.

That can only work if there's a physical reset line wired to the PHY,
which the driver checks by looking if there's a reset GPIO configured
for the MDIO device.

The reset may however be controlled through a reset controller, which
isn't accounted for in the errata handling.

Besides that, PHY drivers aren't expected to directly access the
mdiodev's resources directly, let's therefore wrap this with a phylib
helper, that uses a similar mdio helper to check for reset existence.

This was found in preparation for bus-level resource management for
better mdio scan support.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/qcom/at803x.c | 2 +-
 include/linux/mdio.h          | 5 +++++
 include/linux/phy.h           | 5 +++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index ba4dc07752b6..6872dbf77856 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -537,7 +537,7 @@ static void at803x_link_change_notify(struct phy_device *phydev)
 	 * in the FIFO. In such cases, the FIFO enters an error mode it
 	 * cannot recover from by software.
 	 */
-	if (phydev->state == PHY_NOLINK && phydev->mdio.reset_gpio) {
+	if (phydev->state == PHY_NOLINK && phy_device_has_reset(phydev)) {
 		struct at803x_context context;
 
 		at803x_context_save(phydev, &context);
diff --git a/include/linux/mdio.h b/include/linux/mdio.h
index 300805e66592..a7d9e3ae362a 100644
--- a/include/linux/mdio.h
+++ b/include/linux/mdio.h
@@ -86,6 +86,11 @@ static inline void *mdiodev_get_drvdata(struct mdio_device *mdio)
 	return dev_get_drvdata(&mdio->dev);
 }
 
+static inline bool mdiodev_has_reset(struct mdio_device *mdio)
+{
+	return (mdio->reset_gpio || mdio->reset_ctrl);
+}
+
 void mdio_device_free(struct mdio_device *mdiodev);
 struct mdio_device *mdio_device_create(struct mii_bus *bus, int addr);
 int mdio_device_register(struct mdio_device *mdiodev);
diff --git a/include/linux/phy.h b/include/linux/phy.h
index fc680901275b..beff1d6fcc7c 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2231,6 +2231,11 @@ static inline void phy_device_reset(struct phy_device *phydev, int value)
 	mdio_device_reset(&phydev->mdio, value);
 }
 
+static inline bool phy_device_has_reset(struct phy_device *phydev)
+{
+	return mdiodev_has_reset(&phydev->mdio);
+}
+
 #define phydev_err(_phydev, format, args...)	\
 	dev_err(&_phydev->mdio.dev, format, ##args)
 
-- 
2.55.0


