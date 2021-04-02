Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8823A353070
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhDBU6L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235113AbhDBU6L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:58:11 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C62C061793
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:58:09 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id n138so9107659lfa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ueam1eNKHbBDz7SDl8uIB8BD9gz/4AOee4PPPewcoM=;
        b=nPv1d+lTkkym7XVbDklY5lSMjysVIgpZlelhQ/l2NXLeHT+9VRoPI/DNpcy2cYFXKA
         JI4U1g6/fVbnVqWBEseoO/2PO2giozLiFW3SzCQBsDXmOaBK4/+8WSL4TfB2B6cxDebs
         p2cpqX3gzeY2X+zORZA46vcLJ3ss5dp8rBByGIoCotiotZFwXNiK2kJS8dHQghVm7baf
         glKxFvhPVOD1DJpXppK6pT7HoerIAB10se5yVTg5vsCaF0w36L93SlFKpXZJUoe82g6U
         +7b+u8HHQ36/zECKMYnqE0iKT6ixGe+77UcMy058ZvuIPEph8xsSBXi2JfHD2+V+dQ/o
         fBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ueam1eNKHbBDz7SDl8uIB8BD9gz/4AOee4PPPewcoM=;
        b=js/Ga8MopLo+mRRL+B9WvqzT74sNSxO3t59NCa/PRyRgIrDdgIctxLVETfVvkpRq/0
         IH4tDhhYMcicOnExCBnUVzxlfkVqjJLSHGUDCFozmflSx3R1MzM5cxCClDOQ7HYXnPY5
         UyIR7cIuAI720IxpAZqW1SjKRBJ2mKR86SCJbkZeZee01I0DlWjYK+bt/lpjf4rkXpdY
         AM4Ua3evO2J8KceNBGCFS6csV1y0j1rZ3LyMYMy8jWoBBP5/UB2f4Prvu2wFWREz+SXo
         Rx+WzJMBMiPaA4zdpdSe2qZVsvDNv0bTSntuWQn7VYW7FDxCRfUqKeOTKWMZ9OYieYQB
         7QPw==
X-Gm-Message-State: AOAM530VJdhqzj4aOUGjSQjsrb9G83FfKZ7bLUdfyES6fM8+VHCZZIJI
        5NzmS7wSJ/AztOukmIcWy2TcEg==
X-Google-Smtp-Source: ABdhPJx2LHN7qorApvae/t/WcApNAkybbdtIDT5V53I+MYmDlk6pud2VDI0QMeywSE+XEyKpqGUUmA==
X-Received: by 2002:a19:e49:: with SMTP id 70mr3175258lfo.650.1617397087828;
        Fri, 02 Apr 2021 13:58:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 01/16] clk: qcom: dispcc-sc7180: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:49 +0300
Message-Id: <20210402205804.96507-2-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/dispcc-sc7180.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index f487515701e3..3334bf9cfb94 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -19,8 +19,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_DISP_CC_PLL0_OUT_EVEN,
 	P_DISP_CC_PLL0_OUT_MAIN,
 	P_DP_PHY_PLL_LINK_CLK,
-- 
2.30.2

