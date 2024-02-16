Return-Path: <linux-arm-msm+bounces-11333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3220857B4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 12:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7F101C2120E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 11:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708B759B4D;
	Fri, 16 Feb 2024 11:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZPm2TyXm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB70359B4E
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 11:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708082106; cv=none; b=HV/XDvgl5lgxFmIBLeAlOoAAoEonXUhtH+cDPxBIQ9l4VeunVD2GiR9ED7CHv2G/BSVSOXUJM10K94VrxzQhguAV17ySixZi28Iwy/iGtEu+J2aI5ZXOCVQz5gE5630WTVEQsuq6fSeB0xNKePuFm+yGFUlj3ohspnK1ss7vJUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708082106; c=relaxed/simple;
	bh=J+mKldSFm9UKu1yLjoJAonMWsZZQVr/73ut6LTxc4Wk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I+0EBGPQvY2Pq/grsZbFPzdvBxiUDvej7cLQx+puDGwo6BIjJI3MSWcSvJAsdextjJsQ1xHCvTjXz6eDm5MtmJ6QaclFf8HM92+xjfle2J1N2slqLJPdFdicqm8V1OlBKW8GrY4gR2r7ydnaCgpF8dTdu2RqOMdDUjtsDN7nAKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZPm2TyXm; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-511ac32ff36so2348940e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 03:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708082102; x=1708686902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWJHzoL2wVqlrwIIyuG2xQEWuKVgreBLdPc7KV4ZKiI=;
        b=ZPm2TyXmvI83F6ZIldA8AyMv7lbgIRxvNSMPI/Q7U4DdyB77DW1XX+BlUToaq8L9FR
         PP+4uAz/JjWiCcG1x9CjhtW2XTY/jsl/KDN2iwlEqsFvShTr53Q80XGxXJneGe+qJqmG
         OqFj6LqEjDCZBENkAPPwCrEupP0UOe4l1+1PXzADw3+N+5SQdJBB0638DR5sGaiT2ANf
         RS+9SiRFbTLgjWVz1AbsFyIXb2OTTTJeovA4ekyezVB0uvWB+50ovg+EekIsfTzFm7u+
         5BKrrTjCA5VctlHwTrmIsuGBz5hXcGJrO3tO80LK3UGmmC3y+xQiqEbYIXPIHkbu8Du1
         vsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708082102; x=1708686902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWJHzoL2wVqlrwIIyuG2xQEWuKVgreBLdPc7KV4ZKiI=;
        b=tDKaLSjt7BvNEsUAwFMfwcauXV1eNVkSRD+1Di22jE859JcAXY3C5bDJA91UxPH3Xm
         ul3Y+GMo+o5meP+5u/S8a3r5toqM3F2A0lcF8NeKlxoTvPaHNKyrxOhWeydsKa6gkAgN
         hj2zeuDUPVobDZESbWkeNk4ad9jn95+ydutFnXV7wt+qDzv7hPLXPPrg668Sl00kDFzd
         5LZblR6TfNHmohZ/0vnAgjtK+41SdTY310BCMcwamV+H2k68qhbPr+njlgFvRln47UaH
         3ymlK9sJvMo/Y7gLDIsHxwUOpx7wxIHkoySn8U1zw+eIu6/ZcCvO35u8GTfLjTuMG3K1
         C2yA==
X-Gm-Message-State: AOJu0YwsVCyioNNzEC+09AFZm/NRWIjbkuA+Q1OuS9ZunStI1C5fEdzR
	5fovNEuoGLJWXx+al5AfL+NwkG5ZrecizZpsjhLnFbYYch7c1Igg1YC5Bp9MRGk=
X-Google-Smtp-Source: AGHT+IFt8z2wNiI2iDUev4KZaeAaVIwtBsDBrC2CeqmW+eTlRYV+TkxZWXcJNksiXaZkluX9PzVUVw==
X-Received: by 2002:ac2:4c17:0:b0:511:879f:b12a with SMTP id t23-20020ac24c17000000b00511879fb12amr3002470lfq.43.1708082101716;
        Fri, 16 Feb 2024 03:15:01 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p2-20020a056512312200b005118eeb18b4sm573405lfd.45.2024.02.16.03.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:15:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 16 Feb 2024 13:14:58 +0200
Subject: [PATCH 1/2] clk: qcom: drop the SC7180 Modem subsystem clock
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-drop-sc7180-mss-v1-1-0a8dc8d71c0c@linaro.org>
References: <20240216-drop-sc7180-mss-v1-0-0a8dc8d71c0c@linaro.org>
In-Reply-To: <20240216-drop-sc7180-mss-v1-0-0a8dc8d71c0c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5550;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=J+mKldSFm9UKu1yLjoJAonMWsZZQVr/73ut6LTxc4Wk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlz0OzGIlESZi+Q8Iz8LizXMQyQc6lVVmbPRuwR
 Cx7tg07DpyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZc9DswAKCRCLPIo+Aiko
 1ZRvB/0dbfn2qnxB5t0PbWc7/qxLJLzGWR5YgqcNohQDHUOCC/lBBNsBGB4REmeu+ALCs8fV+//
 sbjqgMJKVOInvPRUe+0HwWaLQpPIiHNhAcNVxb89mUSdQA5ioqO4SeKbkATJ5KKy9cElqQJWe76
 bvtOZTJhKdFAD7IujyhwB7fUxLNanjSDaQIi/EnXEsIsE/N584X1Zw8GSv3/t7dk19lmftpc1UQ
 bGoD0Aa8qqoQz/guz5KdNdgEz6UaqW3UUfh8RciJw3gJRnmgo0WLMoEFp4ZbOQnv7YmDhkktIWu
 hZJgttJ+7EU/3OIvMXnPZGRHxMCdo2QLqsrbdPDfh1yifd3H
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

This driver has never been used in the DT files merged to the kernel.
According to Sibi, it only worked on the pre-production devices. For the
production devices this functionality has been moved to the firmware.

Drop the driver to remove possible confusion.

Cc: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/Kconfig      |  10 ---
 drivers/clk/qcom/Makefile     |   1 -
 drivers/clk/qcom/mss-sc7180.c | 140 ------------------------------------------
 3 files changed, 151 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 4580edbd13ea..8ab08e7b5b6c 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -635,16 +635,6 @@ config SC_LPASS_CORECC_7280
 	  Say Y if you want to use LPASS clocks and power domains of the LPASS
 	  core clock controller.
 
-config SC_MSS_7180
-	tristate "SC7180 Modem Clock Controller"
-	depends on ARM64 || COMPILE_TEST
-	select SC_GCC_7180
-	help
-	  Support for the Modem Subsystem clock controller on Qualcomm
-	  Technologies, Inc on SC7180 devices.
-	  Say Y if you want to use the Modem branch clocks of the Modem
-	  subsystem clock controller to reset the MSS subsystem.
-
 config SC_VIDEOCC_7180
 	tristate "SC7180 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 1da65ca78e24..dec5b6db6860 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -91,7 +91,6 @@ obj-$(CONFIG_SC_LPASSCC_7280) += lpasscc-sc7280.o
 obj-$(CONFIG_SC_LPASSCC_8280XP) += lpasscc-sc8280xp.o
 obj-$(CONFIG_SC_LPASS_CORECC_7180) += lpasscorecc-sc7180.o
 obj-$(CONFIG_SC_LPASS_CORECC_7280) += lpasscorecc-sc7280.o lpassaudiocc-sc7280.o
-obj-$(CONFIG_SC_MSS_7180) += mss-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7280) += videocc-sc7280.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
diff --git a/drivers/clk/qcom/mss-sc7180.c b/drivers/clk/qcom/mss-sc7180.c
deleted file mode 100644
index d106bc65470e..000000000000
--- a/drivers/clk/qcom/mss-sc7180.c
+++ /dev/null
@@ -1,140 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2020, The Linux Foundation. All rights reserved.
- */
-
-#include <linux/clk-provider.h>
-#include <linux/platform_device.h>
-#include <linux/module.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
-#include <linux/regmap.h>
-
-#include <dt-bindings/clock/qcom,mss-sc7180.h>
-
-#include "clk-regmap.h"
-#include "clk-branch.h"
-#include "common.h"
-
-static struct clk_branch mss_axi_nav_clk = {
-	.halt_reg = 0x20bc,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x20bc,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mss_axi_nav_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "gcc_mss_nav_axi",
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch mss_axi_crypto_clk = {
-	.halt_reg = 0x20cc,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x20cc,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "mss_axi_crypto_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "gcc_mss_mfab_axis",
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static const struct regmap_config mss_regmap_config = {
-	.reg_bits	= 32,
-	.reg_stride	= 4,
-	.val_bits	= 32,
-	.fast_io	= true,
-	.max_register	= 0x41aa0cc,
-};
-
-static struct clk_regmap *mss_sc7180_clocks[] = {
-	[MSS_AXI_CRYPTO_CLK] = &mss_axi_crypto_clk.clkr,
-	[MSS_AXI_NAV_CLK] = &mss_axi_nav_clk.clkr,
-};
-
-static const struct qcom_cc_desc mss_sc7180_desc = {
-	.config = &mss_regmap_config,
-	.clks = mss_sc7180_clocks,
-	.num_clks = ARRAY_SIZE(mss_sc7180_clocks),
-};
-
-static int mss_sc7180_probe(struct platform_device *pdev)
-{
-	int ret;
-
-	ret = devm_pm_runtime_enable(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = devm_pm_clk_create(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_clk_add(&pdev->dev, "cfg_ahb");
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to acquire iface clock\n");
-		return ret;
-	}
-
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = qcom_cc_probe(pdev, &mss_sc7180_desc);
-	if (ret < 0)
-		goto err_put_rpm;
-
-	pm_runtime_put(&pdev->dev);
-
-	return 0;
-
-err_put_rpm:
-	pm_runtime_put_sync(&pdev->dev);
-
-	return ret;
-}
-
-static const struct dev_pm_ops mss_sc7180_pm_ops = {
-	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
-static const struct of_device_id mss_sc7180_match_table[] = {
-	{ .compatible = "qcom,sc7180-mss" },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, mss_sc7180_match_table);
-
-static struct platform_driver mss_sc7180_driver = {
-	.probe		= mss_sc7180_probe,
-	.driver		= {
-		.name		= "sc7180-mss",
-		.of_match_table = mss_sc7180_match_table,
-		.pm = &mss_sc7180_pm_ops,
-	},
-};
-
-static int __init mss_sc7180_init(void)
-{
-	return platform_driver_register(&mss_sc7180_driver);
-}
-subsys_initcall(mss_sc7180_init);
-
-static void __exit mss_sc7180_exit(void)
-{
-	platform_driver_unregister(&mss_sc7180_driver);
-}
-module_exit(mss_sc7180_exit);
-
-MODULE_DESCRIPTION("QTI MSS SC7180 Driver");
-MODULE_LICENSE("GPL v2");

-- 
2.39.2


