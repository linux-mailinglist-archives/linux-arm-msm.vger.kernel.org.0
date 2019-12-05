Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF181114490
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 17:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729613AbfLEQPK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Dec 2019 11:15:10 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55130 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbfLEQPK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Dec 2019 11:15:10 -0500
Received: by mail-wm1-f67.google.com with SMTP id b11so4491705wmj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2019 08:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wiYJvs9A2NXd1fHRkB6dBS+AK6nuaV80oV6YetXmGJI=;
        b=KWLZl2b/6PQlobWM37hoxWhnoNlsmP2tN1Krl0Fs6s1r3VFhXK25+dQAtKeDErFMdB
         2pXs/RJvUaBMDMc9onLtaTz+R0liD9XHftl6yc5Gt/UD406Q++EiRzxpL0vo3ROAy3Ko
         WOsRJ6fuXByqkXcpB0BJoIb54lAvC+mhEN4TgKWLPHoBtqYxhjj7tBEipvEWB6aGp0Jo
         D2a7uubzElPPuDG4wFOq+3FxK7dXIXm/8lxvcJuszMOSCIMNR7frLWR+14pI3+fIvxxC
         cnvC1/vhoVOdw9M/9zeKGhahQX7AQe1urZ5/niqU6wMO+7ZPCcun7o8mJ9bQryG33g1S
         3CfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wiYJvs9A2NXd1fHRkB6dBS+AK6nuaV80oV6YetXmGJI=;
        b=C0Qd/p+5a1llywZ/0cUdjW/NDp/7gkMmQL5RgJMaTLCvDyAHMhWTf55452/9Z+UwN7
         vBKEi0ccvg/wO5JfLigcuX7nhmx5lVqitf0D2csAcc5mR6UhnTSUxZM8WRh57gI28UT1
         PROO/rMw8DrO4ePl5XUJAMWm48yJQF1BZvvMFfar7Y0lreqHGrBS6yRrwUwil/Vueq9h
         27KUAsCTmT2eW/QkyqJke/bO8Voer5E6vwYwt22ZXVaVK+Mk3i5ykdy/o2ADtls8PC1m
         SMaUXzqF3NCSktHKWBF+ku78f5YtfZS/El6/UiaKgF7FN+gF2c8KI/uSBOy7qHIBrMmB
         6lmA==
X-Gm-Message-State: APjAAAXFuD1VjNtRWfS9dhnCdRZF0AzPEeg64v2Lxfo7x1OGTrNVRocQ
        X7YFLiKNd1hDdI9hagVEyqk=
X-Google-Smtp-Source: APXvYqwWw/PwEvyIzVeIeTgS8DvzAaqmQtFXahWlWFqVRobCJ2uMcVOwvB9LES5UllOXaXdh6K/OQg==
X-Received: by 2002:a1c:f20c:: with SMTP id s12mr5863834wmc.133.1575562508266;
        Thu, 05 Dec 2019 08:15:08 -0800 (PST)
Received: from gmail.com (net-37-119-134-251.cust.vodafonedsl.it. [37.119.134.251])
        by smtp.gmail.com with ESMTPSA id w20sm291013wmk.34.2019.12.05.08.15.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 08:15:07 -0800 (PST)
From:   Paolo Pisati <p.pisati@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/6] clk: qcom: Drop gcc_aggre1_pnoc_ahb_clk clock
Date:   Thu,  5 Dec 2019 17:15:00 +0100
Message-Id: <20191205161505.15295-2-p.pisati@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205161505.15295-1-p.pisati@gmail.com>
References: <20191205161505.15295-1-p.pisati@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Amit Pundir <amit.pundir@linaro.org>

Clock "gcc_aggre1_pnoc_ahb_clk" added in QcomLT commit 9a108d744fda
("clk: qcom: Add some missing gcc clks for msm8996"), broke USB
gagdets for db820c. So drop it for now and re-visit the dropped
changes while submitting it upstream.

Fixes: 9a108d744fda ("clk: qcom: Add some missing gcc clks for msm8996")
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index d004cda..c1e1148 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -2937,20 +2937,6 @@ static struct clk_branch gcc_smmu_aggre0_ahb_clk = {
 	},
 };
 
-static struct clk_branch gcc_aggre1_pnoc_ahb_clk = {
-	.halt_reg = 0x82014,
-	.clkr = {
-		.enable_reg = 0x82014,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_aggre1_pnoc_ahb_clk",
-			.parent_names = (const char *[]){ "periph_noc_clk_src" },
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_aggre2_ufs_axi_clk = {
 	.halt_reg = 0x83014,
 	.clkr = {
@@ -3453,7 +3439,6 @@ static struct clk_regmap *gcc_msm8996_clocks[] = {
 	[GCC_AGGRE0_CNOC_AHB_CLK] = &gcc_aggre0_cnoc_ahb_clk.clkr,
 	[GCC_SMMU_AGGRE0_AXI_CLK] = &gcc_smmu_aggre0_axi_clk.clkr,
 	[GCC_SMMU_AGGRE0_AHB_CLK] = &gcc_smmu_aggre0_ahb_clk.clkr,
-	[GCC_AGGRE1_PNOC_AHB_CLK] = &gcc_aggre1_pnoc_ahb_clk.clkr,
 	[GCC_AGGRE2_UFS_AXI_CLK] = &gcc_aggre2_ufs_axi_clk.clkr,
 	[GCC_AGGRE2_USB3_AXI_CLK] = &gcc_aggre2_usb3_axi_clk.clkr,
 	[GCC_QSPI_AHB_CLK] = &gcc_qspi_ahb_clk.clkr,
-- 
2.7.4

