Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 726C135307C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235296AbhDBU6V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235241AbhDBU6S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:58:18 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114D4C061797
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:58:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id d12so9063838lfv.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LaVGcGxnlvWl/N60TSPqkBXVPvOJpnJu23KDJt8v/cE=;
        b=V9QLJFr5fQWMhJH5WuavJKVYfSnmSIwkP1PlQp2A6l5uFoboYj9Av9ZTySsZT0yW27
         iPFDws8p4y6JWSYGG5N4eDpMAabB2iPSAjEgRzBL4iXj0jG6E0dMs6T7PrWX5LAR6B05
         QDZQzfjoFiYfVQMx5jKRl8Rh61OJz6COHx9nLZzv3fcfbsQ7VZV1Na/0SceR64+e+1d/
         Pbm/Zp+N0WkaPY2WyV8B2wvO+IbXOe5czr1noTCzGfw9LfvZVco5C7pBILosGf78LKcB
         xTJNxD49CwaRxfMAfYznXO1WYib80JOIV6JsKoOgAPxJffICM1nAuwRfqnJVy9Yl1dNY
         bGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LaVGcGxnlvWl/N60TSPqkBXVPvOJpnJu23KDJt8v/cE=;
        b=PmlBehNPJO0xNSS+BukhzBY1SQwdRgy5G2FQiD0mddbHjhF5SuO2GfeTYwp6yD+bfh
         XQtHjFksANd+hg0J7psI51ID61i2rpbNxXeCfRU8m2aS35I3kw0cn4e/V+Xtpio4t5kB
         nH8c/fLHVn8J7jriMrbXwINLSiwVxHC5ovCjviyMNYGmVLPcWF1pg0mYm4vZt4IU2JZV
         TUhf72/fCgiK0+ORUDqvI1HZqGESr6fHju4gpalYHXp3jbwnIOl3Gh2GkSEAQIJWOBxM
         ALZc3AQdy614DLf11Cj1Z4MfubMcLdjxf6GJWWTdG3+XnvSeYtsSWSbFPor3b/KObzQ8
         2Hxg==
X-Gm-Message-State: AOAM531insepP65rVvGTZktvqEsjlgkk4f//Pb3KkcWL3ooyRdBgr1AG
        v+1EUEnArHHwWXEtj1GIfa/jvxNxyE2iIQ==
X-Google-Smtp-Source: ABdhPJzmSf69w37D4Qe0K4na2g0j82BWteJ8vTN+fKPXbyu/9R8LuDp3eGNhHaoY3jSxderDFCYs5A==
X-Received: by 2002:a19:548:: with SMTP id 69mr9818855lff.465.1617397091570;
        Fri, 02 Apr 2021 13:58:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 06/16] clk: qcom: gpucc-sm8150: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:54 +0300
Message-Id: <20210402205804.96507-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
References: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sm8150.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sm8150.c b/drivers/clk/qcom/gpucc-sm8150.c
index 27c40754b2c7..2b952f561537 100644
--- a/drivers/clk/qcom/gpucc-sm8150.c
+++ b/drivers/clk/qcom/gpucc-sm8150.c
@@ -21,7 +21,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_CC_PLL1_OUT_MAIN,
-- 
2.30.2

