Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67FC433F038
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 13:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbhCQMWw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 08:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbhCQMWa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 08:22:30 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF42C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:22:29 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id z8so2829568ljm.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=b8t+CJm+VxXBLFWofhcsHzdMdRYEBlX47K1nE4h1bshj92j7kgKSQF+3qpXtnU7svM
         flS3g5WXUN7+1elmAFgT6cQWZWONkJ0b9J+XjDGCaoPeAZyOaijtAwU4y2I+TKsNHqJT
         0jcFGudzcU39cVJfsOWHWPyR7gRScHFLdj+M5OJpmaDS0rym/A7JXAdfYgyZvbLidEPn
         5vpJiwPdbrmJMmefQOekhwpgsDjs+9JjDGLOEL2pdyHv0b19lDgajwNmC0xG33oVnGgC
         pOanbPrbvOfgTuTupnNsTyP1Qu/V5hmJHHqiTw04CKqjhL/DCFbXmn+FmkzY1Z9oWM/g
         5pPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=HauFwmpswUSAjn7GlTF3reoXJbiojx9Rntv+bmYvK2Bave3+TH7dAzllhsfG7tAJiu
         JZcvS7aJ0WmlKhMRElvvOcMW0kWaYfXXl7l1DPisK2cue+ssaJfPadunSg+0BXXYMGUa
         w7qx8jd1R/RpsnpzvKxVe4y+Ror4GLZVedX1Rj4BOrLGsm43X1iqV34XDolISb5eftXO
         xJ7+OqgdA1gqE9fbDkq9OfkiiLVgszvsqdOiU/k5FQW9fVYvprXDU0mPGeMQPTolJo+4
         d30RFnf9/bzCK85RmuT8i+edKz5mxarqvtw2316Dofx+Qc6PoE1G0kz3TAONb4/OYxYq
         HETA==
X-Gm-Message-State: AOAM5325wvSmCx2rLyWEIrqSoaaZUgqXCig+cS3DKUoaoAqQ0Sml9T5/
        dWYVlXmTDQi/g9U5pylh4G2pUA==
X-Google-Smtp-Source: ABdhPJyuQQX8r2Y7fDEmKtt9+YEIvsoFzImDHZwlp+DBKTJBqRMYqTSLT9Pnu+tzltj08gAWd15hJQ==
X-Received: by 2002:a2e:8e87:: with SMTP id z7mr2339856ljk.142.1615983748299;
        Wed, 17 Mar 2021 05:22:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w1sm3415816lfu.239.2021.03.17.05.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:22:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 8/8] clk: qcom: videocc-sm8250: drop unused enum entries
Date:   Wed, 17 Mar 2021 15:22:21 +0300
Message-Id: <20210317122221.439105-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317122221.439105-1-dmitry.baryshkov@linaro.org>
References: <20210317122221.439105-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index b0efadc19634..06a8a2c98deb 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -21,8 +21,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_MAIN,
 	P_VIDEO_PLL1_OUT_MAIN,
 };
-- 
2.30.2

