Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 657834761E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232374AbhLOThZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:37:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbhLOThZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:37:25 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7508C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:24 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id p8so34949416ljo.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LTED+BKlni4BC603XN8FKUYwu1Oj07L2DOrxa8DfddI=;
        b=pWOXv6f4ZwmRLzB/3IYB0Tpn4Y79khB1KfSeGMHJzvX2Gco55tWGpo0q+IdhGZG3vj
         x+jrrZCmxbq9/sit4jbfsmj3fcLWIXIr4IHsNCncamRhKJGWhkNfo2W+icd2eeHhkk6F
         uNPz2laku2FZfFwdqfqznnlNYbN78tTt7ML+6a1CK8p1xCAShdBT7vGadBFRnxUy8JBP
         vCYTtusCb/YxoG98BVWhN1jCFqRwQi9Nc1rH6XsIM9UllkszXpl+NgaGjgWy0mLuh7Z7
         UZ0fBNqpvs0m8XgJol/9dEPfaoLSfPRM5Ym1E7Gu2zNk6FXXOBbxLH2k0AaB20D/NuiT
         6cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LTED+BKlni4BC603XN8FKUYwu1Oj07L2DOrxa8DfddI=;
        b=oiWDqSHGbJ5HpLPhI1LJzhcz7eFVobf8Xuj7qiphtFK9wWTbyrV9jMg+Rz7Ajc7M4r
         NSmHmCEjv6lTW6fc1r1AcODOGktbIuhMIxuHu/fAPB3yRMkjeDDkpHWdQi7jc4OtGD+P
         vq/qAwh6QEnn+6wfDh1Ho/lg28izk5js4mYyanF+rezN0R559VN9lD3jOqqjFmmsKnkG
         LHDUUZnBWWZjE1bt49f5piZMr6+Z1fZxccBU4BijXozf8ZpdXagsQy81vGVByPZqkOQz
         VJQODSTIUCaALXFfCFymMB0NXlEzwvRdOOpmnz2fr98GH26ySzQFWxxdUzSK0brnh8Mv
         bZxw==
X-Gm-Message-State: AOAM533m38jwP1VM9AVnYrzxgDMUO/b0SRAIal1FO3OMYS5qg8Bix9zu
        pXYsJBjrp/bYJL9zTD1DJykWCaZiIKK6Hyju
X-Google-Smtp-Source: ABdhPJzFk8YN5r4CUAj/dKd92zuP6zmZqlf97x2kk4RqS0h/q69yIGR9A3LIbDudENzOID2jDb7Yxw==
X-Received: by 2002:a2e:83cc:: with SMTP id s12mr11620607ljh.508.1639597043093;
        Wed, 15 Dec 2021 11:37:23 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id a7sm460592lfi.149.2021.12.15.11.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:37:22 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 09/16] clk: qcom: camcc-sdm845: move clock parent tables down
Date:   Wed, 15 Dec 2021 22:36:57 +0300
Message-Id: <20211215193704.2821775-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move clock parent tables down, after the PLL declrataions, so that we
can use pll hw clock fields in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/camcc-sdm845.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index 6210b0fb7eac..fd01ea53a07f 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -25,22 +25,6 @@ enum {
 	P_CAM_CC_PLL3_OUT_EVEN,
 };
 
-static const struct parent_map cam_cc_parent_map_0[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_CAM_CC_PLL2_OUT_EVEN, 1 },
-	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
-	{ P_CAM_CC_PLL3_OUT_EVEN, 5 },
-	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-};
-
-static const char * const cam_cc_parent_names_0[] = {
-	"bi_tcxo",
-	"cam_cc_pll2_out_even",
-	"cam_cc_pll1_out_even",
-	"cam_cc_pll3_out_even",
-	"cam_cc_pll0_out_even",
-};
-
 static struct clk_alpha_pll cam_cc_pll0 = {
 	.offset = 0x0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
@@ -159,6 +143,22 @@ static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
 	},
 };
 
+static const struct parent_map cam_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL2_OUT_EVEN, 1 },
+	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
+	{ P_CAM_CC_PLL3_OUT_EVEN, 5 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
+};
+
+static const char * const cam_cc_parent_names_0[] = {
+	"bi_tcxo",
+	"cam_cc_pll2_out_even",
+	"cam_cc_pll1_out_even",
+	"cam_cc_pll3_out_even",
+	"cam_cc_pll0_out_even",
+};
+
 static const struct freq_tbl ftbl_cam_cc_bps_clk_src[] = {
 	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
-- 
2.33.0

