Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF15B60C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 11:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbfIRJun (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 05:50:43 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33560 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727196AbfIRJun (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 05:50:43 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AF717613A3; Wed, 18 Sep 2019 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568800242;
        bh=BmM89OpQ2SKm2dGztYrAR61VKxIwn51VuaJPMRK2cw8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dPvns4zWJqcHGj6nNYrUIsym8G/VmVhc/bdASdfQb3OeA4jGwt16a97+hua4M7TpP
         SnkBbzt8fij8ymJUbpg4tY+/s0IyGTc1FnpOiXyIrOhhAGuOBf5FW1uKYm3utOIAPO
         JdLthYnZcBAcu3yLD/sd+/KnwYHXJudFXTRIDIbE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C533C613A3;
        Wed, 18 Sep 2019 09:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568800239;
        bh=BmM89OpQ2SKm2dGztYrAR61VKxIwn51VuaJPMRK2cw8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eHJ+Htlm4penHBiutJquArOPG7GTRrDBoq3v7438ndkmuNQc2aqNP5gtn3/xPu3X4
         +otC1EqzZP1g9OVRedlqf/LIqYlei5dny9mxD7Eks0iHzBjDOXiD/wQC/nm8bBthFM
         LN6KzhvzhvFVMv9f9g734EMzDctt6Tg8bWwMCEsQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C533C613A3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>,
        robh+dt@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 1/3] clk: qcom: rcg: update the DFS macro for RCG
Date:   Wed, 18 Sep 2019 15:20:16 +0530
Message-Id: <20190918095018.17979-2-tdas@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190918095018.17979-1-tdas@codeaurora.org>
References: <20190918095018.17979-1-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the init data name for each of the dynamic frequency switch
controlled clock associated with the RCG clock name, so that it can be
generated as per the hardware plan. Thus update the macro accordingly.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-rcg.h    |  2 +-
 drivers/clk/qcom/gcc-sdm845.c | 96 +++++++++++++++++------------------
 2 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index c25b57c3cbc8..78358b81d249 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -168,7 +168,7 @@ struct clk_rcg_dfs_data {
 };
 
 #define DEFINE_RCG_DFS(r) \
-	{ .rcg = &r##_src, .init = &r##_init }
+	{ .rcg = &r, .init = &r##_init }
 
 extern int qcom_cc_register_rcg_dfs(struct regmap *regmap,
 				    const struct clk_rcg_dfs_data *rcgs,
diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 95be125c3bdd..d2142fe46a8e 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -408,7 +408,7 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_clk_src[] = {
 	{ }
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s0_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s0_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -421,10 +421,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s0_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s0_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s1_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s1_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -437,10 +437,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s1_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s1_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s2_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s2_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -453,10 +453,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s2_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s2_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s3_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s3_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -469,10 +469,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s3_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s3_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s4_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s4_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -485,10 +485,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s4_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s4_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s5_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s5_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -501,10 +501,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s5_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s5_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s6_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s6_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s6_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -517,10 +517,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s6_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s6_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap0_s7_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap0_s7_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s7_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -533,10 +533,10 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap0_s7_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap0_s7_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s0_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s0_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -549,10 +549,10 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s0_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s0_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s1_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s1_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -565,10 +565,10 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s1_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s1_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s2_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s2_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -581,10 +581,10 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s2_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s2_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s3_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s3_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -597,10 +597,10 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s3_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s3_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s4_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s4_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -613,10 +613,10 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s4_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s4_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s5_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s5_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -629,10 +629,10 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s5_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s5_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s6_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s6_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s6_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -645,10 +645,10 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s6_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s6_clk_src_init,
 };
 
-static struct clk_init_data gcc_qupv3_wrap1_s7_clk_init = {
+static struct clk_init_data gcc_qupv3_wrap1_s7_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s7_clk_src",
 	.parent_names = gcc_parent_names_0,
 	.num_parents = 4,
@@ -661,7 +661,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
-	.clkr.hw.init = &gcc_qupv3_wrap1_s7_clk_init,
+	.clkr.hw.init = &gcc_qupv3_wrap1_s7_clk_src_init,
 };
 
 static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
@@ -3577,22 +3577,22 @@ static const struct of_device_id gcc_sdm845_match_table[] = {
 MODULE_DEVICE_TABLE(of, gcc_sdm845_match_table);
 
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s3_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s4_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s5_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s6_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s7_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s2_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s6_clk),
-	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s7_clk),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s5_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s6_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s7_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s6_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s7_clk_src),
 };
 
 static int gcc_sdm845_probe(struct platform_device *pdev)
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

