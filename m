Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A4C2EFCBE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 02:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbhAIBdP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 20:33:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbhAIBdP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 20:33:15 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C292AC061573
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 17:32:34 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 23so27286183lfg.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 17:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TGGL7MRmQ1s/aUig13t2N3SebYQRAiSHRFEw3Tw7vUU=;
        b=cNYhBXkI7teD7LNqqA+xnu7st5wah241+yrwl9D/pHxHts5Ai5r7K0zT5ITjGWYJzM
         FSUxNvf5vaxDtGM7+92DX+9YwUrIcr3IetiPDnLz4zhsvd+fHigG4dPwwWHsNT5xok85
         auLdEOt6gmI3r7L+XLJ4rFG+6h/AXhy996Y3yk8ZTxlp2SimDLWkKSVcoidD2YLVVfOC
         nF8spE0gK42RBr5mVnZyiUKavoDlbqFbburcW9Kh2F9O5GZ+CtRXvdAT/0HnICgVo6zS
         R+Xc1P4YMJemmgMn3yqAzgH3LdMomkEYtztE57Y+Q1bekYbrmmImiPEJZyQPUjwahlRq
         IShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TGGL7MRmQ1s/aUig13t2N3SebYQRAiSHRFEw3Tw7vUU=;
        b=GSCvqM1odKdkJqe6FYVX5p1aRTKsJBY08cxMtuByVsMVusdTmFCHTm+HXO3j9oJW9A
         +6NTVn3PUTIL1D4eEvNeMb9N55DmN1me4yDqfNQea4/iHjftBTOXbkJnvNix53GDfxpc
         JyvSt53uZzzXwSHRxsLO9CjIES/Y9BseiQe1GAnsN9RkYmQ4cAgdDGSpu3NhhczmaMat
         Y32WCovlvwtWTdlJXnc1NDwmR0hWybQPPkMWOEDTNqEjKdM0M0PQ8VAjBcLVFCKCWKDm
         wLoUWbMRKMXdwzH/5EurR0nTvOX1M3dwAAUznzK1WJX3JlH/fCcXl1ZVMvMXKjXFs0DI
         eW6g==
X-Gm-Message-State: AOAM530fhzWaVDywH4m9DMS1pL713XyRaGlwvioOu0Lxnr5o3lmoFI6W
        uZGepkltTYgbPnYa2YHJ4Ts5RQ==
X-Google-Smtp-Source: ABdhPJwzLaXRzgBdgJoEm4J7YJzIudRuzGSfhxzb+vfambZZpDdhXzSYRHBvUoZBC3qTIWgKwzp1lw==
X-Received: by 2002:a2e:87d3:: with SMTP id v19mr2745836ljj.207.1610155953128;
        Fri, 08 Jan 2021 17:32:33 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.99])
        by smtp.gmail.com with ESMTPSA id 132sm241045lff.197.2021.01.08.17.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 17:32:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sm250: Use floor ops for sdcc clks
Date:   Sat,  9 Jan 2021 04:32:30 +0300
Message-Id: <20210109013230.3443039-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Followup to the commits 5e4b7e82d497 ("clk: qcom: gcc-sdm845: Use floor
ops for sdcc clks") and 6d37a8d19283 ("clk: qcom: gcc-sc7180: Use floor ops
for sdcc clks"). Use floor ops for sdcc clocks on sm8250.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 3e5770921a88 ("clk: qcom: gcc: Add global clock controller driver
for SM8250")
---
 drivers/clk/qcom/gcc-sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 86381ea8e37f..8e79d0077b55 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -724,7 +724,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_4,
 		.num_parents = 5,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
@@ -747,7 +747,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.name = "gcc_sdcc4_apps_clk_src",
 		.parent_data = gcc_parent_data_0,
 		.num_parents = 3,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
-- 
2.29.2

