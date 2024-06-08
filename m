Return-Path: <linux-arm-msm+bounces-22122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 165CF901278
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 17:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A21C61F22209
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 15:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5586117B41C;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAHGxkhn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21807179663;
	Sat,  8 Jun 2024 15:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717862241; cv=none; b=Eyb+cUd9AbzXPffvTHOyAWShyoxl/71e16xPnItmWGtzcUT9npYM18e6DF/TKZB6bwsD4rbMQFa0nwdqbhWJELVfNvIkSyml+BTaHZR/9FJ/ccZThDgUx8l1PEHhe8UWYb0HRcI4A90yuYgHsuxUkrNpeVnEBTdyosPZZ3glbkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717862241; c=relaxed/simple;
	bh=CMzX95BYhopK+WIO+dnov/qG98VPRvKcCjXdO2f6tTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bizGzGa+IiLIB9AysUnZoQzEwFUqCKhebBO8OezqO/XG7TKjhgSfs1q9y1g+YnC7pluX+aTyQi67S9yfcx1TC9qSb5OkHkfVS3h3tIgdH0VM1eY6mjAB1kn/JuHQu3exPtPADT0YaJk3hCCRequgARUG/LRWoZ3JNsN9noceAZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAHGxkhn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D50DC4AF07;
	Sat,  8 Jun 2024 15:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717862240;
	bh=CMzX95BYhopK+WIO+dnov/qG98VPRvKcCjXdO2f6tTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZAHGxkhnaz6McvoQMyLgF7EMrucsNM73Mrfr4cQ2cXDikxh67LPzsbD8B9kcTma2U
	 EvZ4OvkC2wAt84R1/nxJQOAxF1ms19erPKxdjnFVwgVqCudQ1BK765qEkh8+s+U5fX
	 OGTk9IR0stsTNj0sqG1wxbI+F/RItQH0K0N93CqbeXMKJ4QVwX5IzR9kn0r5yVvsB2
	 xYqOZsHMwo5dq1f591c3kQWgYSzieOMKXLnNJi7y8K1K36+A0X+X80LVyOpduqOdx8
	 ARiu3gAGm/Lfqaf5dgmuWdIR44ftlwhloj02D8pQ8kMh07BWrB15f9U0USB9KE6a5F
	 R5hvifBMX4uxw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sFyRT-000000003Px-37vN;
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
Subject: [PATCH v3 03/12] mfd: pm8008: Deassert reset on probe
Date: Sat,  8 Jun 2024 17:55:17 +0200
Message-ID: <20240608155526.12996-4-johan+linaro@kernel.org>
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

Request and deassert any (optional) reset gpio during probe in case it
has been left asserted by the boot firmware.

Note the reset line is not asserted to avoid reverting to the default
I2C address in case the firmware has configured an alternate address.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index f71c490f25c8..5a77155a63d7 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -156,6 +157,7 @@ static struct regmap_config qcom_mfd_regmap_cfg = {
 static int pm8008_probe(struct i2c_client *client)
 {
 	struct regmap_irq_chip_data *irq_data;
+	struct gpio_desc *reset;
 	int rc;
 	struct device *dev;
 	struct regmap *regmap;
@@ -167,6 +169,16 @@ static int pm8008_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, regmap);
 
+	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(reset))
+		return PTR_ERR(reset);
+
+	/*
+	 * The PMIC does not appear to require a post-reset delay, but wait
+	 * for a millisecond for now anyway.
+	 */
+	usleep_range(1000, 2000);
+
 	if (of_property_read_bool(dev->of_node, "interrupt-controller")) {
 		rc = devm_regmap_add_irq_chip(dev, regmap, client->irq,
 				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
-- 
2.44.1


