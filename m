Return-Path: <linux-arm-msm+bounces-36068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0902B9B1BC9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 02:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A613F1F21B36
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 01:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6BE1514C9;
	Sun, 27 Oct 2024 01:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cwuOSruj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A4F15099C
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Oct 2024 01:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992312; cv=none; b=XTWydeOKbW9+aNOg1dMuQJSWZgE+qYTSx7ch2r9Z57ywsUcmcS7+C5PKEgxHmLlxPp7o4VkENk47oaSM9l1QRhGBn0lARscHxyFI7yPrBkFjPww6KGtG/k6QZ1HFaZ677n9z/PGRu0+Mq9bcrhkgCUgl1HA/OBE46G2vozs9y8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992312; c=relaxed/simple;
	bh=J01aZfvomEsVQEi/Nl/mHvq41KMRorLHAPm15NwwtBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zc5du0a5LBYHzDCaDmN9y6A86eZsPtQXR6PqCuKVlxkwUiF7thPgWCkx5f2FDjgjlr1P5/eqvOzXuzurzhFTde2XFI8f9dKhJg+lUU8n1577L9glOYTkpKQnjZuKLBbME5rnXCjg1pvqpFJTPm1HezfgRGk8+lJ0fvomW0ZSvrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cwuOSruj; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f1292a9bso3884060e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 18:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729992307; x=1730597107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6AxpS4d6FLuJHatjryaGw2iYlZcDdEsHoMG8xCl8x8=;
        b=cwuOSrujxgRxH+Auh0SjDB6EhkeHsEhD16hP8suU74xFu59z2CyXFFw4kFHq8N3V/V
         xJub0Al3m5g1H4hQ8YF6QelsPNBhbweDipXHzEVZehWUqFiNX90CfDuTbehP2gyW2rqe
         FXp7B8fVTuXV6NJM7BoWn48vWjwIdh1ZBvI+MLgvpIEskWBUr+8PikU01uPoQe+1SgLh
         cknFU9PYgD93YMf1rh63OGodMlCdA/mnhcPWe/zcauN6qQvV4erJLVXFT/kB2alDfKXv
         IO43t5twgrW/sZh5eQAZ2/ecPuDDTVSVsh7TX61JKO0WFrZzGMYBuU2Yw6/qZj0BRDyR
         YvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729992307; x=1730597107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6AxpS4d6FLuJHatjryaGw2iYlZcDdEsHoMG8xCl8x8=;
        b=qw2j46VnQAAvWsMW21Kv3tOlvdaJJBbW2u8lQOlgjVU2RdwXT9R4opNB++2We9kjZS
         EYMXKK/lb38n8yQQw0St+4ttq6UBiQogDOUTBj9sdbNQPWw6FciBpG3qowO7MvpcxWua
         jxLPg65VgPFAYZzXSc5dlyRIgZ/MEy13GvPJm1JwrBpFSYr/7tJRCJ1yEHp216B66J8I
         670QQdibzXU7Kx6lS9nBx97FB1MwfHzMWs/G+6ox4PMM26g86bht9FVLg+1/gOnnCWRU
         49N2fjFc4gJiRyqlRhMGKzkG2G4N8qQxD0tCx+dnR1wXmCNj3juXIbnP60Gx0W/la/5F
         V1/g==
X-Gm-Message-State: AOJu0YxnCLMA28e6yFM35TYzrSTzMEb3/QIwoMzTa/o7VQFSNdiyAsFL
	Esmgil5CU/qKMKq6r9lhm5YouhPbXcENdZmYec/EzPbRGzDHA5Wb1G20aDWQ4u4=
X-Google-Smtp-Source: AGHT+IEd+dqma3RL5aXu4AzcArNcNZnZ0SeEHd3lozPEw5mXracHCdtFMAc0tuN/P4VLDmEaSHySIA==
X-Received: by 2002:a05:6512:12c5:b0:539:e88f:23a1 with SMTP id 2adb3069b0e04-53b3491c80emr1233026e87.44.1729992307146;
        Sat, 26 Oct 2024 18:25:07 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c901esm642356e87.219.2024.10.26.18.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 18:25:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 27 Oct 2024 03:24:48 +0200
Subject: [PATCH v5 09/11] clk: qcom: tcsrcc-sm8550: add SAR2130P support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-sar2130p-clocks-v5-9-ecad2a1432ba@linaro.org>
References: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
In-Reply-To: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2386;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=J01aZfvomEsVQEi/Nl/mHvq41KMRorLHAPm15NwwtBA=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHZZisfbXZLOXg78S3sjIC7QNVHzfgBdu7wd8m
 QU4vZ5oqoyJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx2WYgAKCRAU23LtvoBl
 uIx0D/wOpl9ftdfXZRoFor+5fHeRGD3FvlsCf1u5T1NeAuTyle5QcQubTlqqZZJGkJ0WyE5hbf0
 l0qcZ45qipB2W5oviniT9XgxqUw1qimQt+UTh9OLB64wDbfeZCcPLErgNcbmQzK3K6l8crS2Gyh
 suh97VUbHWl6t3NzFiZS86/KQWyPLyxKqU31IC3CEKtblLbqcevY0uBw1N4imNcivjQVLAFErJL
 SBkGEM7UqZOn0uRrfQt7egPYS7NPazs0b2he3IUj42N+AjVXjNp23giRm0h8BBV06fo4m6sAjeI
 TwWyYspCU/kBHVnuzEL3R3LmwenJkvpT5CG13g1B3tiiv7oZZoES/AipdyPuJIVAPiiEB2w0e5L
 itTIwHy7WiiozoRG9MOlLfOQ9rlCB56FYQrqK45AjveetWr5DxEb8V4bJqcK8y0UNyKNM7o/fru
 vCs7jXkdpgSZdAm/JLKEd6TGPk7pKbclFf1S1hXpyNkzXQmDcT94CWO/DftHvbDNZuTSzyA7n4u
 KD2kp8Zc9BMOxD5V9HYBPN7krx6nDenFcCVWx9Uu+d1Mt3TP3vNsDJtv1fYE9Bg+MurBt9uR8x1
 69b88hWtgKTum9iUqvW9J2ZNzjGzqLFa4c5hul8ZWEGSlp+e/DHvTkbCFXYFYoyBJ9w/KL/mYYD
 xhm7/EZuPhXXU6w==
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


