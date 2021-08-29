Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C933FAE8B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 22:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235316AbhH2Ut2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 16:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235475AbhH2UtW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 16:49:22 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A85EC0617AF;
        Sun, 29 Aug 2021 13:48:29 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 698101FBA5;
        Sun, 29 Aug 2021 22:48:27 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] clk: qcom: gpucc-sdm660: Remove fallback to global clock names
Date:   Sun, 29 Aug 2021 22:48:22 +0200
Message-Id: <20210829204822.289829-5-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829204822.289829-1-marijn.suijten@somainline.org>
References: <20210829204822.289829-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The necessary clocks for this driver are already fully specified in
sdm630 DT under the .fw_name, and do not need an implicit fallback to
their global name.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/gpucc-sdm660.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index bea73ae28b36..41bba96a08b3 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -44,8 +44,7 @@ static struct clk_branch gpucc_cxo_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpucc_cxo_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "xo",
-				.name = "xo"
+				.fw_name = "xo"
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -101,7 +100,7 @@ static const struct clk_parent_data gpucc_parent_data_1[] = {
 	{ .hw = &gpucc_cxo_clk.clkr.hw },
 	{ .hw = &gpu_pll0_pll_out_main.clkr.hw },
 	{ .hw = &gpu_pll1_pll_out_main.clkr.hw },
-	{ .fw_name = "gcc_gpu_gpll0_clk", .name = "gcc_gpu_gpll0_clk" },
+	{ .fw_name = "gcc_gpu_gpll0_clk" },
 };
 
 static struct clk_rcg2_gfx3d gfx3d_clk_src = {
@@ -154,8 +153,8 @@ static const struct parent_map gpucc_parent_map_0[] = {
 
 static const struct clk_parent_data gpucc_parent_data_0[] = {
 	{ .hw = &gpucc_cxo_clk.clkr.hw },
-	{ .fw_name = "gcc_gpu_gpll0_clk", .name = "gcc_gpu_gpll0_clk" },
-	{ .fw_name = "gcc_gpu_gpll0_div_clk", .name = "gcc_gpu_gpll0_div_clk" },
+	{ .fw_name = "gcc_gpu_gpll0_clk" },
+	{ .fw_name = "gcc_gpu_gpll0_div_clk" },
 };
 
 static const struct freq_tbl ftbl_rbbmtimer_clk_src[] = {
-- 
2.33.0

