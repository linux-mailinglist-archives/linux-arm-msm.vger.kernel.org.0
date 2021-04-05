Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D67F3548E0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242868AbhDEWsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242880AbhDEWsJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:48:09 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B907C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:48:02 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id b4so19660225lfi.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CirwHfRqNkxZ61ByzZxH4GAvvF2OlkI9rsYKqqpyblE=;
        b=LtFYuxs72d4/z3qRFG+7AznaUBkmtrpND0rMUYcCA/UhXgVC8Ul8vaxerWsAdbm6Z3
         Ie0XaTAozbEEUeVD0Z2vdfZfg6YzZLNEa6YNXbP0/9+zZFhUB1/VA+wxmH+7WaBIgFCL
         eR+fucuKbp9raBOGjSVECfd2kFeMd4Ql5ISE/3riy2BCvoKdn6mzSQOCDj5u/EOmc9Wo
         ZYTPYdlQU4gyZ7Z/7OEqnJvqCpOGTibcaFvlWt5PL2nJLV2zKIQe1JINeu6d9D28xS35
         phGFVGp9foAKz5+qn3+xVxkkKsmCRe9PR1dEY1FHyOHf0dw1rJQU/k7g/oMpxlDbqC6A
         2g7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CirwHfRqNkxZ61ByzZxH4GAvvF2OlkI9rsYKqqpyblE=;
        b=fZ7/V8FVfWJN9eaWCVTk0Y4U7eQiNHJ+U4EqkQGPhIqDzYl+QRPNGFOUdUyV3wgxjp
         Pl5JDYpMpruqLBqz5YF0MBMrergm4vKBlbCcDOqZjFQL6kCq0kB6OksM9BQqJEcfPlWQ
         R6U0O4m+Tl1QshAxIOl1YFvJ1QUMXQfmhUk4ZxdFk8E4goG8siIYhB9LsTCv8u7nkXHr
         fDN3LhE6pe+Alncl/HB03DoT7AtNdfbKnqHbFMeohrfs8cHofhARmmu4mREKZV6EXHk1
         XsrUa5OD/y/ywQSs5QA6duFDTIA9FpMgAZgkGXUA9ERu8E4pZst3/u6a1CeVw+8N6yxS
         A0Fg==
X-Gm-Message-State: AOAM532NAqToV3s+fbkAFg4Js4sNBdJ9FXKODB6+E0mq0DFQo4U2ziM0
        eu/PPzKUHB26z4ruqYqIvHBsQDWsYz8bvA==
X-Google-Smtp-Source: ABdhPJzRwHwXKOPPiumK3BJrPEEqF0AFIe/K3AdiPmuSDA6zU9k1ETlD+UL1sDtIqySSs1T8dL1PLw==
X-Received: by 2002:ac2:5228:: with SMTP id i8mr262048lfl.27.1617662880615;
        Mon, 05 Apr 2021 15:48:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:48:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 22/33] clk: qcom: gcc-sm8150: use parent_hws where possible
Date:   Tue,  6 Apr 2021 01:47:32 +0300
Message-Id: <20210405224743.590029-23-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gcc-sm8150.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 8e9b5b3cceaf..e642fe785c12 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -69,8 +69,8 @@ static struct clk_alpha_pll_postdiv gpll0_out_even = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0_out_even",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gpll0.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_trion_ops,
-- 
2.30.2

