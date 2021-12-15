Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81180474FA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 01:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235240AbhLOAy7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 19:54:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238681AbhLOAy6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 19:54:58 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93E9C061401
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:54:56 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bi37so40093670lfb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o8Q6jahtPjA03l5l87j5aFfaJ4kP3IwmQsz8+qtvs5U=;
        b=O1ICu1E7dpweGYGLU7zOg30oSJg3z4lVVR7VizDukY3JWynPWzg/JG+7dxNrztlkRF
         gMewTXhlPgjFcqRTcKo5Wwi7oqfaWFj+8WSnRmV4T1LI3Dlx1qc79sJUbZjXBaRHZ6fp
         YuyKhFLYe09e88aWdnx3RE1yi7gtgZv9ie2r55LSf5IUcf2hy/27sC/vLcLObzYcseoC
         69TaPJARVKfUJ9Sw5r+MxDyeh9az+0210Mry6sZTn7UzkBYrMb/YmVucpcTUjIgvuDJE
         /ZiWuCL0pGPlaxh2wTRq4Rg+Nkt+T+wwt/8s8Ej5a5vZgfOHonwi3NyQlsQs9JGvq03t
         nT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o8Q6jahtPjA03l5l87j5aFfaJ4kP3IwmQsz8+qtvs5U=;
        b=hguwDWRAe040V7qbR8f3EVALcexOhV9ioJoTaN5uIGLZZ9vyNUfJ1pvInFrfl60YxI
         dLWbYTy2dSNnEUKn9oZ8mCRKkDY4MtjMlVsQM61/ZQ5JzvAd2DOfIWdTK/sP2KBjHEOF
         42kBFoiAVVF7Akms36Euf01aiZBWVxb+pgYOFrACVa/dX65sfMqUFIt/+RgMoTLOE1CF
         MAweVgBxTF00bvWV8VeY4LD/nKF8W//Y/wzze5yNujw9FP1uDPEX0CVOnDWjv1i/dB8G
         wTpRHaK7uX7HPEl6WKhINPPwdw4jolvNbiS7OTiqPXDdnLeviJ0PtjktvEmR6S38LlZW
         Y1IA==
X-Gm-Message-State: AOAM5338KNVnCcwsfcGptOqf3KRKLj0TfkdS5wI36822LB2ps3yRJFLk
        j8SNZ/MPh4zpveFxoST0o9XA7A==
X-Google-Smtp-Source: ABdhPJyep0IFRTV6XUZN7LvqUAU3bDQcsBkvUKA2DIlHxPKLZufz5aWUU5fIlheDVo6/ZhQA2NRuyQ==
X-Received: by 2002:a05:6512:32c9:: with SMTP id f9mr7671349lfg.575.1639529695078;
        Tue, 14 Dec 2021 16:54:55 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id b12sm53022lfb.146.2021.12.14.16.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:54:54 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 07/15] clk: qcom: camcc-sdm845: get rid of the test clock
Date:   Wed, 15 Dec 2021 03:54:15 +0300
Message-Id: <20211215005423.2114261-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/camcc-sdm845.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index 1b2cefef7431..545c288a7f98 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -23,7 +23,6 @@ enum {
 	P_CAM_CC_PLL1_OUT_EVEN,
 	P_CAM_CC_PLL2_OUT_EVEN,
 	P_CAM_CC_PLL3_OUT_EVEN,
-	P_CORE_BI_PLL_TEST_SE,
 };
 
 static const struct parent_map cam_cc_parent_map_0[] = {
@@ -32,7 +31,6 @@ static const struct parent_map cam_cc_parent_map_0[] = {
 	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
 	{ P_CAM_CC_PLL3_OUT_EVEN, 5 },
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const cam_cc_parent_names_0[] = {
@@ -41,7 +39,6 @@ static const char * const cam_cc_parent_names_0[] = {
 	"cam_cc_pll1_out_even",
 	"cam_cc_pll3_out_even",
 	"cam_cc_pll0_out_even",
-	"core_bi_pll_test_se",
 };
 
 static struct clk_alpha_pll cam_cc_pll0 = {
-- 
2.33.0

