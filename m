Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABED4761E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232353AbhLOThY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:37:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbhLOThY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:37:24 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E890C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:23 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id z7so45109839lfi.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vivgKeQMDgLHDGNiXg2jUG+htUOKQ6yRJeDDy0agyJ8=;
        b=uhK3REmtVgm+nZbC1NGrQTqfxSjKKqT8RPPtcgJELUbGvwih1sRaaumtie2uPEErix
         1LJ8Z7/NE0YLYOosAzIHuBTFFpbr8agjyJQTkCnjBssYdwMuZkqiSHiBdYqxnrtPGPwU
         A8gEiH2oZMdxCOtLLqwANwUL2RlSI+FacfIXfE1pkdDPv1v/Ra4QJxxIG8W8KUG60/NE
         dU096p3xHqqME/GEZU7t1USl7fC99kLAcRJ0LZ9dE4coM6T1og0QMPX+4MZO0q5kHX/c
         nLfENI+4hBouOdBQg8YK11J+r39TyepEtJtTBtQ4hkOCbsDoV9L9qwmxq3Vum4G6qBm8
         bOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vivgKeQMDgLHDGNiXg2jUG+htUOKQ6yRJeDDy0agyJ8=;
        b=P0+nst/IWxHyi7gZhFH1N66DCkKaMKQoIaTIp3erXsJWEeWukxAKGY3lhKkOdy0J59
         9OWahPK/DqX8T7a12z+YHDF92dULXtHtz/QtuYq3GiSfr8kauyMscvUfoj80zAg1XHkU
         wUwzG6xdnJFQ0o9jpXXFRQjn3IIrXo16ILctNJxP/y62SZywOYOPg+k4ttIhpwoTPcOs
         vFWiIOqhTKzUkn5hSur47Ox8Hdpaz7mtn+FiRSe1VGhn1ovrPmnszR82jliQC+lbG4UZ
         Y1ERIfKaLWrJRZZLB4oPZ8ul3exoBtd7ptapENGKH+tb3asBPUN1Q7v8kySgFck104D4
         KpPQ==
X-Gm-Message-State: AOAM530q56zHol7RYlY+XzKkAw2KR8uH4oCFPEU/G95cXnM89flwlIjX
        Ki1r1Or/b++lhZAksd79/QzkcA==
X-Google-Smtp-Source: ABdhPJz9iDr0VX649H80KCVHTY1gEcfhphwsqhSk51tL0jL2ErEc92beKif1yUNOIP5wIz7qmYCSWg==
X-Received: by 2002:ac2:5fcd:: with SMTP id q13mr1656906lfg.621.1639597041925;
        Wed, 15 Dec 2021 11:37:21 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id a7sm460592lfi.149.2021.12.15.11.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:37:21 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 08/16] clk: qcom: camcc-sdm845: get rid of the test clock
Date:   Wed, 15 Dec 2021 22:36:56 +0300
Message-Id: <20211215193704.2821775-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
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
index 97024e466dcd..6210b0fb7eac 100644
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

