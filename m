Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352E53548C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242854AbhDEWsA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242844AbhDEWr7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:47:59 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FA4C061793
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:47:52 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id v140so1867958lfa.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uc2bBmZbtEdOHqgSTXP/SGQ9SxGSu18X6WnoYCdFGZg=;
        b=eKEg98pMFKKixC5AQ6U7ZESJn+pJcb+elY5o5t47eYoQ8HM9XKrrI2si+yCVwxNxs+
         VAAF0ldpWT2BMNsfBNQzJ3itmp/wAprFK1o0dgHq4ZCp26u7WkHIp4AuwQO7nuCn4RSl
         nM9LsLgTn0GPJXUtFbqrB/dv/3LewENXJCwWraZMSL9VPxfFiDYKjknuJwXem1W+Kncx
         zwcp8xIS0vO5h5ksWuwy281yA+1UJdMpsFAeSCskA9EyrjxgtFuqAqEdVNvnMhTg8DLg
         k1i605hyms01HU7JkE21rFVp5nyDv9aKq956fWDX1rG207+3RwZPhSo2zrP9uVEsIOhF
         mmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uc2bBmZbtEdOHqgSTXP/SGQ9SxGSu18X6WnoYCdFGZg=;
        b=CUCilgY49cWSDuffZ11+hISEIJEURIfXrMNAura0HV5cyw3FZdk7mmRgPpDPfnATJy
         32qhZj4B3d+exTGmdPkbf735QNthNKU1GYabHWyVZcxGEdQ9sN+0lgdaiZgwV+2sIiYJ
         LMfyn9IF7Qiyo+sAKg1hcbtbQteHz9eqRmL8vjvXdgjvDWQtL+G5Rune/cQeaj03Jdgv
         YpOqfJbXCwP24J75+GS0cKwXDOl1X1Ug6ZIY1Tm1QCOsWqYrjrzUv2GSjtimM+a+mD3s
         ofPDwQtBg6QyozJjyywKdJ9WpPTtSEeDn7S9ZZLxhU1ylc6i6YH61TMNiqnfgusbmaAW
         GQ+w==
X-Gm-Message-State: AOAM533fn17odHquO4h3HvpyJb0JhVPHvCFxvLgDUrouPGq9jWu7i6Lj
        q8/PK2v8W8dNTd8FR//TbBBvKA==
X-Google-Smtp-Source: ABdhPJyLVAgRRk/UG8ZGRfjI61MRYxgryi9ejU/OglcCtEH5keUUp5kPX82tfr9w4+zVLSFCfn5Jzg==
X-Received: by 2002:ac2:5119:: with SMTP id q25mr19101072lfb.114.1617662871382;
        Mon, 05 Apr 2021 15:47:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 09/33] clk: qcom: videocc-sm8150: drop unused enum entries
Date:   Tue,  6 Apr 2021 01:47:19 +0300
Message-Id: <20210405224743.590029-10-dmitry.baryshkov@linaro.org>
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

