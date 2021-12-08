Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD2D46DA71
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 18:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238281AbhLHR6H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 12:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbhLHR6H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 12:58:07 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A58C061A32
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 09:54:34 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id p8so5101348ljo.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 09:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=22YkWR3aN8tZpq73mniQqTpyqlUPNCWHmLLEEwMvq3U=;
        b=pLEp1S5xy0lpAxHlyI0gM8qH7vvdm0h0xc6lxu89AWHAYKUXobqPIJ2/TLS+9b8jw0
         7OhiTBVfv3YvkfBbAjAamWagsWUw9S9EBqiN98vH063wf11iEE64fB/xVBpR0HlC0T+Y
         /IOQrgR3F7C3X9fVqIczRWncyTHEA08H3UmabpCNjrwePTIDaQtinOz9bHbPd/Opblkx
         Qc1mQwWo7Weu3pPX5w2gTYLmFCiftQGRN6gJ9kcih+HpGp3GW6bf6CdZLdPtrP2Rd8uA
         Zil9EgBZabjXpeK1R4WGpGvCzzUh4ViGxNX6sVBoVwu1/IO36BWO++7gpbKJBo9ibqYv
         zlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=22YkWR3aN8tZpq73mniQqTpyqlUPNCWHmLLEEwMvq3U=;
        b=2P4m1Wn5XW+WjPte5rtLMEzJs+cR2DXw27Ao8dJTn6/xAHzR5N31CYvaXIhmTXVqcr
         BAVkeppBBgD5FB6McadQ/MvLWWKnDs2tIg/yYqF5yiy/RLrjy82lJFKuK/Xc952ugSfH
         bf0W4MV6VBytOdTUw02XQcVhGTzNRstQjiWc8LRFrDufJPUkHgxl9EmHOX9e/Er19L8r
         pkvLIpdr0VC5XALZj1Y4SrdMRz3Xz70HyvPjMjW6Hmn7/LMPRO3DY+krYYycUcLef4kr
         YFP7cy2JinRWtJYIl4N9mdSAjICtep2CSc2ab9JlHS0ue2RSu2y7y3NLT1SY/9iy5lo5
         92ow==
X-Gm-Message-State: AOAM5326IC+JJpbq5xuV0w3XqkQ8Pkvouui9UvJAmxAl72rqCeWTdxW2
        YIB7OTcY5bZisYIFrTm0nVkn9Q==
X-Google-Smtp-Source: ABdhPJxaUZVSYie1S6vwqKensJYHdkHUlZmXojW8ARTOMrU1zrIcJrBQuGJQzYNVrT4RjhLvgcRH5g==
X-Received: by 2002:a2e:95d6:: with SMTP id y22mr935516ljh.5.1638986072953;
        Wed, 08 Dec 2021 09:54:32 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm388903ljg.90.2021.12.08.09.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:54:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 01/11] clk: qcom: gpucc-sdm660: get rid of the test clock
Date:   Wed,  8 Dec 2021 20:54:20 +0300
Message-Id: <20211208175430.1333594-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sdm660.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 41bba96a08b3..26e17f349a77 100644
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
2.33.0

