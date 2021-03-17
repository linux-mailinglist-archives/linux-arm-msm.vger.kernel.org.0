Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E8733F02B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 13:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhCQMWs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 08:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhCQMWZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 08:22:25 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465F6C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:22:25 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id k9so2609787lfo.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r9B4hH0XQcWzr0ChjxI/N+85fa5tVGRkG7jorPots9g=;
        b=PIwNAbz52c7Vb8Ir89Ud6guxDfzb35JX7oyhhCaoOP+Haz9q3NKNZzRcJRVuPe2R1V
         Fks9gg2RzgL+yi8AXV7yo6uwWHFFWl29tAQ/xs0uA+oPmwaPPjYiOwTcqIDBJ/2/5izT
         GmL6aFwvMu9zjxJQUtarmImnFwFviZTewmIp5VHMO57lHBgcgQZ3hSvPnm617Xnmd8l6
         M1RewA8ZPxcSA5kcfBRTOVrEAwuLMSyKYxdgnjupkpPQqVleGKJC3YeB9aT5450+/ySw
         yH9y55O/HwcfJLEXBeL9xtzMdEMJVqmbb0tzDFWw0jHWNA9RpXjTgl+7trluc1rg2lsa
         7psQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r9B4hH0XQcWzr0ChjxI/N+85fa5tVGRkG7jorPots9g=;
        b=BJXyXl458mWQmkibTfbPAL5EvH5ffa+xQagfR3O1oQHl/OJ+jzWqzzgv6qHU/IJLcH
         eNQ4raVrljPfRBZ9vJ8EL4iwyTSBoA68XspKoPQs4oqJMbXqkTrq4PY2sIYNDFtwfpNe
         XzeHGQ8cQVJQR+9+pfFOh9zN0VpCs1Be6DHddPLrIQPmj7XH6e351wx+PAVhWloDHdoo
         At8mNIeYSYtxQXi8VJhOgw8zJhWI4Lyj4Hv5IaPefBzDvkJ+a+hVlUg4NTQNljslZuCr
         jI2GuzNbhoIRQvQAO19NZ5N3k7dz6MgWLPVZrehpTcx58zkBQtDe9UqbYI2BrRBPdKWs
         Eqhw==
X-Gm-Message-State: AOAM532kuI/tmNhYsHmEGHBj6iXAnsYkKsZ0Sb9fBHLX9UfS+r28kg33
        QeB8zjwQdY5WqZiwJHAtBaLVYA==
X-Google-Smtp-Source: ABdhPJw7skkwInl+NvKNFPeLx2843vb70oToOsoSQ0hy+HfoOsia+98bmFkNUEktfJH1TmohiSwK9g==
X-Received: by 2002:a05:6512:1085:: with SMTP id j5mr2353874lfg.592.1615983743762;
        Wed, 17 Mar 2021 05:22:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w1sm3415816lfu.239.2021.03.17.05.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:22:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 2/8] clk: qcom: dispcc-sm8250: drop unused enum entries
Date:   Wed, 17 Mar 2021 15:22:15 +0300
Message-Id: <20210317122221.439105-2-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/dispcc-sm8250.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 588575e1169d..86275814e055 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -21,23 +21,15 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_DISP_CC_PLL0_OUT_MAIN,
 	P_DISP_CC_PLL1_OUT_EVEN,
 	P_DISP_CC_PLL1_OUT_MAIN,
 	P_DP_PHY_PLL_LINK_CLK,
 	P_DP_PHY_PLL_VCO_DIV_CLK,
-	P_DPTX1_PHY_PLL_LINK_CLK,
-	P_DPTX1_PHY_PLL_VCO_DIV_CLK,
-	P_DPTX2_PHY_PLL_LINK_CLK,
-	P_DPTX2_PHY_PLL_VCO_DIV_CLK,
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
 	P_DSI0_PHY_PLL_OUT_DSICLK,
 	P_DSI1_PHY_PLL_OUT_BYTECLK,
 	P_DSI1_PHY_PLL_OUT_DSICLK,
-	P_EDP_PHY_PLL_LINK_CLK,
-	P_EDP_PHY_PLL_VCO_DIV_CLK,
 };
 
 static struct pll_vco vco_table[] = {
-- 
2.30.2

