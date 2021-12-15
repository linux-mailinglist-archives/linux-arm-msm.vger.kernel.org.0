Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA818474F97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 01:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238672AbhLOAyt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 19:54:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235240AbhLOAyt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 19:54:49 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C854AC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:54:48 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bi37so40093324lfb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0lgC1WRH0UWABIXLOobQlcJgNb9x6DGPR2CrkU5o8FI=;
        b=LQEoSymlWg7yAWgPfwyBUvaBmGx2zNnW1zoAu+uFCaeLP544j4tBp5hB3wIb83E8hl
         xDbMnoX7v/Zt+rlmomhs+gu2uRcSoI83irsab9MvxLdN0zjmkpNomc+W3j+bDz8s7d/p
         Xj3/9EvZx8MSJ+0y8I3vL9wzTNKkdvIkrqEdf98bpEtA+XcT3+w71B6OEuU7xkxvyMl4
         t9dW2YFkKPYUMO3w3JgouICTaHwjXKhEMwJMOBfMxsHkarjeGOq+74S2XfGamWl5Qly6
         5p+6xpVwha+vSvbLivqhmFZp1uHSJ6vGxrjzqTTNT7pllq4JfP85KdqpAvKooUCC4vrL
         sUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0lgC1WRH0UWABIXLOobQlcJgNb9x6DGPR2CrkU5o8FI=;
        b=HLS802AIsqSKHmHqfxykpd8yT0SOPjThRpUwkE8D0lO/dafkvEbcSGdr5rUFX4KKmv
         msBNL3UzAplOV+rBepP9Ieru8V0YbphmU0mQ1Gma3cFGIr3D25DyfqW4bOlKwt+OsJyh
         XRQlqMnZSS58zqhQ685loB6tq7ubUi9ImsL6m+n/IreWHHq5ENLaMGfCee6/lUOREzBK
         YWSq0s55mNFfSR+NS8dgf+ZDTgM75DQw1odibqANRHYxCd8DBNVrxM22y9q/8BjsS3vF
         tkhz5A6EWHVOXv3NnN5YVL0fo+14KZrtRQpihWqfStvqokdb+Hi703f3eZvDApJxMP6v
         Eclw==
X-Gm-Message-State: AOAM531AT/gOdHRZGqMT5nqc2RN6SPnXVA02wgrFXCNA+dB4BsiQcnf5
        949561IBtPGy/yh0Ue5TzziiBw==
X-Google-Smtp-Source: ABdhPJwpFgQUeXsxcafgn+qqUntqQIyODcrj12JWHS6BFD/OFBSc7rFkJhQ6wmfEYFtE9gIyaJ+1gA==
X-Received: by 2002:a05:6512:23a0:: with SMTP id c32mr7567390lfv.150.1639529687110;
        Tue, 14 Dec 2021 16:54:47 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id b12sm53022lfb.146.2021.12.14.16.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:54:46 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 02/15] clk: qcom: gpucc-sdm660: get rid of the test clock
Date:   Wed, 15 Dec 2021 03:54:10 +0300
Message-Id: <20211215005423.2114261-3-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/gpucc-sdm660.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 7c07b0979aea..71a1ee05e822 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -29,7 +29,6 @@
 
 enum {
 	P_GPU_XO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_PLL0_PLL_OUT_MAIN,
-- 
2.33.0

