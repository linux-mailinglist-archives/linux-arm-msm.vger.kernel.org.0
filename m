Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07B16AA975
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 13:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjCDMeO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 07:34:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjCDMeN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 07:34:13 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2E911650
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 04:34:04 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id da10so20604061edb.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 04:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677933242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N9dYd0qrltidEHkDRqqhRk3DmzRrcvSAp0RYO9o9mm8=;
        b=Xjs3fZV9KPcKQGshL528UsIW4zdT46CJHhowgKZ5IoQvP0Lrla+baV7NuoLqjzilGM
         ElzE75xRbEYYE3vmm3GIEPt8UFetZ28uQNOgAc417wA6FA4Mh6h2lqJMdFRt9kAFZWKV
         vqYGLNWyWkBU04TivtzAnSl09WwTasFtF85ZEzfs43MG2hPo9+3ErFRrZWmuhTsYb1C8
         L10GcRbX6KPvqn2f2lntnYvBA7wuowg+2RPKuMbMDK0UWbSmSi2ZrHl3UijIkMfO/lKi
         4fIhBa75EUOP98ziqdRIoLEmCS3lx5UKKZ6qC+q0Y0GuSSoQcDOLpnc2QAU9Zv5i7beL
         HjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677933242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9dYd0qrltidEHkDRqqhRk3DmzRrcvSAp0RYO9o9mm8=;
        b=iELH6IEXibUeHIxbmq2TgtSdm+sU3cxhL/wZJuoQG0nv3WMaQEovQhV9gdjdReqzRx
         QqLz7JRIFibl2kICUkBHa+RAIlUYmivQg2+Oc+ypYOoqbtssgR9x2kTafeqJBoDV8u5R
         LLlAzMcvty7o7o4pFol4gG+tGVwT+18gA1cwtKKjq6Lg7JeU5Tdl9/PxLvFTUdZ0zZDS
         DM1NnNrC2laopGO2PGpfji4m01Jiux4eRhmW8Pz73Kuy5Nil/Ruj7O8j5CN/nOtECoD0
         F53VfFvzTEAL/vD4oyts8Boxgk6/8YnYrBfHw5UMfzSMteNjggccQM66q3PgCR3Y7JHG
         pwhA==
X-Gm-Message-State: AO0yUKW4hMnmWjL85Q99pN9NSbThfegDj8SmO3OOFyYv3Qu2VtoHcm0s
        SnGClIPCaYUv4nFeWYSWxkiAJT0usfPPfUpdHk4=
X-Google-Smtp-Source: AK7set+A2mQ/2iG1lKphCs4gxHM6cgDvQqZLVH1/AYCCfMeZQjCXIb+fb+wL4Dw4/TVXO0oHTRnCmw==
X-Received: by 2002:a17:907:1c1f:b0:884:930:b014 with SMTP id nc31-20020a1709071c1f00b008840930b014mr6349313ejc.6.1677933242738;
        Sat, 04 Mar 2023 04:34:02 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:b758:6326:1292:e2aa])
        by smtp.gmail.com with ESMTPSA id q27-20020a17090622db00b008b1787ce722sm2017087eja.152.2023.03.04.04.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 04:34:02 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/8] arm64: dts: qcom: sm8150-kumano: correct GPIO keys wakeup
Date:   Sat,  4 Mar 2023 13:33:51 +0100
Message-Id: <20230304123358.34274-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

gpio-keys,wakeup is a deprecated property:

  sm8150-sony-xperia-kumano-bahamut.dtb: gpio-keys: key-camera-focus: Unevaluated properties are not allowed ('gpio-key,wakeup' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
index ff77cc3c879a..47e2430991ca 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
@@ -59,7 +59,7 @@ key-camera-focus {
 			gpios = <&pm8150b_gpios 2 GPIO_ACTIVE_LOW>;
 			debounce-interval = <15>;
 			linux,can-disable;
-			gpio-key,wakeup;
+			wakeup-source;
 		};
 
 		key-camera-snapshot {
@@ -68,7 +68,7 @@ key-camera-snapshot {
 			gpios = <&pm8150b_gpios 1 GPIO_ACTIVE_LOW>;
 			debounce-interval = <15>;
 			linux,can-disable;
-			gpio-key,wakeup;
+			wakeup-source;
 		};
 
 		key-vol-down {
@@ -77,7 +77,7 @@ key-vol-down {
 			gpios = <&pm8150_gpios 1 GPIO_ACTIVE_LOW>;
 			debounce-interval = <15>;
 			linux,can-disable;
-			gpio-key,wakeup;
+			wakeup-source;
 		};
 	};
 
-- 
2.34.1

