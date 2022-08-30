Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE8F25A5C45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 08:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbiH3G6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 02:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbiH3G5y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 02:57:54 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5CBBFE99
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 23:57:53 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id k18so3928034lji.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 23:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=MW1YzegDLarSYjOyZFmSWtQsOdOkkipTn6NsA3/awlM=;
        b=WQrkEPrveKwgi1zwLcyvWQg9IfEC9AiIZ7vmhFjQwiooHoNHNIuJLE1mKIyYZDYd2n
         uzrswmGVf8+a11ipEdX30cZKFMX+3r3t7I1Z2bX2daOtjq4XS2hevQi1iYCzyRQzdCVY
         WyGPk5ZYBg5nJLEvsJZkfx8IsAekA2e3KH8FIJMnwplCP2iOwWu9m9LivShCKVkVrkL6
         TlCuaTNF8KOa1ex27YCUdICRqP0hQM4VQ5xQHKE3vtwXY/RUEcmft+zSmE4QTSk0MWTC
         gHcfYf/LO3kLk30VzN9AtFGeO3gxWT+efWatVDW255FHX5o/erN163Z2CNCW50Jl4Z8Q
         bI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=MW1YzegDLarSYjOyZFmSWtQsOdOkkipTn6NsA3/awlM=;
        b=oDj1CoWdpP61jHPwZmPTuMEEX5gaXbDiZBMxN7ssGo4HkHsyGHPa2qmf+1JPBJ40Qz
         JM/6zjrvwpKxECLlvmlmcgPyLoJx0ZnYcUyGilpWwf9lGnTsyfsuEBOi5VzhuTvCF9VJ
         jx6WptG20mgv/LSq0p00AxwhACRcSl/Mowi5uWHc0SVClMI8c32f3z/f9lywzaxr9WbG
         QyADvb96ZTw9a4+vfmuXL6+fC/OZ7XRA0hS6Xw1qhc/QbDFcxzpIfRthfN2S/7QzWXij
         sD0lo9ND9FxBZOd5tJggRLcSa6rge8wJTDaV63paLIoKse41p93x1KIoJEUxBO2DZIH3
         yAgQ==
X-Gm-Message-State: ACgBeo3ZdlfDwMpNOMqSKVMdovMKdtxGUhAhkmUiI1jCMkzobypQA18Q
        j/AS03xa3u1UniZx9WTJHD2AZB5/TCodZFPk92w=
X-Google-Smtp-Source: AA6agR6u7YjqH6u9sV/UwghO80J9vA0yT2hqA/KYJyVY6yz3/59CqJc+A1gVGLeiBTvFaLzqUFQbPQ==
X-Received: by 2002:a05:651c:381:b0:264:4fc0:611c with SMTP id e1-20020a05651c038100b002644fc0611cmr2898951ljp.129.1661842671398;
        Mon, 29 Aug 2022 23:57:51 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id c1-20020a056512074100b00492cdba2903sm1515420lfs.97.2022.08.29.23.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 23:57:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v7 3/3] arm64: dts: qcom: msm8992-xiaomi-libra: split qcom,msm-id into tuples
Date:   Tue, 30 Aug 2022 09:57:44 +0300
Message-Id: <20220830065744.161163-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830065744.161163-1-krzysztof.kozlowski@linaro.org>
References: <20220830065744.161163-1-krzysztof.kozlowski@linaro.org>
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

The qcom,msm-id is an uint32 matrix, so a list of tuples.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
index cbe11c060df9..c4e87d0aec42 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -17,7 +17,7 @@ / {
 	chassis-type = "handset";
 
 	/* required for bootloader to select correct board */
-	qcom,msm-id = <251 0 252 0>;
+	qcom,msm-id = <251 0>, <252 0>;
 	qcom,pmic-id = <65545 65546 0 0>;
 	qcom,board-id = <12 0>;
 
-- 
2.34.1

