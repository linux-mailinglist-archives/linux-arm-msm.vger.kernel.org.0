Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 600ED407679
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Sep 2021 14:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbhIKMPS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Sep 2021 08:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235836AbhIKMPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Sep 2021 08:15:15 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D986C061767;
        Sat, 11 Sep 2021 05:14:03 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 12B523F43B;
        Sat, 11 Sep 2021 14:14:01 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] clk: qcom: gpucc-msm8998: Remove unnecessary fallbacks to global clocks
Date:   Sat, 11 Sep 2021 14:13:39 +0200
Message-Id: <20210911121340.261920-8-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911121340.261920-1-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A previous patch removes the "xo" clock from the global namespace making
it impossible to acquire by that ".name".  The device-tree for msm8998
already provides the "xo" and "gpll0" clock since the addition of the
gpucc node making it unnecessary to have this fallback at all.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/gpucc-msm8998.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index 3ac6fbfbd414..a925ac90018d 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -40,8 +40,7 @@ static struct clk_branch gpucc_cxo_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpucc_cxo_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "xo",
-				.name = "xo"
+				.fw_name = "xo"
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -99,7 +98,7 @@ static const struct parent_map gpu_xo_gpll0_map[] = {
 
 static const struct clk_parent_data gpu_xo_gpll0[] = {
 	{ .hw = &gpucc_cxo_clk.clkr.hw },
-	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .fw_name = "gpll0" },
 };
 
 static const struct parent_map gpu_xo_gpupll0_map[] = {
-- 
2.33.0

