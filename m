Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF7E5271A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 16:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbiENOLY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 10:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232964AbiENOKw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 10:10:52 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF58140F5
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:49 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id h29so18964768lfj.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kuFq+aOD13gsAAI3EAyv5+CjaG68fAFpzcXCO25dVHM=;
        b=WKmnmotY9WAeua1zXXW0s3VJMzUuGq/BRlk9RZ+gYf9z/YSm0Dm9CYSa9rIMoe42Fv
         tzbZD2ULrTEbplYcB1Pyu0pL+oCSKdnDJy5R6dItMpPWTuE9O7icPrQJFz8qgOacxI2J
         F1s7qNLHRFy5bmX6ueUGNKKsVtKXftO6Zxu1uNZQxQe6pJsEuyoVcOABNOT5egIn6MtY
         DhmpsN9DRWRCCb8UtnjycW1R6ndd42OmMEGB3zG4xBSjywjh35Ux5ZX2svKfLouDcPrq
         XqoNyboE3KjCbk+eazyBHFGMUn+ePItQLY8Djf0rNHe4J5ixXGADOZU85XbCS5a/PFMu
         Tg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kuFq+aOD13gsAAI3EAyv5+CjaG68fAFpzcXCO25dVHM=;
        b=1M0QoZGg1KgINFDeR2J82FpvUAHH6RgD48FpgrDJyFdUU/0cmX0F0CTa6TWsQQaT79
         yzcNBrUmi4ka64YiWFjPwrRUuq1LQXT7gXrpcSXiyIQYS5WDl/dXw2IinA5+N9qHG97X
         QJ/LVpkTQLRTijWagGPsQ8SJhQm03rhf4DdkbQTRU6YQMCEhJpSh0OTDyGwR2ge2Dps6
         WZiJdDP74MAHrYRe/bEioh4gW7AGqIuypZv6mS15rCe4oVNm9xSBKKWHXV9ne6BFPYe0
         e76NwgGdZJucp/wV+WrzDR0KF4HIubfEcAU0zEyUaZ5a7VdVToYr9wJrEyZ3ic37J6in
         J1MA==
X-Gm-Message-State: AOAM531wBIbaKdFCtyY3xErJ9TVlkjf42/HSRz+oMyE2m+VhC6wpxm5S
        86K3H0tE2f6TPVctEY8LRC5ljQ==
X-Google-Smtp-Source: ABdhPJxCRNYHa2jXIMcsNWlY4T0YjtJz0XC1BjJr4Q3yWq0c8r2RNjC69MeR7Fxz9aY1/AcQYl9F7A==
X-Received: by 2002:a05:6512:228d:b0:473:f729:3219 with SMTP id f13-20020a056512228d00b00473f7293219mr6964165lfu.428.1652537448272;
        Sat, 14 May 2022 07:10:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x9-20020a05651c104900b0024f3d1daedasm845912ljm.98.2022.05.14.07.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 07:10:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 07/12] arm64: dts: qcom: sdm630: fix gpu's interconnect path
Date:   Sat, 14 May 2022 17:10:36 +0300
Message-Id: <20220514141041.3158521-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514141041.3158521-1-dmitry.baryshkov@linaro.org>
References: <20220514141041.3158521-1-dmitry.baryshkov@linaro.org>
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

ICC path for the GPU incorrectly states <&gnoc 1 &bimc 5>, which is
a path from SLAVE_GNOC_BIMC to SLAVE_EBI. According to the downstream
GPU uses MASTER_OXILI here, <&bimc 1 ...>.

Fixes: 5cf69dcbec8b ("arm64: dts: qcom: sdm630: Add Adreno 508 GPU configuration")
Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 2b5dbc12bdf8..6d0bc9e8fb5b 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1045,7 +1045,7 @@ adreno_gpu: gpu@5000000 {
 			nvmem-cells = <&gpu_speed_bin>;
 			nvmem-cell-names = "speed_bin";
 
-			interconnects = <&gnoc 1 &bimc 5>;
+			interconnects = <&bimc 1 &bimc 5>;
 			interconnect-names = "gfx-mem";
 
 			operating-points-v2 = <&gpu_sdm630_opp_table>;
-- 
2.35.1

