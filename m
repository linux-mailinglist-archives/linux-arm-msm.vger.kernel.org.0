Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B18B65271B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 16:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232970AbiENOLy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 10:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233001AbiENOKx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 10:10:53 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 834C91571B
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:51 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id m23so13370687ljc.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=stHG6uGR6YDgbmGma5ATRvc/MnIINOrqBOs1xDu0M30=;
        b=OeiflbQokPM+nX1VMJPxHSavFhZPXV+kVqP0VE8fSU783yzmCuqOUqokWr/Mr4s+Xe
         MoEigF5eHGi21q7rcQdC+9RIiFMco+ECPfn8dyXMCgMQJ9SlE921h2142C/tQbrKAQIt
         4i3DcBar+M/mhVqB0hMj0VyN1RHpamutjP0ZLwhNQgcnqgxmR2uI8zp42VwQvoU0Cjfn
         PQQQmWBjefJiWgLrD2nFIa/Sr/tUGMlJjEG8uQVuGFDYdb88SfgCGFH1a7mtc5d8HcNq
         9hmnas0UPHTSpw3CLkYeQrexhT+a0CBEVFKADcF8VTZKH3QVFrstGkHozO/QVzpSGJni
         +l/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=stHG6uGR6YDgbmGma5ATRvc/MnIINOrqBOs1xDu0M30=;
        b=gtb31g9yqE7F/mZ7jLXBi0cGwyBq3KcrBLTwyWVBsK7Z6zR+Y/mmqXB5BYETyv1WfT
         baWOFWq7rdUtVForPdDBlYP/hxVNGU7+xRVJsQROG0bkaNA6mkkfHdpTuQg4gbHlkupJ
         0+VSiMVLRLL2yGuqNrb4sBHeL6wCqYFzv4kh7PzMM7KGM9/meSyUic0JY+iekw2TKWRL
         oB/z1w1v202UbkLQhM2cSgZDBY3yVp7X8ImLDpbZtzCFEZvY/8SwCCUyf3yW+UCoWeQg
         w3dzTYKFfxDG9kmt3P8CozRg2ZgvCMPBr2kH59YDFWgaclzsx8M087d1fr62kxIWNLJv
         85MQ==
X-Gm-Message-State: AOAM532JucQ4ufKzndo5PMN871FP8cSZDOfxaOZp6J8ShM+tSBDJl7GA
        l3BKMHsYvhpQUuxyA90yJSq2YnNPeWrp6w==
X-Google-Smtp-Source: ABdhPJzvRyBathn0D8obCviyz9ap2o5xhsOsNau/Ju3yiaKF5hdeXld9qPtPC8RWX32GGtFdl1i4ew==
X-Received: by 2002:a2e:9c05:0:b0:253:a1ad:6992 with SMTP id s5-20020a2e9c05000000b00253a1ad6992mr2376357lji.142.1652537449796;
        Sat, 14 May 2022 07:10:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x9-20020a05651c104900b0024f3d1daedasm845912ljm.98.2022.05.14.07.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 07:10:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 09/12] arm64: dts: qcom: sdm636-sony-xperia-ganges-mermaid: correct sdc2 pinconf
Date:   Sat, 14 May 2022 17:10:38 +0300
Message-Id: <20220514141041.3158521-10-dmitry.baryshkov@linaro.org>
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

Fix the device tree node in the &sdc2_state_on override. The sdm630 uses
'clk' rather than 'pinconf-clk'.

Fixes: 4c1d849ec047 ("arm64: dts: qcom: sdm630-xperia: Retire sdm630-sony-xperia-ganges.dtsi")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
index b96da53f2f1e..58f687fc49e0 100644
--- a/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
+++ b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
@@ -19,7 +19,7 @@ / {
 };
 
 &sdc2_state_on {
-	pinconf-clk {
+	clk {
 		drive-strength = <14>;
 	};
 };
-- 
2.35.1

