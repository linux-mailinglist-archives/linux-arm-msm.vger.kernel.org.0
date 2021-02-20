Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C07320604
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Feb 2021 16:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhBTP5Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Feb 2021 10:57:24 -0500
Received: from relay04.th.seeweb.it ([5.144.164.165]:39937 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhBTP5X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Feb 2021 10:57:23 -0500
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 9C9B91F63A;
        Sat, 20 Feb 2021 16:56:38 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 5/6] clk: qcom: gcc-sdm660: Account for needed adjustments in probe function
Date:   Sat, 20 Feb 2021 16:56:16 +0100
Message-Id: <20210220155618.176559-5-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210220155618.176559-1-konrad.dybcio@somainline.org>
References: <20210220155618.176559-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Downstream kernel executes a bunch of commands, such as keeping
GPU/MMSS interface clocks alive to make sure all subsystems can
work properly. Add these to make sure they do.

Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for SDM660")
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/gcc-sdm660.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index bc8dfcd6d629..db2185c88b77 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
@@ -2622,7 +2623,27 @@ static int gcc_sdm660_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return qcom_cc_really_probe(pdev, &gcc_sdm660_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &gcc_sdm660_desc, regmap);
+	if (ret)
+		return ret;
+
+	/* Disable the GPLL0 active input to MMSS and GPU via MISC registers */
+	regmap_update_bits(regmap, 0x0902c, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
+
+	/* This clock is used for all MMSSCC register access */
+	clk_prepare_enable(gcc_mmss_noc_cfg_ahb_clk.clkr.hw.clk);
+
+	/* This clock is used for all GPUCC register access */
+	clk_prepare_enable(gcc_gpu_cfg_ahb_clk.clkr.hw.clk);
+
+	/* Keep bimc gfx clock port on all the time */
+	clk_prepare_enable(gcc_bimc_gfx_clk.clkr.hw.clk);
+
+	/* Set the HMSS_GPLL0_SRC for 300MHz to CPU subsystem */
+	clk_set_rate(hmss_gpll0_clk_src.clkr.hw.clk, 300000000);
+
+	return ret;
 }
 
 static struct platform_driver gcc_sdm660_driver = {
-- 
2.30.1

