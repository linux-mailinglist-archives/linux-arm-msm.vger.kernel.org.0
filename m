Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDBD636C12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 22:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236642AbiKWVIA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 16:08:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239121AbiKWVH3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 16:07:29 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322592BE2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:07:26 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id p8so29910084lfu.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUjry175/VXbDzEgIWugKXjr4zqZnAeXXZOGs2AXa0I=;
        b=T4BAKSuEyY5uCf5CZ0zBMvhnHSy05rhs6sScc2Ivx9W585akn3FcyfwSWWPIDSggdX
         X/qjRxYQRa8bLbFrSDeQYBQ36YOIysexCtAJKkdXcY2V3jdiGT9924oV7HUN4fSpN9s7
         xAvYim7YmGb/hBaDOLXSYgGj+bdNaStkFj88M3oMYGeozjFOhMGrztAYmtEsuxq+wcbt
         jyMPq9Ox4yTSH8TepXsXXlRXwDMOW4cIpKboxBo7/KS95bmwAH48d6ZhMleyPECWBL0L
         LlIzJFMunAgaqSpholvi9DNf+QuKEV7PHfgAwiplNS89bR3RBRwuxn8hQoTQuKJuMCAW
         Raig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUjry175/VXbDzEgIWugKXjr4zqZnAeXXZOGs2AXa0I=;
        b=bRRSYFGgAIaCGCU78EzNBjNqTbWB+Ro887RaULwNg8M8DC58kej23i7M1mENQXdepn
         QwRerlv35k5mAU20ASMZmp9F+DvjuL/YpT5KOme0fMK9j+OdwoaBkHPlqk0E2ARMz1ec
         aX17F3xJyDXdeaxStpewTLEpgYRJTfzqES0lJ5fNnNLC/UPW4r/QvFJBKRTnhaiRdQDe
         UPJZ0yeRZCa3QqoTxW+iTBQsIA6DjVt5MmsyPaa0SSCBqu7D7cKXmZ1+2qOVAPYp1QYt
         cZiJaBrzxqqUiUTqdHtFg5b4TjnPBo2aG22RW3XMkyIZR5Cje9LNkznPSEALlqImP3TU
         1mEg==
X-Gm-Message-State: ANoB5pkJvRThcUoN63/zYep2CfNiIfxP0UeXqAAeHZFeKQEg6r/R6veU
        H+kZPg/tWYuGHR2uzL+Gfz8cJA==
X-Google-Smtp-Source: AA0mqf4j3RwA3yK169nrzO6jRDebpX6fs/sqaTF3eghnIIcerKsaShaIzlXOcMBjEpMqGJxWdQGZWg==
X-Received: by 2002:a19:435c:0:b0:4b0:38f1:1784 with SMTP id m28-20020a19435c000000b004b038f11784mr3321716lfj.335.1669237644530;
        Wed, 23 Nov 2022 13:07:24 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c26-20020ac2415a000000b0048a8c907fe9sm3024119lfi.167.2022.11.23.13.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 13:07:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 4/5] arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI bridge
Date:   Wed, 23 Nov 2022 23:07:19 +0200
Message-Id: <20221123210720.3593671-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
References: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
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

From: Vinod Koul <vkoul@kernel.org>

Add the LT9611uxc DSI-HDMI bridge and supplies

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 59 +++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 75b7aecb7d8e..d1635c9de6f3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -20,6 +20,28 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	lt9611_1v2: lt9611-vdd12-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9611_1V2";
+
+		vin-supply = <&vph_pwr>;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		gpio = <&tlmm 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	lt9611_3v3: lt9611-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9611_3V3";
+
+		vin-supply = <&vreg_bob>;
+		gpio = <&tlmm 109 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -353,6 +375,27 @@ &dispcc {
 	status = "okay";
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	lt9611_codec: hdmi-bridge@2b {
+		compatible = "lontium,lt9611uxc";
+		reg = <0x2b>;
+
+		interrupts-extended = <&tlmm 44 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 107 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&lt9611_1v2>;
+		vcc-supply = <&lt9611_3v3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -416,6 +459,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default", "sleep";
@@ -431,6 +478,18 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <36 4>;
 
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio44";
+		function = "gpio";
+		bias-disable;
+	};
+
+	lt9611_rst_pin: lt9611-rst-state {
+		pins = "gpio107";
+		function = "gpio";
+		output-high;
+	};
+
 	sdc2_card_det_n: sd-card-det-n-state {
 		pins = "gpio92";
 		function = "gpio";
-- 
2.35.1

