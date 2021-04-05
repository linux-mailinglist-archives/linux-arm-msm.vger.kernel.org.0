Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5043548BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbhDEWr7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241381AbhDEWr5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:47:57 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD1AC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:47:49 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 12so19530987lfq.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dCFJAklUokvx3G+IzOXh/1EQ/pUoJjWKvsCg2z2tyJc=;
        b=NMuRiNSZllgAATLnw17z91QxWumR1kjjVnYQiUgzejOTTQRjTA3iKWRM4/mcfgi2iu
         jWpdXoTXBTg3udz7xdsjelWrxhH15owmv+68E5X9KS0vLkPSeO7hGU3/nBmchx6i6hbd
         Jk4h6Kf00WtQMqZ2ZSG2ltnA04MP/nRdzBG8YLrUmJc3tH2m/5/lAnNTP247fiNN+AiH
         wwH8sA3QfOEwo8mhm3JRo75E+pMqDG55oyjrFVxQIAv9MHtsLPxQ2HufyQhWcURh5m3I
         X3b0T7J/OTpr2viDM/blp2yHCPH0h15yrILdzy/uy8gQ/3eqt0O8po1K+7eNsgTCYs6J
         W/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dCFJAklUokvx3G+IzOXh/1EQ/pUoJjWKvsCg2z2tyJc=;
        b=iTqCHz1ZGiO2lET0NujTER7FwnFs4S4FHTXuueKIkwzj9X8vuVAcYIEq8R3H0rpND5
         l6usPQhlTV389zvAmHDwhCGTCxmFNE7JeeCpy0LQjw4XXt+FcwYIwdavWgaKvDnPHMuU
         a3+se4Eb2tJCCcNqRMMlnzvQ5Z5FP2CLxF6VFwulp4uO6E/dX+mVNaw3dPIF78IYrxF0
         W69cL/ycZt67uwpiQs1JOME0LGsNlE8/kZEVi8RsZ7gy93+sVZKFj+MqHZXIU5OJEF7U
         92N4Q0+ckdGP6MP98J4G774UxNBkSEkTeLbcxPW9qbCLl2HvalL3wQWYngZGcH1c1L+r
         JGIA==
X-Gm-Message-State: AOAM533GkCXnXEwKp5mHckwdKZvSTceNMpcx0YsfYMSbmoWBZsmt+1j6
        MaVfgG9sI2R9niYhJObmwoXfOQ==
X-Google-Smtp-Source: ABdhPJw/a90wjnaMucwCovueCCJ3JB6JcriKkZAN6mT9hzibY7QqSNqTEz/subQY2mclbkP0AxdYKA==
X-Received: by 2002:ac2:5933:: with SMTP id v19mr18311541lfi.405.1617662867988;
        Mon, 05 Apr 2021 15:47:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 04/33] clk: qcom: gpucc-sc7180: drop unused enum entries
Date:   Tue,  6 Apr 2021 01:47:14 +0300
Message-Id: <20210405224743.590029-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sc7180.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index 88a739b6fec3..d738251cba17 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -26,12 +26,9 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
-	P_GPU_CC_PLL1_OUT_EVEN,
 	P_GPU_CC_PLL1_OUT_MAIN,
-	P_GPU_CC_PLL1_OUT_ODD,
 };
 
 static const struct pll_vco fabia_vco[] = {
-- 
2.30.2

