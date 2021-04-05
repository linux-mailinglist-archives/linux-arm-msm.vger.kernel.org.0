Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAF603548D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242863AbhDEWsH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242867AbhDEWsF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:48:05 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC8ACC061794
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:47:57 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id b14so19622412lfv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iEzrkw61K5ly8sDFI/i2YxwjKTmQEwy94AUAlvXM3wo=;
        b=g4ggItaqWRwGSkve7bxiFmMXP1siO28Hl/9aeH/+AXcOf4FAnp8GbYuPwN906TYVi6
         uQao4dBfP6IXzoD/07/qSxVL+23RQqHik0IEF6juKts4mUN0zXwyHvtmmTXYnMcc9b7W
         NXSlzk1ooV8+762ETIgAuIrincivtCMP1FDnY1/QuDdyayNWer6L2g6LSzoz3QkJ37V6
         dnTI+iDL1LqyjGmqdzr490rEieMC5B90oEfc6vlJ4zaS3s4VK1PWv+oivhEPSkRpO5fP
         aZ8edYmUmc1B25uNJc/+8Qw7gMYa0RErpNg/n4F3pQJwpbKJi08d+piVuqyUhuqTAqFn
         Y0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iEzrkw61K5ly8sDFI/i2YxwjKTmQEwy94AUAlvXM3wo=;
        b=ngY5GxwjRKHWN7ymmte/2m5j2A17skBs+qQv9WtMjLZWVaxQTA/TY8SwGeOsQ6tETa
         U1wcjYnYW+v9qe5CjwhIrcC4hU1SzDZwnZezUG6e5tfwOtZ0GNPqHnSliOiWO1wxMLOZ
         uxebEjlnQPiQnrzod+6OoSbWXexQqoXr57Y+q9q2vr7HxDrGwm93dmKw3d5oBHQSggMg
         26zXuuLwmCzIqMB91NsKIbyoADhtJB2S7z9kgL14fkIkcFV7Rx0K5mfzu8++sVN/ff9A
         mSUVKbt2M1ToXdJt2AYmuihDuMLfqxJijahCx8XWddpxW7hSg//aExWGWUqL+2fS1XWs
         7A9w==
X-Gm-Message-State: AOAM530F3TxlF7bRvgogtBDxkH6Z4iZO0V63skdsoPiD+WAIHxsrVH6f
        ytYT5LzFj00PWE7SN5sPl86QnJWLUcc3AA==
X-Google-Smtp-Source: ABdhPJw5nevzZLLdD+GzMbBpCYXcm5a+6Hfp9BEZ7QQZwSdy10oufFkbysgV/WoB8vrKEhqdXdmrEA==
X-Received: by 2002:a05:6512:b93:: with SMTP id b19mr18639117lfv.432.1617662876395;
        Mon, 05 Apr 2021 15:47:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 16/33] clk: qcom: videocc-sdm845: get rid of the test clock
Date:   Tue,  6 Apr 2021 01:47:26 +0300
Message-Id: <20210405224743.590029-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sdm845.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index f1dd97032a4b..24251f5d70b4 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -20,7 +20,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_MAIN,
 	/* P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_ODD, */
@@ -51,7 +50,6 @@ static const struct parent_map video_cc_parent_map_0[] = {
 	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
 	/* { P_VIDEO_PLL0_OUT_EVEN, 2 },
 	{ P_VIDEO_PLL0_OUT_ODD, 3 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 4 },
 };
 
 static const struct clk_parent_data video_cc_parent_data_0[] = {
@@ -59,7 +57,6 @@ static const struct clk_parent_data video_cc_parent_data_0[] = {
 	{ .hw = &video_pll0.clkr.hw },
 	/* { .name = "video_pll0_out_even" },
 	{ .name = "video_pll0_out_odd" }, */
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_video_cc_venus_clk_src[] = {
-- 
2.30.2

