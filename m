Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1277F3FAE74
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 22:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235475AbhH2Ubg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 16:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235920AbhH2Ube (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 16:31:34 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF08C061756
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 13:30:42 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id AAC381FA18;
        Sun, 29 Aug 2021 22:30:40 +0200 (CEST)
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] clk: qcom: gcc-sdm660: Remove transient global "xo" clock
Date:   Sun, 29 Aug 2021 22:30:27 +0200
Message-Id: <20210829203027.276143-4-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829203027.276143-1-marijn.suijten@somainline.org>
References: <20210829203027.276143-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DSI PHY/PLL was relying on a global "xo" clock to be found, but the
real clock is named "xo_board" in the DT.  The standard nowadays is to
never use global clock names anymore but require the firmware (DT) to
provide every clock binding explicitly with .fw_name.  The DSI PLLs have
since been converted to this mechanism (specifically 14nm for SDM660)
and this transient clock can now be removed.

This issue was originally discovered in:
https://lore.kernel.org/linux-arm-msm/386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org/
and prevented the removal of "xo" at that time.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/gcc-sdm660.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 9b97425008ce..16fd16351f95 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -37,19 +37,6 @@ enum {
 	P_GPLL1_EARLY_DIV,
 };
 
-static struct clk_fixed_factor xo = {
-	.mult = 1,
-	.div = 1,
-	.hw.init = &(struct clk_init_data){
-		.name = "xo",
-		.parent_data = &(const struct clk_parent_data) {
-			.fw_name = "xo"
-		},
-		.num_parents = 1,
-		.ops = &clk_fixed_factor_ops,
-	},
-};
-
 static struct clk_alpha_pll gpll0_early = {
 	.offset = 0x0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -2281,7 +2268,6 @@ static struct gdsc pcie_0_gdsc = {
 };
 
 static struct clk_hw *gcc_sdm660_hws[] = {
-	&xo.hw,
 	&gpll0_early_div.hw,
 	&gpll1_early_div.hw,
 };
-- 
2.33.0

