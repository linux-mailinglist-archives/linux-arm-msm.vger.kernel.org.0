Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B796640F024
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 05:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243572AbhIQDGR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 23:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243486AbhIQDGQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 23:06:16 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD924C061764
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 20:04:54 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id dw14so5971472pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 20:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/g8Xz+LAQ2v4BN0Z9GtIBIHMKH+31xEphKqwupxC7P0=;
        b=uwv4IZQ6CTYKz4hWoet8ycfrVd9+ckf21FcW36a9uPa4vKG6SkC8JR8LEycqddjiFL
         UeNH3zMjIG5mRXACYNhXtAQi411X8zZW4hJ39n3ZHaZgLFFNakJ1PbsWSGpLWMb6DVj3
         qf9vtX+QZmNR07/ylzRv5x/oXg5etdlcEonRpO62S3daEenpXpZBbI2tWVMKoIUd7Zpu
         rr+p54T6uzjpX+UmjacsCOgNIZflYQHIvgsFuDwpF5mQwaphWasI9csaoFR9G8O2TMwK
         2RB9QXpJ27RWhIgmZE0rxjIYTBBAVpP0MPo3wCjR3fPiYidpSGT1Msvqqei4TQUUi8J4
         4i8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/g8Xz+LAQ2v4BN0Z9GtIBIHMKH+31xEphKqwupxC7P0=;
        b=VklnoIpV7g+Dki3WIvcJzCVM93RbLiEv7wl1FV4zzg8sv/nefphdZqBI/7hIw/M8cd
         VVsC3hWuEQuI0ZscXQ3iB8JwTSUeGalUTKv9eaebYsnYJ54KSqHSB7I3R+GIU7KRN4D3
         FmOzZNmEQs9BNDgzXoljtAVI3G+d4TjZoUcqGBW5o3RyHVg05HTftXWPdPblO4yNbXC8
         DGzMxjUcFC4z+p+bO/akDnLLqPX1TQ9pZD9BLEZq6CGbD4/ua5jHIqUmlS0k1qdBD5cp
         El2RqTsLscBmWyhH12Wab20LbE7poinRGF1n+lFx2BGlLnBlWhpLoO2BNEsrDoLZyxD4
         CZlw==
X-Gm-Message-State: AOAM531R7OgCIOEb7DTZ25F7o8aCpUj2JliCyDCcxjpQ8T3DAhuRWySc
        DvboKFGecNrKEcB0r/lmhJNzcQ==
X-Google-Smtp-Source: ABdhPJycdE246IhV+ZSSIs9/epmDqjlIrC07rj8dlMIS+NHm5di9IzR3phmg+koOL8Dg6c/XkGgwvw==
X-Received: by 2002:a17:902:edc3:b0:13c:957d:63fa with SMTP id q3-20020a170902edc300b0013c957d63famr7566434plk.79.1631847894378;
        Thu, 16 Sep 2021 20:04:54 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id q2sm9133930pjo.27.2021.09.16.20.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 20:04:54 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 1/3] clk: qcom: smd-rpm: Add .recalc_rate hook for clk_smd_rpm_branch_ops
Date:   Fri, 17 Sep 2021 11:04:32 +0800
Message-Id: <20210917030434.19859-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210917030434.19859-1-shawn.guo@linaro.org>
References: <20210917030434.19859-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As there is a `rate` field in clk_smd_rpm, clk_smd_rpm_recalc_rate() can
be used by branch clocks to report rate as well, rather than assuming
the rate is always same as parent clock.  This assumption doesn't hold
on platforms like QCM2290, where xo_board is 38.4MHz while bi_tcxo is
19.2MHz.

To get this work, XO buffered clocks need the following updates.

- Assign a correct rate rather than the fake one which is being used to
  generate binary value for clk_smd_rpm_req interface.

- Explicitly handle the clk_smd_rpm_req interface value for XO buffered
  clocks (.rpm_res_type being QCOM_SMD_RPM_CLK_BUF_A).

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 76 +++++++++++++++++++---------------
 1 file changed, 43 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 66d7807ee38e..8e16e4836424 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -118,14 +118,15 @@
 		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
 		0, QCOM_RPM_SMD_KEY_STATE)
 
-#define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id)	      \
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id, r)      \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
-		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
+		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, r,			      \
 		QCOM_RPM_KEY_SOFTWARE_ENABLE)
 
-#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active, r_id) \
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active,	      \
+					     r_id, r)			      \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
-		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
+		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, r,			      \
 		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
 
 #define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)
@@ -195,6 +196,10 @@ static int clk_smd_rpm_set_rate_active(struct clk_smd_rpm *r,
 		.value = cpu_to_le32(DIV_ROUND_UP(rate, 1000)), /* to kHz */
 	};
 
+	/* Buffered clock needs a binary value */
+	if (r->rpm_res_type == QCOM_SMD_RPM_CLK_BUF_A)
+		req.value = !!req.value;
+
 	return qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_ACTIVE_STATE,
 				  r->rpm_res_type, r->rpm_clk_id, &req,
 				  sizeof(req));
@@ -209,6 +214,10 @@ static int clk_smd_rpm_set_rate_sleep(struct clk_smd_rpm *r,
 		.value = cpu_to_le32(DIV_ROUND_UP(rate, 1000)), /* to kHz */
 	};
 
+	/* Buffered clock needs a binary value */
+	if (r->rpm_res_type == QCOM_SMD_RPM_CLK_BUF_A)
+		req.value = !!req.value;
+
 	return qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_SLEEP_STATE,
 				  r->rpm_res_type, r->rpm_clk_id, &req,
 				  sizeof(req));
@@ -416,20 +425,21 @@ static const struct clk_ops clk_smd_rpm_ops = {
 static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
+	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 
 DEFINE_CLK_SMD_RPM(msm8916, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8916, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8916, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
 DEFINE_CLK_SMD_RPM_QDSS(msm8916, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, bb_clk1, bb_clk1_a, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, bb_clk2, bb_clk2_a, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, rf_clk1, rf_clk1_a, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, rf_clk2, rf_clk2_a, 5);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1_pin, bb_clk1_a_pin, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2_pin, bb_clk2_a_pin, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk1_pin, rf_clk1_a_pin, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2_pin, rf_clk2_a_pin, 5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, bb_clk1, bb_clk1_a, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, bb_clk2, bb_clk2_a, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, rf_clk1, rf_clk1_a, 4, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, rf_clk2, rf_clk2_a, 5, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1_pin, bb_clk1_a_pin, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2_pin, bb_clk2_a_pin, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk1_pin, rf_clk1_a_pin, 4, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2_pin, rf_clk2_a_pin, 5, 19200000);
 
 static struct clk_smd_rpm *msm8916_clks[] = {
 	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
@@ -503,19 +513,19 @@ DEFINE_CLK_SMD_RPM(msm8974, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
 DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk, QCOM_SMD_RPM_BUS_CLK, 3);
 DEFINE_CLK_SMD_RPM(msm8974, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8974, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_d0, cxo_d0_a, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_d1, cxo_d1_a, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a0, cxo_a0_a, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a1, cxo_a1_a, 5);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a2, cxo_a2_a, 6);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_a_clk, 7);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_a_clk1, 11);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_a_clk2, 12);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0_pin, cxo_d0_a_pin, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1_pin, cxo_d1_a_pin, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0_pin, cxo_a0_a_pin, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1_pin, cxo_a1_a_pin, 5);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2_pin, cxo_a2_a_pin, 6);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_d0, cxo_d0_a, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_d1, cxo_d1_a, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a0, cxo_a0_a, 4, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a1, cxo_a1_a, 5, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a2, cxo_a2_a, 6, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_a_clk, 7, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_a_clk1, 11, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_a_clk2, 12, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0_pin, cxo_d0_a_pin, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1_pin, cxo_d1_a_pin, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0_pin, cxo_a0_a_pin, 4, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1_pin, cxo_a1_a_pin, 5, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2_pin, cxo_a2_a_pin, 6, 19200000);
 
 static struct clk_smd_rpm *msm8974_clks[] = {
 	[RPM_SMD_PNOC_CLK]		= &msm8916_pcnoc_clk,
@@ -603,8 +613,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
 	.num_clks = ARRAY_SIZE(msm8976_clks),
 };
 
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, ln_bb_clk, ln_bb_a_clk, 8);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, ln_bb_clk, ln_bb_a_clk, 8, 19200000);
 
 DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
@@ -782,7 +792,7 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
 
 DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
 DEFINE_CLK_SMD_RPM(qcs404, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, ln_bb_clk_a_pin, 8);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, ln_bb_clk_a_pin, 8, 19200000);
 
 static struct clk_smd_rpm *qcs404_clks[] = {
 	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
@@ -811,13 +821,13 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
 };
 
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3_pin, ln_bb_clk3_a_pin,
-				     3);
+				     3, 19200000);
 DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk,
 		   QCOM_SMD_RPM_AGGR_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc_clk, aggre2_noc_a_clk,
 		   QCOM_SMD_RPM_AGGR_CLK, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, rf_clk3, rf_clk3_a, 6);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3_pin, rf_clk3_a_pin, 6);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, rf_clk3, rf_clk3_a, 6, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3_pin, rf_clk3_a_pin, 6, 19200000);
 static struct clk_smd_rpm *msm8998_clks[] = {
 	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
@@ -864,8 +874,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
 
 DEFINE_CLK_SMD_RPM_BRANCH(sdm660, bi_tcxo, bi_tcxo_a, QCOM_SMD_RPM_MISC_CLK, 0,
 								19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, ln_bb_clk3, ln_bb_clk3_a, 3);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, ln_bb_clk3_pin, ln_bb_clk3_pin_a, 3);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, ln_bb_clk3_pin, ln_bb_clk3_pin_a, 3, 19200000);
 
 static struct clk_smd_rpm *sdm660_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
-- 
2.17.1

