Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56D34353075
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235273AbhDBU6N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235113AbhDBU6M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:58:12 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E71AC061788
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:58:10 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id n138so9107700lfa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r9B4hH0XQcWzr0ChjxI/N+85fa5tVGRkG7jorPots9g=;
        b=LfxJvu5oQgWIPry/RXcqn+XBpkXDuniAZ+HgnGoFjyS0bkRgpxsBDSbHIOVjdoCQko
         CR/lhW1MFrsN+f+toSHbaiOB3oB1PQMmgrfmmNdvZvlnUbBs73lbXaHBNtGQUqYGrH5J
         w+Gi+TpRYKRDuvf9+oLWdVeJi4xNPjS8Lmo3ZJFq/q1Xca0OaoWoAo564dnAhwiaGLAG
         DJ91/FTBy+wiNNETp1N3Pa//w4+JjFPA4myqh4nu9fFF4CL9QJnznsl83CcL7PcDp1ua
         4sBV3mpJJQN8ntsbzCwnu6RKIcwglnB+zPq5iDex8TQg7GCkviqcay2KxvKX62Jwrtfw
         ymMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r9B4hH0XQcWzr0ChjxI/N+85fa5tVGRkG7jorPots9g=;
        b=PLmMjz5lH4lAp9I1MOrcl2daVqb1WJhdDv2mGhTVLMBBVbzyv8veR48dzOJMcylUN5
         V3QlO9ngXvPJNmelHa6/DLgoBMbaiYGYCe9OhKYte4ArnMeJjwb71aWGknDZRiqCscmB
         gsHaTmpMovy6cVpi9UY35peAoRPiTARI54yAP9e4V10ne/X9w1KQwUPL9XbbhZS6j4lM
         9cVujtWC1tiwAjZkH/hE+Ke1atMc1axXLV3cU3Ml6uwnNzdXR+0RVcfJZ5v2EQ6UHjK7
         CwGEUDFWcjJhd3fWkgQxbVB5I/+VYFBkjOLCaMV5FbwReVRJJLe/FzTcmqjsRXFoCKoP
         AUPA==
X-Gm-Message-State: AOAM533fEhVTsb5nfd98NP0QbaNJjWqmTGItuLuFWupec8WVlMjpOpxN
        ISDVDx4HQn7aV4OPlHyDIrHBbQ==
X-Google-Smtp-Source: ABdhPJw9F39VWPvBLYLh4qijlvpbrlNQ4t6HhbIwNxkPzb/wEy+wx4Num9JOj9eA1n6DwKmQEn+NJw==
X-Received: by 2002:ac2:598e:: with SMTP id w14mr9792113lfn.622.1617397088766;
        Fri, 02 Apr 2021 13:58:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 02/16] clk: qcom: dispcc-sm8250: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:50 +0300
Message-Id: <20210402205804.96507-3-dmitry.baryshkov@linaro.org>
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

