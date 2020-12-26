Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46AA22E2E57
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Dec 2020 15:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgLZOKl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Dec 2020 09:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgLZOKl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Dec 2020 09:10:41 -0500
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04CAC061757
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Dec 2020 06:09:45 -0800 (PST)
Received: from localhost.localdomain (abac131.neoplus.adsl.tpnet.pl [83.6.166.131])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 64A293F0AC;
        Sat, 26 Dec 2020 15:09:39 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: mmcc-msm8974: Fix mmss_s0_axi clock
Date:   Sat, 26 Dec 2020 15:09:34 +0100
Message-Id: <20201226140934.89856-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On boards without cont_splash the clock wouldn't get enabled.
Reparent it and strongly depend on the parent to make sure
it's accessible. Access to MMSS depends on mmss_s0_axi being
up and alive.

Fixes: d8b212014e69 ("clk: qcom: Add support for MSM8974's multimedia clock controller (MMCC)")
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/mmcc-msm8974.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 015426262d08..6220b62ece1e 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -2101,11 +2101,11 @@ static struct clk_branch mmss_s0_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_s0_axi_clk",
 			.parent_names = (const char *[]){
-				"mmss_axi_clk_src",
+				"mmss_mmssnoc_axi_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
-			.flags = CLK_IGNORE_UNUSED,
+			.flags = CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 		},
 	},
 };
-- 
2.29.2

