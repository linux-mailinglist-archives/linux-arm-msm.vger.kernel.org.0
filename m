Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACAB8353080
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235357AbhDBU6X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235366AbhDBU6T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:58:19 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C09C0613A6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:58:15 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id g8so9054014lfv.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uc2bBmZbtEdOHqgSTXP/SGQ9SxGSu18X6WnoYCdFGZg=;
        b=i4xIYRHXjTwa+eKHyeg0WoG4ZG8DBkTx7ex84k2msQd970qnFy1R+IxgmDz8WYTSIS
         VEh4314kHKrrTUx66eF+I6de7g30K4ABA+aN3WqR8GnTdBmRlUs2sc2TwJ9zxzEqSNZR
         2HNforJJkrYdJuv241L1g22dhw/fdi3ZDALS33MPfl45OMBHu0M6BI2QCoKknMtlTpga
         9Yv4SabyNYIu7d8Z+q94Wz52up9XwcqQHDTHUuq0iQEOh2bNouwpURbMq8AQ952l7aXW
         690nTsUpYR79fbgrWHlDPBFWXM21y79QLR4tXZviOfp7uCHjaD4VH2aAoyRc203aFFL/
         oKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uc2bBmZbtEdOHqgSTXP/SGQ9SxGSu18X6WnoYCdFGZg=;
        b=ldWbui+S4UCYamo+C3lQ2nUwYX6nht/dmurroCM4fU+HCgMLRlFK/0ocyOovkPnIIy
         /Y6IwNq1iDiICsTmQuOegYBFyRSGRlnQACXJZmqQqcWJyTBkWsd9LGdNdFnlDw+ubweL
         RYlaFqSj4kUj91vPDfP3T7wN6vIRg7yQsTuXw1x4e3kmjJmlAkzTdsWaxEzgoKvpOUB6
         g8SZbaSkrIq6KqkRcB7yVPWO4D18qwTr9lZNUvekQejhGOhuMQSZemBd57FNxrfeRuBY
         0ejxTXRIbiZ8krURjfnTHy0yLfY71E0zhJS71GLlAXog4JhJ6p04I/8eZEDY35Fk47wD
         GtFw==
X-Gm-Message-State: AOAM533cTQrni7/tVl0xF4CiYwIFoknhexJWmEhHtQP5Q9Ra2CnoUYjI
        F6+TYrM4mkJlgNAW5A9gnc7mgA==
X-Google-Smtp-Source: ABdhPJwNZkQV1gZPGD+53p0ZHp3ghz8cuZnqmEuCdetcIrx0lDZvFElSNed79P5IJ0SNbIVLqoOpJA==
X-Received: by 2002:a05:6512:1044:: with SMTP id c4mr9740861lfb.198.1617397093596;
        Fri, 02 Apr 2021 13:58:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 09/16] clk: qcom: videocc-sm8150: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:57 +0300
Message-Id: <20210402205804.96507-10-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sm8150.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
index 3087e2ec8fd4..85b0bbc2b151 100644
--- a/drivers/clk/qcom/videocc-sm8150.c
+++ b/drivers/clk/qcom/videocc-sm8150.c
@@ -20,11 +20,7 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
-	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
-	P_VIDEO_PLL0_OUT_ODD,
 };
 
 static struct pll_vco trion_vco[] = {
-- 
2.30.2

