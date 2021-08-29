Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51DEF3FAE85
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 22:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235969AbhH2UtX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 16:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235316AbhH2UtW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 16:49:22 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6888BC0617A8;
        Sun, 29 Aug 2021 13:48:27 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E3A571FAED;
        Sun, 29 Aug 2021 22:48:25 +0200 (CEST)
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
Subject: [PATCH 2/4] clk: qcom: gpucc-sdm660: Use ARRAY_SIZE for num_parents
Date:   Sun, 29 Aug 2021 22:48:20 +0200
Message-Id: <20210829204822.289829-3-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829204822.289829-1-marijn.suijten@somainline.org>
References: <20210829204822.289829-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Where possible, use ARRAY_SIZE to determine the number of parents in
clk_parent_data, instead of hardcoding it.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/gpucc-sdm660.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 1ebcceb3a50d..bea73ae28b36 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -114,7 +114,7 @@ static struct clk_rcg2_gfx3d gfx3d_clk_src = {
 		.clkr.hw.init = &(struct clk_init_data){
 			.name = "gfx3d_clk_src",
 			.parent_data = gpucc_parent_data_1,
-			.num_parents = 4,
+			.num_parents = ARRAY_SIZE(gpucc_parent_data_1),
 			.ops = &clk_gfx3d_ops,
 			.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 		},
@@ -172,7 +172,7 @@ static struct clk_rcg2 rbbmtimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "rbbmtimer_clk_src",
 		.parent_data = gpucc_parent_data_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gpucc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -192,7 +192,7 @@ static struct clk_rcg2 rbcpr_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "rbcpr_clk_src",
 		.parent_data = gpucc_parent_data_0,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gpucc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.33.0

