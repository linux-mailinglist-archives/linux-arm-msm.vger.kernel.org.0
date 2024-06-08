Return-Path: <linux-arm-msm+bounces-22124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C2290127A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 17:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 934F81C21513
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 15:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6904517B4F2;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoyTdela"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1F5179958;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717862241; cv=none; b=bsOfAy2stHRy6Tz1clez7UaEiRNBiJvIdCH4RwJn1mAbfzJDsfxBJ/f2aPUbqXWt6CpCBvzFuLOVUVwFlqBU8HrgdFagwBjGobJnAn+TX4HVqA+fCJDq8ANV04hT9YOZZ/XCr8Yqx+ICUJwZXDYQx9d2rwya4KElngVPUmiZqk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717862241; c=relaxed/simple;
	bh=pIx9hISv3tD47SUT5qu5as5nwq98Svr/ggvTneh6Yl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dkSMIkIrael+UHlQ/huvPtFQvBQ0fA2SjA9z0duLcoe29ietU6JBsBct4X03WwfRvJR6ike0iqLxgnTf5iLJnxyg5FOivag1aw80zBMbm7Z4CX+vQ2JAV09TwZGnsG+sZT0O9yNVzQlMc0idgcyHBq/btG2SQn9N9HVySpkR1fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DoyTdela; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E0EC4AF09;
	Sat,  8 Jun 2024 15:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717862240;
	bh=pIx9hISv3tD47SUT5qu5as5nwq98Svr/ggvTneh6Yl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DoyTdelatrO7ntOSY6Qv3wpP2E5zYm6eJ5fErtUuz13kSjDqoBENpYXi1FlW0/KHB
	 YJkVDgz2i115rfPg0t7CTguDvKOOKzDGXI8r9BZEuRqGz9YTNBwVoKc6jW1BGErW6l
	 HoE9do2WmNyTHkLxoWBSqEyh88UWsoW5q76vsfHpTbIs9mlOWpY0cjZALWMshreUv0
	 At59cH2dYw0jxn+HnEjjXo8KroLfHCjLcFbpoyJG7qrHYQqF8TkHUPqn2IxuPpyDOO
	 PHsoECEKn9vcWLuytknXL5s6xpo35gWF9bw1HUAO/SBSiBIyyQsYFjLEya/fs7RWhH
	 iGUpr5V9XZadg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sFyRT-000000003Pv-2nO6;
	Sat, 08 Jun 2024 17:57:19 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 02/12] mfd: pm8008: Fix regmap irq chip initialisation
Date: Sat,  8 Jun 2024 17:55:16 +0200
Message-ID: <20240608155526.12996-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240608155526.12996-1-johan+linaro@kernel.org>
References: <20240608155526.12996-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regmap irq array is potentially shared between multiple PMICs and
should only contain static data.

Use a custom macro to initialise also the type fields and drop the
unnecessary updates on each probe.

Fixes: 6b149f3310a4 ("mfd: pm8008: Add driver for QCOM PM8008 PMIC")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 64 ++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 41 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 3ac3742f438b..f71c490f25c8 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -56,15 +56,25 @@ static unsigned int pm8008_config_regs[] = {
 	INT_POL_LOW_OFFSET,
 };
 
-static struct regmap_irq pm8008_irqs[] = {
-	REGMAP_IRQ_REG(PM8008_IRQ_MISC_UVLO,	PM8008_MISC,	BIT(0)),
-	REGMAP_IRQ_REG(PM8008_IRQ_MISC_OVLO,	PM8008_MISC,	BIT(1)),
-	REGMAP_IRQ_REG(PM8008_IRQ_MISC_OTST2,	PM8008_MISC,	BIT(2)),
-	REGMAP_IRQ_REG(PM8008_IRQ_MISC_OTST3,	PM8008_MISC,	BIT(3)),
-	REGMAP_IRQ_REG(PM8008_IRQ_MISC_LDO_OCP,	PM8008_MISC,	BIT(4)),
-	REGMAP_IRQ_REG(PM8008_IRQ_TEMP_ALARM,	PM8008_TEMP_ALARM, BIT(0)),
-	REGMAP_IRQ_REG(PM8008_IRQ_GPIO1,	PM8008_GPIO1,	BIT(0)),
-	REGMAP_IRQ_REG(PM8008_IRQ_GPIO2,	PM8008_GPIO2,	BIT(0)),
+#define _IRQ(_irq, _off, _mask, _types)			\
+	[_irq] = {					\
+		.reg_offset = (_off),			\
+		.mask = (_mask),			\
+		.type = {				\
+			.type_reg_offset = (_off),	\
+			.types_supported = (_types),	\
+		},					\
+	}
+
+static const struct regmap_irq pm8008_irqs[] = {
+	_IRQ(PM8008_IRQ_MISC_UVLO,    PM8008_MISC,	BIT(0), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_MISC_OVLO,    PM8008_MISC,	BIT(1), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_MISC_OTST2,   PM8008_MISC,	BIT(2), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_MISC_OTST3,   PM8008_MISC,	BIT(3), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_MISC_LDO_OCP, PM8008_MISC,	BIT(4), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
+	_IRQ(PM8008_IRQ_GPIO1,	      PM8008_GPIO1,	BIT(0), IRQ_TYPE_SENSE_MASK),
+	_IRQ(PM8008_IRQ_GPIO2,	      PM8008_GPIO2,	BIT(0), IRQ_TYPE_SENSE_MASK),
 };
 
 static const unsigned int pm8008_periph_base[] = {
@@ -143,38 +153,9 @@ static struct regmap_config qcom_mfd_regmap_cfg = {
 	.max_register	= 0xFFFF,
 };
 
-static int pm8008_probe_irq_peripherals(struct device *dev,
-					struct regmap *regmap,
-					int client_irq)
-{
-	int rc, i;
-	struct regmap_irq_type *type;
-	struct regmap_irq_chip_data *irq_data;
-
-	for (i = 0; i < ARRAY_SIZE(pm8008_irqs); i++) {
-		type = &pm8008_irqs[i].type;
-
-		type->type_reg_offset = pm8008_irqs[i].reg_offset;
-
-		if (type->type_reg_offset == PM8008_MISC)
-			type->types_supported = IRQ_TYPE_EDGE_RISING;
-		else
-			type->types_supported = (IRQ_TYPE_EDGE_BOTH |
-				IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW);
-	}
-
-	rc = devm_regmap_add_irq_chip(dev, regmap, client_irq,
-			IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
-	if (rc) {
-		dev_err(dev, "Failed to add IRQ chip: %d\n", rc);
-		return rc;
-	}
-
-	return 0;
-}
-
 static int pm8008_probe(struct i2c_client *client)
 {
+	struct regmap_irq_chip_data *irq_data;
 	int rc;
 	struct device *dev;
 	struct regmap *regmap;
@@ -187,9 +168,10 @@ static int pm8008_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, regmap);
 
 	if (of_property_read_bool(dev->of_node, "interrupt-controller")) {
-		rc = pm8008_probe_irq_peripherals(dev, regmap, client->irq);
+		rc = devm_regmap_add_irq_chip(dev, regmap, client->irq,
+				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
 		if (rc)
-			dev_err(dev, "Failed to probe irq periphs: %d\n", rc);
+			dev_err(dev, "failed to add IRQ chip: %d\n", rc);
 	}
 
 	return devm_of_platform_populate(dev);
-- 
2.44.1


