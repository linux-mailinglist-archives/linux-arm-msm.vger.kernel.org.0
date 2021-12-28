Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0BB48060A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 05:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234752AbhL1EyW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Dec 2021 23:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbhL1EyW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Dec 2021 23:54:22 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA63C06173E
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:21 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id h21so16887124ljh.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uRTH7H5JjcF6/NA7ElV6gvCEmfQi/vl0et0PmIOUKok=;
        b=qW8c+DADVDRFAi6a2XK/d8Myn//oDp/u/Gsla8C6I/4seRK4F3iembhH08T7h0bUHz
         KOMlSPailHESlDgBuldR8Ly+8Vq3FFExuIZim3yB5qcw7MDTVBbx6YcDOr1H2x202R3H
         nDqcqBGllIx2P/Fg8i9AgWda/t3175kVaIPS7I+ZCW0UGETeiwgA1LFT189el5FA8c2p
         g828gYh7qMAkix/rOsFSuyQboHcNnnROV9HoSW8Y3wx4ddDuUw4sYLYaolsSG/QJBbAI
         l5FBljjZ00GUhA2OYFmvoWI38Ora8mOvR2tQsjBF/j+z1QyCBXFwUGF74RPmY4cDlhhc
         OF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uRTH7H5JjcF6/NA7ElV6gvCEmfQi/vl0et0PmIOUKok=;
        b=ZQ2X75sHwNtcLKWByLqYWcG2SNQVWnyoAjiGdV0CryedGYNK62iQ4Ea8DyfwQcDPW8
         FcFaprDaK1tRfHqibYAr0uw66IWEPevJn7YYM6SIMEyP6PGwdXkKSaKEkhvxMslReeKB
         sGr3JzvEayL4dpWL3PHMkPU9Vzdn7RWA8E9X0QAaILVdiFSu6Xi3Ai+53fGqs/LpugKg
         0IJ7AdQ08PBSMIE4YZdW3Kkgm4Gxx8fELpHMK0n1H6uorhXlNmnwDJ5DvLZkklxJCABi
         rb2CY9UHL8ihyHvULsEQesTFGT55FinBwCMwReUajxsicYh8ILHASvI9kSkpTtrUIGNB
         Mi2A==
X-Gm-Message-State: AOAM532ZCwtPE6VWcmPVnbIuoyy7gDtLcx4oBTzGcqfelI4nZGNG79oz
        ICn96M2aFeNWv+VjLb1P/5y0JQ==
X-Google-Smtp-Source: ABdhPJwIJDAGLBMqUulDCIOw8tR6vUr72ldNQ5uuFeooIEGyKHt1JUzVc2DGxEOVb0XOTBtyli/TwA==
X-Received: by 2002:a2e:a58a:: with SMTP id m10mr9395003ljp.417.1640667259628;
        Mon, 27 Dec 2021 20:54:19 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:19 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 02/16] clk: qcom: gpucc-sdm660: get rid of the test clock
Date:   Tue, 28 Dec 2021 07:54:01 +0300
Message-Id: <20211228045415.20543-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/gpucc-sdm660.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index d170353eccf6..8271696d21b4 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -29,7 +29,6 @@
 
 enum {
 	P_GPU_XO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_PLL0_PLL_OUT_MAIN,
-- 
2.34.1

