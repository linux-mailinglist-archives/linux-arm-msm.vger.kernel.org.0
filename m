Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E28E17FC5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 20:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbfEHSZW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 14:25:22 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54410 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728093AbfEHSZV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 14:25:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4019F60E41; Wed,  8 May 2019 18:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557339920;
        bh=W82syNol1pbtaBk+TtPGPzsa4suSYIXKfE341ALT8Xs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MOq0oq5YeDoQjWTlbSRaj46WNko9PYsizJKp/rObtmxhIUSjd7kNIMTcihfzjUvn+
         ZRnBGh51uGVEX62IOtXtgho36bjWXN8qw23xQclH59xtM9zMn1mm7YPtsuFc8wSxW+
         wPr4vIBZGSgFtpkuXtG5PYYWST+zmPMCfknFU/Ok=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EFD0960DB3;
        Wed,  8 May 2019 18:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557339919;
        bh=W82syNol1pbtaBk+TtPGPzsa4suSYIXKfE341ALT8Xs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LXxZFAgCasfQue1b60bN2SvKQhBO6BVasm7YDIzm4e2oq3BbzI4yFad743z4HGMGf
         r8XURogVMdlpuY5RxL/pmknIo/SrW6XEaEkm+vSrP6D4AuBZnAsHhan8RRjiLFHzEx
         1NLm0ogMjVWpKdUIP3CNqigqiIy+L9lg2eQTU2Hg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EFD0960DB3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 2/3] clk: qcom: rcg2: Add support for hardware control mode
Date:   Wed,  8 May 2019 23:54:54 +0530
Message-Id: <1557339895-21952-3-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557339895-21952-1-git-send-email-tdas@codeaurora.org>
References: <1557339895-21952-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a flag to indicate to support and enable hardware control mode
of an RCG.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-rcg.h  | 3 +++
 drivers/clk/qcom/clk-rcg2.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index c25b57c..5562f38 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -139,6 +139,7 @@ struct clk_dyn_rcg {
  * @freq_tbl: frequency table
  * @clkr: regmap clock handle
  * @cfg_off: defines the cfg register offset from the CMD_RCGR + CFG_REG
+ * @flags: additional flag parameters for the RCG
  */
 struct clk_rcg2 {
 	u32			cmd_rcgr;
@@ -149,6 +150,8 @@ struct clk_rcg2 {
 	const struct freq_tbl	*freq_tbl;
 	struct clk_regmap	clkr;
 	u8			cfg_off;
+	u8			flags;
+#define HW_CLK_CTRL_MODE	BIT(0)
 };

 #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 57dbac9..5bb6d45 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -289,6 +289,9 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
 	if (rcg->mnd_width && f->n && (f->m != f->n))
 		cfg |= CFG_MODE_DUAL_EDGE;
+	if (rcg->flags & HW_CLK_CTRL_MODE)
+		cfg |= CFG_HW_CLK_CTRL_MASK;
+
 	return regmap_update_bits(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg),
 					mask, cfg);
 }
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

