Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64056480618
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 05:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234789AbhL1Ey2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Dec 2021 23:54:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234791AbhL1Ey1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Dec 2021 23:54:27 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD279C061401
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:26 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id p7so28075975ljj.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n6QTk4EYSkPPr0WQID0w8l1zkHAqcIkrp9aELlsqEJ8=;
        b=yTlEW/+fgUkDNGpUPhAN1O9jI4p8bJAox3FOu7gJEHk8JWsGbEy+hmGuPrA+TsJMJa
         WNkyYVQDbNbY0qOlSopuUb+1P+DHEttb3QrmgJ32RilZnTGsQ2tQffKcSNmKvcEqL29A
         aSf6PMOUpbLOfWhmQTb8Jp49Mnwvy/83RbjyT7aLD6vLe0GLPVz29zTB1JUPtMnq4vXp
         9RuD9v03ja53bA1f71t2RO/9cmAk2K7zhbzB4lKmZCroR0qI4rcNWUUT+T7VqDZVbl2W
         beHT6nWwOjFWBCwJwMMCdIIpnkOSmOjNk2V+M78Gbmz0Ewm/uB2hmnp6yf3oiZSX3M9I
         /7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n6QTk4EYSkPPr0WQID0w8l1zkHAqcIkrp9aELlsqEJ8=;
        b=YSnNVxFq8fyoMA5dkxmJIYFFw0s90/UuzUpyHqPYPyvmhNOaCcUGN83GxMnhVOFwkJ
         r8N/WVpRQ5qJNkoojjhZ2tU2MvRLdTHdPnlNF0GgLAyixZhur0Jgi6H9YO4d3ScQPBIH
         b2DbWbY3Kdb1YGGvPo9mZW0M6EnPyIw3ewSAcqpfXKYddvFuZJnonXu55kxZTewGpW6m
         /iC/n3oYqL/6BT6YLDJyduN+7kwntyPjPKBLNEha0OFI6RG27S+6bcl3idbj8+HDJqqg
         bztKs0iFhJiWGjwgOMzb4KNYx7QyMwMCUdfiSG9R4XYDsaSxcPfQnqUrUQz5EG+WdycA
         n9Nw==
X-Gm-Message-State: AOAM531lOcAHnfLKY1ae8D2dtR58JpixG6cXGTHxPnzuDTeHYGEtbT3b
        MU1FWc1aHPtmJX+1iP4Bqplymw==
X-Google-Smtp-Source: ABdhPJwiE/2SKv+Vqs1/kG6A6meewfk+h6f152TOXBWA8DGjiGPQrA3rfj3mhwDhQQqO7mIsGFhdbw==
X-Received: by 2002:a2e:9183:: with SMTP id f3mr16150286ljg.277.1640667265212;
        Mon, 27 Dec 2021 20:54:25 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 09/16] clk: qcom: camcc-sdm845: move clock parent tables down
Date:   Tue, 28 Dec 2021 07:54:08 +0300
Message-Id: <20211228045415.20543-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
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
2.34.1

