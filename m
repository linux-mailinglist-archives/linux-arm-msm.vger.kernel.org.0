Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FEB63BF349
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 03:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhGHBJf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 21:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhGHBJf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 21:09:35 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05319C061762
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 18:06:53 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id w13so2986454wmc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 18:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k5FkRjNZy41OX+EdXWg5hya79h3Lui7+0lZKw+e++co=;
        b=zBWGbpx9rnx1UKZSwiLjOKyHDCKKTCmgs512msP07UbuwmVofqElp7rgLtVu/RkXP9
         aBpeXJl28hdOKRWBxXNmFilmiVc5b2qIG+0Ox8PIpQpAT72n5tJ08qFcQM8te3ZfUMCW
         doShe49oeTGRKGpKw9pB9BIdsAhJOUyVc9mr8/VDuhWmTp3gTldGC2vngUA5tXfTdLe/
         7wLHcmfhTtKU4MnnmGdv5T82AHsGIFjS/OKphEtmYnrJOAFdtrR+PP4SFq4IwV7E+eWm
         Agn3bcncSI3P5/t+P18zIoeJB5W8elGh5inNsfsgvqIVDUiCEFr31sDI2Uhx+yAAOQEj
         tFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k5FkRjNZy41OX+EdXWg5hya79h3Lui7+0lZKw+e++co=;
        b=EBplQEIXRSPecoXuMbXTOBKcRxLENCWPRrrAyIEbkaHLQHzz4f34Mj1HnnZdrMKYtK
         Av0Ekkq9he+TVk33cohk7nja9gCT6sMdMF+Tuo41XurJdd+yYuBjsV4G2AnSWTM0ByOH
         pNHbrBKfEjAND7iFC1+V5mF3FsFM2XXLpjyZujo3NGHczzQ/HBKfP8JR1GM8DX5eqzMr
         3E2F3aMQJ4el/UuVCK92DAdCM8xllysZQRc8r4KsVYxnEIZsdP+ynN7zm6bLb0xaCjGy
         fkl/6xJFDAFGCgzsNtJhLQy1gMbw4NeMf4v5HMw0+2n3ctogAxMbLQ5NHkHv/x8mJa4k
         bz+A==
X-Gm-Message-State: AOAM533e9otZW+pG91h+lbjuAh2n5N1jNNATU83J2VN+ECsL2H4yeIfR
        DBxI7w0kOLA7TQqMVb8CS+agcg==
X-Google-Smtp-Source: ABdhPJwaL+JBQcScAvm0Mm4Yr3n+x21rLW0uP2e+4FxlMgrITVFswjnUBEBzhPAkE+2cjH1h1N8kvg==
X-Received: by 2002:a7b:c00a:: with SMTP id c10mr2021945wmb.100.1625706411532;
        Wed, 07 Jul 2021 18:06:51 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g3sm537368wrv.64.2021.07.07.18.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 18:06:51 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca,
        robert.foss@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH 1/2] clk: qcom: camcc-sm8250: Fix absent mmcx regulator reference
Date:   Thu,  8 Jul 2021 02:08:38 +0100
Message-Id: <20210708010839.692242-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210708010839.692242-1-bryan.odonoghue@linaro.org>
References: <20210708010839.692242-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current implementation omits the necessary mmcx supply, which means if
you are running the code for this block and a prior clock driver, like say
the videocc hasn't run, then a reset will be generated the first time we
touch these registers.

Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for SM8250")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/camcc-sm8250.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index 439eaafdcc86..c51112546bfc 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -2212,6 +2212,7 @@ static struct gdsc bps_gdsc = {
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
 	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
 };
 
 static struct gdsc ipe_0_gdsc = {
@@ -2221,6 +2222,7 @@ static struct gdsc ipe_0_gdsc = {
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
 	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
 };
 
 static struct gdsc sbi_gdsc = {
@@ -2230,6 +2232,7 @@ static struct gdsc sbi_gdsc = {
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
 	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
 };
 
 static struct gdsc ife_0_gdsc = {
@@ -2239,6 +2242,7 @@ static struct gdsc ife_0_gdsc = {
 	},
 	.flags = POLL_CFG_GDSCR,
 	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
 };
 
 static struct gdsc ife_1_gdsc = {
@@ -2248,6 +2252,7 @@ static struct gdsc ife_1_gdsc = {
 	},
 	.flags = POLL_CFG_GDSCR,
 	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
 };
 
 static struct gdsc titan_top_gdsc = {
@@ -2257,6 +2262,7 @@ static struct gdsc titan_top_gdsc = {
 	},
 	.flags = POLL_CFG_GDSCR,
 	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
 };
 
 static struct clk_regmap *cam_cc_sm8250_clocks[] = {
-- 
2.30.1

