Return-Path: <linux-arm-msm+bounces-22121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4B0901275
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 17:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E107E1C21609
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 15:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B1817A92C;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8Kx/67m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0041D1791ED;
	Sat,  8 Jun 2024 15:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717862241; cv=none; b=GUq3dkrh38ARId/qAk9WwTneheu0QSK6+aC0DunO0PyEJ7Lyg4jl/jOA6QRM0gSn/bseYZTWM3gDa2g62sobR0jnd6H/EHub58xfDPr1t5K27uBTwCAiZqRuXRunWTHtGADNUHSDBO2Pov/tLP2spystcp3Kmkvpmv2QITEHED4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717862241; c=relaxed/simple;
	bh=ktUgF/6UawgynxPPaqC7L5uMYlNVYYch3qE9zi0eRhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3ALVeOvsYOWq/jYNhqQ0X4Swj3EnK/in5tBQCLAkM32uLkBoA93ZiU/eCaAVd8R/2bx4+xkUYHgMo8naUrLyHKeUwJu09EABOIbElrYIW15eKJgotizqjwBb/DS/9NdG6rryhsnR/lFYNdTZbtuBGTLFSi431gvh/MtyXpjta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8Kx/67m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906B8C32781;
	Sat,  8 Jun 2024 15:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717862240;
	bh=ktUgF/6UawgynxPPaqC7L5uMYlNVYYch3qE9zi0eRhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c8Kx/67mQ4wUCl7rXwXfaCaLc45KWHJ4226e8gOj+s9y89rkEqJPDaCaEuBTwIFN2
	 TBb4koGCKrLNbytlME6SOgPocFDkm3x3RB7AkH8NLZPXHiMzu0ULFFBzmT+uzuWP2J
	 WyVKWxGPsf7F3nwnA0rkYgydSMPnygpgoiviiz0Dl2txOj83AkwgAZBpQakn16h2Gw
	 9zt2Nd7XrawCKncciiuKyPcczPmWPCP2maL+mDnr1FqR1sdvvqxhBFAYBgPMZ0TTk7
	 eAYTBRTfmkJfZFRjaCpWVyENyu1eRCluewsQKv31FbrR4JTji/5xgSCWfAgVBgOvV7
	 AkkLgMbaDS+jw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sFyRT-000000003Q1-3pE5;
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
Subject: [PATCH v3 05/12] mfd: pm8008: Use lower case hex notation
Date: Sat,  8 Jun 2024 17:55:19 +0200
Message-ID: <20240608155526.12996-6-johan+linaro@kernel.org>
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

Use lower case hex notation for consistency.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index ab55d524c27b..18173c7a7e7b 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -38,8 +38,8 @@ enum {
 
 #define PM8008_PERIPH_0_BASE	0x900
 #define PM8008_PERIPH_1_BASE	0x2400
-#define PM8008_PERIPH_2_BASE	0xC000
-#define PM8008_PERIPH_3_BASE	0xC100
+#define PM8008_PERIPH_2_BASE	0xc000
+#define PM8008_PERIPH_3_BASE	0xc100
 
 #define PM8008_TEMP_ALARM_ADDR	PM8008_PERIPH_1_BASE
 #define PM8008_GPIO1_ADDR	PM8008_PERIPH_2_BASE
@@ -151,7 +151,7 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
 static struct regmap_config qcom_mfd_regmap_cfg = {
 	.reg_bits	= 16,
 	.val_bits	= 8,
-	.max_register	= 0xFFFF,
+	.max_register	= 0xffff,
 };
 
 static int pm8008_probe(struct i2c_client *client)
-- 
2.44.1


