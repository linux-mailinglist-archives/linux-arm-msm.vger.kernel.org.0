Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4751D3548B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242850AbhDEWr5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236230AbhDEWrz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:47:55 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C43C06178C
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:47:47 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id o126so19730855lfa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ueam1eNKHbBDz7SDl8uIB8BD9gz/4AOee4PPPewcoM=;
        b=pzZ7NVt3k18g/Da7oS0ipH4304krChCEwHQmuT9exB4EHdEFprI9RoISbuPdKX6WUo
         GEwSBpkTMkgoRvAct69XWjjjxi7LE7Bnda4eS20ejm6ZPnfzel7rM1zuAo/u2mAi1vtD
         1ur1iKb5Vf0rDQDDQ4oWeHKHpghwJHq9jFdqb4JYCCMHqdYRNx9XExmwBgxQBqafW+Qw
         0ey4O8Ar1kUS2QBOlshg6KrM86Uz6uTKVRG8RiEfUy2dWgC449vtwvFPxSMbSt6X3llm
         l+nKSQ4USE/zhTOC3qGOMC7BIYkmpyrGzWMOmRrrrNdcyr/PfMgHzhB01FlkhsNQRsuy
         6KjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ueam1eNKHbBDz7SDl8uIB8BD9gz/4AOee4PPPewcoM=;
        b=W0OxuIfKj0aBof1RjFpmbQFe3EWOCm2wGXzFwUfsxyn9WiR102BlkxzjY11xCoex2W
         TFYhUJVtcDEsTbOAXLNSbGLuu8OiaF0lc5Yfzw7kHbIGQ/CREAQBcDF3YnJ3y8DnQ8uZ
         /2g3jOhaLQWM76+DrzseHajZQcB5fo5WrP5PYKcmfz6Bii1no/OBWCWuYYxL2Wo2kAQh
         sRt9C0U8UwhIaRxhjtQ2X2VyfzPt/NmA1hF+avg5vRWheajO2iVh/Patv8ytcHBSLVyL
         y6XufRw0Rt4TfiEHPapcT54m5LrTBdUfHOlBtiBI6Pq1Dp+/2XDiTnr+mKcScWnO43qR
         gs0g==
X-Gm-Message-State: AOAM5336fTI6FRDD5i+qj4YqxwN0acyvD/+lp/0nmSfVWGQXhGvTQK+e
        t0N1z4xT7nRz45JAVqoLdVB/SQ==
X-Google-Smtp-Source: ABdhPJz1h/wmFMbL0fDrCefgx6exKVJ8Q7AMiJNyXfJNo9yURer6QJORT0BBku5I3voZY78mTXtHFQ==
X-Received: by 2002:ac2:4298:: with SMTP id m24mr19819208lfh.429.1617662866008;
        Mon, 05 Apr 2021 15:47:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v4 01/33] clk: qcom: dispcc-sc7180: drop unused enum entries
Date:   Tue,  6 Apr 2021 01:47:11 +0300
Message-Id: <20210405224743.590029-2-dmitry.baryshkov@linaro.org>
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

