Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16787353077
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235228AbhDBU6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235025AbhDBU6N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:58:13 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEAC1C061788
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:58:11 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id u10so6707524lju.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dCFJAklUokvx3G+IzOXh/1EQ/pUoJjWKvsCg2z2tyJc=;
        b=RQseK+v2y9+Y9Tja3btRyJoS2TWXAxKLDDqf0PxrB92NAWyzu0QpuUON+2zUJDNiQz
         cHqxmlhSdjavwwMtMciXtgCxsEZncS80rHO2rUlChs/orjzQ4bDfXpZ+bmc+DCVCE5Gd
         fdjz4SLYuEaFn4giNpPoVmYv1sAHmmNpTJxYS/xeSoxGUAk1J80V7reH2FD5IGthou7H
         GADxTpM/QcX3uLw0QVKN6i2b1vC/n2bvOAUHr0+YNlQkNEvY8gGm7qluQHkik9NfQeq5
         Yj96IGS5erG+rF2gOpNFher45W3QItQ3jWB0DQjwLlWjjBIsJrtV6JIU35LRGImiUbKc
         j/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dCFJAklUokvx3G+IzOXh/1EQ/pUoJjWKvsCg2z2tyJc=;
        b=nXTinoG6iy9Cdq6sP69uMfR6uwWFib1YjXvYwYN2YhfQ4Z/IQ4nB8bImopuE2RZsaH
         ZULY2wtDC8gycWcKx6ebUL0CYuBqMciywLix3IHVn60inm+dDYrc0bdQNfgifRwHhHwQ
         NfcLPKAlh0aeei3y9Yjh07x6ZYwl7xOCgca6wBOX6uyFPwR1u4dP91gvDt+kLWuNme7t
         2/k2MphQBid6n2VA0UiqW8B4WQCXXUuGha8Gx3uvNqf8DUUyZP2JiRn4PggjkB54D1/n
         b2IOkRLDSN53CSRZKkCeO6uKXYZJWlQUR0ALO8a5HAe/iTBwqhRqlFIfe1F3i+zNDeRp
         /q9A==
X-Gm-Message-State: AOAM530hTm+l+3cUP6LMLHbYj6tLnF6NzrvrzH8pbptr8eWoMYcunxud
        KWZ7ZD+yxFUhb4m9TNPo0AIoIA==
X-Google-Smtp-Source: ABdhPJw45AhbBGM61ImPHmAHwcmSNXScYW1iW034WjSYHXbHnLCmfyAdLzr2DQISjHqwqir5lst2GA==
X-Received: by 2002:a2e:5445:: with SMTP id y5mr9529636ljd.381.1617397090254;
        Fri, 02 Apr 2021 13:58:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 04/16] clk: qcom: gpucc-sc7180: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:52 +0300
Message-Id: <20210402205804.96507-5-dmitry.baryshkov@linaro.org>
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

