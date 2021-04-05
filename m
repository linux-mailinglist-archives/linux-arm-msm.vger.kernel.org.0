Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0F73548BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241380AbhDEWr7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242849AbhDEWr5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:47:57 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6936C0617AB
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:47:50 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id w28so19610442lfn.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LaVGcGxnlvWl/N60TSPqkBXVPvOJpnJu23KDJt8v/cE=;
        b=wYP1Rg42CeLV8hV3/H3qsHkbdEui8ow21fPTRg1YJqrgCisoVCs6KJrUasHx55b5NI
         I21tZC4h5v3au2qXjHAuK8XVdQuXp2N2fDNdn2e+Wy02bbd0qgXAOQypkQpMJBVLQSw7
         7geu6bp8vESxFRzAQtHiKpkeBXw3JaOgJrxVFucIXSrIhjD386KGsA/YldMORD9oHadR
         U9DFa+p+lD58n701bh13jrgSSdzXWPI2oJD8UV53t0yNUI0AQBEiQ4qB7CEkS0hgW3iu
         XLJ7ZOgp5+nfekUksk6lM1dtdAtqRWeCDio3teL8AbbDNqmKw0su11KmIz3AmkNVruZ+
         hR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LaVGcGxnlvWl/N60TSPqkBXVPvOJpnJu23KDJt8v/cE=;
        b=c5aep/0F8jY9KKDd3Tw49fl0P6gaqzau/OoAPGaO9ZHl/wc6L9V9Z061p7ymsX/+6e
         sBD87r1OXqYQrsjjp/ZBGGhdDy+iO5bSTiX6VaQrJkEDcNE8/b+hJHdy+MfWLF0D/BpA
         6zWVWoKREo6T11U9m+mCXWcCm21yqWKagRv+pNYrVKkWSQsOOoL9w4FD0V8V3+7AgHLQ
         lHxlOopIHZ3S4D0LReI1e5bOjkjn6JJb5ldxOAZ/ihzrGBiLawt8Rwu04yKbPh6bbMYA
         3tnv7YEhNQpIshPQX+MV1X2FfP2BilLXpQ0NTmxwr/L+uMdFAxlfeqMAG7qvjLYHy9PB
         dBUw==
X-Gm-Message-State: AOAM532/SUjT6F/Y/91SFGF9ZNpKba6jiyfgSiGWoE6GV8sCm+9aVEkR
        5YVSnpThgMK5W9ktaskRF7n2fA==
X-Google-Smtp-Source: ABdhPJx08woCFqYotvYKIyfZfrbOktho2R292oUhNXmgxFX/3rSl8uheNbCswGGh4hBOFLXuK2GCPw==
X-Received: by 2002:a05:6512:2090:: with SMTP id t16mr19935365lfr.514.1617662869315;
        Mon, 05 Apr 2021 15:47:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 06/33] clk: qcom: gpucc-sm8150: drop unused enum entries
Date:   Tue,  6 Apr 2021 01:47:16 +0300
Message-Id: <20210405224743.590029-7-dmitry.baryshkov@linaro.org>
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

