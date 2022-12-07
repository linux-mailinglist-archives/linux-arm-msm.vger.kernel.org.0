Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1364264558D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 09:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbiLGIk5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 03:40:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiLGIk4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 03:40:56 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529151F9F2
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 00:40:54 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id vp12so12252063ejc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 00:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8XELo1fO300N0txX2bi3UEYRaJ+M60DVCY2RyFyvGz8=;
        b=TCecy/H/WK1gAkBTJ5GIKc+X1XC31M66Rla7gAYR1wRrlgJCAcTCRyXbsYXA03JzXx
         JOcEi6F4tQYRZLWJirYh5RmB0UIdHH2tuRtnrGMM1mX38mq61gNNs3OIdk2xJsUa6Mqk
         mCuAZ6/rIKB2BpF1G+vwRJLGuN2P98C7xvOBhJSIQWAkpOssgKkGh/kJ2ih2Yvn12pcG
         ZpCedigP6QoDhTc5NVkItdJHsfTOM2j82buah4N42FtSwGZUyniCYdxgJY+sd0n6ESMc
         PhPbrCkjOvVnnKaIaofP3r/tX35vnvZvB/XqDWuzN8BNApw1owEG6LIb7dswyal38tWW
         mMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XELo1fO300N0txX2bi3UEYRaJ+M60DVCY2RyFyvGz8=;
        b=Dw/e57Z0sZjyimUVoIPibgx2Na2T39tYkc+wYLCdLLLUInnj/kI6kYryP/eQeDniQl
         orm1hb0iwBxLQoF+6hzCwRLct2N7CYF3YmlCHNJ7b1ZkDDd+JUFlSfIIGAVhi3bNrkyL
         72ZXI3u+EDBd2bV7gOBjC9yBAp8etEgeqaSyp2fFsnsLeVDiijn12x1zxNWMSKwENhYX
         AuvrF2Lq0RikWY4FmgGV57v8k7lIipSRJ8KSANuAcJZHMD1xWzcIdLNczgJKVkemWiSw
         EE0KlTCk3Te95IzopLkAMfhO5W80JLhvq1tUJ6NEOcw17MlVR5esvkPKBnWJmLE53kdg
         MVcA==
X-Gm-Message-State: ANoB5pkYoMfakWhHid88s//2h40WtPBmrM0spu7mYOF6fHD0k+yegsYA
        CK2ZDh6GnX+7tYhq4J/u8w4zO8i29iihC2P6
X-Google-Smtp-Source: AA0mqf6U95l25iZubD6K14hN1Ncq7oAY8QAmNyarEwa8m5xcbZDpWkUuic5l1vZnnYgt2adI42tyew==
X-Received: by 2002:a17:906:9f09:b0:7bc:db1b:206f with SMTP id fy9-20020a1709069f0900b007bcdb1b206fmr12269924ejc.719.1670402452588;
        Wed, 07 Dec 2022 00:40:52 -0800 (PST)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id kx4-20020a170907774400b0079e11b8e891sm8183619ejc.125.2022.12.07.00.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 00:40:52 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Add pmk8350 PMIC
Date:   Wed,  7 Dec 2022 09:40:45 +0100
Message-Id: <20221207084045.270172-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.38.1
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

The PMK8350 (which is actually a PMK8003) is used for the RTC and has
ADC for thermals.

Since the adc_tm compatible used in PMK8350 is not yet supported, skip
configuring that and the associated thermal zone for now.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index c456e9594ea5..df05e5dc8696 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -5,7 +5,11 @@
 
 /dts-v1/;
 
+/* PMK8350 (in reality a PMK8003) is configured to use SID6 instead of 0 */
+#define PMK8350_SID 6
+
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -13,6 +17,7 @@
 #include "pm6150l.dtsi"
 #include "pm6350.dtsi"
 #include "pm7250b.dtsi"
+#include "pmk8350.dtsi"
 
 / {
 	model = "Fairphone 4";
@@ -426,6 +431,20 @@ conn-therm@1 {
 	};
 };
 
+&pmk8350_rtc {
+	status = "okay";
+};
+
+&pmk8350_vadc {
+	adc-chan@644 {
+		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "xo_therm";
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
-- 
2.38.1

