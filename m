Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B65EB35256E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 04:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234217AbhDBCVW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 22:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234089AbhDBCVU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 22:21:20 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C7DC061788
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 19:21:18 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id o126so5720317lfa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 19:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b5s+r9vXI8ypakYfW1qP+Mc/8XhHgo5jUKnSXepZgcA=;
        b=usAekJAwSkmBZDHWsOi1sqnqHBdsp1rJX6Xkno0GWC7pi8dpXdz+mr/IOfa8h7FYiG
         P/INQSrQRXZQSCfQv8j7u/K9ybFUoqS0hyJaDmtQBfz68WejWU+ef2sSrON6OLmEQRb5
         EuCzJmepn8Aezw732MGjOnu9pfvxWjF+pYtm2SavCLz/t+UsFZxHKvBvTs5GWyHp2wHU
         Lq/y3+Yhv31YloBGzfd09mCRwg4gQKSUJYYeCOKU2TOuHJUUMRuZXpzhBR7qXdbhus3N
         QS9AbcZdKKEeTXPaN62JIkxr4wD/ikfdpaIa4Ikky7+q6ve4dbKVU9GDgxpe11CBYNTc
         8XYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b5s+r9vXI8ypakYfW1qP+Mc/8XhHgo5jUKnSXepZgcA=;
        b=hNMYPU20fs9uNnssBjLSxFbpyzJk/AwuhtOJm5Glur3b8eJn1RN9fGVHdQW0SOi+vJ
         OIQmiWwch12V00cfHa9cCaLjo0Fck/KZ6k85w/1FIhpBS7lx9s6YPvTVzbU8lAu7gtVQ
         skQiLkQBgUyy51cUFoM4OG5x3DEnglum1vO38MR8OPpdI7Rqch1oeIyZ+ZfCrn2dcwQ6
         hWiXK5apSvR6wHb78FMu6+NVok/zKSx38PrVK2tn1R9kLg7hXJdopyl0UD2ehkUK+AfK
         tfb35r4mxyfEyeBsLdYK/hoHEfEiUZa6UkQJNmyLULv0SJ9OUb+/swRPuCp4vsHflSV5
         lz6Q==
X-Gm-Message-State: AOAM532EZB6/wyIxs01MWlVZUBA0owp8mVJwKVjIn24b2yG3Pks5Hy+o
        VdYY20N50RKXegvkMInZLZHuTg==
X-Google-Smtp-Source: ABdhPJyTMmoEn34HKQB9KVHGOQRoNE4A4gHRObee+l/8g/JO0vNoF80/c177hW459nJQDvJiQVk7/g==
X-Received: by 2002:a05:6512:3c9a:: with SMTP id h26mr7249716lfv.112.1617330076852;
        Thu, 01 Apr 2021 19:21:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 08/16] clk: qcom: videocc-sc7180: drop unused enum entries
Date:   Fri,  2 Apr 2021 05:21:00 +0300
Message-Id: <20210402022108.4183114-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
References: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/videocc-sc7180.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index 276e5ecd4840..ed57bbb19f88 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -19,11 +19,7 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
-	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
-	P_VIDEO_PLL0_OUT_ODD,
 };
 
 static const struct pll_vco fabia_vco[] = {
-- 
2.30.2

