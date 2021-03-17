Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7B333F034
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 13:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbhCQMWu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 08:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbhCQMW2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 08:22:28 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B5CC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:22:27 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 16so2840832ljc.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ompL+1ESkwIQ3JYCBOzQVLg5EbIrKfFGt5UNdwB9BnE=;
        b=w2Hs5aq6/HvAPcpbfrqsRDWUL8f/HaGjF8xaUxdLDvPZcvE/ZoIiXeKOUzH3jPZHCM
         QJNUh4yvJgJf6AO8i9C8Mu4ElsSQURLLz1GHil8b/WGuL85j2yoYg8F/lr5WfyeIV64w
         d1kkHpKAvtGuaQwJzirFdfpxzOmuCQ22TerhjZkmxLoqy3Vl5KDzmT68UZtCluMWcDAF
         cUKFmOF98qpkhMc3llsLJ6Y/A8lAqS05a37w7p4oiFH14S29zVXCZpHKQ9z2hR60C4Iu
         m2OVUuesgVIurMp19Z02LLxhjnC0oCdk0YU+wCzLZ5pdr/7CzQcq5GeJ2IEwoCawMX0e
         NLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ompL+1ESkwIQ3JYCBOzQVLg5EbIrKfFGt5UNdwB9BnE=;
        b=heS4sen9s9r/tUU+ki03q1ypKG27v2sUW21NnAaRJF9+9imv4erxwrxlFtZsblLqhH
         +QQh/rC8YcmqvplLf+KZ8gMCgmSM6qVF/CQSAzXgG8N/NH4O6/ZIVDng8kjxTA4buPdY
         0khOQgVzCGXUZBgqrN2thM2ZIvwOGlRyzocKcLcq44Zt/XcHD0Aeb1XGPuic1DrdjenE
         tCjmQscgQjyNsQVGffLhV0Uo7rS8xBSidNmdTP8IeTy0AHf78EcWNZ23Rd2rMCTNjncS
         wBXEaJxaBGvoMhbcHVl9HqORZ3Ww7t6Muk9rxbgK6tTFP9d7Nn8D1/GTYO7Zuomk2cbI
         RaYQ==
X-Gm-Message-State: AOAM532cRrHt8oSTFPrc1aEssVuRxO0dwlUT0Zfzo/Z5irnUGtLgsMN0
        WkRp/wwUMRd+ORpyqkSI491Svw==
X-Google-Smtp-Source: ABdhPJxR/RBogg+piwOAVSpqiN6MYjaz8HGYCtMeREezCYfJlfT58FFuG6Lrbc3k7CUcZbTWBKxCAA==
X-Received: by 2002:a2e:3a17:: with SMTP id h23mr2324461lja.158.1615983746143;
        Wed, 17 Mar 2021 05:22:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w1sm3415816lfu.239.2021.03.17.05.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:22:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 5/8] clk: qcom: gpucc-sm8250: drop unused enum entries
Date:   Wed, 17 Mar 2021 15:22:18 +0300
Message-Id: <20210317122221.439105-5-dmitry.baryshkov@linaro.org>
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

