Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F32433F02F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 13:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhCQMWs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 08:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbhCQMW0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 08:22:26 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F6AC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:22:26 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id y1so2846919ljm.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=cSWO7D85nEOKoiFiK71NcT3e6QL5OQUpf6zQ3BI1w6r8nK/wj3xwyv3fm9ngbtDVDB
         iyPSk4QU/6LMtp3fwZqssTLhtnxutG8fuJdypB7Y1sVegWOenj88JjwI/1jQ4S1BwSS2
         TXyUS6V5U4PAf3Jcquc3Bo8liX9VAYQkb1sYP8EV2U9pSkE55prkMvPoYW8HDjKVAzLR
         YoyE1DKB8l3FwZYR92Y/synYJn8zQ4uoN7VhaBS91m0BtxnmArCZhpbMlkF7HDnRDtQI
         90L1/ndYG2WtHnGXeKjnSAxczCIWulrqOrbqc/KgjqpJmtAlSR/M0n5ZE4Isg4O3CNJd
         sUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=BGeTGcX7hi9O//6rY3gQd3YU45S6daDrFrCN3LMYCJTZbWKCrJDDtUcUbf9R29j9W9
         tPhWaPnclEwbSigDGbM05v+O3D2bo/0y2Hqk9s8umK1gkb/7Meglo1GFyShoWiCdOBS9
         rQJnt3auvRld7YZTlDEEpo231lEgvJGlcmhD4JiWtOUHbHFaK9w5d/65Xdx9LGXKKdgz
         PxIJqJMTikw8mQGn4Sw1OmSmYsbNBpGMEF81E1Rf3DCC18NLKbwkIuWjUl2/T43ZWgB3
         +37TZdP762FYu8fmWqqHK5Krmv6LHRUjoai4SVIbcb25Z67XGtoqGJh8DbZvMx+paMAY
         uDXA==
X-Gm-Message-State: AOAM530flHcFfIHGZxKSVUP1DmHfsqqLVTEGVUGpSyvTBISgW+mDwR8K
        VQd9hjrtWBNGklPEALnaXkWiOD8RXjiHoQ==
X-Google-Smtp-Source: ABdhPJwpqNNd4MDEAIv3ArfUoqrIUA/5IxgUgKTewjqOPs3v6cUem/PJrQqKIksQr2LLXhEPFLjhsw==
X-Received: by 2002:a2e:bc0a:: with SMTP id b10mr2375652ljf.6.1615983744750;
        Wed, 17 Mar 2021 05:22:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w1sm3415816lfu.239.2021.03.17.05.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:22:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 3/8] clk: qcom: gcc-sm8250: drop unused enum entries
Date:   Wed, 17 Mar 2021 15:22:16 +0300
Message-Id: <20210317122221.439105-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317122221.439105-1-dmitry.baryshkov@linaro.org>
References: <20210317122221.439105-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8250.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index ab594a0f0c40..86626a027f6f 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -25,7 +25,6 @@
 enum {
 	P_BI_TCXO,
 	P_AUD_REF_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_EVEN,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL4_OUT_MAIN,
-- 
2.30.2

