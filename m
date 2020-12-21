Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2202DFF33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Dec 2020 19:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgLUSEp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Dec 2020 13:04:45 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:35550 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgLUSEp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Dec 2020 13:04:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608573875; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=qtC1xnTwsZ/pq2bzAAmFHJGvkNgdm1UbjIJc3YraR48=; b=IYde+MpMVI7xv2DgUUVVBGKPIjHcLe9lepVELgvvu9yRzt86QEkBe29MHQIE3zRqHaBNLIed
 dEhZnJGL4HZ+BoWjFBk1eXFvPqOzLNySvOI+UPtaQti9sKPV14soB9yCOAub+mQppxjbu3ZT
 1zH7uVEK9OxViywnEghp9w2G72c=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fe0e3877036173f4f1290ca (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Dec 2020 18:03:51
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D5532C433ED; Mon, 21 Dec 2020 18:03:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D870C43461;
        Mon, 21 Dec 2020 18:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0D870C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1] clk: qcom: gcc-sc7180: Mark the camera abh clock always ON
Date:   Mon, 21 Dec 2020 23:33:36 +0530
Message-Id: <1608573816-1465-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The camera clock controller requires the AHB clock, the driver when
moved to use the pm_runtime_get() API, the camera ahb clock failed turn
on before access, thus mark it as always ON.

Reported-by: Stephen Boyd <sboyd@kernel.org>
Fixes: 8d4025943e13 ("clk: qcom: camcc-sc7180: Use runtime PM ops instead of clk ones")
Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gcc-sc7180.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index d82d725..b05901b 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -891,21 +891,6 @@ static struct clk_branch gcc_boot_rom_ahb_clk = {
 	},
 };

-static struct clk_branch gcc_camera_ahb_clk = {
-	.halt_reg = 0xb008,
-	.halt_check = BRANCH_HALT,
-	.hwcg_reg = 0xb008,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0xb008,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_camera_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_camera_hf_axi_clk = {
 	.halt_reg = 0xb020,
 	.halt_check = BRANCH_HALT,
@@ -2317,7 +2302,6 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
 	[GCC_AGGRE_UFS_PHY_AXI_CLK] = &gcc_aggre_ufs_phy_axi_clk.clkr,
 	[GCC_AGGRE_USB3_PRIM_AXI_CLK] = &gcc_aggre_usb3_prim_axi_clk.clkr,
 	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
-	[GCC_CAMERA_AHB_CLK] = &gcc_camera_ahb_clk.clkr,
 	[GCC_CAMERA_HF_AXI_CLK] = &gcc_camera_hf_axi_clk.clkr,
 	[GCC_CAMERA_THROTTLE_HF_AXI_CLK] = &gcc_camera_throttle_hf_axi_clk.clkr,
 	[GCC_CAMERA_XO_CLK] = &gcc_camera_xo_clk.clkr,
@@ -2519,11 +2503,12 @@ static int gcc_sc7180_probe(struct platform_device *pdev)

 	/*
 	 * Keep the clocks always-ON
-	 * GCC_CPUSS_GNOC_CLK, GCC_VIDEO_AHB_CLK, GCC_DISP_AHB_CLK
-	 * GCC_GPU_CFG_AHB_CLK
+	 * GCC_CPUSS_GNOC_CLK, GCC_VIDEO_AHB_CLK, GCC_CAMERA_AHB_CLK,
+	 * GCC_DISP_AHB_CLK, GCC_GPU_CFG_AHB_CLK
 	 */
 	regmap_update_bits(regmap, 0x48004, BIT(0), BIT(0));
 	regmap_update_bits(regmap, 0x0b004, BIT(0), BIT(0));
+	regmap_update_bits(regmap, 0x0b008, BIT(0), BIT(0));
 	regmap_update_bits(regmap, 0x0b00c, BIT(0), BIT(0));
 	regmap_update_bits(regmap, 0x71004, BIT(0), BIT(0));

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

