Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE46B717325
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 03:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbjEaB0d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 21:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233739AbjEaB0c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 21:26:32 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D00C9
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:26:31 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so6004926e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685496389; x=1688088389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbd5t5Zp+ma3P1n+fyVRc8yZo3nip3v6YMJHIs9kFoc=;
        b=fPBG52Wzjjl56Z9LTtRwkj7CXMrzjj/VwVI1atzM7JPbxgPNnYfhWs0Uo56hsZTp7M
         cJcamOKGOZLvhut3m2TJl/Y4BSkVD66spyY0VTeJzqz3N+R5FiQxnVMWATLVOraUZP43
         b6QvFXv5B2hGKLlMN8eCKGFIvT/0Q3GKcLXyhLetjhMVDXIxYf3ux0RytohLi6ZYMaqR
         FndIj/AQzDfBo+41JvXqzusy68XElauQ3kgj9hjg2qEBfbeHh3TE4cWUqYofdwzfXfgz
         yd184eeZa3q2WdcwhDZYo6KiP4UZXJ/yc5RIkk2+eGwfSyCEI9o9XwmYQr5uARoY61qI
         ccjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685496389; x=1688088389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbd5t5Zp+ma3P1n+fyVRc8yZo3nip3v6YMJHIs9kFoc=;
        b=V7taJreYwi8ei/iguVuG618DQwBIP38lybDlihbH+65Zi6mmZlcbzqASD8BG9X2vNi
         ZoQimkM6wpknUsX+CvcAKHoxOluoMb68pZ2O38P9VNYm4An8q1GJHrNUvIzAHYvM42ti
         PyFE950UCBhnvRDSgTtNGjChEPsQkYcLKS5Vd5Edd9yOumaOBJLhi/2Idqt7BfqkcxBy
         fAuk4DAb3NXze0Tl1sOAYjNHbeoaPqXAuTc1RLiU943UVrogc++fTAmWxwUDJryFZ99C
         FALqCp8AsAvEPM5C0TLFjl7EmElk1/QLM7YeLCkxrqbPbLo3WII3CQFWwYBgdj08mlA7
         GG+g==
X-Gm-Message-State: AC+VfDyH7qPCdCdK1xoJP7UsBXUEE4thF8x4waRCaGNCHWvUVGJp+uuP
        5DqvEqhvdKsiV4R7vTINFNoYW3SM3NvbneYTt6E=
X-Google-Smtp-Source: ACHHUZ782aWdccRDyyEeNmjsOuHuDTndW87mJqmx2cXR16ic2Nsz+83+Me/mfXElLMchR6LWt2bpGw==
X-Received: by 2002:ac2:55a4:0:b0:4f3:ac64:84f8 with SMTP id y4-20020ac255a4000000b004f3ac6484f8mr1758851lfg.34.1685496389747;
        Tue, 30 May 2023 18:26:29 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id q3-20020ac24a63000000b004f27471e0aesm509992lfp.79.2023.05.30.18.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:26:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: qcom: apq8074-dragonboard: add onboard leds
Date:   Wed, 31 May 2023 04:26:26 +0300
Message-Id: <20230531012627.3813060-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531012627.3813060-1-dmitry.baryshkov@linaro.org>
References: <20230531012627.3813060-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dragonboard as three LEDs: red, green and blue. Add corresponding
description.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index 72f6611bbe49..dc8667ad1b54 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include "qcom-msm8974.dtsi"
 #include "qcom-pm8841.dtsi"
 #include "qcom-pm8941.dtsi"
@@ -90,6 +91,29 @@ &mdss_dsi0_phy {
 	vddio-supply = <&pm8941_l12>;
 };
 
+&pm8941_lpg {
+	qcom,power-source = <1>;
+	status = "okay";
+
+	led@5 {
+		reg = <5>;
+		color = <LED_COLOR_ID_BLUE>;
+		function = LED_FUNCTION_INDICATOR;
+	};
+
+	led@6 {
+		reg = <6>;
+		color = <LED_COLOR_ID_GREEN>;
+		function = LED_FUNCTION_INDICATOR;
+	};
+
+	led@7 {
+		reg = <7>;
+		color = <LED_COLOR_ID_RED>;
+		function = LED_FUNCTION_INDICATOR;
+	};
+};
+
 &pm8941_wled {
 	qcom,cs-out;
 	qcom,switching-freq = <3200>;
-- 
2.39.2

