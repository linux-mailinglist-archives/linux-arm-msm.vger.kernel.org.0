Return-Path: <linux-arm-msm+bounces-54494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECD7A8B847
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 14:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A640190574F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 12:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B3A24C080;
	Wed, 16 Apr 2025 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZbWGhzD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E07724BC07;
	Wed, 16 Apr 2025 12:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805086; cv=none; b=Gk/quiBddYo7ewPA/zr/98WN0Q7j3L8TU5vlxMftYf2SgudZhq1k2/K5R1UizfU7teeg5mmy8T0Y255a3YhDGptAlukGhFUMHe3uKonQrw5TLAv5AXTOw35zb9uICDb4HMlcC1rymSHeAccs2zLv8wB/HZMor5xz5kBWClYDYyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805086; c=relaxed/simple;
	bh=0eqbW/ADX0/3OFgPSkh+pNLMavSwHy31i9yMWuD4ffI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TvVk36+fdxZ9AxmRnuXLsC066dZyecFShXclIrSUHSJFc3zhMbWVXcs5E67L5kWGwsuvu+sfrwB9V2M0mpLDZYXPc1aqGeUfkBDFtDMeBZQLbozsAlNSaxM5tvmXAuQG0P+SztSmmSjU/jAiON/Y8unkSdYwqZ2SPmzJvFZxF6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZbWGhzD; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227cf12df27so5411635ad.0;
        Wed, 16 Apr 2025 05:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744805084; x=1745409884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ie7hREUa4SMJAa/pZTbegFZ7KD0h8GRA9ZCVQg1tUQo=;
        b=eZbWGhzDJhSPdJpzPPslkfmlwPP7KaRcuE/uH38hn4P4XDNRrztdjko/SRd/ySGHt0
         YuHPrGEF3EXkQTHUyBWvGecoBqXKzmYwlCmmqVwtkFid5jeMommqYIOmwdTg+hREVRF3
         Q9Zo7djlAxxAAGK1NBo8vS5PBz3Tm59hEitcxnFWQyd46bU7GaM3aRLuJtixuq7LDa00
         ASRc+NgYcO2nINdZqOh7xCXzENeDnp/XD+0aCxuakxF+Iajz+KgPZGRMyepuLx34F8KF
         KcXc0hdY3l8q1AlwB/R8qTDWoMBsCsTez/QOp9naTbW9DoaySTr78+ko3kz/wzvlX3RJ
         R+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805084; x=1745409884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ie7hREUa4SMJAa/pZTbegFZ7KD0h8GRA9ZCVQg1tUQo=;
        b=Ya2XW/D35Yidhj79U/AUjgDa8USZDZR71C7YJHTFlgwAsR95xbm2F7ivFIrSBTN5me
         /E5PUbmTg1dOlCxrZP02LzetTxOH6wAMW2ADupZfgWV0/J1cJ/R6hsUVpRkNvWuBmzyK
         MaH7SZ3M39/YFjSo4T/ijd4wk8WtFrOaf8zR9xG16Knsk9W24oEEst3upnfWf+vBKgRF
         6xnbxhLshArZRdq50OhPF7cf4rCEgeNjjPfI7GSPgDZ96HQaJDrf/xBOdsIY/iFQCH+r
         CWbvtqEWr84FkUoDFi/RTDPhpBB1/FZevzxM6paAtMgKgibshm/SQ7EnngV+ykR2CNEl
         napw==
X-Forwarded-Encrypted: i=1; AJvYcCUpyBl7X8pAX0ImUim0aEXIPP34vq5yGgl5kl5Rkx3uidcDX1t0nPh/rnDuGr5/GcPS2CIHdaYMxe2I@vger.kernel.org, AJvYcCWE1pUD/ekGwg28z6phdjbk7dhVT0ind6u4LxeToCPZyWtZ1b/IXRHbslf3L49zd98SpMOGAY9Z28xyoQFz@vger.kernel.org
X-Gm-Message-State: AOJu0YznXpuKbcLaPnOI2wD7xv/thUa7SRUh+0PKAVgYZok7Vs3bsupY
	d3bbIDMyRTNLZdtSFcMyIQu/047cQpUxCr/fmnbMiOW6iJ1fLVHh
X-Gm-Gg: ASbGncvVoblRBylfdcLsPpEiT9MoCeCIUzDw3ac1oIOLJPNNqqB1GeRCR7K8HPu3lVx
	/i16zMGMAFlntAvpqNPNgjVxYN1EJO8J9gTLUGGcJIIaV5I0EBl29+nK4dxG3NQPrpTMNFkA1Bd
	jN0533f79Fn98Ztt5R3NJbonc2WyY11HVOxJ4qyl6+D3qteGLWwUJW+Ew1uMH7XOV+lK4dMSK07
	IUijLSWkI/bIZma3OrNR3e8WfweBuvXvMuwdq8NmcfJ53fyTzVkuJ5+rTDtLwsduH+3kR7fldTk
	dJupP7S5hbfCYZcG15Y+BTkIbd14gCz9z+pqu/2NahBysYIq4A==
X-Google-Smtp-Source: AGHT+IF3c77cgFMGhot+IttF6abeW9f9RiIxUS3EHqsIYXeT4jB4a6Vdk4WPQdSgQAWsR+Iaultg5w==
X-Received: by 2002:a17:903:188:b0:220:cfb7:56eb with SMTP id d9443c01a7336-22c35f1cd23mr19478865ad.26.1744805083546;
        Wed, 16 Apr 2025 05:04:43 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33febfb3sm12033385ad.259.2025.04.16.05.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:04:43 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] phy: qualcomm: phy-qcom-eusb2-repeater: rework reg override handler
Date: Wed, 16 Apr 2025 20:02:01 +0800
Message-ID: <20250416120201.244133-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416120201.244133-1-mitltlatltl@gmail.com>
References: <20250416120201.244133-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In downstream tree, many registers need to be overridden, it varies
from devices and platforms, with these registers getting more, adding
a handler for this is helpful.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 105 +++++++++++++++---
 1 file changed, 92 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index 6bd1b3c75..a4b75e70e 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -68,12 +68,27 @@ struct eusb2_repeater_cfg {
 	int num_vregs;
 };
 
+struct tune {
+	const char * const tune_name;
+	const char * const host_tune_name;
+	enum eusb2_reg_layout init_tbl_idx;
+	u8 tune_reg;
+	u8 tune;
+	u8 host_tune;
+};
+
+struct tune_cfg {
+	struct tune *tune_tbl;
+	int tune_tbl_size;
+};
+
 struct eusb2_repeater {
 	struct device *dev;
 	struct regmap *regmap;
 	struct phy *phy;
 	struct regulator_bulk_data *vregs;
 	const struct eusb2_repeater_cfg *cfg;
+	struct tune_cfg *tune_cfg;
 	u32 base;
 	enum phy_mode mode;
 };
@@ -108,6 +123,79 @@ static const struct eusb2_repeater_cfg smb2360_eusb2_cfg = {
 	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
 };
 
+static struct tune tune_tbl[] = {
+	{
+		.tune_name = "qcom,tune-usb2-amplitude",
+		.host_tune_name = "qcom,tune-usb2-amplitude-host",
+		.init_tbl_idx = TUNE_IUSB2,
+		.tune_reg = EUSB2_TUNE_IUSB2,
+	},
+	{
+		.tune_name = "qcom,tune-usb2-disc-thres",
+		.host_tune_name = "qcom,tune-usb2-disc-thres-host",
+		.init_tbl_idx = TUNE_HSDISC,
+		.tune_reg = EUSB2_TUNE_HSDISC,
+
+	},
+	{
+		.tune_name = "qcom,tune-usb2-squelch",
+		.host_tune_name = "qcom,tune-usb2-squelch-host",
+		.init_tbl_idx = TUNE_SQUELCH_U,
+		.tune_reg = EUSB2_TUNE_SQUELCH_U,
+	},
+	{
+		.tune_name = "qcom,tune-usb2-preem",
+		.host_tune_name = "qcom,tune-usb2-preem-host",
+		.init_tbl_idx = TUNE_USB2_PREEM,
+		.tune_reg = EUSB2_TUNE_USB2_PREEM,
+	},
+};
+
+static struct tune_cfg tune_cfg = {
+	.tune_tbl	= tune_tbl,
+	.tune_tbl_size	= ARRAY_SIZE(tune_tbl),
+};
+
+static void eusb2_repeater_write_overrides(struct eusb2_repeater *rptr,
+					   bool is_host_mode)
+{
+	struct tune *tune_tbl;
+	int size, i;
+
+	tune_tbl = rptr->tune_cfg->tune_tbl;
+	size = rptr->tune_cfg->tune_tbl_size;
+
+	for (i = 0; i < size; ++i)
+		regmap_write(rptr->regmap, rptr->base + tune_tbl[i].tune_reg,
+			     is_host_mode ? tune_tbl[i].host_tune : tune_tbl[i].tune);
+}
+
+static void eusb2_repeater_parse_dt(struct eusb2_repeater *rptr)
+{
+	struct device_node *np = rptr->dev->of_node;
+	const u32 *init_tbl = rptr->cfg->init_tbl;
+	struct tune *tune_tbl;
+	int size, i, idx;
+
+	tune_tbl = tune_cfg.tune_tbl;
+	size = tune_cfg.tune_tbl_size;
+
+	for (i = 0; i < size; ++i) {
+		/* set default values from init_tbl */
+		idx = tune_tbl[i].init_tbl_idx;
+		tune_tbl[i].tune = init_tbl[idx];
+		tune_tbl[i].host_tune = init_tbl[idx];
+
+		/* update values from dt */
+		of_property_read_u8(np, tune_tbl[i].tune_name,
+				    &tune_tbl[i].tune);
+		of_property_read_u8(np, tune_tbl[i].host_tune_name,
+				    &tune_tbl[i].host_tune);
+	}
+
+	rptr->tune_cfg = &tune_cfg;
+}
+
 static int eusb2_repeater_init_vregs(struct eusb2_repeater *rptr)
 {
 	int num = rptr->cfg->num_vregs;
@@ -127,20 +215,12 @@ static int eusb2_repeater_init_vregs(struct eusb2_repeater *rptr)
 static int eusb2_repeater_init(struct phy *phy)
 {
 	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
-	struct device_node *np = rptr->dev->of_node;
 	struct regmap *regmap = rptr->regmap;
 	const u32 *init_tbl = rptr->cfg->init_tbl;
-	u8 tune_usb2_preem = init_tbl[TUNE_USB2_PREEM];
-	u8 tune_hsdisc = init_tbl[TUNE_HSDISC];
-	u8 tune_iusb2 = init_tbl[TUNE_IUSB2];
 	u32 base = rptr->base;
 	u32 val;
 	int ret;
 
-	of_property_read_u8(np, "qcom,tune-usb2-amplitude", &tune_iusb2);
-	of_property_read_u8(np, "qcom,tune-usb2-disc-thres", &tune_hsdisc);
-	of_property_read_u8(np, "qcom,tune-usb2-preem", &tune_usb2_preem);
-
 	ret = regulator_bulk_enable(rptr->cfg->num_vregs, rptr->vregs);
 	if (ret)
 		return ret;
@@ -153,14 +233,9 @@ static int eusb2_repeater_init(struct phy *phy)
 	regmap_write(regmap, base + EUSB2_TUNE_USB2_HS_COMP_CUR, init_tbl[TUNE_USB2_HS_COMP_CUR]);
 	regmap_write(regmap, base + EUSB2_TUNE_USB2_EQU, init_tbl[TUNE_USB2_EQU]);
 	regmap_write(regmap, base + EUSB2_TUNE_USB2_SLEW, init_tbl[TUNE_USB2_SLEW]);
-	regmap_write(regmap, base + EUSB2_TUNE_SQUELCH_U, init_tbl[TUNE_SQUELCH_U]);
 	regmap_write(regmap, base + EUSB2_TUNE_RES_FSDIF, init_tbl[TUNE_RES_FSDIF]);
 	regmap_write(regmap, base + EUSB2_TUNE_USB2_CROSSOVER, init_tbl[TUNE_USB2_CROSSOVER]);
 
-	regmap_write(regmap, base + EUSB2_TUNE_USB2_PREEM, tune_usb2_preem);
-	regmap_write(regmap, base + EUSB2_TUNE_HSDISC, tune_hsdisc);
-	regmap_write(regmap, base + EUSB2_TUNE_IUSB2, tune_iusb2);
-
 	ret = regmap_read_poll_timeout(regmap, base + EUSB2_RPTR_STATUS, val, val & RPTR_OK, 10, 5);
 	if (ret)
 		dev_err(rptr->dev, "initialization timed-out\n");
@@ -177,6 +252,7 @@ static int eusb2_repeater_set_mode(struct phy *phy,
 
 	switch (mode) {
 	case PHY_MODE_USB_HOST:
+		eusb2_repeater_write_overrides(rptr, true);
 		/*
 		 * CM.Lx is prohibited when repeater is already into Lx state as
 		 * per eUSB 1.2 Spec. Below implement software workaround until
@@ -186,6 +262,7 @@ static int eusb2_repeater_set_mode(struct phy *phy,
 		regmap_write(regmap, base + EUSB2_FORCE_VAL_5, V_CLK_19P2M_EN);
 		break;
 	case PHY_MODE_USB_DEVICE:
+		eusb2_repeater_write_overrides(rptr, false);
 		/*
 		 * In device mode clear host mode related workaround as there
 		 * is no repeater reset available, and enable/disable of
@@ -252,6 +329,8 @@ static int eusb2_repeater_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	eusb2_repeater_parse_dt(rptr);
+
 	rptr->phy = devm_phy_create(dev, np, &eusb2_repeater_ops);
 	if (IS_ERR(rptr->phy)) {
 		dev_err(dev, "failed to create PHY: %d\n", ret);
-- 
2.49.0


