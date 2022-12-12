Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33F57649B9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 11:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbiLLKDF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 05:03:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231995AbiLLKCz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 05:02:55 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807C2DF07
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 02:02:54 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id v11so2269970ljk.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 02:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyA5j8UPbljPS/0gpmRfAGvM80LSRW/CSN7T+wq0jpI=;
        b=wlwCJPGMJX/3fqDm2EwFukIHjoYLL77T+IyWq7UAWWeFG5IvdP+khMjXPwb42kaWDa
         eX7QGFkcSfwQw/ZF0hJeExffBvAFolfmrbAJ+GI4XS/cpkRdm+K/Cua+SW4Md2D2EHmM
         FFTR2UjqS8HPkrWVJWfKovIz3nWJlfzPDxzeEssei+lFOnOTd1hBNCYwIbLmDoGdQTLI
         VX46uHsuEexAlR+pCIxiWSVbJdALILZt04TtnMV6EcWAi12NGg+FDw0P0qbMNVGLSKZf
         ejTMjXe4R65hkkfd07pnasRH4raV9n6C1YkySnhAK1Nx48T/JLElCc/gSsyYkoEs5rCn
         y96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyA5j8UPbljPS/0gpmRfAGvM80LSRW/CSN7T+wq0jpI=;
        b=inMpapLYajTIFZIL8hNeehdAigW9YsttOlQ0tB6dVm/Opi0n85789+yHaekb/ovPnr
         Srzz2LD/SD/HNwU1a9cJA3hOF6m7b44C7ZrAPnDmDodwggU4T5Bu22sdLoHY6DfnGfBH
         2CmiI/fsIjVzne7TBy0u32p7Rbf8T6HYpOuMTXipOs5E5Zgyf05cpUTupodkSWdMXZFY
         ZuTLdjv5CzGHvJlNQR2+lk3udgsG6umCcZCfeKgM78BoRWVNLfk3Mvg7z48mRSPQR/3N
         A9A0Px2fDOZ1MHIpUsnQZ+Vw9mJzGg/+qp2E3NWgQ1JSBrag34lGkoPCIIsR2Vma+mMx
         H6ZQ==
X-Gm-Message-State: ANoB5pnUNDjRgmPW8RQnnFWDfo4MT13zuej83QR/9pQ5yjYd0SIl7ggl
        EX0WnkelWCh3wsUrjfWM36q7Xg==
X-Google-Smtp-Source: AA0mqf4e0QcaG8GVFC1QW92UI0JfVtgNYFwioD9n4jzQqURktxD+vBYMWzo8hWzWkwK5aAEbMqhPgA==
X-Received: by 2002:a2e:9a95:0:b0:27a:43d0:1d4c with SMTP id p21-20020a2e9a95000000b0027a43d01d4cmr1948422lji.35.1670839372747;
        Mon, 12 Dec 2022 02:02:52 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i124-20020a2e2282000000b0027712379ec8sm1145101lji.28.2022.12.12.02.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 02:02:52 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8250: move sound and codec nodes out of soc
Date:   Mon, 12 Dec 2022 11:02:32 +0100
Message-Id: <20221212100232.138519-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212100232.138519-1-krzysztof.kozlowski@linaro.org>
References: <20221212100232.138519-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sound and on-board WCD9380 codec nodes are not properties of the
soc, but rather board as it describes the sound configuration.  They also
does not have unit addresses:

  sm8250-hdk.dtb: soc@0: sound: {} should not be valid under {'type': 'object'}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

---

Changes since v1:
1. Add Rb tag.
2. Rephrase commit msg.
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 40 ++++++++++++-------------
 arch/arm64/boot/dts/qcom/sm8250.dtsi    |  6 ++--
 2 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 3ed8c84e25b8..b741b7da1afc 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -27,6 +27,25 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	wcd938x: codec {
+		compatible = "qcom,wcd9380-codec";
+		#sound-dai-cells = <1>;
+		reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+		vdd-buck-supply = <&vreg_s4a_1p8>;
+		vdd-rxtx-supply = <&vreg_s4a_1p8>;
+		vdd-io-supply = <&vreg_s4a_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob>;
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+	};
+
 	thermal-zones {
 		camera-thermal {
 			polling-delay-passive = <0>;
@@ -631,27 +650,6 @@ &slpi {
 	firmware-name = "qcom/sm8250/slpi.mbn";
 };
 
-&soc {
-	wcd938x: codec {
-		compatible = "qcom,wcd9380-codec";
-		#sound-dai-cells = <1>;
-		reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
-		vdd-buck-supply = <&vreg_s4a_1p8>;
-		vdd-rxtx-supply = <&vreg_s4a_1p8>;
-		vdd-io-supply = <&vreg_s4a_1p8>;
-		vdd-mic-bias-supply = <&vreg_bob>;
-		qcom,micbias1-microvolt = <1800000>;
-		qcom,micbias2-microvolt = <1800000>;
-		qcom,micbias3-microvolt = <1800000>;
-		qcom,micbias4-microvolt = <1800000>;
-		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
-		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
-		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
-		qcom,rx-device = <&wcd_rx>;
-		qcom,tx-device = <&wcd_tx>;
-	};
-};
-
 &sound {
 	compatible = "qcom,sm8250-sndcard";
 	model = "SM8250-MTP-WCD9380-WSA8810-VA-DMIC";
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index d517d6a80bdc..fbbbae29e0c2 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2826,9 +2826,6 @@ compute-cb@8 {
 			};
 		};
 
-		sound: sound {
-		};
-
 		usb_1_hsphy: phy@88e3000 {
 			compatible = "qcom,sm8250-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -4910,6 +4907,9 @@ cpufreq_hw: cpufreq@18591000 {
 		};
 	};
 
+	sound: sound {
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13
-- 
2.34.1

