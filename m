Return-Path: <linux-arm-msm+bounces-2347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DFA7FCCBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 03:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8ABF1C210D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 02:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E59611F;
	Wed, 29 Nov 2023 02:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4zNijdk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2685C1BC3;
	Tue, 28 Nov 2023 18:12:38 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40b474c925bso18224035e9.3;
        Tue, 28 Nov 2023 18:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701223957; x=1701828757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79YmmR9cXswZrK49RYM13kaDY83DvisuNGYYcbhjp0k=;
        b=Q4zNijdkB1zvSuQnCsqm3IsBNSVNFa5l2/QBOhaVQvVNyZrHBXGJTWqVGeQnB4FHIu
         OaD6J+FEmtuAUqJbDgGU3RthPbI5WAZkxcMfYB53k1ZUpiztPL3mwcPjO0ctCIez/uGf
         lbUIjJ9zF9Fbek9ZE7oiv8Qpp0Q/ryzGKeUfXhWSKwJjEyr2cjbfaWWgCxa8kfxRBAhD
         Ef5a271gHdjALNpdm1BdHzdiOWX8kO83d9Kn/UIJcueU+AtH9SbrQKTqYnv/Pl58WWUz
         s1k2PiubIR+dIRZig4ou6vQIAzyOpOksme4rzThd1PZR7i3gXbm5KrVvJwPeJ6/WmjZR
         FXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701223957; x=1701828757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79YmmR9cXswZrK49RYM13kaDY83DvisuNGYYcbhjp0k=;
        b=oVPF8DONNbw5ixemQrAxst23vj0TWUcT5XtVidfSjIRE83t/UDLG9CWvYwBDnRT5E3
         pExcAAGmMEd7toICjoq4EScfHk0yObfjx3CY6pOGhoD0bcXPv1t/e9R/orBe60QqkTqj
         5a7ZBliLVdhSs3y6cJDalF4gVvSb/J+6ZoQTEoUPW/l6ptZkA5+NCb+8+D5ufezdpSwJ
         XwXBqG/F9f18YeVbvv/C1OGdtoasFs2LbGvzwFeDDVw9pRNlwGp4Betg1C+r9gyUbqj3
         AmbNoA494EyUXh0TZfX7sTPOxAoAHK8w/8+kJtdkN8Fl+HmHs8bmLd1G6/rGt4dA0GHw
         1lrg==
X-Gm-Message-State: AOJu0YzSqpBv2hAZrGXOOODVYOzXnNr78fIhsn/cdUA3YhKpb5de8nGA
	bOUkBZHLZW1FijXoIbMZzmE=
X-Google-Smtp-Source: AGHT+IGn3jLgOwlVml0KrEQwHH8xIw4gpNkpllT3RECFCq+9cLHvzbo8Z4AaBUfCRnoHb48GJ5ZhRA==
X-Received: by 2002:a05:600c:4690:b0:40b:47b5:be4f with SMTP id p16-20020a05600c469000b0040b47b5be4fmr5163729wmo.26.1701223957007;
        Tue, 28 Nov 2023 18:12:37 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id b19-20020a05600c4e1300b0040648217f4fsm321406wmq.39.2023.11.28.18.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 18:12:36 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 08/14] net: phy: at803x: drop specific PHY id check from cable test functions
Date: Wed, 29 Nov 2023 03:12:13 +0100
Message-Id: <20231129021219.20914-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129021219.20914-1-ansuelsmth@gmail.com>
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop specific PHY id check for cable test functions for at803x. This is
done to make functions more generic.

PHYs that requires to set additional reg are moved to specific function
calling the more generic one.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/at803x.c | 48 +++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
index e7d006ca1676..8f5878ccb1a8 100644
--- a/drivers/net/phy/at803x.c
+++ b/drivers/net/phy/at803x.c
@@ -1263,19 +1263,11 @@ static int at803x_cable_test_one_pair(struct phy_device *phydev, int pair)
 }
 
 static int at803x_cable_test_get_status(struct phy_device *phydev,
-					bool *finished)
+					bool *finished, unsigned long pair_mask)
 {
-	unsigned long pair_mask;
 	int retries = 20;
 	int pair, ret;
 
-	if (phydev->phy_id == ATH9331_PHY_ID ||
-	    phydev->phy_id == ATH8032_PHY_ID ||
-	    phydev->phy_id == QCA9561_PHY_ID)
-		pair_mask = 0x3;
-	else
-		pair_mask = 0xf;
-
 	*finished = false;
 
 	/* According to the datasheet the CDT can be performed when
@@ -1310,10 +1302,6 @@ static int at803x_cable_test_start(struct phy_device *phydev)
 	 */
 	phy_write(phydev, MII_BMCR, BMCR_ANENABLE);
 	phy_write(phydev, MII_ADVERTISE, ADVERTISE_CSMA);
-	if (phydev->phy_id != ATH9331_PHY_ID &&
-	    phydev->phy_id != ATH8032_PHY_ID &&
-	    phydev->phy_id != QCA9561_PHY_ID)
-		phy_write(phydev, MII_CTRL1000, 0);
 
 	/* we do all the (time consuming) work later */
 	return 0;
@@ -1664,6 +1652,26 @@ static int at8031_set_wol(struct phy_device *phydev,
 	return at803x_set_wol(phydev, wol);
 }
 
+static int at8031_cable_test_get_status(struct phy_device *phydev,
+					bool *finished)
+{
+	return at803x_cable_test_get_status(phydev, finished, 0xf);
+}
+
+static int at8031_cable_test_start(struct phy_device *phydev)
+{
+	at803x_cable_test_start(phydev);
+	phy_write(phydev, MII_CTRL1000, 0);
+
+	return 0;
+}
+
+static int at8032_cable_test_get_status(struct phy_device *phydev,
+					bool *finished)
+{
+	return at803x_cable_test_get_status(phydev, finished, 0x3);
+}
+
 static int at8035_parse_dt(struct phy_device *phydev)
 {
 	struct device_node *node = phydev->mdio.dev.of_node;
@@ -2205,8 +2213,8 @@ static struct phy_driver at803x_driver[] = {
 	.handle_interrupt	= at803x_handle_interrupt,
 	.get_tunable		= at803x_get_tunable,
 	.set_tunable		= at803x_set_tunable,
-	.cable_test_start	= at803x_cable_test_start,
-	.cable_test_get_status	= at803x_cable_test_get_status,
+	.cable_test_start	= at8031_cable_test_start,
+	.cable_test_get_status	= at8031_cable_test_get_status,
 }, {
 	/* Qualcomm Atheros AR8030 */
 	.phy_id			= ATH8030_PHY_ID,
@@ -2243,8 +2251,8 @@ static struct phy_driver at803x_driver[] = {
 	.handle_interrupt	= at803x_handle_interrupt,
 	.get_tunable		= at803x_get_tunable,
 	.set_tunable		= at803x_set_tunable,
-	.cable_test_start	= at803x_cable_test_start,
-	.cable_test_get_status	= at803x_cable_test_get_status,
+	.cable_test_start	= at8031_cable_test_start,
+	.cable_test_get_status	= at8031_cable_test_get_status,
 }, {
 	/* Qualcomm Atheros AR8032 */
 	PHY_ID_MATCH_EXACT(ATH8032_PHY_ID),
@@ -2259,7 +2267,7 @@ static struct phy_driver at803x_driver[] = {
 	.config_intr		= at803x_config_intr,
 	.handle_interrupt	= at803x_handle_interrupt,
 	.cable_test_start	= at803x_cable_test_start,
-	.cable_test_get_status	= at803x_cable_test_get_status,
+	.cable_test_get_status	= at8032_cable_test_get_status,
 }, {
 	/* ATHEROS AR9331 */
 	PHY_ID_MATCH_EXACT(ATH9331_PHY_ID),
@@ -2272,7 +2280,7 @@ static struct phy_driver at803x_driver[] = {
 	.config_intr		= at803x_config_intr,
 	.handle_interrupt	= at803x_handle_interrupt,
 	.cable_test_start	= at803x_cable_test_start,
-	.cable_test_get_status	= at803x_cable_test_get_status,
+	.cable_test_get_status	= at8032_cable_test_get_status,
 	.read_status		= at803x_read_status,
 	.soft_reset		= genphy_soft_reset,
 	.config_aneg		= at803x_config_aneg,
@@ -2288,7 +2296,7 @@ static struct phy_driver at803x_driver[] = {
 	.config_intr		= at803x_config_intr,
 	.handle_interrupt	= at803x_handle_interrupt,
 	.cable_test_start	= at803x_cable_test_start,
-	.cable_test_get_status	= at803x_cable_test_get_status,
+	.cable_test_get_status	= at8032_cable_test_get_status,
 	.read_status		= at803x_read_status,
 	.soft_reset		= genphy_soft_reset,
 	.config_aneg		= at803x_config_aneg,
-- 
2.40.1


