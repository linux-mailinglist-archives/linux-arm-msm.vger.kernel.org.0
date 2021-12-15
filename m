Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F2D4761ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbhLOTh2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:37:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbhLOTh1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:37:27 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D4DC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:27 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id d38so781134lfv.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0qxzUI1bMJ1leNljdsV9Ai6m1pYm9LuHUA4SWG9Ci20=;
        b=oIYlaaCAUouQYYSaJgyFWfO/74G4+HmpWvBh6RJ4+bo+ruE7lQNUji1o8LyWYYSLMD
         LE3Gds4UZ1Cj5n5Up9Clj0GFa23gqkSu0GiWhMQ8H8A1izLfGCGoQU8pNi5/1zdjBKuk
         OkLSvbf/tbWZW/QzbcLY/8GGKeSzKUVUxDwFGEhV4kF04/JCehD/D/A6KMiNzXUWK01J
         2Yj863kf41HB5L8+tCQ1+/94XlQoIlIkCfmNM4HAWzTfncjXmMqtXwyri+EI897ajWAZ
         eCSBTePg+C/H4UTiZnWNrSDKuu5cZJnWB0cXvXijznBc38zmtFcO2Z4ebCQ6UM3L7yiT
         HXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0qxzUI1bMJ1leNljdsV9Ai6m1pYm9LuHUA4SWG9Ci20=;
        b=5we/KF0Q/W82hj8As1mw1GqCho4Zezo7l3lKUT7TbNhk8oWUwyCOY+28bwgMJ8el9l
         AL/9JVhygOnhnqidQMO9bgLBJXuHfhNeqHXfDYp5rgCWVx7vWAHsuDEczeO6lP7jw4b+
         ZTJ9CfdTJaILjYFGlyUxqk0TMkghp2fe7JnevMN2DPQ/UC6VZUOCheXm1a+MXuH+Xq2N
         dlwlVNJgToLpc6EK6gORuMn4RB/CHD+B4EMXpFT0kf2NczLILeCAmViBhXkA25TLpFUU
         RbAniVIcVn7P4IZssU95DUx0iZpBr+k3rs0OcaN7Adw6o0qDu+P+D+lTlHPbww7zcnu5
         54YA==
X-Gm-Message-State: AOAM532NS/ONM37rFtr+ZGVp+UsnkBaEjEf1/6JThO8zj4oi+jauKQ/6
        WXF+9fR9wpQyRH0NPKSkdQ39Qw==
X-Google-Smtp-Source: ABdhPJzz4pjPeOHVvVEr3CuohrQ9vupGyFxek1hhyoPU9zA6WvrgpdJwbd1LeeWoYurfWcAz2yveIA==
X-Received: by 2002:a05:6512:3b0a:: with SMTP id f10mr10890315lfv.410.1639597045671;
        Wed, 15 Dec 2021 11:37:25 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id a7sm460592lfi.149.2021.12.15.11.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:37:25 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 11/16] clk: qcom: videocc-sc7180: use parent_hws instead of parent_data
Date:   Wed, 15 Dec 2021 22:36:59 +0300
Message-Id: <20211215193704.2821775-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If all parents are specified as clk_hw, we can use parent_hws instead of
parent_data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
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

