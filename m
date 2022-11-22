Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B12634B31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 00:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234913AbiKVXhO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 18:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235183AbiKVXhG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 18:37:06 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639ACBEB6D
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:37:05 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id x21so19596768ljg.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FM4K/pkHjLHkAOvfw4d2cino7N9sUMcIq1wxV3ai/bY=;
        b=KOsB3D1ho5/J9eaOkqkoyZqIaHUjyVggsLvtTrZLamLCBMyz4E88xUqGZ2H+bpAswX
         IlRtdpWMlod+j3hCE2lNqqbs1FXOKze37Yerp8Wis/uSMcQ8CuVRKIxYxPlSpOchQOuL
         isc/9GPdtC+dQaG7sOwDslT+51chZzcLUyRilb4yadGv2IJftqTXphuIYgtaVHJ10DW0
         GjgbYDubU+k2xnWtJyTZCdBjZd2I8QRl21jn8MJOX3TM85gCor1QSVl2WHg6TNhdK9dV
         efOdBWkihJP5oju4p1IVqPoGW/xSh5u8RpJ1U8hbG9XJkzYM5ds1x/hwifd9xslXWTc1
         mmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FM4K/pkHjLHkAOvfw4d2cino7N9sUMcIq1wxV3ai/bY=;
        b=iVNwZuqNGdsZFi18ggyICXhWMg7MiXNFhH7AgV3NDaqvNVbbivuTTA7k4xip8AA8JH
         7Lz7htqXma1pJxEapNebfxSsPx4y3jY50uKyDZJ+Q8he43wf9azjOTR1tk1LzUui66AO
         yuYrUc+R3OXeTGOcPMWIuRqlwYt0kdw/QWG6KbHqnjb+0vIDpbg0Pj/fNRI8N+EqVaSr
         DF4A4r5HUn6C+El8+yDlkh+JBaJ4XB1Oz8FIY1Ju0W77bEx2orkhVHWEBESmW+Tpkh8z
         nnjwBvkTO1EZdXUCAVitxCzUu4VGkPdcmcO9YkcLDj5mfFh9IEzJqJ+boenLV++nb2lU
         YadQ==
X-Gm-Message-State: ANoB5plwjmb6QSPoGXB4vXzTgNLPAL5VPRgIn5NR/6gBAgwhqnbTFMZ9
        lvOLX9x7AvWtHaJDCtKZsgPXOQ==
X-Google-Smtp-Source: AA0mqf5bZVQDunR4a0/2DQ93hnQZnrAIyyh6AoqyqeMzmVooT0FTtKSReZ5efjgw/D1ntdL5r9UMaQ==
X-Received: by 2002:a2e:b55b:0:b0:26c:554f:87a5 with SMTP id a27-20020a2eb55b000000b0026c554f87a5mr5067918ljn.452.1669160223739;
        Tue, 22 Nov 2022 15:37:03 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
        by smtp.gmail.com with ESMTPSA id h3-20020ac250c3000000b00492c463526dsm2666454lfm.186.2022.11.22.15.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 15:37:02 -0800 (PST)
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
Subject: [PATCH v2 4/5] arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI bridge
Date:   Wed, 23 Nov 2022 01:36:58 +0200
Message-Id: <20221122233659.3308175-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
References: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
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

From: Vinod Koul <vkoul@kernel.org>

Add the LT9611uxc DSI-HDMI bridge and supplies

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 61 +++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 75b7aecb7d8e..6b6dcd0e0052 100644
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
@@ -431,6 +478,20 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <36 4>;
 
+	lt9611_irq_pin: lt9611-irq {
+		pins = "gpio44";
+		function = "gpio";
+		bias-disable;
+	};
+
+	lt9611_rst_pin: lt9611-rst-state {
+		pins = "gpio107";
+		function = "normal";
+
+		output-high;
+		input-disable;
+	};
+
 	sdc2_card_det_n: sd-card-det-n-state {
 		pins = "gpio92";
 		function = "gpio";
-- 
2.35.1

