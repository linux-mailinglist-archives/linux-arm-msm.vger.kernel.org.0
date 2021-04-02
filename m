Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE1835255B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 04:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbhDBCVN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 22:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbhDBCVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 22:21:13 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31786C06178C
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 19:21:13 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id n138so5666689lfa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 19:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ueam1eNKHbBDz7SDl8uIB8BD9gz/4AOee4PPPewcoM=;
        b=pQImnG8wfibvkznJfZRoZO6JB4v4xEPuJRO188rlmdOQO3zFAE4He/zrPmXmpFaLPe
         QjVjeBqRaGRwVyTaSxIXWzLOTC1QWVbzTo4mbqN6uVYVqq37sYWZLRHfurHYaegavBIT
         +jTT0H0Y2dH6iz65pbuJfovmiKca+lYHQI+Vg5Ug2tHNe0vftYoYkw0U09kvZYyJrMRb
         eqYgeXstSZ/tcN2SGOXrjnfY9NXzcR72V6yQ88XvoJxnEp/OINWgFzUKZ2q/Tn5iSgD6
         VL3U3SpBxFd2EwVIBpCWoKIYkmdfBzGinXYZgYY6qkRQxZITBuCdy6zbK8kUpCcbxyRI
         SBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ueam1eNKHbBDz7SDl8uIB8BD9gz/4AOee4PPPewcoM=;
        b=aKyxZZWf+tm0I6bhfXGjXej16Nqt16aKxg8JnLlVDEh5+SWWPTCfH5PEvMi6NJUDvx
         Yd9aFyRjGSCq/2xpPV4fJFcajvOO2302Pzsb1nf3SIug6/AiuI8DE/u9MdtFCuS9tiGs
         hiI4eOFaoXzsczxN0lhaHdrsCLqmy1ihGD1CDO4eO2HBqlLPzD+arx9Y7mgN4EcQY1FI
         tZpQDX72somwRdnB4csgF3u+v0+yoPYarhigwtJQ2+aDCUUVp1e9x3orY4zq5/pMn+5F
         XdGQB17YE536+2JisCXlZBAIzlGE3WZdMUDyCxfnMiw2aaeDmLwu223xC9qYWyo/b2vM
         nWqg==
X-Gm-Message-State: AOAM5319t/y0lKFMQQjWsTytvN1oX6VgxA/xB4QuRCxZYHLqqlG5dMrq
        IANtAPCCoi25Rg8iMnOLa8ltZg==
X-Google-Smtp-Source: ABdhPJxBI/kKFW1uWghOpZIZxmBA6h8bm5S+JTEwaYy2M54HCRxdDjR+ueALCNQH3JuKcgZ4Xtzbbw==
X-Received: by 2002:ac2:5221:: with SMTP id i1mr7478306lfl.160.1617330071604;
        Thu, 01 Apr 2021 19:21:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 01/16] clk: qcom: dispcc-sc7180: drop unused enum entries
Date:   Fri,  2 Apr 2021 05:20:53 +0300
Message-Id: <20210402022108.4183114-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
References: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
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

