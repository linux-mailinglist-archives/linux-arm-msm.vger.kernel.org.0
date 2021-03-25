Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D780348EA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 12:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbhCYLM0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 07:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbhCYLLw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 07:11:52 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9553CC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:51 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id u10so2578753lju.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LaVGcGxnlvWl/N60TSPqkBXVPvOJpnJu23KDJt8v/cE=;
        b=egsHgCoMFTg+Isv4OqRKIyHcn/ZhIvioDwGRg06M+Sd3N5tWX7/rMPTxwHK55u2as7
         Bqc7pIfA6NOcoxdNT8WRu7Y1tOO/6vv2aT6g2GgXCK9kjkV+fI6bRqeUC0kzvwg9A6K6
         lCTpRYO5J4Cb7MJy4SoFHE2LXU5c/X/QhFZQbNNi/44WBl4a0BKkQ37lsq5xavlB4xid
         dkNhXFY+UY7nUi8nXw3yWKZeOdptdrK6TgTOfJMY7vcWwQS/CzMUW7dIWxtlOdacG2Gl
         lU6tDbpN/aLJ488Sn84ZHNNog6KLSz27voInA+HPKloX9NErNTvQWfKII7u3zNB77kf7
         JCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LaVGcGxnlvWl/N60TSPqkBXVPvOJpnJu23KDJt8v/cE=;
        b=hBB8hblwPiAonv5iV8BKtrroMfLzuyIPamPaiAMyJYe59WRlr5K4E/2Njf1BBuEkIO
         EV34CWkkaOzyWEB6Ra/iZpu9pqMV6+WKk6w4EBSOOLeNWqyZPajHcfmQkWx1tD9TtFdr
         Gm3xKaWya4nsUHlr2tg2OrROhjju2e4lp+VPM0MNn8vkJiPf7IdULMtulDM4P1BqfrIR
         IZVBOxDVy7Dj8qZPsLPat7/LXEZk8U+vY1x/htyX9myMlzt2n6pXQAaSqqJcXCnbbM9x
         0tl8+UHB+5eJs8SohS9SO+4c+zF/Q6nBVsRCjV1OyfJWgHAPu0ASUWBjqsMM4/UZY4VL
         15ew==
X-Gm-Message-State: AOAM531rlrxuEsGQyg9XSi0l2nsNwcBm4vVQcJH3xsG8/d+nuP2HPyFx
        CsZ4kL8jAMiLkJTNjXqw9O1COg==
X-Google-Smtp-Source: ABdhPJw+dT/6+5zBothJQsM7+qMExpahbdTo6DR7t9hL8tupo4nowupKLWlb9YYO0biPLyNgfqZMNA==
X-Received: by 2002:a05:651c:118a:: with SMTP id w10mr5115847ljo.431.1616670710064;
        Thu, 25 Mar 2021 04:11:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 04/15] clk: qcom: gpucc-sm8150: drop unused enum entries
Date:   Thu, 25 Mar 2021 14:11:33 +0300
Message-Id: <20210325111144.2852594-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sm8150.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sm8150.c b/drivers/clk/qcom/gpucc-sm8150.c
index 27c40754b2c7..2b952f561537 100644
--- a/drivers/clk/qcom/gpucc-sm8150.c
+++ b/drivers/clk/qcom/gpucc-sm8150.c
@@ -21,7 +21,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_CC_PLL1_OUT_MAIN,
-- 
2.30.2

