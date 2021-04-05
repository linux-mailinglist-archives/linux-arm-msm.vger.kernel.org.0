Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD8A93548E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242886AbhDEWsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242888AbhDEWsM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:48:12 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A14CC061794
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:48:05 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id n8so895816lfh.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rg/duZw0gU1onjIcDsIMU1JUbVdlmgsLzC71USqejBA=;
        b=jwAdRFq43r/sbrOg2QdAQED3w/1Tdb3l6/ijlBR8t7pbRuikgZdOY9PT4vyEQPaLVA
         4Pv/YSBRAUBuBIY90cOI25l/kJBu/U9+xSGcfdoPRf9o4TazslY06JiHhjuj1pi0K+eU
         ct88MP7cG3SPyhkeOQF9VQa2Guw/hPw2i4xZ+cBdCETcNI6lbL0lGUfojXjo8mxwDkbt
         cZqPtSOL1Tuj1M/LKoQoH1jzamEquHjVs2JNVflP0JWX/e4jKblUuQcUz/hokMVQHDnn
         tQT0o4AURSABAxeaGkKS8yWBVvZYoi0iD69L58i/LHkRvtyGjjkwfqCHT3g2KCLwDaL4
         pqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rg/duZw0gU1onjIcDsIMU1JUbVdlmgsLzC71USqejBA=;
        b=dduaawTCxYwrG0IYMk6NZQwqoemSwLSmHoT6SsZ010fbJ8KdE9h0+f43eqr8w71JtC
         aeiHcc+RiF1dvFPr82koXuGbBbDYd35jQjANRsmue81zDIsEbjMYmqh2Lu4g2MaJaoqc
         otHGHirbEPMP6dqJl6n9JI9dnmBsFQT+EC8l5hwHtW11MuBxXHSwuHIz0gcU0Etbh6tD
         A8u1PjdAI0PadbdXiErK6k5kfEGC3si6qVLe1QicjS8rqKQzOrChpTPdd1DWfHHX50yT
         AxyLYTNsiDgKmkFsh49Q1DPYPrCfhqvtDLaBH7eG6dAwOxF1pLU8Agoz1CM1pxIiK5o1
         i0DQ==
X-Gm-Message-State: AOAM530cV2OyoDa1RhmOJjealkgvCjS4XN+qu1S3OThlZTg7y9iPc/Pf
        yCllH/pv+bHIBFCKiQOt1E58Uw==
X-Google-Smtp-Source: ABdhPJy4U5dVHYNAi6pUQZbuPnHqyRFssuf1JZaj8Lcovw0m7Auyu0XihDmmKMvyqwhzdwc9DXIVsw==
X-Received: by 2002:a05:6512:3091:: with SMTP id z17mr19077045lfd.84.1617662883799;
        Mon, 05 Apr 2021 15:48:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:48:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 26/33] clk: qcom: gpucc-sm8250: use parent_hws where possible
Date:   Tue,  6 Apr 2021 01:47:36 +0300
Message-Id: <20210405224743.590029-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch to using parent_hws instead of parent_data when parents are
defined in this driver and so accessible using clk_hw.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sm8250.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
index 67c136a77efb..9c1f8ce32da4 100644
--- a/drivers/clk/qcom/gpucc-sm8250.c
+++ b/drivers/clk/qcom/gpucc-sm8250.c
@@ -147,8 +147,8 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_cx_gmu_clk",
-			.parent_data =  &(const struct clk_parent_data){
-				.hw = &gpu_cc_gmu_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gpu_cc_gmu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -204,8 +204,8 @@ static struct clk_branch gpu_cc_gx_gmu_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_gx_gmu_clk",
-			.parent_data =  &(const struct clk_parent_data){
-				.hw = &gpu_cc_gmu_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gpu_cc_gmu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

