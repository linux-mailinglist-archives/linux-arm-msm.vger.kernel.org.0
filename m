Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52021348EA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 12:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhCYLM2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 07:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbhCYLLx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 07:11:53 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8E3C061761
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:52 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id b14so1902201lfv.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ompL+1ESkwIQ3JYCBOzQVLg5EbIrKfFGt5UNdwB9BnE=;
        b=hs9teXZEtIGL+cI04QxqH76lI2tolC5L6VTmabcYqdW7E2G/L/y4RDAQ5jD6G9ntNt
         5gq0KFRCPkkgR9QDkSVkAhj4r7Bb7UqPvwj0b7oNgMiiGnWe/QulA/wMDgVOK7G6avNV
         QtN9/MkjGxdCwQGtJeS6yzfnL87tkY0dHCjdeoSqfLE5JA5h/of+MSJkLMYH6kQt1Ia1
         U3brCX3xAJ2fcCr1dVCf9LKpC9RtVsmHmgLMz8TGtRHkYdC+zJREGbEoNnXkRNlJEiGK
         E0/EY4sX2G+Syfsl8wqo5Ykv2GYxNDlm7IZDfRyHCjsoPDAA/SZL7F6edg2XzksRyuQj
         g4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ompL+1ESkwIQ3JYCBOzQVLg5EbIrKfFGt5UNdwB9BnE=;
        b=Dn+EzFEZA/hqo3HWG9Af2VtbStxd72icRUuq9UX2AvTs+mGfGpgoBXOVbSGBXy/bIG
         6fGszSw10bjlse0pskmJtmgc29ap8aLE0zCTP12wOz690J1+zK0a3VmEHeG/T2bf8XQq
         9uXTfWarQJhUOu2T8kZbA5z/ucOoBN7ncsNAqiQSAvh5fdStcS0uOe/uvaeWnsC3+tih
         xZJBKP5CB1vavZYVBwFYGxXI7RJ1dT4P+sWU6oSH7kMLyhcdSLyeUEIB/cmf+qN3AkyV
         sOeTBfVJvEuETmisw2TlxzByplnqT5c3A1CUmygYG9KTG2Sl3cMozfUYWESaDnmS0VMC
         r8pQ==
X-Gm-Message-State: AOAM532lIfqC5BAveduHTkGdToGjEN7dS6AS5smuFoT7IcCow7CiAtjR
        HtGOsTnLZG7TIlBrzQxmCZ/YBQ==
X-Google-Smtp-Source: ABdhPJwxhvqE9iL/EsXxGt/q5BG1lzgY0Ujxe2wgUDB1FVOsIXTzteMOvr2RAlZjL38p1aId3Vyx+A==
X-Received: by 2002:ac2:46ee:: with SMTP id q14mr4718751lfo.303.1616670710844;
        Thu, 25 Mar 2021 04:11:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 05/15] clk: qcom: gpucc-sm8250: drop unused enum entries
Date:   Thu, 25 Mar 2021 14:11:34 +0300
Message-Id: <20210325111144.2852594-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sm8250.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
index 3fa7d1f9ff98..67c136a77efb 100644
--- a/drivers/clk/qcom/gpucc-sm8250.c
+++ b/drivers/clk/qcom/gpucc-sm8250.c
@@ -26,7 +26,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_CC_PLL0_OUT_MAIN,
-- 
2.30.2

