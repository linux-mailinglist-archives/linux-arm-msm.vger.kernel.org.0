Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E442676D5C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 19:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbjHBRoF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 13:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233777AbjHBRnz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 13:43:55 -0400
X-Greylist: delayed 1194 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 02 Aug 2023 10:43:43 PDT
Received: from srv01.abscue.de (abscue.de [IPv6:2a03:4000:63:bf5:4817:8eff:feeb:8ac7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53DE30C0;
        Wed,  2 Aug 2023 10:43:42 -0700 (PDT)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id 72BAE1C0185;
        Wed,  2 Aug 2023 19:06:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
Received: from fluffy-mammal.fritz.box (dslb-092-072-013-079.092.072.pools.vodafone-ip.de [92.72.13.79])
        by srv01.abscue.de (Postfix) with ESMTPSA id 0F2E91C0184;
        Wed,  2 Aug 2023 19:06:13 +0200 (CEST)
From:   =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To:     linux-clk@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH 2/2] clk: qcom: gcc-msm8917: Enable GPLL0_SLEEP_CLK_SRC
Date:   Wed,  2 Aug 2023 19:03:18 +0200
Message-Id: <20230802170317.205112-3-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230802170317.205112-1-otto.pflueger@abscue.de>
References: <20230802170317.205112-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is the parent clock of gpll0_early, so it needs to be enabled
for gpll0_early to return the correct rate. Enable GPLL0_SLEEP_CLK_SRC
by adding its existing definition to the clock list.

This clock also doesn't work with clk_alpha_pll_ops, use
clk_branch_simple_ops instead to make it enable and disable correctly.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 drivers/clk/qcom/gcc-msm8917.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8917.c b/drivers/clk/qcom/gcc-msm8917.c
index 5ec14480e068..f2dd132e2fb1 100644
--- a/drivers/clk/qcom/gcc-msm8917.c
+++ b/drivers/clk/qcom/gcc-msm8917.c
@@ -63,7 +63,7 @@ static struct clk_alpha_pll gpll0_sleep_clk_src = {
 				.index = DT_XO,
 			},
 			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
+			.ops = &clk_branch_simple_ops,
 		},
 	},
 };
@@ -3041,6 +3041,7 @@ static struct gdsc cpp_gdsc = {
 static struct clk_regmap *gcc_msm8917_clocks[] = {
 	[GPLL0] = &gpll0.clkr,
 	[GPLL0_EARLY] = &gpll0_early.clkr,
+	[GPLL0_SLEEP_CLK_SRC] = &gpll0_sleep_clk_src.clkr,
 	[GPLL3] = &gpll3.clkr,
 	[GPLL3_EARLY] = &gpll3_early.clkr,
 	[GPLL4] = &gpll4.clkr,
-- 
2.39.1
