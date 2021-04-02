Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB39935256B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 04:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233974AbhDBCVW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 22:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233870AbhDBCVT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 22:21:19 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E81C06178C
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 19:21:19 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i26so5646640lfl.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 19:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uc2bBmZbtEdOHqgSTXP/SGQ9SxGSu18X6WnoYCdFGZg=;
        b=ClruPNLntTFAoPDuCQF0YfFFTSWaCUSRJZUKBZzmomjD1eZ9e5VHjn/xAFJFx4q7pt
         usGS5/fBlYwpxUkSgQlcbgUnP9LbT/b67KN6XDFEZ9XzRUYGo4Qu+BQo6+WiZUA9afon
         g/1Y1B3DuwssxmQNoucNmbQppFSdMb3lXcUaXji7iX1tYU8yi3tCRbPHtzIypVj1YDTM
         R3x80Fg38cq6XLnWjaBXOSC7U6Lksp/vTOe+I2ogmjKMDmh2HOmSP+HJIJnGMvHDYP9u
         NlZ7WYoLaiz0F0LJ6UVxjbhvSvRWoGEvwliHlJXgGbBbKeuSg9U/ACkKfdJ/9y7ux4YW
         LTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uc2bBmZbtEdOHqgSTXP/SGQ9SxGSu18X6WnoYCdFGZg=;
        b=t2oa+TV4hfEF+9XsTFy2OW0Wz0jvekXrrxtCkydkF1Dcf7sXXB25ogaVo2oosImgyJ
         4CTDUPvufn7JHeT+eN0x6+EVK0tDMoitn/G5E927UjvqJ5yfb9s7hGPfTQInutQgVpTD
         i1lQQb4hTlPL5BPORzQfuFyuzD6lp1pXArs6+LMnLa0ECfC9RfAUGgA13z48R418+KMO
         5tDsy7cCzEEVh8gkOFyj6jLF7s5/oHKQAayva/26GZhGi7ofOKPPoI9NkJ+wY+dzOGJj
         rRVZvoA1D+79bC1gVGhrTevNJtYLcV6hvyD6PY/mkLpvmji3rNUQR2At+7m5Zoux23eP
         2oFg==
X-Gm-Message-State: AOAM533ipMbSbff0ZlFC6YGGj6T9H0QRc/1npApukLBN2wv/o6kSDkmH
        agH8Tdd1mVgjhU3gK3kTBO4Z6g==
X-Google-Smtp-Source: ABdhPJwN1tZgE3CEsST2roXG908R3DIpstdehE+N3BrXGOR2rsAt2cAnqbwbgEogN7WiT9qDUeFKBA==
X-Received: by 2002:ac2:4908:: with SMTP id n8mr7546009lfi.314.1617330077508;
        Thu, 01 Apr 2021 19:21:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 09/16] clk: qcom: videocc-sm8150: drop unused enum entries
Date:   Fri,  2 Apr 2021 05:21:01 +0300
Message-Id: <20210402022108.4183114-10-dmitry.baryshkov@linaro.org>
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

