Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 051DB474F95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 01:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238668AbhLOAys (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 19:54:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235240AbhLOAyr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 19:54:47 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70EA8C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:54:47 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id l7so30910251lja.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YjtmLC1Vf5ZIFfw4f99ohhNZHTDpH6wpJkebrivmqJA=;
        b=OyH9U1gGbntZOkZXCtT7+E/3yTS+Qhuyxt+ccmKoawGIGLsl6DRVVaQIXux+0ALTs0
         wqIOOnGn4vNbVjbZJosGajKGcYgwBHS3B1GS5+KXuuzW68AQS1iLVsiGJyWW47iybmR4
         Y9/E9ZbRYTDoMThfAugVy04eTu10tasLV4IEJxcNpr0s1iFDkvcSe5Wf1q0q5RgTcyFV
         CdI6dtMuvhDjhvsVVvwXRslXt8SiFp5Ga20NKz3Sy22tyF6F/gJJDUeOUa7jW1egUZHm
         YVp4A7Trm21CNggBIAGOGZ2PcIZmz8Dt2Nk8Ozbl1yOuQlK0CW+JAjkeTfQQcq5CEHB0
         RUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YjtmLC1Vf5ZIFfw4f99ohhNZHTDpH6wpJkebrivmqJA=;
        b=ENv/3LY10OaGmQuvw8yJJVi2aMPqHIfCKREWLJ4NmINMLLzzNLVPpTtSyPHxcI+c9+
         WxUSU7Q0qyjECgDT2ZmpinpFGXX1XuJL7VUVL1AAkvxReW1wrVv1tmO1Y/z4xCb0PIpu
         eG3MkvG8Pac6wZZgtSpD1eMIHqDL8BP2ckH3pbJESKzA3RL7UJSJRUAti0ZoaPqPhndW
         Xk4R+P77qU/HJzK+TG27NaW9qmLhUu8G275hg6CFRwL1jE7nR53BTRUyM93w0MJXa9YI
         R8aODI5VOeCLRFwNJpxc0NxcebcsgbZ72Fb52pykLyzAlvcf7njvnDYI8ZDHpbfNptO+
         bJQQ==
X-Gm-Message-State: AOAM532jid2cOLPSF1LFOgMH2Zq6nICp+B73AnnjY9kz97SpaiZq2Yi6
        BVJqTI/d/BzeQucnJn0MOePxuA==
X-Google-Smtp-Source: ABdhPJww3rA5+O62rNKiakFtKOUXQ0lIqvsxa0/up8nvRlkxdqL1UY+xjUAtOe9IyOcRvCrd0Pt0UA==
X-Received: by 2002:a2e:b6c5:: with SMTP id m5mr8080780ljo.220.1639529685691;
        Tue, 14 Dec 2021 16:54:45 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id b12sm53022lfb.146.2021.12.14.16.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:54:45 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 01/15] clk: qcom: gpucc-sdm660: fix two clocks with parent_names
Date:   Wed, 15 Dec 2021 03:54:09 +0300
Message-Id: <20211215005423.2114261-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Two clocks are still using parent_names, use parent_hws instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sdm660.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 41bba96a08b3..7c07b0979aea 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -204,8 +204,8 @@ static struct clk_branch gpucc_rbbmtimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpucc_rbbmtimer_clk",
-			.parent_names = (const char *[]){
-				"rbbmtimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&rbbmtimer_clk_src.clr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -222,8 +222,8 @@ static struct clk_branch gpucc_rbcpr_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpucc_rbcpr_clk",
-			.parent_names = (const char *[]){
-				"rbcpr_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&rbcpr_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.33.0

