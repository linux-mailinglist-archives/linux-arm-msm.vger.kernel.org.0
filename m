Return-Path: <linux-arm-msm+bounces-47674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CBCA31AFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 02:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B1561650A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 01:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1029A8633A;
	Wed, 12 Feb 2025 01:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkNQ0TxJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E28482CD;
	Wed, 12 Feb 2025 01:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739322505; cv=none; b=WH/o2v0Uz0vam7ZoJLGdseTOmnCnKhXH9s0m5gnFLp6uk9CH9nXnw26GnQ0n2l2vi1FInKK+8TZ2CHjAOAPqrCthI3PDghCF3x64Z9QtgwFJ9/D0yATKuESTlvJLpajZjRnOu83HGe9IfyyJNxcX7b0lb53tFBhAPTPNC5CqjyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739322505; c=relaxed/simple;
	bh=NnPqFwECXlng2m0SEfvDcQ9fe7r5dK6tNvpp/cqfWJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQyxujGJI8lOcZZxLIkeJkQxIn3OU8ibbW5AlnPY+BKGsIcXqa29vPQVEmHBlS06rKwmjgjblICYXw3ATxqIbj+LzcXUkfDRJzLAhtCQHTdqXcgy5pyIDG3iRaz14n/63PbBiOhX+BKRooxgKlNHqSbZ8WseYBTbx6AhmvUGexE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkNQ0TxJ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fa1a3c88c5so8216116a91.3;
        Tue, 11 Feb 2025 17:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739322502; x=1739927302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shRMn7M37CuuTlRmUI4my+XR0Bdop4ipT1c9qnH219c=;
        b=RkNQ0TxJhqZEkRLCX+vW3BloQ2/Cg8yi8VON7xVPboDTYQk4uf4u8/lUQoupiMhipr
         +bUsB+N1Z/tiQLlvF/etlBEtvSprqz61PD9R7VBGFqSOhKwbSQ33y8IOoDg6fknWOr+3
         ZRKZQqszD8+7R3SPnuFdyP0HIsxHgStPzUjeX3czE6wqAh5/9njJFDEmPjuBAeFCUuQ/
         faANza7u8FUHx01q3iiX5mPWXhHndpYWhq85NfpMH69KA8cp22EjHcKIMjcGjA6Lr5GB
         hdpcjHZZRT+RIaZHnqXyRA+RupNvOLxrFnWKzqytvm+c22Qta4Qy0XgqS4sMEyue/x1S
         RTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739322502; x=1739927302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shRMn7M37CuuTlRmUI4my+XR0Bdop4ipT1c9qnH219c=;
        b=Vto8U/Dv9R9/OX9ChOktIQbZDrqeABL497JGMZB7rjyX/bDlbm5r1xJ3IX+N+qkdL/
         2FuYN6cJiIhDeACp7D5ZU9Sy5CPuoOKNBxD/SGUo51oKk47sW8wZZGeR9NTamXGyClWp
         zpAfUwYeRUiyTzu7M9oPQg2nNt4xkn3hXI3hOLc7YEPjqv0H1YqLjYIxm+SajAgVY9kG
         idJj8NFGQuFprL6m2EkU78WecKWezG3Z7O7jFitHQzPPj533nQvLwWZGDCYoNC0WwiQi
         KbXSO/fwHSdek5zXGkANjmcwJnsHE7/aa20gl5yqhNtkT/9xAPlaFBMU18OvKhZ/aYq/
         r5qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6BJp95avZHHHCfXEn6Q9hJ8OGCfMtmPszqITwQFadrRSiRjkFZoImzP4Rh/BoKMAunwOUCt+JK5ir@vger.kernel.org
X-Gm-Message-State: AOJu0YxB4yVlOPM0Vn4WwzOSf8xnLgDB2lOuLGQUfeoaY8+2SVJl2k5c
	y5oy/EZvpJJlgTD7ErgDsjzVX2Oly6/raolZjLxP1UL9aowNOpUi8rZmx8Kd
X-Gm-Gg: ASbGnctKlQ8vCDK4eFguLTwJjdSV1VeKxAxSu2bwkzfgCdwn43c6BYuQXhcKf7LFKWH
	dSNiG9/JeOdgWxCXC2g3IcA/u26A+lB0pgh2YbXqrGETg+dG0MDbXnxcIaruOdLx2+QQb7CgG+b
	OAmAtPEw3ftZVQ4/BBL0879i2iJqd/Uq5S2/cyV+/9HaXqsEmHoL8mwOAXrqec1U4C+grfLuWi1
	fYNOY/i6VGQPluTEVkK/XEORxmRvSAh9+z+COOh2UfQWQZ6JvweYvLkZz7W2T1sDpZHL1qJg1oS
	ZKNNbA6xAyQ7TXiFQzFSfxaARm1zdLaVRjHsWQ==
X-Google-Smtp-Source: AGHT+IHTR66kM/tAv6mAaJTtkOxLfcf9aWO/JCZcrvLxALl858qnRVi+bpFPjbNQGjoRnQ3h5DAwXw==
X-Received: by 2002:a17:90b:54d0:b0:2f4:47fc:7f18 with SMTP id 98e67ed59e1d1-2fbf8f32cddmr1367234a91.10.1739322502371;
        Tue, 11 Feb 2025 17:08:22 -0800 (PST)
Received: from localhost.localdomain ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98d3d16sm190408a91.13.2025.02.11.17.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 17:08:22 -0800 (PST)
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
Date: Tue, 11 Feb 2025 17:07:43 -0800
Message-ID: <20250212010744.2554574-3-james.a.macinnes@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212010744.2554574-1-james.a.macinnes@gmail.com>
References: <20250212010744.2554574-1-james.a.macinnes@gmail.com>
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
 drivers/regulator/qcom_usb_vbus-regulator.c | 38 ++++++++++++++++++---
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index cd94ed67621f..804dd1a9e057 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -20,10 +20,30 @@
 #define OTG_CFG				0x53
 #define OTG_EN_SRC_CFG			BIT(1)
 
-static const unsigned int curr_table[] = {
+struct msm_vbus_desc {
+	const unsigned int *curr_table;
+	unsigned int n_current_limits;
+};
+
+static const unsigned int curr_table_pm8150b[] = {
 	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
 };
 
+static const unsigned int curr_table_pmi8998[] = {
+	250000, 500000, 750000, 1000000,
+	1250000, 1500000, 1750000, 2000000,
+};
+
+static const struct msm_vbus_desc msm_vbus_desc_pm8150b = {
+	.curr_table = curr_table_pm8150b,
+	.n_current_limits = ARRAY_SIZE(curr_table_pm8150b),
+};
+
+static const struct msm_vbus_desc msm_vbus_desc_pmi8998 = {
+	.curr_table = curr_table_pmi8998,
+	.n_current_limits = ARRAY_SIZE(curr_table_pmi8998),
+};
+
 static const struct regulator_ops qcom_usb_vbus_reg_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -37,8 +57,6 @@ static struct regulator_desc qcom_usb_vbus_rdesc = {
 	.ops = &qcom_usb_vbus_reg_ops,
 	.owner = THIS_MODULE,
 	.type = REGULATOR_VOLTAGE,
-	.curr_table = curr_table,
-	.n_current_limits = ARRAY_SIZE(curr_table),
 };
 
 static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
@@ -48,6 +66,7 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	struct regulator_config config = { };
 	struct regulator_init_data *init_data;
+	const struct msm_vbus_desc *quirks;
 	int ret;
 	u32 base;
 
@@ -68,6 +87,12 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 	if (!init_data)
 		return -ENOMEM;
 
+	quirks = of_device_get_match_data(dev);
+	if (!quirks)
+		return -ENODEV;
+
+	qcom_usb_vbus_rdesc.curr_table = quirks->curr_table;
+	qcom_usb_vbus_rdesc.n_current_limits = quirks->n_current_limits;
 	qcom_usb_vbus_rdesc.enable_reg = base + CMD_OTG;
 	qcom_usb_vbus_rdesc.enable_mask = OTG_EN;
 	qcom_usb_vbus_rdesc.csel_reg = base + OTG_CURRENT_LIMIT_CFG;
@@ -80,18 +105,21 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 	rdev = devm_regulator_register(dev, &qcom_usb_vbus_rdesc, &config);
 	if (IS_ERR(rdev)) {
 		ret = PTR_ERR(rdev);
-		dev_err(dev, "not able to register vbus reg %d\n", ret);
+		dev_err(dev, "Failed to register vbus reg %d\n", ret);
 		return ret;
 	}
 
 	/* Disable HW logic for VBUS enable */
 	regmap_update_bits(regmap, base + OTG_CFG, OTG_EN_SRC_CFG, 0);
 
+	dev_dbg(dev, "Registered QCOM VBUS regulator\n");
+
 	return 0;
 }
 
 static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
-	{ .compatible = "qcom,pm8150b-vbus-reg" },
+	{ .compatible = "qcom,pm8150b-vbus-reg", .data = &msm_vbus_desc_pm8150b },
+	{ .compatible = "qcom,pmi8998-vbus-reg", .data = &msm_vbus_desc_pmi8998 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_usb_vbus_regulator_match);
-- 
2.43.0


