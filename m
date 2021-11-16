Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 197BE4529C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 06:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbhKPFbX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 00:31:23 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:12595 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234146AbhKPFaC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 00:30:02 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637040425; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=stLNCS/UpzaSmS0b3auQ+7YCiZ9kHw57/bx7tlJcDws=; b=TjDIA6lKPR0iIQDTmCQZqYbKtbHjfZmNQXay7C/SV1pp2OWwTs+XTM/Cekgz2yZTTaL/fcWz
 iH7VGf8fZiaFOIVoIfd4CEV3NSOEq5L88eybaG7rGBbW/owedDM5Lex/Y8Wzpf0iGcn9/UZd
 JFwzMONMzH0iXtSdhwHY0pEIik4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6193412860a72f6110343046 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Nov 2021 05:27:04
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F33B8C43616; Tue, 16 Nov 2021 05:27:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D09F2C4338F;
        Tue, 16 Nov 2021 05:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D09F2C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 1/2] soc: qcom: rpmhpd: Rename rpmhpd struct names
Date:   Tue, 16 Nov 2021 10:56:21 +0530
Message-Id: <1637040382-22987-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The rpmhpd structs were named with a SoC-name prefix, but then
they got reused across multiple SoC families making things confusing.
Rename all the struct names to remove SoC-name prefixes.
No other functional change as part of this patch.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/soc/qcom/rpmhpd.c | 255 +++++++++++++++++++++++-----------------------
 1 file changed, 128 insertions(+), 127 deletions(-)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 1118345..c71481d 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -63,73 +63,102 @@ struct rpmhpd_desc {
 
 static DEFINE_MUTEX(rpmhpd_lock);
 
-/* SDM845 RPMH powerdomains */
+/* RPMH powerdomains */
 
-static struct rpmhpd sdm845_ebi = {
+static struct rpmhpd ebi = {
 	.pd = { .name = "ebi", },
 	.res_name = "ebi.lvl",
 };
 
-static struct rpmhpd sdm845_lmx = {
+static struct rpmhpd lmx = {
 	.pd = { .name = "lmx", },
 	.res_name = "lmx.lvl",
 };
 
-static struct rpmhpd sdm845_lcx = {
+static struct rpmhpd lcx = {
 	.pd = { .name = "lcx", },
 	.res_name = "lcx.lvl",
 };
 
-static struct rpmhpd sdm845_gfx = {
+static struct rpmhpd gfx = {
 	.pd = { .name = "gfx", },
 	.res_name = "gfx.lvl",
 };
 
-static struct rpmhpd sdm845_mss = {
+static struct rpmhpd mss = {
 	.pd = { .name = "mss", },
 	.res_name = "mss.lvl",
 };
 
-static struct rpmhpd sdm845_mx_ao;
-static struct rpmhpd sdm845_mx = {
+static struct rpmhpd mx_ao;
+static struct rpmhpd mx = {
 	.pd = { .name = "mx", },
-	.peer = &sdm845_mx_ao,
+	.peer = &mx_ao,
 	.res_name = "mx.lvl",
 };
 
-static struct rpmhpd sdm845_mx_ao = {
+static struct rpmhpd mx_ao = {
 	.pd = { .name = "mx_ao", },
 	.active_only = true,
-	.peer = &sdm845_mx,
+	.peer = &mx,
 	.res_name = "mx.lvl",
 };
 
-static struct rpmhpd sdm845_cx_ao;
-static struct rpmhpd sdm845_cx = {
+static struct rpmhpd cx_ao;
+static struct rpmhpd cx = {
 	.pd = { .name = "cx", },
-	.peer = &sdm845_cx_ao,
-	.parent = &sdm845_mx.pd,
+	.peer = &cx_ao,
+	.parent = &mx.pd,
 	.res_name = "cx.lvl",
 };
 
-static struct rpmhpd sdm845_cx_ao = {
+static struct rpmhpd cx_ao = {
 	.pd = { .name = "cx_ao", },
 	.active_only = true,
-	.peer = &sdm845_cx,
-	.parent = &sdm845_mx_ao.pd,
+	.peer = &cx,
+	.parent = &mx_ao.pd,
 	.res_name = "cx.lvl",
 };
 
+static struct rpmhpd mmcx_ao;
+static struct rpmhpd mmcx = {
+	.pd = { .name = "mmcx", },
+	.peer = &mmcx_ao,
+	.res_name = "mmcx.lvl",
+};
+
+static struct rpmhpd mmcx_ao = {
+	.pd = { .name = "mmcx_ao", },
+	.active_only = true,
+	.peer = &mmcx,
+	.res_name = "mmcx.lvl",
+};
+
+static struct rpmhpd mxc_ao;
+static struct rpmhpd mxc = {
+	.pd = { .name = "mxc", },
+	.peer = &mxc_ao,
+	.res_name = "mxc.lvl",
+};
+
+static struct rpmhpd mxc_ao = {
+	.pd = { .name = "mxc_ao", },
+	.active_only = true,
+	.peer = &mxc,
+	.res_name = "mxc.lvl",
+};
+
+/* SDM845 RPMH powerdomains */
 static struct rpmhpd *sdm845_rpmhpds[] = {
-	[SDM845_EBI] = &sdm845_ebi,
-	[SDM845_MX] = &sdm845_mx,
-	[SDM845_MX_AO] = &sdm845_mx_ao,
-	[SDM845_CX] = &sdm845_cx,
-	[SDM845_CX_AO] = &sdm845_cx_ao,
-	[SDM845_LMX] = &sdm845_lmx,
-	[SDM845_LCX] = &sdm845_lcx,
-	[SDM845_GFX] = &sdm845_gfx,
-	[SDM845_MSS] = &sdm845_mss,
+	[SDM845_EBI] = &ebi,
+	[SDM845_MX] = &mx,
+	[SDM845_MX_AO] = &mx_ao,
+	[SDM845_CX] = &cx,
+	[SDM845_CX_AO] = &cx_ao,
+	[SDM845_LMX] = &lmx,
+	[SDM845_LCX] = &lcx,
+	[SDM845_GFX] = &gfx,
+	[SDM845_MSS] = &mss,
 };
 
 static const struct rpmhpd_desc sdm845_desc = {
@@ -139,9 +168,9 @@ static const struct rpmhpd_desc sdm845_desc = {
 
 /* SDX55 RPMH powerdomains */
 static struct rpmhpd *sdx55_rpmhpds[] = {
-	[SDX55_MSS] = &sdm845_mss,
-	[SDX55_MX] = &sdm845_mx,
-	[SDX55_CX] = &sdm845_cx,
+	[SDX55_MSS] = &mss,
+	[SDX55_MX] = &mx,
+	[SDX55_CX] = &cx,
 };
 
 static const struct rpmhpd_desc sdx55_desc = {
@@ -151,12 +180,12 @@ static const struct rpmhpd_desc sdx55_desc = {
 
 /* SM6350 RPMH powerdomains */
 static struct rpmhpd *sm6350_rpmhpds[] = {
-	[SM6350_CX] = &sdm845_cx,
-	[SM6350_GFX] = &sdm845_gfx,
-	[SM6350_LCX] = &sdm845_lcx,
-	[SM6350_LMX] = &sdm845_lmx,
-	[SM6350_MSS] = &sdm845_mss,
-	[SM6350_MX] = &sdm845_mx,
+	[SM6350_CX] = &cx,
+	[SM6350_GFX] = &gfx,
+	[SM6350_LCX] = &lcx,
+	[SM6350_LMX] = &lmx,
+	[SM6350_MSS] = &mss,
+	[SM6350_MX] = &mx,
 };
 
 static const struct rpmhpd_desc sm6350_desc = {
@@ -165,33 +194,18 @@ static const struct rpmhpd_desc sm6350_desc = {
 };
 
 /* SM8150 RPMH powerdomains */
-
-static struct rpmhpd sm8150_mmcx_ao;
-static struct rpmhpd sm8150_mmcx = {
-	.pd = { .name = "mmcx", },
-	.peer = &sm8150_mmcx_ao,
-	.res_name = "mmcx.lvl",
-};
-
-static struct rpmhpd sm8150_mmcx_ao = {
-	.pd = { .name = "mmcx_ao", },
-	.active_only = true,
-	.peer = &sm8150_mmcx,
-	.res_name = "mmcx.lvl",
-};
-
 static struct rpmhpd *sm8150_rpmhpds[] = {
-	[SM8150_MSS] = &sdm845_mss,
-	[SM8150_EBI] = &sdm845_ebi,
-	[SM8150_LMX] = &sdm845_lmx,
-	[SM8150_LCX] = &sdm845_lcx,
-	[SM8150_GFX] = &sdm845_gfx,
-	[SM8150_MX] = &sdm845_mx,
-	[SM8150_MX_AO] = &sdm845_mx_ao,
-	[SM8150_CX] = &sdm845_cx,
-	[SM8150_CX_AO] = &sdm845_cx_ao,
-	[SM8150_MMCX] = &sm8150_mmcx,
-	[SM8150_MMCX_AO] = &sm8150_mmcx_ao,
+	[SM8150_MSS] = &mss,
+	[SM8150_EBI] = &ebi,
+	[SM8150_LMX] = &lmx,
+	[SM8150_LCX] = &lcx,
+	[SM8150_GFX] = &gfx,
+	[SM8150_MX] = &mx,
+	[SM8150_MX_AO] = &mx_ao,
+	[SM8150_CX] = &cx,
+	[SM8150_CX_AO] = &cx_ao,
+	[SM8150_MMCX] = &mmcx,
+	[SM8150_MMCX_AO] = &mmcx_ao,
 };
 
 static const struct rpmhpd_desc sm8150_desc = {
@@ -199,17 +213,18 @@ static const struct rpmhpd_desc sm8150_desc = {
 	.num_pds = ARRAY_SIZE(sm8150_rpmhpds),
 };
 
+/* SM8250 RPMH powerdomains */
 static struct rpmhpd *sm8250_rpmhpds[] = {
-	[SM8250_CX] = &sdm845_cx,
-	[SM8250_CX_AO] = &sdm845_cx_ao,
-	[SM8250_EBI] = &sdm845_ebi,
-	[SM8250_GFX] = &sdm845_gfx,
-	[SM8250_LCX] = &sdm845_lcx,
-	[SM8250_LMX] = &sdm845_lmx,
-	[SM8250_MMCX] = &sm8150_mmcx,
-	[SM8250_MMCX_AO] = &sm8150_mmcx_ao,
-	[SM8250_MX] = &sdm845_mx,
-	[SM8250_MX_AO] = &sdm845_mx_ao,
+	[SM8250_CX] = &cx,
+	[SM8250_CX_AO] = &cx_ao,
+	[SM8250_EBI] = &ebi,
+	[SM8250_GFX] = &gfx,
+	[SM8250_LCX] = &lcx,
+	[SM8250_LMX] = &lmx,
+	[SM8250_MMCX] = &mmcx,
+	[SM8250_MMCX_AO] = &mmcx_ao,
+	[SM8250_MX] = &mx,
+	[SM8250_MX_AO] = &mx_ao,
 };
 
 static const struct rpmhpd_desc sm8250_desc = {
@@ -218,34 +233,20 @@ static const struct rpmhpd_desc sm8250_desc = {
 };
 
 /* SM8350 Power domains */
-static struct rpmhpd sm8350_mxc_ao;
-static struct rpmhpd sm8350_mxc = {
-	.pd = { .name = "mxc", },
-	.peer = &sm8350_mxc_ao,
-	.res_name = "mxc.lvl",
-};
-
-static struct rpmhpd sm8350_mxc_ao = {
-	.pd = { .name = "mxc_ao", },
-	.active_only = true,
-	.peer = &sm8350_mxc,
-	.res_name = "mxc.lvl",
-};
-
 static struct rpmhpd *sm8350_rpmhpds[] = {
-	[SM8350_CX] = &sdm845_cx,
-	[SM8350_CX_AO] = &sdm845_cx_ao,
-	[SM8350_EBI] = &sdm845_ebi,
-	[SM8350_GFX] = &sdm845_gfx,
-	[SM8350_LCX] = &sdm845_lcx,
-	[SM8350_LMX] = &sdm845_lmx,
-	[SM8350_MMCX] = &sm8150_mmcx,
-	[SM8350_MMCX_AO] = &sm8150_mmcx_ao,
-	[SM8350_MX] = &sdm845_mx,
-	[SM8350_MX_AO] = &sdm845_mx_ao,
-	[SM8350_MXC] = &sm8350_mxc,
-	[SM8350_MXC_AO] = &sm8350_mxc_ao,
-	[SM8350_MSS] = &sdm845_mss,
+	[SM8350_CX] = &cx,
+	[SM8350_CX_AO] = &cx_ao,
+	[SM8350_EBI] = &ebi,
+	[SM8350_GFX] = &gfx,
+	[SM8350_LCX] = &lcx,
+	[SM8350_LMX] = &lmx,
+	[SM8350_MMCX] = &mmcx,
+	[SM8350_MMCX_AO] = &mmcx_ao,
+	[SM8350_MX] = &mx,
+	[SM8350_MX_AO] = &mx_ao,
+	[SM8350_MXC] = &mxc,
+	[SM8350_MXC_AO] = &mxc_ao,
+	[SM8350_MSS] = &mss,
 };
 
 static const struct rpmhpd_desc sm8350_desc = {
@@ -255,14 +256,14 @@ static const struct rpmhpd_desc sm8350_desc = {
 
 /* SC7180 RPMH powerdomains */
 static struct rpmhpd *sc7180_rpmhpds[] = {
-	[SC7180_CX] = &sdm845_cx,
-	[SC7180_CX_AO] = &sdm845_cx_ao,
-	[SC7180_GFX] = &sdm845_gfx,
-	[SC7180_MX] = &sdm845_mx,
-	[SC7180_MX_AO] = &sdm845_mx_ao,
-	[SC7180_LMX] = &sdm845_lmx,
-	[SC7180_LCX] = &sdm845_lcx,
-	[SC7180_MSS] = &sdm845_mss,
+	[SC7180_CX] = &cx,
+	[SC7180_CX_AO] = &cx_ao,
+	[SC7180_GFX] = &gfx,
+	[SC7180_MX] = &mx,
+	[SC7180_MX_AO] = &mx_ao,
+	[SC7180_LMX] = &lmx,
+	[SC7180_LCX] = &lcx,
+	[SC7180_MSS] = &mss,
 };
 
 static const struct rpmhpd_desc sc7180_desc = {
@@ -272,15 +273,15 @@ static const struct rpmhpd_desc sc7180_desc = {
 
 /* SC7280 RPMH powerdomains */
 static struct rpmhpd *sc7280_rpmhpds[] = {
-	[SC7280_CX] = &sdm845_cx,
-	[SC7280_CX_AO] = &sdm845_cx_ao,
-	[SC7280_EBI] = &sdm845_ebi,
-	[SC7280_GFX] = &sdm845_gfx,
-	[SC7280_MX] = &sdm845_mx,
-	[SC7280_MX_AO] = &sdm845_mx_ao,
-	[SC7280_LMX] = &sdm845_lmx,
-	[SC7280_LCX] = &sdm845_lcx,
-	[SC7280_MSS] = &sdm845_mss,
+	[SC7280_CX] = &cx,
+	[SC7280_CX_AO] = &cx_ao,
+	[SC7280_EBI] = &ebi,
+	[SC7280_GFX] = &gfx,
+	[SC7280_MX] = &mx,
+	[SC7280_MX_AO] = &mx_ao,
+	[SC7280_LMX] = &lmx,
+	[SC7280_LCX] = &lcx,
+	[SC7280_MSS] = &mss,
 };
 
 static const struct rpmhpd_desc sc7280_desc = {
@@ -290,17 +291,17 @@ static const struct rpmhpd_desc sc7280_desc = {
 
 /* SC8180x RPMH powerdomains */
 static struct rpmhpd *sc8180x_rpmhpds[] = {
-	[SC8180X_CX] = &sdm845_cx,
-	[SC8180X_CX_AO] = &sdm845_cx_ao,
-	[SC8180X_EBI] = &sdm845_ebi,
-	[SC8180X_GFX] = &sdm845_gfx,
-	[SC8180X_LCX] = &sdm845_lcx,
-	[SC8180X_LMX] = &sdm845_lmx,
-	[SC8180X_MMCX] = &sm8150_mmcx,
-	[SC8180X_MMCX_AO] = &sm8150_mmcx_ao,
-	[SC8180X_MSS] = &sdm845_mss,
-	[SC8180X_MX] = &sdm845_mx,
-	[SC8180X_MX_AO] = &sdm845_mx_ao,
+	[SC8180X_CX] = &cx,
+	[SC8180X_CX_AO] = &cx_ao,
+	[SC8180X_EBI] = &ebi,
+	[SC8180X_GFX] = &gfx,
+	[SC8180X_LCX] = &lcx,
+	[SC8180X_LMX] = &lmx,
+	[SC8180X_MMCX] = &mmcx,
+	[SC8180X_MMCX_AO] = &mmcx_ao,
+	[SC8180X_MSS] = &mss,
+	[SC8180X_MX] = &mx,
+	[SC8180X_MX_AO] = &mx_ao,
 };
 
 static const struct rpmhpd_desc sc8180x_desc = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

