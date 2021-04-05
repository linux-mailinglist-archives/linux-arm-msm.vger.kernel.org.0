Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C75B03548E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242885AbhDEWsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242886AbhDEWsL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:48:11 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC1EC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:48:04 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id n138so19675441lfa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=totkdhpiKIF1Q8NIelblJdJ8yC3ccQXvmxBlzRWD17w=;
        b=YrXmmP1tWZqN72it1cw/PzYss+HuWqigue7rdA+S+N3SH+dmkG3oFEJCIQv++6OthJ
         C7DN7zMsPpX0omI6AvbtEvi6ZQQ59cUYI/bCzuCO8hP5PB5o0nP9IJmFf06yBIubcJMk
         Cxqn1CzkNJ1osnvyWcXmK91+yRJEO/IWWUOF2WmNknY2sC3h8DGyuUdix+rV2i+5kcPz
         xJeRGLfQcqWyxiFwMg40KtxeKug3/inZjC4+LM5I1f531Z3kCHX2BBL6Ui1v+l5IAZrV
         wiTRxav32mwfnvWp7DYk7zQDPKce+eNpFggvxpaMVg0eWDSXP2zeROaV/aIStnIhy/E5
         CiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=totkdhpiKIF1Q8NIelblJdJ8yC3ccQXvmxBlzRWD17w=;
        b=NM8kAbFEqfxUEeixsm8N6/mfkVLC0IDruqu5uh2mpUv+ddk+l2RfonHnO3Mus7K1RX
         sI8I1doDC7SEHNWuT6O92Y7fGojKxhS7KTY0/+qKENp6ju4v+1sZ7d+hf1poPeXdIyMh
         3c7tYwZ7UcT9ExIexDtsyqp7d5EtOVGIhbJCTEChj78TEoAo3w9NhmnXbWyJdLuDqCkf
         n1sPKyFT/WrK3xx3w4U+1tfUkqgkKUdbgFW50be7HRFSGydDDHnzgmhe6S2djPjuSxis
         qDTu5st7CXpDkFFqH9b03UnBcPW4SdgkJe3dHJRgtVgTsEu3SBFXzxj9+O3iS0NTtM4H
         u/lA==
X-Gm-Message-State: AOAM532njTI+atyfSbXq3rVO/GwA3n1OFBcNtLIXBym7FLFkAhY/0E58
        K0A09hSKHoNEmhBSw/DbQPNjhw==
X-Google-Smtp-Source: ABdhPJyOMRm9I8DZD7jFwJKJDHzOMrMxa39UEnv0lSMP+UFSIQ1ySUc1pDSw/8+Ymr1TsAJ69iFt/g==
X-Received: by 2002:a19:f50c:: with SMTP id j12mr403678lfb.604.1617662882888;
        Mon, 05 Apr 2021 15:48:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:48:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 25/33] clk: qcom: gpucc-sm8150: use parent_hws where possible
Date:   Tue,  6 Apr 2021 01:47:35 +0300
Message-Id: <20210405224743.590029-26-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gpucc-sm8150.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm8150.c b/drivers/clk/qcom/gpucc-sm8150.c
index 2b952f561537..80fb6f73601d 100644
--- a/drivers/clk/qcom/gpucc-sm8150.c
+++ b/drivers/clk/qcom/gpucc-sm8150.c
@@ -144,8 +144,8 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
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
@@ -201,8 +201,8 @@ static struct clk_branch gpu_cc_gx_gmu_clk = {
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

