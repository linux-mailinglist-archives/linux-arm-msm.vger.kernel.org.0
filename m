Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 250D5571AB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbiGLM7e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbiGLM7c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:59:32 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EADE1EC63
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:59:31 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id r14so11092076wrg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i+V89geLiLXzM5+1YTX4/D4u8ztE0W1UgBm1oX1c/M4=;
        b=Ic87ot/UqTL7gdD2xPXQJ7rG1601hBJJKdtd7twMd+EWAugAw0Y8nHfI8FtjaEZaPj
         a0Cap9gHOCw/lFuLdwlvUZjlLfbZ+wH2kLwHuuqtP4RV7lfMIL0NAV2ZlpxGetQu1Ce0
         BTTQXu8bB5Yyac2KMAkdX27ENJa48Hm3x5gXaYcbIo9Cocisgt3Nnd8vJI1DVzV0fBfU
         sf2BVWAG2zeETSrfSro8WRe3tPqjDrYJsGXu4vD0uPJWqWOWp3ntVFMAB+5YvIBD+Hnk
         8h1KUnVL+1vDg9jiG6UQg54hl3szcjrGMWyLeEQA0N8avqX3dGbx/0rd2G+uUiSGzmPx
         f1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i+V89geLiLXzM5+1YTX4/D4u8ztE0W1UgBm1oX1c/M4=;
        b=QIdJ5EE/hW1SzbfFSwV23cMNMubN1dmgyptaAX1eWWAIIgUUoFkxJhUsdKcJiPOCYe
         X0uqb8oIShAp2ATCfjwEZje/eyRx7dMem0muPshRx8toORBvRt4L7vwB87JVAmdlSsoH
         W+Rl+SukD5V18GSfjiEpMzWg8oXNNL2mI8YPr8FGQtBxDcbaDfCewqMm+yBtVhW+GHvE
         fyPqbhvRfGXrHnVe/CppBp/e32rWx/RMYkBxGATWC4jLttLJTv00HlkFTIjzcljHVR4P
         6kp4tJtJWwAHF14O3+ppmRNw17UZgzsoufMxbuHft343CyXhrfMgepEyb/MlSJSKU75v
         MbLg==
X-Gm-Message-State: AJIora9PVEbzMfErvBmIZe1KAbNBMRPBFKr2LjmbWlTG0TVA0dsmdrhG
        qYWX3pHrvMdZ50v58sz6LlEuOw==
X-Google-Smtp-Source: AGRyM1vgT8JeJj7PH7ZsY80tk5QjJT0bNzi4XS3L43fl5eeObVK0xDsORjtbC+yu1OHT6P7DpHJZhA==
X-Received: by 2002:a05:6000:1567:b0:21d:abdb:29e1 with SMTP id 7-20020a056000156700b0021dabdb29e1mr7452177wrz.36.1657630769671;
        Tue, 12 Jul 2022 05:59:29 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t123-20020a1c4681000000b003973c54bd69sm13008627wma.1.2022.07.12.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 05:59:29 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 5/6] clk: qcom: gcc-msm8939: Add missing MDSS MDP clock frequencies
Date:   Tue, 12 Jul 2022 13:59:21 +0100
Message-Id: <20220712125922.3461675-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Again the msm8936/msm8939 supports a wider range of operating frequencies
to the antecedent msm8916 from which the msm8939.c driver is derived.

static struct clk_freq_tbl ftbl_gcc_mdss_mdp_clk[] = {
        F(  50000000,      gpll0_out_aux,  16,    0,    0),
        F(  80000000,      gpll0_out_aux,  10,    0,    0),
        F( 100000000,      gpll0_out_aux,   8,    0,    0),
        F( 145500000,      gpll0_out_aux,  5.5,   0,    0),
        F( 153600000,      gpll1_out_main,      4,      0,      0),
        F( 160000000,      gpll0_out_aux,   5,    0,    0),
        F( 177780000,      gpll0_out_aux, 4.5,    0,    0),
        F( 200000000,      gpll0_out_aux,   4,    0,    0),
        F( 266670000,      gpll0_out_aux,   3,    0,    0),
        F( 307200000,      gpll1_out_main,      2,      0,      0),
        F( 366670000,      gpll3_out_aux,   3,        0,    0),
        F_END
};

We are missing 145.5 MHz and 153.6 MHz.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 6b265b68524f2..7f71491d52c4b 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -1294,6 +1294,8 @@ static const struct freq_tbl ftbl_gcc_mdss_mdp_clk[] = {
 	F(50000000, P_GPLL0_AUX, 16, 0, 0),
 	F(80000000, P_GPLL0_AUX, 10, 0, 0),
 	F(100000000, P_GPLL0_AUX, 8, 0, 0),
+	F(145500000, P_GPLL0_AUX, 5.5, 0, 0),
+	F(153600000, P_GPLL0, 4, 0, 0),
 	F(160000000, P_GPLL0_AUX, 5, 0, 0),
 	F(177780000, P_GPLL0_AUX, 4.5, 0, 0),
 	F(200000000, P_GPLL0_AUX, 4, 0, 0),
-- 
2.36.1

