Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04FEF51C300
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 16:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343874AbiEEOyw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 10:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380811AbiEEOyr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 10:54:47 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52FCD2EA
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 07:51:07 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id l19so5914475ljb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cCJxeJC0tRB2AQKfmOYETUqTQM/MtsTVsq8EDHvVZ9I=;
        b=AJorOR0Gh+y4ffCpnHs8JtJFDfdXvnaWyubg2/Wb8A8zuUkTS/ookJgFDuUo7FgKKB
         1rjMrkZDV2i7Gq2NpGThXMSAZGnpCAsFuMNutAUSZ1vdiXQybsQtPZwvVbO0VnRDH7ZS
         0yDppv5xbr2ZbJQNrd0c+Oa73ahJ2M4wkegW/IE9RUNSx4qfo9t0v5rENA6T1Kok70o0
         aTccrYlhfePSQs9X2mVwulPqmqGea4TJBXbS9/RfapvLHSg91amb7A227UupymeT9tV1
         a9lN3vItev93uWq7Dw4PemNQ6tdBvrkzfxph7cXfNWO0/Z8rpb5bOfNNsjJFWzvpBYcD
         EwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cCJxeJC0tRB2AQKfmOYETUqTQM/MtsTVsq8EDHvVZ9I=;
        b=z2hODblByigKwR5sjX5Aw2yS6BSTUPOpQpfXdIQfIB+ypBzLvO6ijBJ+L0hE0OZryc
         mtclu/G8Y/zN5nlSKlJJONjsSRHDZ4Zu4iPFENktKGFcB0lmC5EYYJaaf0FDHStQ0gAS
         hw+FZLvFSsOUFDaPEsUnzUyxz4s1YZ5PkDCMzM2UYqUbouxIsuLeeypZZ95hrLC99lpK
         2MVd7g4wvScBxoJnL+8u+pbo2XfI7CzxkdWUXkoRNphXT5Yri8QQVeKiPbr78hM0ynH8
         Uyk74S9F0+3YWIoQ7Bsr0DiENsVSTFip0Q1YlfNiJc76WdAfhS32fSqtMl3XxiyKfaRo
         Z6yw==
X-Gm-Message-State: AOAM532yVl20tW/ueSwt7epynFvVCoquS5QzFKpiT3OqIdb/Sz34fxxo
        yUN+c+gyz3xUSD17YuZAj6Xj98YNKNf+Xw==
X-Google-Smtp-Source: ABdhPJzwOXSFFgQbdLcYt6u1hm3ETe2Ay2XUYHnYpLgh+C3Yd5F4+OYUb+qg8QSArOCpNoiCmPxvtQ==
X-Received: by 2002:a05:651c:160b:b0:247:f955:1b18 with SMTP id f11-20020a05651c160b00b00247f9551b18mr17176760ljq.427.1651762265723;
        Thu, 05 May 2022 07:51:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h5-20020a05651c114500b0024f3d1dae8bsm227238ljo.19.2022.05.05.07.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 07:51:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qrb5165-rb5: declare tri-led user leds
Date:   Thu,  5 May 2022 17:51:02 +0300
Message-Id: <20220505145102.1432670-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505145102.1432670-1-dmitry.baryshkov@linaro.org>
References: <20220505145102.1432670-1-dmitry.baryshkov@linaro.org>
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

Qualcomm RB5 platform uses Light Pulse Generator tri-led block to drive
three green leds. Add device nodes defining those leds.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 0e63f707b911..621127a7ce9b 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -806,6 +807,35 @@ lt9611_rst_pin: lt9611-rst-pin {
 	};
 };
 
+&pm8150l_lpg {
+	status = "okay";
+
+	led@1 {
+		reg = <1>;
+		color = <LED_COLOR_ID_GREEN>;
+		function = LED_FUNCTION_HEARTBEAT;
+		function-enumerator = <3>;
+
+		linux,default-trigger = "heartbeat";
+		default-state = "on";
+	};
+
+	led@2 {
+		reg = <2>;
+		color = <LED_COLOR_ID_GREEN>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <2>;
+		default-state = "on";
+	};
+
+	led@3 {
+		reg = <3>;
+		color = <LED_COLOR_ID_GREEN>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <1>;
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
-- 
2.35.1

