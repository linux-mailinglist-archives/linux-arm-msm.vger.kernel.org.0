Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC40346DA83
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 18:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238329AbhLHR6Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 12:58:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238373AbhLHR6N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 12:58:13 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519BDC0617A2
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 09:54:40 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id l7so5117192lja.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 09:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sxL2C2YNiw7asLGMMPsl7e/9UK8nM85q1DiDSzw8EWQ=;
        b=Po4CLULdhF2vUIHcRj0/K7B425uoqZkYBdlu49IaVteQkE2TOy3uJ7ZCmJHNif10Xy
         LEeLTF2c/xEk7pIN+O1V5r/2nkSo0EZ+opLyqc4bgulKbRBA8Zct1RxqfHvmMu2m2Yg9
         solrh1WxMFRe5a03WvD8ybgT+VpfbTCfauesb+jISSKHvsX8g5HywRkP0pendQ0w23xx
         xzarCiKjGO8YzVO4b2xYOGpVoHLh8eMHsCZvj4w1FWDM2X+ZOptN1MmJwIdCmPWwI0uq
         NWXADgBjIH/CDs0k0hR16EgqgMpQt64TeOqfXG4gYwgyUXupevizoKwellSt9v/d5TOf
         /YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sxL2C2YNiw7asLGMMPsl7e/9UK8nM85q1DiDSzw8EWQ=;
        b=0CnGy8BPdSSuk3posCFLRtRD98ihnP86QfGzZ243XzOJnkHX4oaqzb2uQFpxNGCWGE
         oD26uxtHaNGP6DTCmK3UXKHlBB/I4Vq/y9Z1OLPPgnOXxx+74QPskaoBUvmV00z1mBM4
         xetY6mewdNnnfggyDOmq21fEaLekxjQvOvrAQhZY1QwTt1fa6X2ScMzXe/wmK9VB+1S/
         6Oxt4tt72H6yyxcR3fXoB6PYMhDV3CwRPTn5Ii9b8oR/FiML7mH4udLLZ9bM1Cj65f1L
         I29zRMLEXoYTlFX3HsWs/5239urUIZCk/vAsJhxlkOw5WrhEn5VVTqkn/pp8zbJqUt3H
         BNiw==
X-Gm-Message-State: AOAM530VYjVRAmOvQpbLOV3qSGce5rYzTHFckQ8k0duHDTtmpLx9Fguy
        V6e759HPrMQy1jYHimFz5MYZiw==
X-Google-Smtp-Source: ABdhPJxT101IoywolzHa0OJq+zHQIwKfl2vOp9dXhucyzhcWIWifJstfs3FcUhoqsZ10p3Mv6kbMIw==
X-Received: by 2002:a2e:99cf:: with SMTP id l15mr942978ljj.111.1638986078650;
        Wed, 08 Dec 2021 09:54:38 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm388903ljg.90.2021.12.08.09.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:54:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 07/11] clk: qcom: videocc-sc7180: use parent_hws instead of parent_data
Date:   Wed,  8 Dec 2021 20:54:26 +0300
Message-Id: <20211208175430.1333594-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If all parents are specified as clk_hw, we can use parent_hws instead of
parent_data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sc7180.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index ed57bbb19f88..5b9b54f616b8 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -99,8 +99,8 @@ static struct clk_branch video_cc_vcodec0_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_vcodec0_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_venus_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -143,8 +143,8 @@ static struct clk_branch video_cc_venus_ctl_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_venus_ctl_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_venus_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.33.0

