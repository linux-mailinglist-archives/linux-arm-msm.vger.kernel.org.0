Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD25372575
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 07:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbhEDF3v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 01:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhEDF3v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 01:29:51 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E181C061574
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 22:28:57 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id e15so6276549pfv.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 22:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ts19LcXzJnm2OK0dKlHI64T4AANtdk+C1elhddnhZ4k=;
        b=TSRMvon4FdD8NHLI1+656d3UAALnt4POSawOiyDfsw8RDog22qyaig24zVhKgU6Wbu
         I29fbfqm6Q9sJ1PWouIm+m+Dy2hgxOaXdzysEXWj3o8tTXn9My7oyVirKEtAbsAH3rpR
         XOehcTuE6yAgqffZgx0XoRDN/nSjCFOpWDo+d2TPdlgRPZrPa7Q7ZlFCbs6bhrX2UFHn
         A2n1KEYY3Vl43/dTFaAVSl1EOKW00l7uxcJawHnOHEktNmS6uG+wF/Hgr1ZB84TGsMjs
         hh/i3GzH84QTgcEldcynV0F8RTvFjdeoI5y83pjOJedJ8ek5bhamoq+mdN3wZGu9Of0q
         +adQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ts19LcXzJnm2OK0dKlHI64T4AANtdk+C1elhddnhZ4k=;
        b=RpSANh654hM0kF3+4TueDBZC3eoTuoGqDmCIbhjvNbKLnHuOYmdtyqltZQ3eWuCfyX
         yoiYnbWMFoEk8//bPt63Cry3ZNEsxHARN3G2ceQXoLoTBExsVPh4IPD90TcAFXXse/Fr
         VKmVRwnRMq4NzvbWDfeY6AB5wOi4cZ6QVPpIP0ViKeJTg63igsNy9i/hgCgrG4uZfOV3
         ZItMoX0dnxJ6zsS9RjkHe/NpNe0wdEtQRVKC2FxGp2ju50ejutIuKMvRReL/AaPes9Ym
         529urb8SFA4CrzrOXNvtOFx9Sb3CmplJ0718qfTj59I3t7mMRz6xUAAgbHRCi5sioUaq
         YeOw==
X-Gm-Message-State: AOAM5307Qdt8HZTHR/t+f7YuWh7z3nnd926KH/7OKBwOp1ILEXp0q5yn
        2dtVEpOrwAGkpb1HAWfsEED0Og==
X-Google-Smtp-Source: ABdhPJz2XiWwCEp746etZEjp1bdfE8F+eo84izKixIQN16nnxgI0pOpet0UmOEQ5ZaSq+9EMM8UpCA==
X-Received: by 2002:a17:90a:1782:: with SMTP id q2mr3457058pja.73.1620106136731;
        Mon, 03 May 2021 22:28:56 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 145sm5933229pfv.196.2021.05.03.22.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 22:28:56 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/5] clk: qcom: apcs-msm8916: Flag a53mux instead of a53pll as critical
Date:   Tue,  4 May 2021 13:28:40 +0800
Message-Id: <20210504052844.21096-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504052844.21096-1-shawn.guo@linaro.org>
References: <20210504052844.21096-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The clock source for MSM8916 cpu cores is like below.

                        |\
         a53pll --------| \ a53mux     +------+
                        | |------------| cpus |
     gpll0_vote --------| /            +------+
                        |/

So clock a53mux rather than a53pll is actually the clock source of cpu
cores.  It makes more sense to flag a53mux rather than a53pll as
critical, since a53pll could be irrelevant if a53mux switches its parent
clock to be gpll0_vote.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/a53-pll.c      | 1 -
 drivers/clk/qcom/apcs-msm8916.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index 45cfc57bff92..8614b0b0e82c 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -70,7 +70,6 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	init.parent_names = (const char *[]){ "xo" };
 	init.num_parents = 1;
 	init.ops = &clk_pll_sr2_ops;
-	init.flags = CLK_IS_CRITICAL;
 	pll->clkr.hw.init = &init;
 
 	ret = devm_clk_register_regmap(dev, &pll->clkr);
diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index cf69a97d0439..d7ac6d6b15b6 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -65,7 +65,7 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	init.parent_data = pdata;
 	init.num_parents = ARRAY_SIZE(pdata);
 	init.ops = &clk_regmap_mux_div_ops;
-	init.flags = CLK_SET_RATE_PARENT;
+	init.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT;
 
 	a53cc->clkr.hw.init = &init;
 	a53cc->clkr.regmap = regmap;
-- 
2.17.1

