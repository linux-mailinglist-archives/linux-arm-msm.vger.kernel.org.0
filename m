Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CED8752739C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 21:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234807AbiENTBw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 15:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234819AbiENTBt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 15:01:49 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51DA2871E
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:47 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id d19so19659971lfj.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kuFq+aOD13gsAAI3EAyv5+CjaG68fAFpzcXCO25dVHM=;
        b=A+j3iCbdS6iqfTv3V3EudQpYFnrMGsvV/9XAoF8nJ6F6jU62ftLBwbXXlG/dZPMBpg
         u5X3V4rGdLo9pwW4rejOdAz5UrIHiOd5qNgLRPBmeblV+MCZqSTg+e0/cM4MNheJohwK
         n48WkmsuoU35wd7/g2hfv7x5ILLKvqToHT3iAC9qzTX9OjaVQTQHf4SkmMapy87NR3dL
         IwNAr6biPp9pWijph/XlPcjQ32mPmrbNL4+Gzxif9tVGONyuN8p8MYepvxyUm9OnvyGt
         /RblcBkVDsDafUaNywTKKl+nHzXUY9neC1oTV7hKWAPpnQvKwlmPIHXxSfVXTIaCGOPn
         wQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kuFq+aOD13gsAAI3EAyv5+CjaG68fAFpzcXCO25dVHM=;
        b=LKJqPwSIlAszc93g3h0p68OYfHHRazChgGoUy/JVeJqGt7iJakU9/J7GcCt9yhCjre
         rVqjY+27h5B6yZ/ICiOctqVru2W2Pg2A/Ft9elz2GhKZfMFww+WfYdwid9wcJ1SJoNgZ
         H0H97b5WlztyJu4B61ezpPh8CD8jTAktQJ/90I7f2Y7slO/4L4V1kmK+20Op0KGg/bs7
         uIXAgKWh6Elgkc5menle352ByOk55DBdEXy0hiL0ZiFtkChjP9xQoOsoOWwZ9LJ51ccF
         5KVLlajD5SD1duSSZ4VynlEFsqdvsCVTi5dJ+9oh2J2+AJp4RZwmPX+Ir7eFuNazURrH
         01zA==
X-Gm-Message-State: AOAM5338+z/AHIFvx8XGgy06bYoZ0VxLuMAiZHUZxlBPYkqL6NwzsPWd
        5bWqgd06h4tJsUBYsxR1ehmEPQ==
X-Google-Smtp-Source: ABdhPJwd+GF8I7VL3lMnDboQH2Vd+kpH9kv8glPRF4+KI7koykIt/Kz/RVT2eo7RdY9swPC1PXKXLA==
X-Received: by 2002:a05:6512:282c:b0:472:5e33:e239 with SMTP id cf44-20020a056512282c00b004725e33e239mr7411190lfb.597.1652554906072;
        Sat, 14 May 2022 12:01:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([93.92.200.201])
        by smtp.gmail.com with ESMTPSA id y26-20020ac255ba000000b0047255d210f4sm787427lfg.35.2022.05.14.12.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 12:01:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 07/12] arm64: dts: qcom: sdm630: fix gpu's interconnect path
Date:   Sat, 14 May 2022 22:01:33 +0300
Message-Id: <20220514190138.3179964-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
References: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
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

