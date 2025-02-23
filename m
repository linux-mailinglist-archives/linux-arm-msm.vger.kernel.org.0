Return-Path: <linux-arm-msm+bounces-49067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B47A410FA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 19:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 559D716EABC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 18:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6238918A6DE;
	Sun, 23 Feb 2025 18:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="FO8WQ8i4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE67188713;
	Sun, 23 Feb 2025 18:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337132; cv=none; b=eLvZID8i1IpE46bf4llcig0ByaoBxBO6opoEOkxYluNeQ3qjCdz5+a2lgJhtwgo8KrZgAm1jzL1Ieh+W6AmwihO4MuX5XPMpT2uwt9F+eyPpdc9xo5H+k998yRSVC5gXPgxU4puc2JlfmiKMawXzm7qar6KJSiVs3cjArmXgkj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337132; c=relaxed/simple;
	bh=7WIpvq4/O65XfG23yjkfFRHrpE2QsTdNr67aJS/kJew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nb0urtHrhBCEzGztlgekQgi7/3G8PrcVT5kcxDVwxSLbjwt11gwz2PSotS3AR1wQiEkYk2Nfjj/qIeqK33E7kADdrPOzbPDvwCCiHPwTbyXzlEDLm0TzBuYnB4mvPK8xJ6K5kRqzZSbxQOIK/8Ddp7x6De/hxPoeVaYPNwdKaSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=FO8WQ8i4; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.34.162] (254C2546.nat.pool.telekom.hu [37.76.37.70])
	by mail.mainlining.org (Postfix) with ESMTPSA id D1940BBAB1;
	Sun, 23 Feb 2025 18:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1740337128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAV0Qe0+FmS/ZCfAzMOGXS1xl5PRcB7p0GeHYLx+/po=;
	b=FO8WQ8i41spKCC9MqV832IxK0b50nrm7ugQJ+4YIybi1fSZ8CBIfLtye9O8h8XwJOFvwgx
	DDWTx2FSV3G92j0cVSpewBgMpEqLkpeCdFIn5Ky030Yj0mWsjofEtYlL2wmAM+avizJiLM
	ZWy4XD5OsOygDDw8DT7UcMQQwbwGf0TNX1wgZpFZKVRf0QyG30FRCGAa3d0U2WFHhoW19q
	5OVSHmhyh0EkSfWsCb5f77RET4O4icJFKpUc/Y1v0wf7hpjrZhvQ1hBiuAYAgQX6pm0aX0
	nXJZsrnt/V95JcF5wTs98t2F9Cjn1GrxKF0Uir2zNPPU6cabf0eZEsmitZv1bg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 23 Feb 2025 19:57:48 +0100
Subject: [PATCH v2 3/8] pinctrl: qcom: msm8917: Add MSM8937 wsa_reset pin
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250223-msm8937-v2-3-b99722363ed3@mainlining.org>
References: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
In-Reply-To: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Dang Huynh <danct12@riseup.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740337120; l=2411;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ATKVPnPAnxLDqZY8gYpdG3Mfkq8Qieu8l9ptvDkctEI=;
 b=/i7b896LZsXxFwQVIpwXMGgL7eB8bBsr7xzx7pi1RkYYlRPQqdEHNYItsOHk6nKsJeeDyaG+E
 DlQnYu8rohfAWiMTjbCtoZY+sQBVHr4daHDBIKp5b7mLn7O4U2Xlr+9
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Dang Huynh <danct12@riseup.net>

It looks like both 8917 and 8937 are the same except for one pin
"wsa_reset".

Signed-off-by: Dang Huynh <danct12@riseup.net>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/pinctrl/qcom/Kconfig.msm       | 4 ++--
 drivers/pinctrl/qcom/pinctrl-msm8917.c | 8 +++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 35f47660a56b1a730d7724fd5a4fb490da9c7880..a0d63a6725393496e034ca26d218265b7ba4b53f 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -138,10 +138,10 @@ config PINCTRL_MSM8916
 	  Qualcomm TLMM block found on the Qualcomm 8916 platform.
 
 config PINCTRL_MSM8917
-	tristate "Qualcomm 8917 pin controller driver"
+	tristate "Qualcomm 8917/8937 pin controller driver"
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-	  Qualcomm TLMM block found on the Qualcomm MSM8917 platform.
+	  Qualcomm TLMM block found on the Qualcomm MSM8917, MSM8937 platform.
 
 config PINCTRL_MSM8953
 	tristate "Qualcomm 8953 pin controller driver"
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8917.c b/drivers/pinctrl/qcom/pinctrl-msm8917.c
index cff137bb3b23fbbe2b2630a7cbbf9f46e39981e7..350636807b07d9ab0e207368de63837bc5fa5502 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8917.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8917.c
@@ -539,6 +539,7 @@ enum msm8917_functions {
 	msm_mux_webcam_standby,
 	msm_mux_wsa_io,
 	msm_mux_wsa_irq,
+	msm_mux_wsa_reset,
 	msm_mux__,
 };
 
@@ -1123,6 +1124,10 @@ static const char * const wsa_io_groups[] = {
 	"gpio94", "gpio95",
 };
 
+static const char * const wsa_reset_groups[] = {
+	"gpio96",
+};
+
 static const char * const blsp_spi8_groups[] = {
 	"gpio96", "gpio97", "gpio98", "gpio99",
 };
@@ -1378,6 +1383,7 @@ static const struct pinfunction msm8917_functions[] = {
 	MSM_PIN_FUNCTION(webcam_standby),
 	MSM_PIN_FUNCTION(wsa_io),
 	MSM_PIN_FUNCTION(wsa_irq),
+	MSM_PIN_FUNCTION(wsa_reset),
 };
 
 static const struct msm_pingroup msm8917_groups[] = {
@@ -1616,5 +1622,5 @@ static void __exit msm8917_pinctrl_exit(void)
 }
 module_exit(msm8917_pinctrl_exit);
 
-MODULE_DESCRIPTION("Qualcomm msm8917 pinctrl driver");
+MODULE_DESCRIPTION("Qualcomm msm8917/msm8937 pinctrl driver");
 MODULE_LICENSE("GPL");

-- 
2.48.1


