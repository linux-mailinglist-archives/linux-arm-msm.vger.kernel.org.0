Return-Path: <linux-arm-msm+bounces-35207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3229A6343
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC0571F22639
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 10:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001391E570A;
	Mon, 21 Oct 2024 10:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hSOjKJb4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B751EABB5
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 10:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729506666; cv=none; b=tHxeYhSDSwL5cBGahgIrD7ty35Tc01ykOo2qJuCiFBRHSnJHYJqQechTYl4hIwKYcpU5Z6nDIcMp31m9Y54+VyCmF5bqiP2CcW2UZXjlc3JKuVolZhm6/bNyDdUBRGgL8JZTL08vB4oOlDmodel60u6ic0DvOpdfdqhNEihO0Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729506666; c=relaxed/simple;
	bh=J01aZfvomEsVQEi/Nl/mHvq41KMRorLHAPm15NwwtBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d7aPPtiMgDQcZcP9ObmUC3Rlth/uMf7w1NH4nyrKE47WmSQco6FrG7yXJX9+gDRlWkH3IjPnYyhkXSihbvWPCOMLe51nTvdVhKRH0oSP+2D9w0TwFUw0ZBlR18mR/Q8i62/PPfRAdyeO+oH4QVkJ+ipxJg2HOCgP1b/q5Yq3NIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hSOjKJb4; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb51f39394so43135111fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 03:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729506663; x=1730111463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6AxpS4d6FLuJHatjryaGw2iYlZcDdEsHoMG8xCl8x8=;
        b=hSOjKJb4/YX+OFMTqKUfK/0uKMlo1cZUHHb2xfDmi/KQ9TnVYgGGjuS+gPm9YAzpxB
         8hfgvsOMt2sx80Bc0Q93jESnmxlRornkMA7Nr7z/TClGuJaWbzwQsCQdraNrl8q7Kk9H
         YkGT6PuZG9jxO2ospSn73NZKYH+8NFO3p9lGUtRTlsKc4P9BX1l2TG6OB2ura5Z0j7Ce
         9Lztp2hTGl5P5l0lENpaqc652j1lUm4DvgsF+KHtO+YREKyF/p2xY4XrgR2nmysuROPC
         +ft+1NxpBjtAhnm32Fqewks+Vga2sr92pnJH6uKljYuYJO7/Z4zZafUiX362nC/455Ay
         PNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506663; x=1730111463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6AxpS4d6FLuJHatjryaGw2iYlZcDdEsHoMG8xCl8x8=;
        b=J9xmnP15fSnuQ6uB+r65LERDCCOeuFPlnQ17t2lYct8NRG64HwnXzGrldE3ng1LIIx
         r8GaDKvoh0GRIjrKRhCztyUxOpfBAxDGI+iWSKLb0/HJWvK7Xy2w7FWd9nDTMojXqmwq
         96p6fw51aKOLshKmsrYb3NYLjxJiFn7TKvGCfckTqN01Vq+g1fjYM67oVxLhg0FJbIEo
         VwwXB2qIE8UfzsPnuNTi0Wted1NFHIUw8j+aPRgT0G0UgsFpk3ytfcVPI5AwzAzstsNI
         q5QWm9oYHnZfRZ56EDzwLozba0cFTWwJ1+zEHrbSC+vnGlYX9fgAz7X4EFh3iAWivSna
         fMYQ==
X-Gm-Message-State: AOJu0YxnBT6/K3P6CGGHdZhxU9WUfq9ob1ubz7jBnbzyQYqc4vLaVm3p
	EGHPiGUSTE6A4+GHQtMLy29wAC70gLdmSHFOkAWgs65xysSUYYW5DbHwI3C//ag=
X-Google-Smtp-Source: AGHT+IEqC/pLoypvo2ghbgcPuJ3wehaaSwQ1Z0DK1gHnkpzZvRomDcUg7oGMEOGVP1d2KdaCX0T6SA==
X-Received: by 2002:a2e:b8d0:0:b0:2f9:cc40:6afe with SMTP id 38308e7fff4ca-2fb82ea23f4mr49433021fa.14.1729506662695;
        Mon, 21 Oct 2024 03:31:02 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae1217bsm4522711fa.112.2024.10.21.03.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:31:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 13:30:37 +0300
Subject: [PATCH v2 09/11] clk: qcom: tcsrcc-sm8550: add SAR2130P support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-sar2130p-clocks-v2-9-383e5eb123a2@linaro.org>
References: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
In-Reply-To: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2386;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=J01aZfvomEsVQEi/Nl/mHvq41KMRorLHAPm15NwwtBA=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnFi1NVOD+s+oScaINMj2eEqJgluu2FZG58PC80
 Uv0GXOOSz2JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxYtTQAKCRAU23LtvoBl
 uFd5D/4loh09WL3exFN26S6zift5LG3X5i9PUvGCULDFe/wiUKo4zERb0Uia4B4KpjFFHOTC39l
 qKpFeNBCLhdIDFWIATg9Fc3p8kLBjBzsRNp0TtLTRNyxVLG8jdyCCnSqEGuBA+m/Gd9a7QWBhsX
 kq9jxmPyNTGtxgWT1AAhgLsbg2CG1k/XABYHSMNGbV+Nrv2VFmGIt2ZVzonduRMqT1qQmLKT0kr
 X6VaMyZwCccwbXjt94AhGZYQOscpbQIc/VKinJ3C5pfxXTC9y0BtWg5qGDb7zmLvhPPrd+uPMgc
 asoNZsf7HN16z2kDr4dtrJx+hqE85OSR4df6mPDsIbW05F0LQ8SiDhq5jgmLlDJaGsWfalHJg9P
 PRuk94naEifiZRpOiW7MK3WO29mtorRpqNddtnIYsZAktSthhr3QtbbIRCOqgXsuE0CWnx0x5rI
 di8AyBEpzALcNuRZA3BSzusCMHRSVWkjBNd/J1KZhMM0gOJlW8Gt1J8aWW74bMgTk0wbsIBNboB
 ST25JxiIMbfk/kljob/A/Z1Y/tdguKIufE76LKp0N887ymnKLdmk3UH+y4kiJP1jGWvMjmy48l+
 2k4NFIM8gfOWue6L+CwMjip+d1ehcTRUf9yHjDlrYGobRL1yaA3A48jyt/xvWYXES0/Lfxf9M6Y
 HNhDYXmAW5JCRsA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SAR2130P platform has the same TCSR Clock Controller as the SM8550,
except for the lack of the UFS clocks. Extend the SM8550 TCSRCC driver
to support SAR2130P.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/tcsrcc-sm8550.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-sm8550.c b/drivers/clk/qcom/tcsrcc-sm8550.c
index e5e8f2e82b949dae592ec3dda585138bf89cab37..41d73f92a000ab924560a0c2c9d8e85a9aaeb1b0 100644
--- a/drivers/clk/qcom/tcsrcc-sm8550.c
+++ b/drivers/clk/qcom/tcsrcc-sm8550.c
@@ -129,6 +129,13 @@ static struct clk_branch tcsr_usb3_clkref_en = {
 	},
 };
 
+static struct clk_regmap *tcsr_cc_sar2130p_clocks[] = {
+	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
+	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
+	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
+	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
+};
+
 static struct clk_regmap *tcsr_cc_sm8550_clocks[] = {
 	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
 	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
@@ -146,6 +153,12 @@ static const struct regmap_config tcsr_cc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
+static const struct qcom_cc_desc tcsr_cc_sar2130p_desc = {
+	.config = &tcsr_cc_sm8550_regmap_config,
+	.clks = tcsr_cc_sar2130p_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_sar2130p_clocks),
+};
+
 static const struct qcom_cc_desc tcsr_cc_sm8550_desc = {
 	.config = &tcsr_cc_sm8550_regmap_config,
 	.clks = tcsr_cc_sm8550_clocks,
@@ -153,7 +166,8 @@ static const struct qcom_cc_desc tcsr_cc_sm8550_desc = {
 };
 
 static const struct of_device_id tcsr_cc_sm8550_match_table[] = {
-	{ .compatible = "qcom,sm8550-tcsr" },
+	{ .compatible = "qcom,sar2130p-tcsr", .data = &tcsr_cc_sar2130p_desc },
+	{ .compatible = "qcom,sm8550-tcsr", .data = &tcsr_cc_sm8550_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tcsr_cc_sm8550_match_table);
@@ -162,7 +176,7 @@ static int tcsr_cc_sm8550_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 
-	regmap = qcom_cc_map(pdev, &tcsr_cc_sm8550_desc);
+	regmap = qcom_cc_map(pdev, of_device_get_match_data(&pdev->dev));
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 

-- 
2.39.5


