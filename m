Return-Path: <linux-arm-msm+bounces-2345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D85C97FCCB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 03:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0716F1C210BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 02:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0401FDC;
	Wed, 29 Nov 2023 02:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIbZx8VU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7DF19BE;
	Tue, 28 Nov 2023 18:12:37 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b479b9c35so20646755e9.1;
        Tue, 28 Nov 2023 18:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701223956; x=1701828756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5v5tvMkrHBHUZzomW/zRyl4hZOMTbCoPspKHkGLKUJU=;
        b=jIbZx8VUvI/3erv6YejseXUsgbkFvYozPCTtwgR82PVrwefs29qm0YYoW/owwtHIEi
         4CQiSbi7QQHuHiUj9jCareUSILWDCj6W0B5x440Fp/DspsjbuveYPtDrvV4LE0roiZVN
         DO2jND2ESJ6QUBQ3/YL2rDQXHN4m6BIavY/Xw+Po2fs38jYcYSyMX6AUHS9/trpJeTqL
         JyXa8vSKjyPv96z7Xqmo3Y52tT0xR39bUNMniSp5LpCd6clYiZ2aH9jwe9ZRrnp0x/7O
         wu/z3qDbpffeCBVQ9iBE4yhSgssggUsFnlsecaAHYx6+wgICyOzBEyVcOw5uBD03VKaw
         9tZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701223956; x=1701828756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5v5tvMkrHBHUZzomW/zRyl4hZOMTbCoPspKHkGLKUJU=;
        b=dWE6MKa4VezfJY4ismi+7wJIC/B2/Oyymrs4PvWvozPhq0mcd9iWDNxGTH3ZZEKcfq
         qJ31861Hf3dX8fJdAlgiiiIlNnGajJ1Rvf3NdhJgAwSuDQeqNpUefJCMjwGv8N57ToMV
         MACYRG2WO/kaIa1I19uW2uKkr/JChDZcf9nkyqbNVkkhbXtkihvHWCaQR6Kep7FsHiFQ
         X4Wm1TXSznjLDGPg8d1ERlhB+n1B4+bPvDEqaF/FbdisZ0MZcsS7xpNp9uSRGFLQzSgT
         P4+sUoWt3/9W9HyZRmvmLfaw8iwz9qidByy1hV4K9NAarv6k375ffbW2fa2JHUYUW454
         Bh2w==
X-Gm-Message-State: AOJu0YwNLqW+hdSLWpIrnF8fr1DR/JgBPr8ypEU8nN1/BfkC8GLZCG6n
	F/IGsKQNWxWrnccpQ4iSboE=
X-Google-Smtp-Source: AGHT+IGpBoZ9r/dFQC/s54Tzgn+bgbTrRMGct36TBZ+7oM+l8g/cjPs7xMLNxLE9yXEmUlujQ63Opw==
X-Received: by 2002:a05:600c:1989:b0:408:3f87:cba with SMTP id t9-20020a05600c198900b004083f870cbamr11340219wmq.39.1701223955827;
        Tue, 28 Nov 2023 18:12:35 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id b19-20020a05600c4e1300b0040648217f4fsm321406wmq.39.2023.11.28.18.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 18:12:35 -0800 (PST)
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
Subject: [net-next PATCH 07/14] net: phy: at803x: move at8035 specific DT parse to dedicated probe
Date: Wed, 29 Nov 2023 03:12:12 +0100
Message-Id: <20231129021219.20914-8-ansuelsmth@gmail.com>
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

Move at8035 specific DT parse for clock out frequency to dedicated probe
to make at803x probe function more generic.

This is to tidy code and no behaviour change are intended.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/at803x.c | 62 ++++++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 19 deletions(-)

diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
index b83422c6db74..e7d006ca1676 100644
--- a/drivers/net/phy/at803x.c
+++ b/drivers/net/phy/at803x.c
@@ -647,23 +647,6 @@ static int at803x_parse_dt(struct phy_device *phydev)
 
 		priv->clk_25m_reg |= FIELD_PREP(AT803X_CLK_OUT_MASK, sel);
 		priv->clk_25m_mask |= AT803X_CLK_OUT_MASK;
-
-		/* Fixup for the AR8030/AR8035. This chip has another mask and
-		 * doesn't support the DSP reference. Eg. the lowest bit of the
-		 * mask. The upper two bits select the same frequencies. Mask
-		 * the lowest bit here.
-		 *
-		 * Warning:
-		 *   There was no datasheet for the AR8030 available so this is
-		 *   just a guess. But the AR8035 is listed as pin compatible
-		 *   to the AR8030 so there might be a good chance it works on
-		 *   the AR8030 too.
-		 */
-		if (phydev->drv->phy_id == ATH8030_PHY_ID ||
-		    phydev->drv->phy_id == ATH8035_PHY_ID) {
-			priv->clk_25m_reg &= AT8035_CLK_OUT_MASK;
-			priv->clk_25m_mask &= AT8035_CLK_OUT_MASK;
-		}
 	}
 
 	ret = of_property_read_u32(node, "qca,clk-out-strength", &strength);
@@ -1681,6 +1664,47 @@ static int at8031_set_wol(struct phy_device *phydev,
 	return at803x_set_wol(phydev, wol);
 }
 
+static int at8035_parse_dt(struct phy_device *phydev)
+{
+	struct device_node *node = phydev->mdio.dev.of_node;
+	struct at803x_priv *priv = phydev->priv;
+	u32 freq;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_OF_MDIO))
+		return 0;
+
+	ret = of_property_read_u32(node, "qca,clk-out-frequency", &freq);
+	if (!ret) {
+		/* Fixup for the AR8030/AR8035. This chip has another mask and
+		 * doesn't support the DSP reference. Eg. the lowest bit of the
+		 * mask. The upper two bits select the same frequencies. Mask
+		 * the lowest bit here.
+		 *
+		 * Warning:
+		 *   There was no datasheet for the AR8030 available so this is
+		 *   just a guess. But the AR8035 is listed as pin compatible
+		 *   to the AR8030 so there might be a good chance it works on
+		 *   the AR8030 too.
+		 */
+		priv->clk_25m_reg &= AT8035_CLK_OUT_MASK;
+		priv->clk_25m_mask &= AT8035_CLK_OUT_MASK;
+	}
+
+	return 0;
+}
+
+static int at8035_probe(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = at803x_probe(phydev);
+	if (ret)
+		return ret;
+
+	return at8035_parse_dt(phydev);
+}
+
 static int qca83xx_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
@@ -2167,7 +2191,7 @@ static struct phy_driver at803x_driver[] = {
 	PHY_ID_MATCH_EXACT(ATH8035_PHY_ID),
 	.name			= "Qualcomm Atheros AR8035",
 	.flags			= PHY_POLL_CABLE_TEST,
-	.probe			= at803x_probe,
+	.probe			= at8035_probe,
 	.config_aneg		= at803x_config_aneg,
 	.config_init		= at803x_config_init,
 	.soft_reset		= genphy_soft_reset,
@@ -2188,7 +2212,7 @@ static struct phy_driver at803x_driver[] = {
 	.phy_id			= ATH8030_PHY_ID,
 	.name			= "Qualcomm Atheros AR8030",
 	.phy_id_mask		= AT8030_PHY_ID_MASK,
-	.probe			= at803x_probe,
+	.probe			= at8035_probe,
 	.config_init		= at803x_config_init,
 	.link_change_notify	= at803x_link_change_notify,
 	.set_wol		= at803x_set_wol,
-- 
2.40.1


