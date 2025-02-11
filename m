Return-Path: <linux-arm-msm+bounces-47637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC5DA315F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 20:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39E62188A8C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 19:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57C526461E;
	Tue, 11 Feb 2025 19:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WR2rrlUT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C4226462F;
	Tue, 11 Feb 2025 19:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739303396; cv=none; b=i7fBYRttW6CfPVZoh0sprxErv2TyGrya0NdvRW5PzPq7Ab9A4OFr78ega5MVKic4BKqHx+0lofy2wNMoonDTU9dnQ2XHH0NReL8QGREVfHW/WimFg8sQAgQrUE2EzXqKR7QzmFXhAk0xgTYxM3hc8Wq3KxYoIsMxcl66qQpZKnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739303396; c=relaxed/simple;
	bh=AdacFwxw8gCcFmJP49qm7Ryyc5F5/zv0U/QYhsmE8Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AhH/ueC+GnwObRlKfjmi+wPHZQJEQMrggTH1+XqKaO3kHfXCVqajG1rGJZIDtm5xwt25o2dKw96kpSX5REAIfGWnvNHW7si+XIiAx0p6aBorAncBn9pCkIZ75nGS5HmttNDS3HOABUYzbHsxSXALdV+jmvTZrmZIclEIY7V+6N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WR2rrlUT; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f2339dcfdso1680485ad.1;
        Tue, 11 Feb 2025 11:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739303394; x=1739908194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m33azoSAmxnYqUN7kdaWmQ74O6kiFs5HwyKhfWMOt38=;
        b=WR2rrlUTdHJ3WX1EffErGiAgjzWQwDlbIOH69XPza1zv1CLAurN9qQ5GEhdRpkC4Fz
         8p8nBsQNAytVuyn+qtnjwnVunpbTTyYqlblntU3CRhlYDVTrdHQXwy0eN+nFjm6sQ16K
         1X2ziyGG1sipF2SnKK06IZS0Rgg+80f1VPm081cXPl6+S2T38Qi/SUvsQcpxEUwzDbQP
         dzLzJWaTlk5Y5aPMcs5B64gJgFIrRAFyjqzwi6+JOs0ElrI9POBmkdn4vKewYvH2EGgD
         84tDfnX2UGh9wv5UED07joMtQpXrG40vgbU2tzm2ZNnmn3CDtES3QvFb8DwC8j0zGn7W
         nnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739303394; x=1739908194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m33azoSAmxnYqUN7kdaWmQ74O6kiFs5HwyKhfWMOt38=;
        b=dHWZj85RZtz1MQ58mqPvtXVwa65d+jZ8QY79GMcnNgVDsXXsncoGVxh0B84+iZ0wt4
         kKYJu95+GrnFjO8pTfEcajBsfSzmWzpyxDBOpi4LWy813KdVdCaDG/NFR/MpalvuwHGH
         DbWCsAlgK7RendjmfmoY8A1mO8JPYaNtQLCWmV+gxQA5uutm4uZQVfPuNxa+KVnzCvDG
         OUZSFFXO/atbEsgu8xCgouhhtlb5Fsy/uOlB95ZBg56YKo7uOz7OQx35OcXWRghWbqE4
         0SEMnV+QQROOhemuBvp7lGT6DAMu2DqDcXaW8bjQCdDsjyruys2oJE3Yxsd1g6jHddKS
         di/A==
X-Forwarded-Encrypted: i=1; AJvYcCVHHd/FZ3lJJrtq+n5tR0GRha09HTaKq9jlVYzbL5blt/kfalRgONMbGzRYy0XJkS8V2Qbce2aPa5c4@vger.kernel.org
X-Gm-Message-State: AOJu0YyZnF691rqTZaXZ6B+7Gw8uMi4eV9rpOQIThNQX34GVRSgl2qWj
	Rp7UX0LzBzkllns7HyzQVb7KkRr5mnP2jDxxrYAWnOzdLVmMmQOoLqrPI0JO
X-Gm-Gg: ASbGncvRm6GCSLu9ZWAok7ZsCgx31/EzsCDOiYeZNF/8RvL0ItgMLGhPaWctiHxenqk
	f6ilyRmYagPjxuia7qP2I5WvPYLvpWea5/q1v++YyKDS26CJhWuH10mWe31yIEt3Hbit0zPDRGo
	34dJYLvFXae0dnQ6fEcueWCpSOx6qFvR3aibCwFPWejfngNhJZSnMMiMVpwqSGGXR4BYKHc3oiB
	OrIiwizs/v8trAkj14yfKwlTM7ersZA/Ex+DySfGm083EC0lGK6fGO+9W36LrIXrYxGvcEdVmMG
	11mgqqKWWrcVkP+GgpMSFcDndZJsNISVcdyKUA==
X-Google-Smtp-Source: AGHT+IHgUt7/1e5Y1Rm5wxmA+YxwTLPy4SYjE4gmuRFLSsYG8r1UsEqOOC1KvqzVlJm/8PLQVSbLMw==
X-Received: by 2002:a17:903:1a24:b0:215:8847:4377 with SMTP id d9443c01a7336-220bc2197ccmr4877365ad.15.1739303394028;
        Tue, 11 Feb 2025 11:49:54 -0800 (PST)
Received: from localhost.localdomain ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e68bsm99815035ad.169.2025.02.11.11.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 11:49:53 -0800 (PST)
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	quic_wcheng@quicinc.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	"James A. MacInnes" <james.a.macinnes@gmail.com>
Subject: [PATCH 2/3] regulator: qcom_usb_vbus: Add support for PMI8998 VBUS
Date: Tue, 11 Feb 2025 11:49:15 -0800
Message-ID: <20250211194918.2517593-3-james.a.macinnes@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211194918.2517593-1-james.a.macinnes@gmail.com>
References: <20250211194918.2517593-1-james.a.macinnes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch extends the Qualcomm USB VBUS regulator driver to support
PMI8998 PMIC alongside the existing support for PM8150B.

Key changes:
- Added current limit tables specific to PMI8998.
- Dynamically configure the VBUS regulator based on the PMIC type.
- Updated debug messages to reflect successful initialization for
  supported PMICs.
- Changed registration log message

These changes ensure proper VBUS current limit configuration and
compatibility across multiple Qualcomm PMICs.

Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
---
 drivers/regulator/qcom_usb_vbus-regulator.c | 33 +++++++++++++++++----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index cd94ed67621f..bfcb77698ba2 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -20,10 +20,15 @@
 #define OTG_CFG				0x53
 #define OTG_EN_SRC_CFG			BIT(1)
 
-static const unsigned int curr_table[] = {
+static const unsigned int curr_table_pm8150b[] = {
 	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
 };
 
+static const unsigned int curr_table_pmi8998[] = {
+	250000, 500000, 750000, 1000000,
+	1250000, 1500000, 1750000, 2000000,
+};
+
 static const struct regulator_ops qcom_usb_vbus_reg_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -37,8 +42,8 @@ static struct regulator_desc qcom_usb_vbus_rdesc = {
 	.ops = &qcom_usb_vbus_reg_ops,
 	.owner = THIS_MODULE,
 	.type = REGULATOR_VOLTAGE,
-	.curr_table = curr_table,
-	.n_current_limits = ARRAY_SIZE(curr_table),
+	.curr_table = NULL,
+	.n_current_limits = 0,
 };
 
 static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
@@ -50,6 +55,7 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 	struct regulator_init_data *init_data;
 	int ret;
 	u32 base;
+	const char *pmic_type;
 
 	ret = of_property_read_u32(dev->of_node, "reg", &base);
 	if (ret < 0) {
@@ -68,6 +74,19 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 	if (!init_data)
 		return -ENOMEM;
 
+	// Determine PMIC type
+	pmic_type = of_device_get_match_data(dev);
+	if (pmic_type && strcmp(pmic_type, "pmi8998") == 0) {
+		qcom_usb_vbus_rdesc.curr_table = curr_table_pmi8998;
+		qcom_usb_vbus_rdesc.n_current_limits =
+			ARRAY_SIZE(curr_table_pmi8998);
+	} else if (pmic_type && strcmp(pmic_type, "pm8150b") == 0) {
+		qcom_usb_vbus_rdesc.curr_table = curr_table_pm8150b;
+		qcom_usb_vbus_rdesc.n_current_limits =
+			ARRAY_SIZE(curr_table_pm8150b);
+	} else {
+		return -ENODEV;
+	}
 	qcom_usb_vbus_rdesc.enable_reg = base + CMD_OTG;
 	qcom_usb_vbus_rdesc.enable_mask = OTG_EN;
 	qcom_usb_vbus_rdesc.csel_reg = base + OTG_CURRENT_LIMIT_CFG;
@@ -80,18 +99,22 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 	rdev = devm_regulator_register(dev, &qcom_usb_vbus_rdesc, &config);
 	if (IS_ERR(rdev)) {
 		ret = PTR_ERR(rdev);
-		dev_err(dev, "not able to register vbus reg %d\n", ret);
+		dev_err(dev, "Failed to register vbus reg %d\n", ret);
 		return ret;
 	}
 
 	/* Disable HW logic for VBUS enable */
 	regmap_update_bits(regmap, base + OTG_CFG, OTG_EN_SRC_CFG, 0);
 
+	dev_info(dev, "Registered QCOM %s VBUS regulator\n",
+		 pmic_type);
+
 	return 0;
 }
 
 static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
-	{ .compatible = "qcom,pm8150b-vbus-reg" },
+	{ .compatible = "qcom,pm8150b-vbus-reg", .data = "pm8150b" },
+	{ .compatible = "qcom,pmi8998-vbus-reg", .data = "pmi8998" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_usb_vbus_regulator_match);
-- 
2.43.0


