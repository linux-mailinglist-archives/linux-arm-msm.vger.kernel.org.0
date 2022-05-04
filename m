Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4C1151A5B9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 18:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353547AbiEDQmV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 12:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353544AbiEDQmU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 12:42:20 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F2F2E9E3
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 09:38:43 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id i20-20020a05600c355400b0039456976dcaso1459140wmq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 09:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=siU+wBqj7fM15r3xqMtrTLdyDG3+rk6lYP4gDSiorCM=;
        b=B0DKbibSbI7ljdG8oBkHEC/g0wXePf+zk2ObPHs886bF35Qqf/8phpN26C+GHwNoWH
         B5zMyziOHqNRkc6SyuLl6fnZT4dvpsl6Yd2FHRRSMwu84Kt295b4piOV/yCsicrHGlVu
         4SmSuR0YbQInk83UsQHaaqAdzLwYTRNa1S0Q8cbLesTLcUBeyXn7xyPLB3k+5x+SZitL
         D/RqFvVOsWeqVY942JYZV/DFn8YATN/f54S3kikqfE4HQC4dstEtih82MzMD7p9C1AG9
         DTkUNAwN/10H6gdz1wYdxo3NFoLbO8KZrT9oPsD2Ldkk5utYBwW8qasEb7BPQf+foJnQ
         UhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=siU+wBqj7fM15r3xqMtrTLdyDG3+rk6lYP4gDSiorCM=;
        b=RhtLFjx4NdGmDyAcPtyphQUILapHG/PFzMgMRvGDb7YkYXnZmpPl9UgQ9SHCyfaINT
         fgCER6BmyARU1qjwK4W8BdaDmnbF4P9Gxelv7JpbEHos/laIklv54KEX3lZKxFxY+6IN
         ek0oMP5UuvJj48LjhCejMLrkDtVm1Z7LmvKuCQD9l490mxIZTZOeE8Ix8ncap5FLy7n1
         8YV5ioHvKtqjmQsY/ZxT0YFp1hR65a2v8I1woMcvl31dB05lNaufL162Pe59kmA3B/Vw
         R9KBE1dK250eeQv2oFBLPApXrTTdS6Mf8x3p6s9NVep1K+rHXRvQYvSAMpTMhyQBS88U
         sAqg==
X-Gm-Message-State: AOAM533hk5xFW6i585+pFKU/CtFV6BHFpegn4/7IqXcQs/CGW4JVVYQn
        VYSLtB8CHQctkq/aZRG+RVQi6g==
X-Google-Smtp-Source: ABdhPJxNFJXUOQ9ChpPHqwkZYcSRVG3a8L0gyd6JnmKyTzdas4oc9zIkBOxTzohl2v1dWuWc4byK6Q==
X-Received: by 2002:a1c:2542:0:b0:38e:b64c:6afb with SMTP id l63-20020a1c2542000000b0038eb64c6afbmr218725wml.65.1651682322115;
        Wed, 04 May 2022 09:38:42 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r20-20020adfa154000000b0020c5253d8c7sm11671706wrr.19.2022.05.04.09.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 09:38:41 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 4/4] clk: qcom: add gcc-msm8939: Point MM peripherals to system_mm_noc clock
Date:   Wed,  4 May 2022 17:38:35 +0100
Message-Id: <20220504163835.40130-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
References: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qcom docs indciate the following peripherals operating from System NOC
MM not from System NOC clocks.

- MDP
- VFE
- JPEGe
- Venus

Switch over the relevant parent pointers.

Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index f27e19035c4f..c9845cbdde2a 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -2455,7 +2455,7 @@ static struct clk_branch gcc_camss_jpeg_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_jpeg_axi_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_noc_bfdcd_clk_src.clkr.hw,
+				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2659,7 +2659,7 @@ static struct clk_branch gcc_camss_vfe_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_vfe_axi_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_noc_bfdcd_clk_src.clkr.hw,
+				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2815,7 +2815,7 @@ static struct clk_branch gcc_mdss_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_axi_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_noc_bfdcd_clk_src.clkr.hw,
+				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3207,7 +3207,7 @@ static struct clk_branch gcc_mdp_tbu_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdp_tbu_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_noc_bfdcd_clk_src.clkr.hw,
+				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3225,7 +3225,7 @@ static struct clk_branch gcc_venus_tbu_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_venus_tbu_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_noc_bfdcd_clk_src.clkr.hw,
+				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3243,7 +3243,7 @@ static struct clk_branch gcc_vfe_tbu_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_vfe_tbu_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_noc_bfdcd_clk_src.clkr.hw,
+				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3261,7 +3261,7 @@ static struct clk_branch gcc_jpeg_tbu_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_jpeg_tbu_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_noc_bfdcd_clk_src.clkr.hw,
+				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3498,7 +3498,7 @@ static struct clk_branch gcc_venus0_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_venus0_axi_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_noc_bfdcd_clk_src.clkr.hw,
+				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.35.1

