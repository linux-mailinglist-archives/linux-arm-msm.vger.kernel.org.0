Return-Path: <linux-arm-msm+bounces-56688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36730AA86D6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90526175EAD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 14:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D79E1DFDAB;
	Sun,  4 May 2025 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkxFOY8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5581DE3AB;
	Sun,  4 May 2025 14:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746369948; cv=none; b=AfejmFFfWkdSBb5kA9oiUj0mgNpM1yeBnDkTNjnjppKQmp3S/pysElwRGFGpFzRIBwcOnDlAEm7iyl8lbrtBBBQTyqPOQP6Aho28GeVz1VaGXU+hC4z4AY5EPWhYzS6TsuzEXXNlGqNxEiQWPT2LyVE23X06gpW034ocYZvWxv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746369948; c=relaxed/simple;
	bh=+OIIOz2hdxGL78KHMo4lMpF6RDi0hxMvLnncPwM8Y6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETDsLDpxkYcipIbmBsc/MwSAm7YK/GJDvrzITuUWhMsgVNLZf3XIhWQnY2j1klnT5UhvfSO/UNdytGrq1Wzf87dAtOcl1AUeRvXLJQqlYZE9jT3DpVrTEPhuJ7edfNlcg2CuU28fNr9tO1NCtbOptulNUiE9Ex7sBxPogz9FqiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkxFOY8G; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso5378985a12.1;
        Sun, 04 May 2025 07:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369944; x=1746974744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5tSHqpXtWFPabFBWZB93znRyMEz1UyBewsCCfTVVvw=;
        b=QkxFOY8G2G/KOtCMV9Of4X90XV5oY3SJwWo4LOVzrw8xhDNlww4cO//QO9dSSnYS5s
         nGTRSm01v8qfBDG9h3fEv+7mfbvnnxLwhEkMuy9BJxVc3PSuX6h5begcdApwd1Bkt4+j
         HlYhaWM3kBLg55wPXIGDsxV/XNWRIAuuS9s8daubKXXvDxHYSAxydOQrmQjCWqghmUvo
         09Vx/jFrR5KgMtJ/cYFZwx4GG1Xy7ExJz1L3D9mhjoW3LaCdBcPa8hVdc/K1n7TfDa57
         NbZHhcbXw4mmNO0Y5UDr006JJoQgC4iC6Gk5kAhcMyhYOmUUChOKFG3BE8mAz5raUKbT
         hb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369944; x=1746974744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5tSHqpXtWFPabFBWZB93znRyMEz1UyBewsCCfTVVvw=;
        b=gYVWRXV10qTzNmc6fYh5WWqlKS1w7m2D4KbCfiw2ytRsxO9WHYiHTLkUoEteLwsH+E
         r5+XVc2QXeojNtqbm5+/L6f5ZX6mXDeSlY6jmG8u13B9NlUSFdsVcTutTcQawXzBu+qp
         H3I1ETwdmBnVJXwH3ZElUvh9yk8dg8JR4WbgenzrKMAiomgPxUEFo+SxaRTMDypz21Mb
         99uJO+NKM5bzCZgnjrzTaVZ9KcgrJzNav66AqkFweORIQB8ar7pe+xkO1gDaZoEAvnJ/
         9MnlJWwJL6XbvHz/Gm81rSXTABt9By0FTgfydyNT0PIUQI+PXS8T0TOaf514YzEHgEZ5
         VUuA==
X-Forwarded-Encrypted: i=1; AJvYcCU77vSlQcOnV9avet4zacZ8yX/39eNZsRT6XnsKqoXX5kaulgYneKqheiZHzHVsEC8uLehkBk9tClhkhdVU@vger.kernel.org, AJvYcCUO8UxZ2jhyrn9WVp6aLJNt+p5k1kkek8GzGPS3q80uvReu94EaSjc4hwTM/9CUbQQpupafzu7Wz74X@vger.kernel.org, AJvYcCXZXhatK71pZIqXO2OaTuLWRikp5B6gn6nzB3/9jql5CuuFg0/iOyhXyYbKDXDaa0VtHIHDzw52wsA7t7sZlLA7xW0=@vger.kernel.org, AJvYcCXzV2SyDX+qU8Exl1As1oVUWc6MQrLt5NBw+d3FwhOuMdp7O2FFechZ7S1IiDP0LWqHE9NGiIqKNnNt81Sojg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNA1r7a7CMBcSr+I1ZjuuPEAJB15Ffb0Tx2A7rjS5OaBNmWxIq
	VSB0FJI4lRHLRbtducF5RaZxZBGq3fxUALG+/jcvVHt/xFtOPD94
X-Gm-Gg: ASbGnctBho/V5s36woxmk7pv5hqfpzY2JXHeBp38M4k0KIuP9RkRGH15QmkIqNIUUqO
	Z605BWmNvPWFcc0AjVPV3+R0xtZCN+z50OViYBxYXjwkiobsTzcsrNwItkS6ycDKlsqIhKXHCYQ
	qYn2nv+BPaHiV2KPZwsjggicFDCyB7JqESaYW2CaBR1zhMhTK3IL9vGXiCP4sB3eOu1ACJcTXhC
	SVoc2Oo8EoQo7nJ7/a4Q7c/eW4RJy2AqYz6zF3pL+iTx1zgA7kXQCjmf/D8pvsfvPYupV2jlLG2
	sr2RK4cNEF0Of6xxUfCfc7ll4eb4Up8JO4zDqjOrFr8c3/TtJM4k5pIeYMrPMi6ioyzIzwJE8YM
	LaHJLE3MAa2n+tp7o
X-Google-Smtp-Source: AGHT+IGQBQrBO1qlxwwu+jJ6EzfLuutmdXd+dnHvvpsx5Z89dAJ0PMX5GR7in/J0mFrvVBGWiDk2LQ==
X-Received: by 2002:a05:6402:40c2:b0:5ee:486:9d4b with SMTP id 4fb4d7f45d1cf-5faa8025c59mr4232708a12.34.1746369943770;
        Sun, 04 May 2025 07:45:43 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:43 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/10] phy: phy-snps-eusb2: refactor constructs names
Date: Sun,  4 May 2025 17:45:21 +0300
Message-ID: <20250504144527.1723980-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the driver now resides outside the phy subdirectory under a different
name, refactor all definitions, structures and functions to explicitly
specify what code is Qualcomm-specific and what is not.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 256 +++++++++++++++++------------------
 1 file changed, 128 insertions(+), 128 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 1484691a4..e1b175f48 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -13,15 +13,15 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
-#define USB_PHY_UTMI_CTRL0		(0x3c)
+#define QCOM_USB_PHY_UTMI_CTRL0		(0x3c)
 #define SLEEPM				BIT(0)
 #define OPMODE_MASK			GENMASK(4, 3)
 #define OPMODE_NONDRIVING		BIT(3)
 
-#define USB_PHY_UTMI_CTRL5		(0x50)
+#define QCOM_USB_PHY_UTMI_CTRL5		(0x50)
 #define POR				BIT(1)
 
-#define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
+#define QCOM_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
 #define PHY_ENABLE			BIT(0)
 #define SIDDQ_SEL			BIT(1)
 #define SIDDQ				BIT(2)
@@ -30,15 +30,15 @@
 #define FSEL_19_2_MHZ_VAL		(0x0)
 #define FSEL_38_4_MHZ_VAL		(0x4)
 
-#define USB_PHY_CFG_CTRL_1		(0x58)
+#define QCOM_USB_PHY_CFG_CTRL_1		(0x58)
 #define PHY_CFG_PLL_CPBIAS_CNTRL_MASK	GENMASK(7, 1)
 
-#define USB_PHY_CFG_CTRL_2		(0x5c)
+#define QCOM_USB_PHY_CFG_CTRL_2		(0x5c)
 #define PHY_CFG_PLL_FB_DIV_7_0_MASK	GENMASK(7, 0)
 #define DIV_7_0_19_2_MHZ_VAL		(0x90)
 #define DIV_7_0_38_4_MHZ_VAL		(0xc8)
 
-#define USB_PHY_CFG_CTRL_3		(0x60)
+#define QCOM_USB_PHY_CFG_CTRL_3		(0x60)
 #define PHY_CFG_PLL_FB_DIV_11_8_MASK	GENMASK(3, 0)
 #define DIV_11_8_19_2_MHZ_VAL		(0x1)
 #define DIV_11_8_38_4_MHZ_VAL		(0x0)
@@ -46,73 +46,73 @@
 #define PHY_CFG_PLL_REF_DIV		GENMASK(7, 4)
 #define PLL_REF_DIV_VAL			(0x0)
 
-#define USB_PHY_HS_PHY_CTRL2		(0x64)
+#define QCOM_USB_PHY_HS_PHY_CTRL2	(0x64)
 #define VBUSVLDEXT0			BIT(0)
 #define USB2_SUSPEND_N			BIT(2)
 #define USB2_SUSPEND_N_SEL		BIT(3)
 #define VBUS_DET_EXT_SEL		BIT(4)
 
-#define USB_PHY_CFG_CTRL_4		(0x68)
+#define QCOM_USB_PHY_CFG_CTRL_4		(0x68)
 #define PHY_CFG_PLL_GMP_CNTRL_MASK	GENMASK(1, 0)
 #define PHY_CFG_PLL_INT_CNTRL_MASK	GENMASK(7, 2)
 
-#define USB_PHY_CFG_CTRL_5		(0x6c)
+#define QCOM_USB_PHY_CFG_CTRL_5		(0x6c)
 #define PHY_CFG_PLL_PROP_CNTRL_MASK	GENMASK(4, 0)
 #define PHY_CFG_PLL_VREF_TUNE_MASK	GENMASK(7, 6)
 
-#define USB_PHY_CFG_CTRL_6		(0x70)
+#define QCOM_USB_PHY_CFG_CTRL_6		(0x70)
 #define PHY_CFG_PLL_VCO_CNTRL_MASK	GENMASK(2, 0)
 
-#define USB_PHY_CFG_CTRL_7		(0x74)
+#define QCOM_USB_PHY_CFG_CTRL_7		(0x74)
 
-#define USB_PHY_CFG_CTRL_8		(0x78)
+#define QCOM_USB_PHY_CFG_CTRL_8		(0x78)
 #define PHY_CFG_TX_FSLS_VREF_TUNE_MASK	GENMASK(1, 0)
 #define PHY_CFG_TX_FSLS_VREG_BYPASS	BIT(2)
 #define PHY_CFG_TX_HS_VREF_TUNE_MASK	GENMASK(5, 3)
 #define PHY_CFG_TX_HS_XV_TUNE_MASK	GENMASK(7, 6)
 
-#define USB_PHY_CFG_CTRL_9		(0x7c)
+#define QCOM_USB_PHY_CFG_CTRL_9		(0x7c)
 #define PHY_CFG_TX_PREEMP_TUNE_MASK	GENMASK(2, 0)
 #define PHY_CFG_TX_RES_TUNE_MASK	GENMASK(4, 3)
 #define PHY_CFG_TX_RISE_TUNE_MASK	GENMASK(6, 5)
 #define PHY_CFG_RCAL_BYPASS		BIT(7)
 
-#define USB_PHY_CFG_CTRL_10		(0x80)
+#define QCOM_USB_PHY_CFG_CTRL_10	(0x80)
 
-#define USB_PHY_CFG0			(0x94)
+#define QCOM_USB_PHY_CFG0		(0x94)
 #define DATAPATH_CTRL_OVERRIDE_EN	BIT(0)
 #define CMN_CTRL_OVERRIDE_EN		BIT(1)
 
-#define UTMI_PHY_CMN_CTRL0		(0x98)
+#define QCOM_UTMI_PHY_CMN_CTRL0		(0x98)
 #define TESTBURNIN			BIT(6)
 
-#define USB_PHY_FSEL_SEL		(0xb8)
+#define QCOM_USB_PHY_FSEL_SEL		(0xb8)
 #define FSEL_SEL			BIT(0)
 
-#define USB_PHY_APB_ACCESS_CMD		(0x130)
+#define QCOM_USB_PHY_APB_ACCESS_CMD	(0x130)
 #define RW_ACCESS			BIT(0)
 #define APB_START_CMD			BIT(1)
 #define APB_LOGIC_RESET			BIT(2)
 
-#define USB_PHY_APB_ACCESS_STATUS	(0x134)
+#define QCOM_USB_PHY_APB_ACCESS_STATUS	(0x134)
 #define ACCESS_DONE			BIT(0)
 #define TIMED_OUT			BIT(1)
 #define ACCESS_ERROR			BIT(2)
 #define ACCESS_IN_PROGRESS		BIT(3)
 
-#define USB_PHY_APB_ADDRESS		(0x138)
+#define QCOM_USB_PHY_APB_ADDRESS	(0x138)
 #define APB_REG_ADDR_MASK		GENMASK(7, 0)
 
-#define USB_PHY_APB_WRDATA_LSB		(0x13c)
+#define QCOM_USB_PHY_APB_WRDATA_LSB	(0x13c)
 #define APB_REG_WRDATA_7_0_MASK		GENMASK(3, 0)
 
-#define USB_PHY_APB_WRDATA_MSB		(0x140)
+#define QCOM_USB_PHY_APB_WRDATA_MSB	(0x140)
 #define APB_REG_WRDATA_15_8_MASK	GENMASK(7, 4)
 
-#define USB_PHY_APB_RDDATA_LSB		(0x144)
+#define QCOM_USB_PHY_APB_RDDATA_LSB	(0x144)
 #define APB_REG_RDDATA_7_0_MASK		GENMASK(3, 0)
 
-#define USB_PHY_APB_RDDATA_MSB		(0x148)
+#define QCOM_USB_PHY_APB_RDDATA_MSB	(0x148)
 #define APB_REG_RDDATA_15_8_MASK	GENMASK(7, 4)
 
 static const char * const eusb2_hsphy_vreg_names[] = {
@@ -121,7 +121,7 @@ static const char * const eusb2_hsphy_vreg_names[] = {
 
 #define EUSB2_NUM_VREGS		ARRAY_SIZE(eusb2_hsphy_vreg_names)
 
-struct qcom_snps_eusb2_hsphy {
+struct snps_eusb2_hsphy {
 	struct phy *phy;
 	void __iomem *base;
 
@@ -135,17 +135,17 @@ struct qcom_snps_eusb2_hsphy {
 	struct phy *repeater;
 };
 
-static int qcom_snps_eusb2_hsphy_set_mode(struct phy *p, enum phy_mode mode, int submode)
+static int snps_eusb2_hsphy_set_mode(struct phy *p, enum phy_mode mode, int submode)
 {
-	struct qcom_snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
 
 	phy->mode = mode;
 
 	return phy_set_mode_ext(phy->repeater, mode, submode);
 }
 
-static void qcom_snps_eusb2_hsphy_write_mask(void __iomem *base, u32 offset,
-					     u32 mask, u32 val)
+static void snps_eusb2_hsphy_write_mask(void __iomem *base, u32 offset,
+					u32 mask, u32 val)
 {
 	u32 reg;
 
@@ -158,65 +158,65 @@ static void qcom_snps_eusb2_hsphy_write_mask(void __iomem *base, u32 offset,
 	readl_relaxed(base + offset);
 }
 
-static void qcom_eusb2_default_parameters(struct qcom_snps_eusb2_hsphy *phy)
+static void qcom_eusb2_default_parameters(struct snps_eusb2_hsphy *phy)
 {
 	/* default parameters: tx pre-emphasis */
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
-					 PHY_CFG_TX_PREEMP_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_TX_PREEMP_TUNE_MASK, 0));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_9,
+				    PHY_CFG_TX_PREEMP_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_TX_PREEMP_TUNE_MASK, 0));
 
 	/* tx rise/fall time */
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
-					 PHY_CFG_TX_RISE_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_TX_RISE_TUNE_MASK, 0x2));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_9,
+				    PHY_CFG_TX_RISE_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_TX_RISE_TUNE_MASK, 0x2));
 
 	/* source impedance adjustment */
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
-					 PHY_CFG_TX_RES_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_TX_RES_TUNE_MASK, 0x1));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_9,
+				    PHY_CFG_TX_RES_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_TX_RES_TUNE_MASK, 0x1));
 
 	/* dc voltage level adjustement */
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_8,
-					 PHY_CFG_TX_HS_VREF_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_TX_HS_VREF_TUNE_MASK, 0x3));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_8,
+				    PHY_CFG_TX_HS_VREF_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_TX_HS_VREF_TUNE_MASK, 0x3));
 
 	/* transmitter HS crossover adjustement */
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_8,
-					 PHY_CFG_TX_HS_XV_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_8,
+				    PHY_CFG_TX_HS_XV_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
 }
 
-static int qcom_eusb2_ref_clk_init(struct qcom_snps_eusb2_hsphy *phy)
+static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 {
 	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
 
 	switch (ref_clk_freq) {
 	case 19200000:
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
-						 FSEL_MASK,
-						 FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
 
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_2,
-						 PHY_CFG_PLL_FB_DIV_7_0_MASK,
-						 DIV_7_0_19_2_MHZ_VAL);
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
+					    PHY_CFG_PLL_FB_DIV_7_0_MASK,
+					    DIV_7_0_19_2_MHZ_VAL);
 
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_3,
-						 PHY_CFG_PLL_FB_DIV_11_8_MASK,
-						 DIV_11_8_19_2_MHZ_VAL);
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
+					    PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    DIV_11_8_19_2_MHZ_VAL);
 		break;
 
 	case 38400000:
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
-						 FSEL_MASK,
-						 FIELD_PREP(FSEL_MASK, FSEL_38_4_MHZ_VAL));
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_38_4_MHZ_VAL));
 
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_2,
-						 PHY_CFG_PLL_FB_DIV_7_0_MASK,
-						 DIV_7_0_38_4_MHZ_VAL);
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
+					    PHY_CFG_PLL_FB_DIV_7_0_MASK,
+					    DIV_7_0_38_4_MHZ_VAL);
 
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_3,
-						 PHY_CFG_PLL_FB_DIV_11_8_MASK,
-						 DIV_11_8_38_4_MHZ_VAL);
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
+					    PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    DIV_11_8_38_4_MHZ_VAL);
 		break;
 
 	default:
@@ -224,15 +224,15 @@ static int qcom_eusb2_ref_clk_init(struct qcom_snps_eusb2_hsphy *phy)
 		return -EINVAL;
 	}
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_3,
-					 PHY_CFG_PLL_REF_DIV, PLL_REF_DIV_VAL);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
+				    PHY_CFG_PLL_REF_DIV, PLL_REF_DIV_VAL);
 
 	return 0;
 }
 
-static int qcom_snps_eusb2_hsphy_init(struct phy *p)
+static int snps_eusb2_hsphy_init(struct phy *p)
 {
-	struct qcom_snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
@@ -265,73 +265,73 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 		goto disable_ref_clk;
 	}
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG0,
-					 CMN_CTRL_OVERRIDE_EN, CMN_CTRL_OVERRIDE_EN);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG0,
+				    CMN_CTRL_OVERRIDE_EN, CMN_CTRL_OVERRIDE_EN);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_UTMI_CTRL5, POR, POR);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_UTMI_CTRL5, POR, POR);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
-					 PHY_ENABLE | RETENABLEN, PHY_ENABLE | RETENABLEN);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+				    PHY_ENABLE | RETENABLEN, PHY_ENABLE | RETENABLEN);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_APB_ACCESS_CMD,
-					 APB_LOGIC_RESET, APB_LOGIC_RESET);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_APB_ACCESS_CMD,
+				    APB_LOGIC_RESET, APB_LOGIC_RESET);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, UTMI_PHY_CMN_CTRL0, TESTBURNIN, 0);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_UTMI_PHY_CMN_CTRL0, TESTBURNIN, 0);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_FSEL_SEL,
-					 FSEL_SEL, FSEL_SEL);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_FSEL_SEL,
+				    FSEL_SEL, FSEL_SEL);
 
 	/* update ref_clk related registers */
 	ret = qcom_eusb2_ref_clk_init(phy);
 	if (ret)
-		goto disable_ref_clk;
+		return ret;
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_1,
-					 PHY_CFG_PLL_CPBIAS_CNTRL_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_MASK, 0x1));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_1,
+				    PHY_CFG_PLL_CPBIAS_CNTRL_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_MASK, 0x1));
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_4,
-					 PHY_CFG_PLL_INT_CNTRL_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_INT_CNTRL_MASK, 0x8));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_4,
+				    PHY_CFG_PLL_INT_CNTRL_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_INT_CNTRL_MASK, 0x8));
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_4,
-					 PHY_CFG_PLL_GMP_CNTRL_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_GMP_CNTRL_MASK, 0x1));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_4,
+				    PHY_CFG_PLL_GMP_CNTRL_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_GMP_CNTRL_MASK, 0x1));
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_5,
-					 PHY_CFG_PLL_PROP_CNTRL_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_PROP_CNTRL_MASK, 0x10));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_5,
+				    PHY_CFG_PLL_PROP_CNTRL_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_PROP_CNTRL_MASK, 0x10));
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_6,
-					 PHY_CFG_PLL_VCO_CNTRL_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_VCO_CNTRL_MASK, 0x0));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_6,
+				    PHY_CFG_PLL_VCO_CNTRL_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_VCO_CNTRL_MASK, 0x0));
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_5,
-					 PHY_CFG_PLL_VREF_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_VREF_TUNE_MASK, 0x1));
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_5,
+				    PHY_CFG_PLL_VREF_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_VREF_TUNE_MASK, 0x1));
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL2,
-					 VBUS_DET_EXT_SEL, VBUS_DET_EXT_SEL);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
+				    VBUS_DET_EXT_SEL, VBUS_DET_EXT_SEL);
 
 	/* set default parameters */
 	qcom_eusb2_default_parameters(phy);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL2,
-					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
-					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
+				    USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
+				    USB2_SUSPEND_N_SEL | USB2_SUSPEND_N);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
-					 SIDDQ_SEL, SIDDQ_SEL);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+				    SIDDQ_SEL, SIDDQ_SEL);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
-					 SIDDQ, 0);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+				    SIDDQ, 0);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_UTMI_CTRL5, POR, 0);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_UTMI_CTRL5, POR, 0);
 
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL2,
-					 USB2_SUSPEND_N_SEL, 0);
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
+				    USB2_SUSPEND_N_SEL, 0);
 
 	return 0;
 
@@ -344,9 +344,9 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 	return ret;
 }
 
-static int qcom_snps_eusb2_hsphy_exit(struct phy *p)
+static int snps_eusb2_hsphy_exit(struct phy *p)
 {
-	struct qcom_snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
 
 	clk_disable_unprepare(phy->ref_clk);
 
@@ -357,18 +357,18 @@ static int qcom_snps_eusb2_hsphy_exit(struct phy *p)
 	return 0;
 }
 
-static const struct phy_ops qcom_snps_eusb2_hsphy_ops = {
-	.init		= qcom_snps_eusb2_hsphy_init,
-	.exit		= qcom_snps_eusb2_hsphy_exit,
-	.set_mode	= qcom_snps_eusb2_hsphy_set_mode,
+static const struct phy_ops snps_eusb2_hsphy_ops = {
+	.init		= snps_eusb2_hsphy_init,
+	.exit		= snps_eusb2_hsphy_exit,
+	.set_mode	= snps_eusb2_hsphy_set_mode,
 	.owner		= THIS_MODULE,
 };
 
-static int qcom_snps_eusb2_hsphy_probe(struct platform_device *pdev)
+static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct qcom_snps_eusb2_hsphy *phy;
+	struct snps_eusb2_hsphy *phy;
 	struct phy_provider *phy_provider;
 	struct phy *generic_phy;
 	int ret, i;
@@ -405,7 +405,7 @@ static int qcom_snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(phy->repeater),
 				     "failed to get repeater\n");
 
-	generic_phy = devm_phy_create(dev, NULL, &qcom_snps_eusb2_hsphy_ops);
+	generic_phy = devm_phy_create(dev, NULL, &snps_eusb2_hsphy_ops);
 	if (IS_ERR(generic_phy)) {
 		dev_err(dev, "failed to create phy %d\n", ret);
 		return PTR_ERR(generic_phy);
@@ -418,25 +418,25 @@ static int qcom_snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy_provider))
 		return PTR_ERR(phy_provider);
 
-	dev_info(dev, "Registered Qcom-eUSB2 phy\n");
+	dev_info(dev, "Registered Snps-eUSB2 phy\n");
 
 	return 0;
 }
 
-static const struct of_device_id qcom_snps_eusb2_hsphy_of_match_table[] = {
+static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
 	{ .compatible = "qcom,sm8550-snps-eusb2-phy", },
 	{ },
 };
-MODULE_DEVICE_TABLE(of, qcom_snps_eusb2_hsphy_of_match_table);
+MODULE_DEVICE_TABLE(of, snps_eusb2_hsphy_of_match_table);
 
-static struct platform_driver qcom_snps_eusb2_hsphy_driver = {
-	.probe		= qcom_snps_eusb2_hsphy_probe,
+static struct platform_driver snps_eusb2_hsphy_driver = {
+	.probe		= snps_eusb2_hsphy_probe,
 	.driver = {
-		.name	= "qcom-snps-eusb2-hsphy",
-		.of_match_table = qcom_snps_eusb2_hsphy_of_match_table,
+		.name	= "snps-eusb2-hsphy",
+		.of_match_table = snps_eusb2_hsphy_of_match_table,
 	},
 };
 
-module_platform_driver(qcom_snps_eusb2_hsphy_driver);
-MODULE_DESCRIPTION("Qualcomm SNPS eUSB2 HS PHY driver");
+module_platform_driver(snps_eusb2_hsphy_driver);
+MODULE_DESCRIPTION("Synopsys eUSB2 HS PHY driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0


