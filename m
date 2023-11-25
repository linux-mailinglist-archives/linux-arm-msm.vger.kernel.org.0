Return-Path: <linux-arm-msm+bounces-1918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ADA7F8741
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 01:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23CB51C21069
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 00:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8CF818;
	Sat, 25 Nov 2023 00:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STS20KIn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 155CC19B7;
	Fri, 24 Nov 2023 16:35:28 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40b2c8e91afso18143695e9.3;
        Fri, 24 Nov 2023 16:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700872526; x=1701477326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcMwiWHz9qYe+Y9Zq1AR8weNzBMQy4Mg6NfLIwNy3q4=;
        b=STS20KInglK4T9aWAyYP67hUY3l26ecE5JPqDcazThMB4rEFMe2DhZNdgm7vBJ1S+K
         Cw0i6SAakB+wZeloCB2EFOTJkCC0i0xQarAJDsEAYQi/FLRiAPoTTfOEu2sNx334pd2y
         htMP6DjeBsISLZyGKr34xdtz7itI0PDC6+8FfzGcok+V7vDlcFL0YXWaBjU0zB9mA/iV
         r7/X3Tq52/VIFX5C2sigE4LW6vRw8U4il5hva9roAs+QozGmZyK8NxSAelKLorGk5RyC
         RI6Go0Tj+vytNKK9ndWyeuqW95NKARhjOjaZs2X/aOiA0i2PBhrXPrmPM6QX7GTPIaB5
         Bv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700872526; x=1701477326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcMwiWHz9qYe+Y9Zq1AR8weNzBMQy4Mg6NfLIwNy3q4=;
        b=tMNmagI+fWhccbr0AcJVXFmiBkKdR61ubLXZxR+uO2MuAjDIKRPyT7QFIAXsnfAmSc
         1AAylVLzFE6QtBuZneeFyAa3uuQBkcdBA1/mTzwGLRkJqaSFl/PC3xs/npt+QVe156on
         nPTRosw2hIdi+KVsSq24RHrTKAE1g3ch7OyGiU5AVvcTHRHfkC2SUt9faFB0Bl68ocqA
         mvLlgqYBdiPejFWgYw2ebd+Zrqbi3Ae9fzr6KXxwllxODX8rjgm0Hny4yvTHVTmTYlaZ
         pbSrCJzlgtMLuFQgQeEGfY4GgU30fQD1oAx7ERud0L1yyuLP3LuyTToWyibIjws++oug
         7mTA==
X-Gm-Message-State: AOJu0YwxtbEgEVKX0KUCZm5XJgF8KhRDlUbww1GRcLmBMZIgmiKXQfo1
	Q8q4pvjo+HqRWffC65DTofY=
X-Google-Smtp-Source: AGHT+IFXmHhNEQUs3v0Z74fnQ+w5I7liDT133TiEHE1H6er7Lzi3dwTa6E8rghUZEgwLREoIIGNEZw==
X-Received: by 2002:a05:600c:314c:b0:405:95ae:4a94 with SMTP id h12-20020a05600c314c00b0040595ae4a94mr3259912wmo.5.1700872526488;
        Fri, 24 Nov 2023 16:35:26 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u13-20020a05600c00cd00b00405718cbeadsm4268005wmm.1.2023.11.24.16.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 16:35:26 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH v2 06/11] net: phy: move mmd_phy_indirect to generic header
Date: Sat, 25 Nov 2023 01:11:22 +0100
Message-Id: <20231125001127.5674-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move mmd_phy_indirect function from phy-core to generic phy.h to permit
future usage for PHY package read/write_mmd.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phy-core.c | 14 --------------
 include/linux/phy.h        | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 966c93cbe616..b4f80847eefd 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -526,20 +526,6 @@ int phy_speed_down_core(struct phy_device *phydev)
 	return 0;
 }
 
-static void mmd_phy_indirect(struct mii_bus *bus, int phy_addr, int devad,
-			     u16 regnum)
-{
-	/* Write the desired MMD Devad */
-	__mdiobus_write(bus, phy_addr, MII_MMD_CTRL, devad);
-
-	/* Write the desired MMD register address */
-	__mdiobus_write(bus, phy_addr, MII_MMD_DATA, regnum);
-
-	/* Select the Function : DATA with no post increment */
-	__mdiobus_write(bus, phy_addr, MII_MMD_CTRL,
-			devad | MII_MMD_CTRL_NOINCR);
-}
-
 /**
  * __phy_read_mmd - Convenience function for reading a register
  * from an MMD on a given PHY.
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 677b5bceac45..0f3b21c90583 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1356,6 +1356,20 @@ static inline int __phy_modify_changed(struct phy_device *phydev, u32 regnum,
 					regnum, mask, set);
 }
 
+static inline void mmd_phy_indirect(struct mii_bus *bus, int phy_addr, int devad,
+				    u16 regnum)
+{
+	/* Write the desired MMD Devad */
+	__mdiobus_write(bus, phy_addr, MII_MMD_CTRL, devad);
+
+	/* Write the desired MMD register address */
+	__mdiobus_write(bus, phy_addr, MII_MMD_DATA, regnum);
+
+	/* Select the Function : DATA with no post increment */
+	__mdiobus_write(bus, phy_addr, MII_MMD_CTRL,
+			devad | MII_MMD_CTRL_NOINCR);
+}
+
 /*
  * phy_read_mmd - Convenience function for reading a register
  * from an MMD on a given PHY.
-- 
2.40.1


