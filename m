Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898952769BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 08:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgIXGzP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Sep 2020 02:55:15 -0400
Received: from m17618.mail.qiye.163.com ([59.111.176.18]:47721 "EHLO
        m17618.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726929AbgIXGzP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Sep 2020 02:55:15 -0400
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
        by m17618.mail.qiye.163.com (Hmail) with ESMTPA id A86434E1856;
        Thu, 24 Sep 2020 14:55:12 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH] clk/qcom: fix spelling typo
Date:   Thu, 24 Sep 2020 14:55:04 +0800
Message-Id: <1600930506-394-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZSBhJHxlIH0hOSk8eVkpNS0tCSEtOSkhLSUJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pgw6Pjo5Cj8eLAMsOgkqSRUV
        SRMwC0lVSlVKTUtLQkhLTkpIT05DVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISllXWQgBWUFISUxJNwY+
X-HM-Tid: 0a74bee5003b9376kuwsa86434e1856
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Modify the comment typo: "compliment" -> "complement".

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 26139ef..5644311
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -609,7 +609,7 @@ static unsigned long
 alpha_huayra_pll_calc_rate(u64 prate, u32 l, u32 a)
 {
 	/*
-	 * a contains 16 bit alpha_val in two’s compliment number in the range
+	 * a contains 16 bit alpha_val in two’s complement number in the range
 	 * of [-0.5, 0.5).
 	 */
 	if (a >= BIT(PLL_HUAYRA_ALPHA_WIDTH - 1))
@@ -641,7 +641,7 @@ alpha_huayra_pll_round_rate(unsigned long rate, unsigned long prate,
 		quotient++;
 
 	/*
-	 * alpha_val should be in two’s compliment number in the range
+	 * alpha_val should be in two’s complement number in the range
 	 * of [-0.5, 0.5) so if quotient >= 0.5 then increment the l value
 	 * since alpha value will be subtracted in this case.
 	 */
@@ -666,7 +666,7 @@ alpha_pll_huayra_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 		regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &alpha);
 		/*
 		 * Depending upon alpha_mode, it can be treated as M/N value or
-		 * as a two’s compliment number. When alpha_mode=1,
+		 * as a two’s complement number. When alpha_mode=1,
 		 * pll_alpha_val<15:8>=M and pll_apla_val<7:0>=N
 		 *
 		 *		Fout=FIN*(L+(M/N))
@@ -674,12 +674,12 @@ alpha_pll_huayra_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 		 * M is a signed number (-128 to 127) and N is unsigned
 		 * (0 to 255). M/N has to be within +/-0.5.
 		 *
-		 * When alpha_mode=0, it is a two’s compliment number in the
+		 * When alpha_mode=0, it is a two’s complement number in the
 		 * range [-0.5, 0.5).
 		 *
 		 *		Fout=FIN*(L+(alpha_val)/2^16)
 		 *
-		 * where alpha_val is two’s compliment number.
+		 * where alpha_val is two’s complement number.
 		 */
 		if (!(ctl & PLL_ALPHA_MODE))
 			return alpha_huayra_pll_calc_rate(rate, l, alpha);
-- 
2.7.4

