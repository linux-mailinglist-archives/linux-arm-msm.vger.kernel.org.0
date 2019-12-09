Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1706117012
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 16:14:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfLIPOK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 10:14:10 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36862 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfLIPOK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 10:14:10 -0500
Received: by mail-wr1-f65.google.com with SMTP id z3so16641498wru.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2019 07:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=seR2eR4oF+9mUqkJVZpxUp4ywuAuiYupPHrHVsyLleM=;
        b=m5vIl0bN8GcddkonWrQti/f5RKhrXWiFxRd4S2Mix1D9ozLn+8PPOxRE/YZvesTICW
         1K5XAv9/Yk5KvqNJ667vEghUpOd3vIlGhe2iYfP5kDgmMdHiY2nbBCnUq075v0K51Tj7
         HNv0nlEYtZ6+pBttGGaxHOZi6sQWxRFNJFFY/w2qh6ehguyNOWEWDPPlDlQUcXeWLFXJ
         07e6w0Vsi+VjwwKQmUjEEMpo3uNqTViwhdz7ob+WNKzWb+Vo0V1RIeUAlPLLiGa48TEX
         Ai7BqC32FJOItNd5j8i9WOw7+rEexre+q7egDDgysH+KG6oBfmiGrHvj5VA0defdaowY
         1IUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=seR2eR4oF+9mUqkJVZpxUp4ywuAuiYupPHrHVsyLleM=;
        b=b08gO8x9l3EkvAkHQ8gwJmMsJTq335q32vDzp8IVbgv6RUPA6cFfP8Y85c6IGyAl9c
         FYTCzAkHHhn5Ae1n4tbjLjmA3CvK31gqJy5tLcil5QNf5c5lS2LZfyZhlIps5YGRE6t1
         pdmPCG0f9ySc+g3XR99VxJwcnRGBULMblH/9lBEBBBr2HF3AuRiXIPoDp7wlMtweBf9d
         SJnSxAMiw68UUP9VYgvX5W/s3pL6Mv6+5vGMakE7Glz6gldOuVnxu4KO/G6NWoCfwWc2
         aSvUcnA4tJFM/OH+NzhS0eOldrNdVP6F/nttJn2c3/h/RVZgJU8iTb4CANqQ9xzLzY9t
         IluA==
X-Gm-Message-State: APjAAAWzwmeGfUXxgrhedB6/LBXKDJDfg8tzWDs4j1HFESUBCbXlPCkA
        enTM4GmBDHFx0pdQYnG5aaMfEPJy
X-Google-Smtp-Source: APXvYqyCiG5wOKi0eJaYMirLTK/MPN/s5q3LBvUpd0jatqDvV0nZzhmjwhegtqoMyxDlVndMArScKg==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr2750029wrv.198.1575904448221;
        Mon, 09 Dec 2019 07:14:08 -0800 (PST)
Received: from gmail.com (net-130-25-95-221.cust.vodafonedsl.it. [130.25.95.221])
        by smtp.gmail.com with ESMTPSA id q3sm28189522wrn.33.2019.12.09.07.14.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 07:14:07 -0800 (PST)
From:   Paolo Pisati <p.pisati@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] clk: qcom: Drop gcc_aggre1_pnoc_ahb_clk clock
Date:   Mon,  9 Dec 2019 16:14:07 +0100
Message-Id: <20191209151407.26886-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205161505.15295-2-p.pisati@gmail.com>
References: <20191205161505.15295-2-p.pisati@gmail.com>
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
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
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

