Return-Path: <linux-arm-msm+bounces-36349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1DC9B57FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 00:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEE0C2837D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 23:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CF020C034;
	Tue, 29 Oct 2024 23:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+P8g4y1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AB620C001;
	Tue, 29 Oct 2024 23:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730245606; cv=none; b=MRkaON4RGV5wYowv1DtoXV7K7Xi2KkF2yF4M7T7VCVJBAYlZB39RpmjAX4N5HHCGzQWr1PRbV76nwQUrWHDvvv2k0Y2Qsm5Ee9hMR+ata0WVaEHWeOBwinvsb1ogHO+MUoyPm/0KXjJgi+e9NnmVRX9YU34VpIDqNobuN8TgrWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730245606; c=relaxed/simple;
	bh=8XBp4F4iONR8uEUZBp+RtV28I5FbOp5N7WLMmKuu8sY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIYjBu52s7O8P88sqrpgaHp97M9YYVmv9qS+YZ3AR+Tm3wHV2jDkTzY10IP8NoyWw09ZkC+QK7iaP5WW4XcvmQkR2v9Z0TOp1xdmq6dgPbfuAQ9dWHntYicMXbmfnpNyKb9ZgELvnQZRSTIsLM8cJTQrVgweuzrU7uPfm1BTq3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+P8g4y1; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20ca7fc4484so41747435ad.3;
        Tue, 29 Oct 2024 16:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730245603; x=1730850403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h+jF7+/wy1zJKHitIOxInif26MR0AFPTEaBZnPmRRhc=;
        b=c+P8g4y1RlEemX3lpqw+5A27s7xGkPe3EA6cEc6MMrUQdiPdiWBLpHtfp3jZOYf4Cc
         LKeUBiF/qvFYBsxVJBTlAVUsybV90r5iZrL3lT1lFszSlLSA+bSdVCJ2WB9Fp9JKsNRs
         Vl3Ic7vFGl3X6iw2QZ1f18MIzM1zH/GhWDrVq/GqmK4VcBbAdEGOHk73C1imb36CGVu/
         LlnoTgk923PJ/fVRv8ZU7vnk3aDNzNhYTOs1ImjY71kmbJk3m8Sj30vzNE7S+VpgAdeC
         D+m5nBtzFjUy3uT8AF8anW01dexb7D/E+vL0AlgnIhx5e/w9D3fqEZXDktljWQ0gwQlt
         Ln0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245603; x=1730850403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+jF7+/wy1zJKHitIOxInif26MR0AFPTEaBZnPmRRhc=;
        b=naBN2+fbEV50gZGbFy47rlf2Iz9q8hxaegg0FTow2M64MruHX/NbNEQDaz25uQXKrR
         JQVd7TTgb6/Zw96nkIfEPCI0kJXEpRJO36f2XGFerZzESnled4Y7CGDNiJ64ei5qWTSM
         DImD/iarJ7eSnYhNuu5bOZSS1guShCoadl7OjsQd24JMEKJCyomPb2noIVRoGw5nXt1G
         feofADXtyKSoFMvMut/Qy9yqNsHB18B8ksF4GomN5D1Bm6aZHyxj3gMisa/EvnWVzUo4
         IGj/s7U9fuQvkgd1Yxnc2+TZgTNZ/pEVAtJ54DDUQhwxKbB0UsCDzfKEFxbYTWzIYBYh
         S/Eg==
X-Forwarded-Encrypted: i=1; AJvYcCW3Wxj7G1hDJ1QmYGMTc5K+MUptkCVSsl9a6mxlrDBotq/2ZuEwhsMFyfJqwxmU6hagpTVrGwCa4B5AXaJA@vger.kernel.org, AJvYcCX6HzebH8RVbv3+xrE911qqZJnD/TbvvSsnLBAxrCYToNPtZ1EzVH3NKQNw7LI8EHTgE5CupjDW8WjIUQyp@vger.kernel.org
X-Gm-Message-State: AOJu0YzktXzFKw85SwO+snYHpfm8gAikbN2wNKQe47GbkMIjKkQzEMc8
	uW8JK6Npckmbslda9ABZMk7sJV6Uy2HVJVPwNFe+7bliTxNrWiLxwM/3zIlc
X-Google-Smtp-Source: AGHT+IHdXUd5atdv8fKvdzCF5RNLF7tk5MBWicmuXdZ2OKMYMGZ4ZHlL5l63grziVbkHW345aIiXkg==
X-Received: by 2002:a17:902:ecc1:b0:20c:a8cf:fa19 with SMTP id d9443c01a7336-210c68cc7a5mr205592205ad.22.1730245603503;
        Tue, 29 Oct 2024 16:46:43 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf4435asm72121155ad.55.2024.10.29.16.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:46:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrei Botila <andrei.botila@oss.nxp.com>,
	Rosen Penev <rosenp@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST)
Subject: [PATCH net-next] net: phy: use ethtool string helpers
Date: Tue, 29 Oct 2024 16:46:41 -0700
Message-ID: <20241029234641.11448-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the preferred way to copy ethtool strings.

Avoids incrementing pointers all over the place.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/phy/adin.c            |  6 ++----
 drivers/net/phy/icplus.c          |  3 +--
 drivers/net/phy/marvell.c         | 12 ++++--------
 drivers/net/phy/micrel.c          |  6 ++----
 drivers/net/phy/mscc/mscc_main.c  |  3 +--
 drivers/net/phy/nxp-c45-tja11xx.c |  6 ++----
 drivers/net/phy/nxp-cbtx.c        |  2 +-
 drivers/net/phy/qcom/qca83xx.c    |  6 ++----
 8 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index 2e1a46e121d9..a2a862bae2ed 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -801,10 +801,8 @@ static void adin_get_strings(struct phy_device *phydev, u8 *data)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(adin_hw_stats); i++) {
-		strscpy(&data[i * ETH_GSTRING_LEN],
-			adin_hw_stats[i].string, ETH_GSTRING_LEN);
-	}
+	for (i = 0; i < ARRAY_SIZE(adin_hw_stats); i++)
+		ethtool_puts(&data, adin_hw_stats[i].string);
 }
 
 static int adin_read_mmd_stat_regs(struct phy_device *phydev,
diff --git a/drivers/net/phy/icplus.c b/drivers/net/phy/icplus.c
index a00a667454a9..ee438b71a0b4 100644
--- a/drivers/net/phy/icplus.c
+++ b/drivers/net/phy/icplus.c
@@ -540,8 +540,7 @@ static void ip101g_get_strings(struct phy_device *phydev, u8 *data)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(ip101g_hw_stats); i++)
-		strscpy(data + i * ETH_GSTRING_LEN,
-			ip101g_hw_stats[i].name, ETH_GSTRING_LEN);
+		ethtool_puts(&data, ip101g_hw_stats[i].name);
 }
 
 static u64 ip101g_get_stat(struct phy_device *phydev, int i)
diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 28aec37acd2c..cd50cd6a7f75 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -2020,10 +2020,8 @@ static void marvell_get_strings(struct phy_device *phydev, u8 *data)
 	int count = marvell_get_sset_count(phydev);
 	int i;
 
-	for (i = 0; i < count; i++) {
-		strscpy(data + i * ETH_GSTRING_LEN,
-			marvell_hw_stats[i].string, ETH_GSTRING_LEN);
-	}
+	for (i = 0; i < count; i++)
+		ethtool_puts(&data, marvell_hw_stats[i].string);
 }
 
 static void marvell_get_strings_simple(struct phy_device *phydev, u8 *data)
@@ -2031,10 +2029,8 @@ static void marvell_get_strings_simple(struct phy_device *phydev, u8 *data)
 	int count = marvell_get_sset_count_simple(phydev);
 	int i;
 
-	for (i = 0; i < count; i++) {
-		strscpy(data + i * ETH_GSTRING_LEN,
-			marvell_hw_stats_simple[i].string, ETH_GSTRING_LEN);
-	}
+	for (i = 0; i < count; i++)
+		ethtool_puts(&data, marvell_hw_stats_simple[i].string);
 }
 
 static u64 marvell_get_stat(struct phy_device *phydev, int i)
diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 65b0a3115e14..43c82a87bc3a 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -2018,10 +2018,8 @@ static void kszphy_get_strings(struct phy_device *phydev, u8 *data)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(kszphy_hw_stats); i++) {
-		strscpy(data + i * ETH_GSTRING_LEN,
-			kszphy_hw_stats[i].string, ETH_GSTRING_LEN);
-	}
+	for (i = 0; i < ARRAY_SIZE(kszphy_hw_stats); i++)
+		ethtool_puts(&data, kszphy_hw_stats[i].string);
 }
 
 static u64 kszphy_get_stat(struct phy_device *phydev, int i)
diff --git a/drivers/net/phy/mscc/mscc_main.c b/drivers/net/phy/mscc/mscc_main.c
index 6f74ce0ab1aa..bee381200ab8 100644
--- a/drivers/net/phy/mscc/mscc_main.c
+++ b/drivers/net/phy/mscc/mscc_main.c
@@ -139,8 +139,7 @@ static void vsc85xx_get_strings(struct phy_device *phydev, u8 *data)
 		return;
 
 	for (i = 0; i < priv->nstats; i++)
-		strscpy(data + i * ETH_GSTRING_LEN, priv->hw_stats[i].string,
-			ETH_GSTRING_LEN);
+		ethtool_puts(&data, priv->hw_stats[i].string);
 }
 
 static u64 vsc85xx_get_stat(struct phy_device *phydev, int i)
diff --git a/drivers/net/phy/nxp-c45-tja11xx.c b/drivers/net/phy/nxp-c45-tja11xx.c
index 7e328c2a29a4..ade544bc007d 100644
--- a/drivers/net/phy/nxp-c45-tja11xx.c
+++ b/drivers/net/phy/nxp-c45-tja11xx.c
@@ -1140,13 +1140,11 @@ static void nxp_c45_get_strings(struct phy_device *phydev, u8 *data)
 
 	for (i = 0; i < count; i++) {
 		if (i < ARRAY_SIZE(common_hw_stats)) {
-			strscpy(data + i * ETH_GSTRING_LEN,
-				common_hw_stats[i].name, ETH_GSTRING_LEN);
+			ethtool_puts(&data, common_hw_stats[i].name);
 			continue;
 		}
 		idx = i - ARRAY_SIZE(common_hw_stats);
-		strscpy(data + i * ETH_GSTRING_LEN,
-			phy_data->stats[idx].name, ETH_GSTRING_LEN);
+		ethtool_puts(&data, phy_data->stats[idx].name);
 	}
 }
 
diff --git a/drivers/net/phy/nxp-cbtx.c b/drivers/net/phy/nxp-cbtx.c
index 145703f0a406..3d25491043a3 100644
--- a/drivers/net/phy/nxp-cbtx.c
+++ b/drivers/net/phy/nxp-cbtx.c
@@ -182,7 +182,7 @@ static int cbtx_get_sset_count(struct phy_device *phydev)
 
 static void cbtx_get_strings(struct phy_device *phydev, u8 *data)
 {
-	strncpy(data, "100btx_rx_err", ETH_GSTRING_LEN);
+	ethtool_puts(&data, "100btx_rx_err");
 }
 
 static void cbtx_get_stats(struct phy_device *phydev,
diff --git a/drivers/net/phy/qcom/qca83xx.c b/drivers/net/phy/qcom/qca83xx.c
index a05d0df6fa16..7a5039920b9f 100644
--- a/drivers/net/phy/qcom/qca83xx.c
+++ b/drivers/net/phy/qcom/qca83xx.c
@@ -42,10 +42,8 @@ static void qca83xx_get_strings(struct phy_device *phydev, u8 *data)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(qca83xx_hw_stats); i++) {
-		strscpy(data + i * ETH_GSTRING_LEN,
-			qca83xx_hw_stats[i].string, ETH_GSTRING_LEN);
-	}
+	for (i = 0; i < ARRAY_SIZE(qca83xx_hw_stats); i++)
+		ethtool_puts(&data, qca83xx_hw_stats[i].string);
 }
 
 static u64 qca83xx_get_stat(struct phy_device *phydev, int i)
-- 
2.47.0


