Return-Path: <linux-arm-msm+bounces-35901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6331C9B0732
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED87F2822A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F011155392;
	Fri, 25 Oct 2024 15:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yeM91Aj4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26002161EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 15:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868661; cv=none; b=bi2xqI+ahgxOAYfaYDHC4s1bS4JQPDYpn+4OXXmzssU4IG69g528EFWybvAGDKgLz5xTxeA/yz1D/XDvafPfwH9RbV5pPsZr/RS1piiIJ4X6RJxSJQsCGb6eYNl/P/GUOGJANKx+yGunOfPunWA4r/0n6gp2rgVauvKEcTbFkG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868661; c=relaxed/simple;
	bh=J01aZfvomEsVQEi/Nl/mHvq41KMRorLHAPm15NwwtBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5KdElpFMcMjjoojYyHBdUIcuTVEZrgUBei/hEJbprJX411NgQvnTdKe/UcL0VjChOrraKhjRSWMGFEviEzYzgqxqB4dHrRGgAZ6IBcCfotBo6RPNkluZzWVWJ/sb7zx37vGNrMjmi5OAISWyIP9H+xLFqeSnmwev92OH668Mto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yeM91Aj4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539fbbadf83so2955751e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729868655; x=1730473455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6AxpS4d6FLuJHatjryaGw2iYlZcDdEsHoMG8xCl8x8=;
        b=yeM91Aj4Eu7kB4UI5KWie+ZJY8L48Hcy19pgRamFbYrlVnVit71j09SxXrhgtMXsOs
         bckFGIQX3hWnGfTxVoVWB9ukZBVZIX0uuNLO2qyXsaILeaue0S4TcHYd6Nr0CPYquYQv
         475fWLPpTS/V9J7qweechIuWSOXMMzfych2fy29eHUs+6+eaTxdKZiHDadsbUgiyES+B
         Wp6cW7qbd06NzmoN/ldE0rRRGDi22b0+5UWEnjBycQSlvST/ai2xy9YLjcLYJiG/ST/P
         pfyohqQa2DOM4kIXfaDkgD8GZ0wWcAzWe6bbL8ayhXqTW/JCIB2tKP+NzNLydgy+BeXS
         DMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868655; x=1730473455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6AxpS4d6FLuJHatjryaGw2iYlZcDdEsHoMG8xCl8x8=;
        b=Ubbigi9Zguur8Wd3IQ+QltMPifPfkISykEDHvViSiyXg7OBWucRagL1j1V1fdX/fGy
         5TwAUCDkrTP2YCiFth7S/EfT+O3kWYgouSUWpbXheYc2ZcVF2tfl6eda2pNipbLtMU8A
         pCTPMQw3CK0XlsEsJlNUEiE/pjx6Qf4HvMrqeXqIJzDFxsVLBXvgT0Xi/RZ6deehmBGl
         XMCSTGSkcZOdYXjyQA2EVEEREv74u4wOLE0uoEIrYcnPSc5Tnu7/RhBFodLuGEvkjC4z
         Ms3TPi+C1LgFNIVhd/Jb2IcvAzvXA6m0xHflAknrEzlDezZUUSmFQqNeFbu7R4I5zHbH
         BwbA==
X-Gm-Message-State: AOJu0YyfJ8o4Kj7SSpZN6lLfNw4qjwGwmTP3grGmZBII1KrwVX/F400D
	awLu3qActQMnxixdwDD08Z1PyOt6Nj1a/VyOQpzB0VMwvqARPuudQqvZOiJt8oM=
X-Google-Smtp-Source: AGHT+IGrSHPP8wl0YFLqkY277VdawPX7McKOZmYIDWvsShnFWKKkXWSaruguYLJAcQSpoPS/KDHxiw==
X-Received: by 2002:a05:6512:3996:b0:539:f593:c19e with SMTP id 2adb3069b0e04-53b1a3b018amr5559612e87.60.1729868654822;
        Fri, 25 Oct 2024 08:04:14 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a915sm209542e87.12.2024.10.25.08.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:04:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 18:03:43 +0300
Subject: [PATCH v3 09/11] clk: qcom: tcsrcc-sm8550: add SAR2130P support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-sar2130p-clocks-v3-9-48f1842fd156@linaro.org>
References: <20241025-sar2130p-clocks-v3-0-48f1842fd156@linaro.org>
In-Reply-To: <20241025-sar2130p-clocks-v3-0-48f1842fd156@linaro.org>
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
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnG7NVcO+TfaucfkkCZs49mJGy/3tSuSuD+ndpO
 NK9pIJyiOKJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxuzVQAKCRAU23LtvoBl
 uCLDD/9wA7GtCzWO+qyhZpXE5uI+kquhx6JJFbQS/NrIsB1Ygyw2vA/9lZnLjk8Jsge5QcJuf6w
 6jFvmFSDBK/RHQJiJyPZnCb3sf7dHt66j4nCtASJ3sAe1xS28c+dJ+ByTtz/tvFGg778aviaplt
 uEvZzdL4hbfDicw5mIn/rgBIIcPw8WF0Su8M1s/tBWegaNOoTCSKfsU3DBnuITV5TWsgzQ4VpAz
 Oj69t3+x2pxh5DEgsooHDBJcKBJI6qfcpIu4oyLLoF0ZVEGm7hqymm/L6S5Xx7TbPyfjWIi7Jzz
 03T3J0JB3n46mAMNL+a0KdsNB5FqTinRRmRopLJbvRUb7l/yBt++G5eWJBijt9/gsDBYSHnah2Y
 wIu46ym4HlF2aUl2SJGmc5A0JS3w8AfJIvhSto567U+kSlyeUANOcrXrAUvFdn3v98DwXXIQhl2
 +ykPAaBF0uGLDZzit4ea2SLr4OTE65WLp3rumNbTbckjGWpalyjcyrHWk3YJ6O0r8KRWF20Qz7V
 nehaCRxcE21vrRdY3Y+z/Da/ojvf0LRJW+aN9bb3NcDFSYYG3UFfFL5sp0jvMLCQZq2hQEYMEXh
 jOhQQwWrmtAERrnerIOp7IrpC9YrkQjXlw22F7INOCzZIkW3rYA5Xds1DEcD6eLwlkzeP3FXtWU
 ELrUMfdAD3LnUPg==
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


