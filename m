Return-Path: <linux-arm-msm+bounces-31326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C93FD971BB1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FEA8B24000
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CEC1BA29B;
	Mon,  9 Sep 2024 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iJCHW6F0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58021BA26E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 13:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889904; cv=none; b=fRmkTOG926ou0eX9d2XL2T+198RH2p7EfXp3L8170rbN5lTrkHLtxYbnt/SVB1ast4FbbYEohpK1bZWHBx3k5wOoBfCw8wnQsJl+fyZIoXqiLaz3mixNbSyWVBhdn+SaYXx+7JWQgcBVuvrl74e+oRTnmpYtxcNK2I92gZfWWpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889904; c=relaxed/simple;
	bh=7T+l2SN6pqbE6hOx06iBBg4xZdBmuecLOUZCOIFvMyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qw/0C7wS0Ft+YTWnwj30JYrvJMJZMlTQTIUInwhdsq/FVmD+jLBAkd56YKohxbJc6Pa10FZ7XX6I3caQP+NbD6R89bX6EzgHpCK/BJpGaYAxCp+YugDRV6c1d+Lu0+ePCqyFEh0GC81iuUciBwpRNIYFbgqYjttZ5yXZRPtB7l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iJCHW6F0; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8713b00219so23252266b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 06:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889901; x=1726494701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWUZynZie/tnte+8abYpr8R+Igo3OliRTpchdOYI/bM=;
        b=iJCHW6F0h7vHODRF+6Sbg3dN+AmB1f5OxQ9T44Bl/q348IQdN73/cS0Axb78l82vOk
         U5ZouR7Q2t8c6UzbCKumkQnprA9aWaC4KRVVfNlzmI2lZ0lKaPQC8qifWl5Bu1i6OP2e
         x3YENUIA2ba1noh3roiO/xmfo4XuK9YHcaqeb+45HeQtCMmSquEiqf//8gCdKcTY1V7B
         QkoAxZHY1GNH1dH++W/RmhYRiERaYjoWin5UEzDGE8x4nH9SLkk80cNhMklyN1Fr3Yhm
         73Y9WjvDFjLUsTMVBemyjp28WDPIpAU+K48SS/evii87Z1HDX1IIhLQicz295w0VZh4F
         ppow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889901; x=1726494701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWUZynZie/tnte+8abYpr8R+Igo3OliRTpchdOYI/bM=;
        b=XIJT64/iyk1v+96lZcnzoEyxBhoBP+JUrIecMUIqgo7gOz5hEdmpWN/JReRmzk0MzV
         jiJv4fRieA5g/WarWr3X9CqYe6Nn3amikldnROAEbLT57r1/3RF5wPTuO64dyv0bKMmo
         x1KVqQTMkBMeO4elhj2Ulf4obhm5ytn2VQ1skywW2V8LoW3GDaP9JygxQ5SPRaQU5rdm
         zDMV+Lk5xrgonSOfRP0ooN7mqX0urai2/MZGt/JT9mLWVZ362paZAe9ExWtLZUpzsCq/
         14w+M7f/HeaE2KSF+Mc3z74KjQnyJCqweSL+EUarii7sFIF4WXncfUR29POlPk+6/2OA
         viEg==
X-Forwarded-Encrypted: i=1; AJvYcCXLuZTgBapypOE9n69ti9m7T20vpxDV5jItOqbPYQtOcMTvTHM247QDCl3111SAaEc4kRveYKz0LWWBW/kD@vger.kernel.org
X-Gm-Message-State: AOJu0YycwxESI6o5VSALMhOcLnutVZfn42NLAYs14kOMtMnuSW750teA
	tauK5kIqZ6ZI0jLL+O5fT6g+zq53dJyRy6rN2tU+OM+5kTfPQdS9AmJDGJ0T4xk=
X-Google-Smtp-Source: AGHT+IGolL3X79jf6IP489nGtxAGUdA8yh3dZboS2pdNZz9QxZiprwgkdAl5gVT7/E37l/eQxx6GtA==
X-Received: by 2002:a17:907:da3:b0:a83:70d0:7a1e with SMTP id a640c23a62f3a-a8a888e61a0mr406825166b.9.1725889900964;
        Mon, 09 Sep 2024 06:51:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:13 +0200
Subject: [PATCH 02/17] regulator: da9055: Constify static data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-2-8934704a5787@linaro.org>
References: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
In-Reply-To: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5542;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=7T+l2SN6pqbE6hOx06iBBg4xZdBmuecLOUZCOIFvMyE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1a58opF52+48fMopZc5Ie9MgwbFtabVspDx
 XEDU3SMO8GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79WgAKCRDBN2bmhouD
 10RTD/0R3aEMOqjsaXdiCVQWplC8EpgbLj8ZanFKI2VfbsehBl68HKT/D98YBx6czQKoVB2yrlW
 PYvASCaQUm5YWQWux7cw+yXpnbq7LVSD6eNjRVw/q6tmWdrstD+Qn7t4HN1ktZzo4oBK7rlvLMc
 x3mtMz9FRaTzTH5Nazadk42WBjKw7mxTr7QMxR442nCi5/HyqlGDYagpIJNG+XYLQbo1iVKmoDG
 6Zu3wrt2pSFqWk18Hy3ShRYELnzjdFhiSB1RnGaByDwQxBdg+u445qBb0su71+1+Bmpl9rk/jkv
 8hTlPMk4mSpkaGLWV2CNJ7MhjGvhJTL7pqhlkp43GHePiUHF+W6FVUjupqQueyG7j9xL7FNAv5I
 ZnioNWLnhS0coGeh1Bgp9zHoRR7yCcHX60En5L5lup9oBDNW6vF6HWQacApjh8sf8cz/QCGzE7x
 9wfWe3KsjQaYpjDKD37c1cjI6nF4TMPL9LyQptdgS0aIV+OxuW29I3DaXtVANuU4FZtuM8iY1V1
 Y8pmzsl+sjIGQoE9cOvo30Y6+9j/nBeVgPRRvzpfxAEnPQPCNBZJb43aa8IRZF95de7aeqSeppV
 rL2WZ13ht2jGqi8aKSJYLtaWv7WdHrP8TDes+0K/pPUhR8b7Rve8G/CRjwFQGxWWB1WKgA8ERYB
 BHYCyhf+ywSoirw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not modify static data with regulators description (struct
da9055_regulator_info), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/da9055-regulator.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/regulator/da9055-regulator.c b/drivers/regulator/da9055-regulator.c
index 352547c375bd..a0d3414aa79e 100644
--- a/drivers/regulator/da9055-regulator.c
+++ b/drivers/regulator/da9055-regulator.c
@@ -73,7 +73,7 @@ struct da9055_regulator_info {
 
 struct da9055_regulator {
 	struct da9055 *da9055;
-	struct da9055_regulator_info *info;
+	const struct da9055_regulator_info *info;
 	struct regulator_dev *rdev;
 	enum gpio_select reg_rselect;
 };
@@ -81,7 +81,7 @@ struct da9055_regulator {
 static unsigned int da9055_buck_get_mode(struct regulator_dev *rdev)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	int ret, mode = 0;
 
 	ret = da9055_reg_read(regulator->da9055, info->mode.reg);
@@ -107,7 +107,7 @@ static int da9055_buck_set_mode(struct regulator_dev *rdev,
 					unsigned int mode)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	int val = 0;
 
 	switch (mode) {
@@ -129,7 +129,7 @@ static int da9055_buck_set_mode(struct regulator_dev *rdev,
 static unsigned int da9055_ldo_get_mode(struct regulator_dev *rdev)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	int ret;
 
 	ret = da9055_reg_read(regulator->da9055, info->volt.reg_b);
@@ -145,7 +145,7 @@ static unsigned int da9055_ldo_get_mode(struct regulator_dev *rdev)
 static int da9055_ldo_set_mode(struct regulator_dev *rdev, unsigned int mode)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	struct da9055_volt_reg volt = info->volt;
 	int val = 0;
 
@@ -167,7 +167,7 @@ static int da9055_ldo_set_mode(struct regulator_dev *rdev, unsigned int mode)
 static int da9055_regulator_get_voltage_sel(struct regulator_dev *rdev)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	struct da9055_volt_reg volt = info->volt;
 	int ret, sel;
 
@@ -199,7 +199,7 @@ static int da9055_regulator_set_voltage_sel(struct regulator_dev *rdev,
 					    unsigned int selector)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	int ret;
 
 	/*
@@ -242,7 +242,7 @@ static int da9055_regulator_set_suspend_voltage(struct regulator_dev *rdev,
 						int uV)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	int ret;
 
 	/* Select register set B for suspend voltage ramping. */
@@ -264,7 +264,7 @@ static int da9055_regulator_set_suspend_voltage(struct regulator_dev *rdev,
 static int da9055_suspend_enable(struct regulator_dev *rdev)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 
 	/* Select register set B for voltage ramping. */
 	if (regulator->reg_rselect == NO_GPIO)
@@ -277,7 +277,7 @@ static int da9055_suspend_enable(struct regulator_dev *rdev)
 static int da9055_suspend_disable(struct regulator_dev *rdev)
 {
 	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 
 	/* Diselect register set B. */
 	if (regulator->reg_rselect == NO_GPIO)
@@ -396,7 +396,7 @@ static const struct regulator_ops da9055_ldo_ops = {
 	},\
 }
 
-static struct da9055_regulator_info da9055_regulator_info[] = {
+static const struct da9055_regulator_info da9055_regulator_info[] = {
 	DA9055_BUCK(BUCK1, 25, 725, 2075, 6, 9, 0xc, 2),
 	DA9055_BUCK(BUCK2, 25, 925, 2500, 6, 0, 3, 0),
 	DA9055_LDO(LDO1, 50, 900, 3300, 6, 2),
@@ -417,7 +417,7 @@ static int da9055_gpio_init(struct device *dev,
 			    struct regulator_config *config,
 			    struct da9055_pdata *pdata, int id)
 {
-	struct da9055_regulator_info *info = regulator->info;
+	const struct da9055_regulator_info *info = regulator->info;
 	struct gpio_desc *ren;
 	struct gpio_desc *ena;
 	struct gpio_desc *rsel;
@@ -491,9 +491,9 @@ static irqreturn_t da9055_ldo5_6_oc_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static inline struct da9055_regulator_info *find_regulator_info(int id)
+static inline const struct da9055_regulator_info *find_regulator_info(int id)
 {
-	struct da9055_regulator_info *info;
+	const struct da9055_regulator_info *info;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(da9055_regulator_info); i++) {

-- 
2.43.0


