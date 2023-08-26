Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCD297899B6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 00:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjHZWTw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 18:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbjHZWTZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 18:19:25 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0581B3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 15:19:22 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso3137122e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 15:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693088360; x=1693693160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HfcW2sKs/zrz1JXyCkhYKWgvTXW8hsLwfoBt2SnqaA=;
        b=CG6f02NxvEHWWuCBh03fQjQ/iOuSaQD1oBApi/x6D2oRvDqt6dUjl0sqMGaajM0IJe
         1aidb+telhttTzOQ/lDOfW2NMpMMpBkZtU5yZ2BCIgWqJFt8iRBQJLedo9wkcy13q8Kc
         E/1YOniyVf1T8ErDvgeFCIYQzVy4xZgt9lDSud5lYUEXqaKPXwdyYB5MRLpYGWAfQMBY
         TIcCNseV7+PBI75OXBz1ZWYei2ydlfFnDhSFeRfdeRxEDcHbZSevQZRdrWhSCvW0JQh1
         /fpkLASTygeMsmPxbmpW9dChbS1TDiHiR6SX/H0lfxLK4NE88rdDCwbgoERk9O77By80
         Ub+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693088360; x=1693693160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HfcW2sKs/zrz1JXyCkhYKWgvTXW8hsLwfoBt2SnqaA=;
        b=KSWpfbMeQ6pmJFyDHN8O97Algv0BLBNJhK+xXruZTw+DGK7A4w6JjyRx9LkAUe/uv9
         YD+TL/H4TCeg+3VuiZfOi1Rvikd5mxde8vohGIH5uoR7kCgKNJXpHiB94b79/W2DxjGG
         oE5AAbiJgSdCczlROzmKUbTWDvrrk2rt/NyF37ayJSjX13MZkT19NHOQr7+FQMRvkv/9
         FlTGcNr5N1P2K5qqJj0ghVY/Jd8WwIIhfcLS+1en69A/MTxADSm6vnc2Y4GP9S/Eadzy
         aot8kuEFLL58jtGOjao1y4zCpyppJ8bQJUemjCGUfjK9qwxbRmux+2gTIIzU7znhY9xV
         7B8Q==
X-Gm-Message-State: AOJu0YzAHN7DV/3j4KTlFISejZ7YBkfQAQcrhIrpLn8ziOXZhqX3Lq8/
        FlLGEs1z/pa+fWRLY0X9qNp7hg==
X-Google-Smtp-Source: AGHT+IG63JICgFMRbkTaMszSt6Xi3auTUa5JOgwfAlgsi5W2YmHHrBfVZqTyTCGtdYRJ/GYNTD4tBA==
X-Received: by 2002:a05:6512:2347:b0:4ff:8f71:9713 with SMTP id p7-20020a056512234700b004ff8f719713mr18892741lfu.42.1693088360644;
        Sat, 26 Aug 2023 15:19:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a19ae19000000b004fbad341442sm868672lfc.97.2023.08.26.15.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 15:19:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: qcom: sdm845-mtp: enable PCIe support
Date:   Sun, 27 Aug 2023 01:19:15 +0300
Message-Id: <20230826221915.846937-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230826221915.846937-1-dmitry.baryshkov@linaro.org>
References: <20230826221915.846937-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable two PCIe hosts support on Qualcomm SDM845 MTP board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 78 +++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index aec3f358d426..76bfa786612c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -533,6 +533,38 @@ &mss_pil {
 	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mbn";
 };
 
+&pcie0 {
+	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_default_state>;
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+};
+
 &pm8998_adc {
 	channel@4c {
 		reg = <ADC5_XO_THERM_100K_PU>;
@@ -630,6 +662,52 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 };
 
+&tlmm {
+	pcie0_default_state: pcie0-default-state {
+		clkreq-pins {
+			pins = "gpio36";
+			function = "pci_e0";
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio35";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio37";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		clkreq-pins {
+			pins = "gpio103";
+			function = "pci_e1";
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio102";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio104";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
 &uart9 {
 	status = "okay";
 };
-- 
2.39.2

