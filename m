Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7AC9704F50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 15:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbjEPNaZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 09:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233137AbjEPNaX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 09:30:23 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5762D5F
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 06:30:21 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50bc1612940so25401758a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 06:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684243820; x=1686835820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNOdUh9izb+8S/FC6G+97iSwe6d7rWiNQT3JqGUTaVU=;
        b=m+rpTHXuvREksVCHIc/xlMGI3QzBRwlzS62RNwNsXn6aUrs1MNgTquZIuqjsXLBZXL
         +DjyGosBSZqwaFPIXolSWhpY61xx3HeyzjxCtJxLEUstJKFHeu+v5ftmWK413CR9XjWf
         ajc+NGGn55LH1yURmpBt1DvgCuzacRZU+LLPUYN+MucXyTID1G3rxNxoCGIIYldb4m2j
         i6J55Z9wRcF4c4yShKvF9Vi7uVUXHX+Rd2wlhUQytE9ShF5EjGq7Hn1decddUXVU5idw
         hhcfzPYxNMG2gF8LOU8Kg8BLv9d9WKuxz0+6KvCrzCM7uM+RsAya/L/SbmvL1ny7u0Wi
         +VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684243820; x=1686835820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNOdUh9izb+8S/FC6G+97iSwe6d7rWiNQT3JqGUTaVU=;
        b=Ao9abjN3f28ItitoIvH5kWelDxjIG3H5JN2zX0gNXjrgWYHtAlKe1LklB5UJoWGnxA
         /uP/4IY0e6wuAQD8iA5mkQ+ZclObzPsglArp/3S24Pc966eWYU7oVZVAO2lh+tx6aifH
         3k8LJUURZyyeENLyIURw0Tmvhg1Znw7ZfTgfKIFpwr7im6tGAwuwq4OrrhZ8zJqSYG7Y
         UT3W7UlGyUTFP9PngXygcdkGhRtBzpkrJdrFq+gHWzFGQ+xgsdZ51Gcl9lTA2IYSTtmQ
         wD6vXF8CrM/rvXjBge50YN7A2KSqVOoFN8IBxpyxBBbU/hkO0DAtI8vvD7EIl1xVS5Up
         fLxA==
X-Gm-Message-State: AC+VfDxkXwfX3e+PcyJWsX+7/fGNy3IW5HkLarchxxUUcpMJxWZ5FiTQ
        KSPtYh2wKFSSf9DNmTyXBv/a2g==
X-Google-Smtp-Source: ACHHUZ7Ne3KfRRdIDK0kHnAIbgOj9VBc4GGF4d8sn02nISCeSe2Sk1GSx3Qwzmhh/XHAH8AXIkTJsg==
X-Received: by 2002:a05:6402:12d9:b0:50b:d77d:53aa with SMTP id k25-20020a05640212d900b0050bd77d53aamr27557423edx.38.1684243820192;
        Tue, 16 May 2023 06:30:20 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7d157000000b0050bfed94702sm8273461edo.77.2023.05.16.06.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 06:30:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8550-qrd: add USB OTG
Date:   Tue, 16 May 2023 15:30:11 +0200
Message-Id: <20230516133011.108093-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516133011.108093-1-krzysztof.kozlowski@linaro.org>
References: <20230516133011.108093-1-krzysztof.kozlowski@linaro.org>
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

Add missing parts of USB stack to enable USB OTG mode.  The QRD8550
comes with one USB Type-C port.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 52 ++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index e7a2bc5d788b..88b7d3ecdbc9 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -53,6 +53,40 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	pmic-glink {
+		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -417,6 +451,11 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pm8550b_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_1p8>;
+	vdd3-supply = <&vreg_l5b_3p1>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -505,13 +544,24 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_1_dwc3_ss {
+	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l1e_0p88>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
+	phys = <&pm8550b_eusb2_repeater>;
+
 	status = "okay";
 };
 
-- 
2.34.1

