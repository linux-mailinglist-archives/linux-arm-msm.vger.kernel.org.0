Return-Path: <linux-arm-msm+bounces-1161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F9A7F14CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A64F1C2187A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 13:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E42A1BDFC;
	Mon, 20 Nov 2023 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAzqogHA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217CED5D;
	Mon, 20 Nov 2023 05:51:23 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40842752c6eso16250665e9.1;
        Mon, 20 Nov 2023 05:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488281; x=1701093081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qB4fi/eCMZ5pGZWSsqUWAAl8tjVSzuSGp4YLf0Eq9M0=;
        b=mAzqogHAf1D7ONAHYaBcvRLY8y8kp/v0Pmr+NA15XISsQ68WKVxe+MPI62RYMcTuqX
         T/wDomRuB61Ycq5TaUsjptkKJ0ngs0NU3Co6kMI7zZKfrOVhYYptixAyRo39SJwuKtE4
         S9YNa+UmbAg0+mq+EW8GXRqq+ZfMOagqG+ADHss4ZYr2DIrEJb8y/Uvhns/7wKIbNwjI
         EteutBXF/bTkPeADtYfyvPZAlXUe7RRGYVyCd7qallSSewVHbwPtzu72daTsrCL3U95z
         iYDjRvK2naegCoteX4a7w+pweSOj6ZL+FiB1XvvXNxrcUU5F4GJPFhQ5LTCiqzE7qa/D
         U46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488281; x=1701093081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB4fi/eCMZ5pGZWSsqUWAAl8tjVSzuSGp4YLf0Eq9M0=;
        b=nEkkqFiShc7tRFlYqoR40AlK0l9CgzgbKoevTdb6hbYHTD4r1ObpwwRpM4WPFmDAqX
         cSK2U3sX86uKUlG85uxhq0s9BcnAutttimY3jL2jelN+VS4H8gxWaUJVgH05OhPVe1O+
         +vT/DAWPbvMhSrCYFMGrk3SIpJvhVys6LbEYwRmUFWd/bMWSeQRnnY0DG92lqq4dC1FV
         WzL/uU4W7YToEvFicHtRtwQ/i0a8/twt0+WO2QyhMWEac2xQKdN2OcUzEqVkDwEQqiPQ
         grv7yxHv7qfqaqFKELPR0XNuR75PL6tClYUJdoHGqJr5tF0wwZVu2zyWCG7GteFmn6A3
         4XzQ==
X-Gm-Message-State: AOJu0YyLvP+ZNK4htVM3VkBq9ld5Mqix24jp4BQRUq0f3+PYM3ssSoRf
	ytGnyl2S/VLMfygibhmzvmw=
X-Google-Smtp-Source: AGHT+IFcMey6TnOXOu5MSlLdoD6XtZU3LWDsq7B13n3sOVMBzRaLsi3NtlxaruTsT9S5irAnnjq1Bg==
X-Received: by 2002:a05:600c:1914:b0:409:7d0:d20b with SMTP id j20-20020a05600c191400b0040907d0d20bmr5623787wmq.24.1700488281411;
        Mon, 20 Nov 2023 05:51:21 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:21 -0800 (PST)
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
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH 06/14] net: phy: add support for shared priv data size for PHY package in DT
Date: Mon, 20 Nov 2023 14:50:33 +0100
Message-Id: <20231120135041.15259-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120135041.15259-1-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for defining shared data size for PHY package defined in DT.

A PHY driver has to define the value .phy_package_priv_data_size to make
the generic OF PHY package function alloc priv data in the shared struct
for the PHY package.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phy_device.c | 7 ++++++-
 include/linux/phy.h          | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 452fd69e8924..91d17129b774 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3200,6 +3200,7 @@ static int of_phy_package(struct phy_device *phydev)
 	struct device_node *package_node;
 	const char *global_phy_name;
 	int i, global_phys_num, ret;
+	int shared_priv_data_size;
 	int *global_phy_addrs;
 
 	if (!node)
@@ -3252,8 +3253,12 @@ static int of_phy_package(struct phy_device *phydev)
 		global_phy_addrs[i] = addr;
 	}
 
+	shared_priv_data_size = 0;
+	if (phydev->drv->phy_package_priv_data_size)
+		shared_priv_data_size = phydev->drv->phy_package_priv_data_size;
+
 	ret = devm_phy_package_join(&phydev->mdio.dev, phydev, global_phy_addrs,
-				    global_phys_num, 0);
+				    global_phys_num, shared_priv_data_size);
 	if (ret)
 		goto exit;
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 5e595a0a43b6..7c47c12cffa0 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -896,6 +896,8 @@ struct phy_led {
  *   for PHY package global init. If defined, list is compared
  *   with DT values to match correct PHY phandle order. List
  *   last element MUST BE an empty string.
+ * @phy_package_priv_data_size: Size of the priv data to alloc
+ *   for shared struct of PHY package.
  *
  * All functions are optional. If config_aneg or read_status
  * are not implemented, the phy core uses the genphy versions.
@@ -915,6 +917,7 @@ struct phy_driver {
 	const void *driver_data;
 	unsigned int phy_package_global_phy_num;
 	const char * const *phy_package_global_phy_names;
+	unsigned int phy_package_priv_data_size;
 
 	/**
 	 * @soft_reset: Called to issue a PHY software reset
-- 
2.40.1


