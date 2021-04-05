Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90EB23548C1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242851AbhDEWsA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242854AbhDEWr7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:47:59 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247E8C06178C
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:47:52 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id b14so19622104lfv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b5s+r9vXI8ypakYfW1qP+Mc/8XhHgo5jUKnSXepZgcA=;
        b=Z+IkZruGrZaabSYy0xACMntYsKB1e8EqvWzHdMt6/5s91XdMwjAmubwiLwgOMY66DP
         yXxqoHyfw72ghv4QMXW/wz9mu7+D9Epx4oGt8spmGl45s1Db9C4oIFuIVMeji8icCsZ1
         LZgDkgJ8zoJOe12bdwxalRpGgS2TCNgemGsW1OcmcAfiqAiDKl3lYiqjle8urNiJg+Wm
         UfVpcqhZZc7vShAKqwyyBHL/J7/ViQZYsdqdvCFPs8vmfL5iWoP2DapOpsRMqQUdTPEe
         LsB0JDjKcYSD3c7FDF9/408YGv7UwAgYtW13La6CvcVM/mADwzrt0xTZ9clwaudU0FiN
         fRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b5s+r9vXI8ypakYfW1qP+Mc/8XhHgo5jUKnSXepZgcA=;
        b=fapoGxLZgfE0uRw+/ygKurOELpMr4xTOSOglAXVKjuCI85tnlx9yDqFPvjyEb02l17
         gxORGh4u39U0kQN8Rovxjku5DPLQ9aG01O7mISLNcLIEsynJLnlb9l3Q21hbeBpbgUeN
         f3SOd/sa3LDCiIHedL5lEOVzzaKd3Zap+DV/mrmly6F0n6coK6mgYM1UcDCq41P1pnO8
         G4OOon81jZlYFd9+Bqu6DVWLuougObh9GdNCvJF4Md7czazV16j80Bi5mUuKfqqZSR8d
         7fiAPHSoWcWk16r8xZeIxedK+RUPjTUZxyvrgBTNUxHkwqXwim+trfg0PKy/CrMWQRsf
         jwYg==
X-Gm-Message-State: AOAM530BeYIOPnS2mGl946uZrWfPG3WBlp79tdfEp6Y1PFBjEAgkiqoP
        mj9JturXQcHAIlaAsbz581RmNg==
X-Google-Smtp-Source: ABdhPJwg2Oie9vK1EmSx5XaUQ258eIEpkoNfFIkVb6IYDe6N5ViEfRkqsa8LLTV3qjXEIVBxFwSYaw==
X-Received: by 2002:a19:c7c3:: with SMTP id x186mr18445313lff.76.1617662870662;
        Mon, 05 Apr 2021 15:47:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v4 08/33] clk: qcom: videocc-sc7180: drop unused enum entries
Date:   Tue,  6 Apr 2021 01:47:18 +0300
Message-Id: <20210405224743.590029-9-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sc7180.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index 276e5ecd4840..ed57bbb19f88 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -19,11 +19,7 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
-	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
-	P_VIDEO_PLL0_OUT_ODD,
 };
 
 static const struct pll_vco fabia_vco[] = {
-- 
2.30.2

