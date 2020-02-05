Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B87B015269D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 08:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgBEHCH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 02:02:07 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:23308 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727836AbgBEHCH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 02:02:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580886126; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=895Q+fKggWhwkwgRG0plgGxTflX/NjId+yNJ80pnPq4=; b=IS4bELlcImLEBTTUh369saWPhC50KAXvMhppI28M0sddY9nbZH2SrB2M4pON+O5htSwDMMNT
 aXNjbmu7tvt+zWTPcRfqAK386lJlBqLhgfR/UuypH1GAk0y5MPVB4euhdtAs0wDVlNrnwL77
 eJcw0jsQByJ4P2gvkM1CF28l32Q=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3a6863.7f66726cb458-smtp-out-n03;
 Wed, 05 Feb 2020 07:01:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B3F83C433CB; Wed,  5 Feb 2020 07:01:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from smasetty-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3AA49C43383;
        Wed,  5 Feb 2020 07:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3AA49C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        jcrouse@codeaurora.org, mka@chromium.org, dianders@chromium.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v4 2/3] clk: qcom: gpucc: Add support for GX GDSC for SC7180
Date:   Wed,  5 Feb 2020 12:31:36 +0530
Message-Id: <1580886097-6312-3-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org>
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

 Most of the time the CPU should not be touching the GX domain on the
 GPU
 except for a very special use case when the CPU needs to force the GX
 headswitch off. Add a dummy enable function for the GX gdsc to simulate
 success so that the pm_runtime reference counting is correct.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gpucc-sc7180.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index ec61194..3b29f19 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -172,8 +172,45 @@ enum {
 	.flags = VOTABLE,
 };
 
+/*
+ * On SC7180 the GPU GX domain is *almost* entirely controlled by the GMU
+ * running in the CX domain so the CPU doesn't need to know anything about the
+ * GX domain EXCEPT....
+ *
+ * Hardware constraints dictate that the GX be powered down before the CX. If
+ * the GMU crashes it could leave the GX on. In order to successfully bring back
+ * the device the CPU needs to disable the GX headswitch. There being no sane
+ * way to reach in and touch that register from deep inside the GPU driver we
+ * need to set up the infrastructure to be able to ensure that the GPU can
+ * ensure that the GX is off during this super special case. We do this by
+ * defining a GX gdsc with a dummy enable function and a "default" disable
+ * function.
+ *
+ * This allows us to attach with genpd_dev_pm_attach_by_name() in the GPU
+ * driver. During power up, nothing will happen from the CPU (and the GMU will
+ * power up normally but during power down this will ensure that the GX domain
+ * is *really* off - this gives us a semi standard way of doing what we need.
+ */
+static int gx_gdsc_enable(struct generic_pm_domain *domain)
+{
+	/* Do nothing but give genpd the impression that we were successful */
+	return 0;
+}
+
+static struct gdsc gx_gdsc = {
+	.gdscr = 0x100c,
+	.clamp_io_ctrl = 0x1508,
+	.pd = {
+		.name = "gpu_gx_gdsc",
+		.power_on = gx_gdsc_enable,
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = CLAMP_IO,
+};
+
 static struct gdsc *gpu_cc_sc7180_gdscs[] = {
 	[CX_GDSC] = &cx_gdsc,
+	[GX_GDSC] = &gx_gdsc,
 };
 
 static struct clk_regmap *gpu_cc_sc7180_clocks[] = {
-- 
1.9.1
