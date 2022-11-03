Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB1C3617A5E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 10:58:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbiKCJ6j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 05:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231302AbiKCJ6g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 05:58:36 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0610410542
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 02:58:35 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id z5-20020a17090a8b8500b00210a3a2364fso5381303pjn.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 02:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2bk7pRYobVWNftG5GXW6pX8qzOqi3/Pti4Jd+nYDpQ=;
        b=uV2ovQXXjvVL1zbdGGTdMHq7EWfBxQLxUP4785isfZICCQl3dBmeOb5L2hhwzDvbl+
         rmoRpa/xn7VTXXoW8kxdhU07EKo8sh8CJVH7fVs5/8OqHoCYhj2HcOftJ78XojjaFn39
         ilWWzpfbHGg6m5RL9WjcEe73Xbz+qc4jQEss988SFuPe/DM5XDqX/be2gkvYkzOk+uM+
         dVNtHlUWJ8/DSWRPInNeHRMl71F0UpNXDRI/CnHoUBycG0Xx7nROiGaP/2vDJWc4IRA6
         jnwxA1htu/bN8hUtkz9Bh7242U7W5IlGuGqU9lMVH3VY7Mp9NeMsbq3N3kAqbhy4VKN8
         ls6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2bk7pRYobVWNftG5GXW6pX8qzOqi3/Pti4Jd+nYDpQ=;
        b=JCVtDXchIv3ehgKD7AG/e9yF7SY0tj4/fC4twbgXPjpkGzLM22pQjXknl4REokTrIM
         6qp8BYMMpBDKMIcfMbWJIDftE4ez+eS3ZKBRDMLcsPOrvNewbMoiPo1tWh3upCuVSFNn
         /Qfu1D0pofnw7fY0OyGiOXnMakKvZPCCoGPu0aBILuSe+wYWzC2LcU1ZX9KDTUY0fxD4
         GpDj2ExpanFZxIwBbyfselA/yT8DAXqw2/0j7PMmkSfwPrwfp/tz9vIhiCCFHbbnYrWT
         XPkEIwXXCE0fyg9ge417ibPGFpwcVA+wYsKVT6NHBGLmpU7r3MQvAkfZZPeo9/ZcGfzl
         ToFg==
X-Gm-Message-State: ACrzQf3EszEsJAGRtIEKtHLT3BYoYw5h10U6i34Sk+5XR9h2kQlPiKs8
        bmetqiQKEaHM+7o0brv94lro
X-Google-Smtp-Source: AMsMyM5XqXD8B4LGcXKgC8UFLqn0dmzC3//jkDNdrVTKZfsUtnI4sPGTTqoh7MVbuz0UimRqKX40rw==
X-Received: by 2002:a17:902:da84:b0:187:28c4:eff5 with SMTP id j4-20020a170902da8400b0018728c4eff5mr17650712plx.146.1667469514435;
        Thu, 03 Nov 2022 02:58:34 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.64])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902e54600b00186c54188b4sm161670plf.240.2022.11.03.02.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 02:58:33 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 02/12] arm64: dts: qcom: sc8280xp-pmics: Add temp alarm for PM8280_{1/2} PMICs
Date:   Thu,  3 Nov 2022 15:28:00 +0530
Message-Id: <20221103095810.64606-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221103095810.64606-1-manivannan.sadhasivam@linaro.org>
References: <20221103095810.64606-1-manivannan.sadhasivam@linaro.org>
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

Add support for temperature alarm feature in the PM8280_{1/2} PMICs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index 24836b6b9bbc..5de47b1434a4 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -33,6 +33,13 @@ pmc8280_1: pmic@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8280_1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pmc8280_1_gpios: gpio@8800 {
 			compatible = "qcom,pm8350-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -78,6 +85,13 @@ pmc8280_2: pmic@3 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8280_2_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pmc8280_2_gpios: gpio@8800 {
 			compatible = "qcom,pm8350-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
-- 
2.25.1

