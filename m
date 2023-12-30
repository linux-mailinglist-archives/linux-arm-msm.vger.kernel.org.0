Return-Path: <linux-arm-msm+bounces-6138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 043E4820672
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Dec 2023 14:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 357021C2117A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Dec 2023 13:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75019BA27;
	Sat, 30 Dec 2023 13:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z/pYJNEg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87C0DF51
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-555aa7fd668so1805352a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 05:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703941477; x=1704546277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfQSHQVKZa9EvvBG/LcF4bzMUV+tRVHuASDVzXtfju8=;
        b=Z/pYJNEgHtZMivDSEPrYKGHyrB2XEeV0FQdN5lnhbab7swf0w7SyWiX3i9uBoIS0VB
         1/MeQpveG1dxiy2TaGzYcrqZjszKngdQXel9Wmhlu8Y3TVio97nN2ZYDaXqZWpe6W2IA
         gef6SngdtIuGz8gruj1taJCbKWy6R/UQX1WSzcA4GS2u4AhAoVt1t1VH5fRWaS3Jkgib
         d5pSyqB8kVAtr8RVGzJZhq+qmGRAVQE4Nta0J44/DtAuQPssHESYasTJugL8RdsdGeDl
         lgdEgf9YGSUkC3m/+/Joo3pbr9PrS4lnEze2+se212nQjndckbMxubaxPskRg82xV1iD
         WM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703941477; x=1704546277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfQSHQVKZa9EvvBG/LcF4bzMUV+tRVHuASDVzXtfju8=;
        b=bvnASCJszCiqKxrOQNd2dcpPqY/f6Pfpm2LCv2CKoiwSXc19k88+6+J0lhUai/24CT
         A+LCliNBwCUWwvwEpxXnxGz4S3JM/iNJP4agLwPirQZiwsiroCCfKXubpC4uCrvjEqkn
         w8A8MF4DqK44Ddtw8g710UXeU99XEUPtuP6TnZ6seSPblQxLfPJS8v1OpU5BocLX9Npn
         QD7vYWm7i5ophU6f8WWgGY2tF4xB1WWsHcOACdD1jI1lbu8Q8KH8YCNVlRUKUBighBE9
         ucpHOPXsvHNO4+0njGIKLnzzhUmdQ9WouznxivchXUOonBUq3niCvl5f9TXdMgxa2U/4
         GJjA==
X-Gm-Message-State: AOJu0YwMeCsVtBmvmd0rqA9E4sRU187g1V4i0k+UOFEiNZZYsSfmdvTL
	gebmgGQkybD320FGVpswb+eoPLLHWeK+YQ==
X-Google-Smtp-Source: AGHT+IFp7qOKEwck7YlfT98VS8vZxEPrO/uOP1yERiEaOkRcTQ2msBRzBNb+5EOvBRtGfjjr1Vu9QA==
X-Received: by 2002:a50:c057:0:b0:553:4089:84ad with SMTP id u23-20020a50c057000000b00553408984admr8552516edd.69.1703941477234;
        Sat, 30 Dec 2023 05:04:37 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id ij14-20020a056402158e00b00554368c9ce8sm11359578edb.1.2023.12.30.05.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 05:04:36 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 30 Dec 2023 14:04:08 +0100
Subject: [PATCH v4 06/12] clk: qcom: gpucc-sm6115: Add runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v4-6-32c293ded915@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v4-0-32c293ded915@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v4-0-32c293ded915@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703941465; l=1935;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=qEBaNjI/ooL6lWFCafYj+PBBQcvfVeNIWrGrvhel2cE=;
 b=s6Bmn1QknE8wAHZxEr28aFfM2UMtVmuEwBy7x6fY9hhUZ2uKkBB9QQ53Ef6uN/maPbogQydK/
 DVkYisH4Kb3BHrT9x0b2oO5y1Kpsut29zfl1/nmjq7R8o5Fk3qYzRdW
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GPU_CC block on SM6115 is powered by the VDD_CX rail. We only need
to cast an enable vote for it if the GPU blocks are in use.

Enable runtime PM to keep the power flowing only when necessary.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gpucc-sm6115.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm6115.c b/drivers/clk/qcom/gpucc-sm6115.c
index 93a50431aef8..b50979ce1cbe 100644
--- a/drivers/clk/qcom/gpucc-sm6115.c
+++ b/drivers/clk/qcom/gpucc-sm6115.c
@@ -8,6 +8,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sm6115-gpucc.h>
@@ -443,10 +444,21 @@ MODULE_DEVICE_TABLE(of, gpu_cc_sm6115_match_table);
 static int gpu_cc_sm6115_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
 
 	regmap = qcom_cc_map(pdev, &gpu_cc_sm6115_desc);
-	if (IS_ERR(regmap))
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
 		return PTR_ERR(regmap);
+	}
 
 	clk_alpha_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_alpha_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
@@ -461,7 +473,10 @@ static int gpu_cc_sm6115_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x1078); /* GPU_CC_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x1060); /* GPU_CC_GX_CXO_CLK */
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sm6115_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &gpu_cc_sm6115_desc, regmap);
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver gpu_cc_sm6115_driver = {

-- 
2.43.0


