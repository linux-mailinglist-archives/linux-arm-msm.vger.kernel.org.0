Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84C7F619741
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 14:14:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbiKDNON (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 09:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231899AbiKDNOH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 09:14:07 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082532ED53
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 06:14:06 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id c1so5723844lfi.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 06:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLFrKd+ROJ9tv/L8iVxO8FwvCoBYlk02Gu3gZfVzyXo=;
        b=dDLyiVNY/WopgOLiG3zcg/Ix4nglxx5NItUotY9cRT6PXkloAaLowjYyglklFM1rVY
         vvfxSjCZkXl6qvIdq6l9JiDXR486N1BS1XbnvaFTlmmBkBNaEEcQnPfp24iur7OGirQB
         ibCkbHlbN8JTb52+tJT2xNhgtLxucjY9p0Wuy1JXhyhzh/FEDHzbT615Z3CY1FoLdxLy
         gsVdgsxGHoKSdJF6F8rJARsDtTgnCdap9j6LnGWOyE31oEhzVBVnF7FtB5l1uymkWQoq
         o+57h2nFHCJsgCrpJc27Rag12CXEgW0JoKwN5MIPuQr07xUpngzHa7t4FG4Ee60tasUo
         fUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLFrKd+ROJ9tv/L8iVxO8FwvCoBYlk02Gu3gZfVzyXo=;
        b=EFGJoaeIyXbj8QkSkZnKvV3bWXaOBpJZMhT7U5NEWDzZEBjH9tlYgb9fcPzDQkPDNJ
         eZNYjOhHXw3oK97xJ6zU2rrx1hQXWhLsrPQP3n8qh1AOWXtlANEkcAuS6tTRaY/C9Z4Y
         WPwYJokRK5S9ztQefbUNTwYfPFuo50ygwfMH2/SXvhGFdRVTmwxgjG4uB35I4hrFI2KL
         U76j8h6VGysQVKronCuhDLUMxJ6jKBotIuI296WDZSyyJ0814ViPuWOBE8+n6vyI8xTH
         RYn146PIoC/V3QV03mNVr6BqYHFmyqzaA82sJrfD+WyJkq7Ir11g59iIMCC/dd9r9ldE
         8Osg==
X-Gm-Message-State: ACrzQf1BsY0aJLJ+onGLkLH2QdhuZf8sMXhGWUp8uo/GXgpBKQxg91d+
        q3/3eGJjAr38LPp2k8WOU0Q9zA==
X-Google-Smtp-Source: AMsMyM436Teu9wteeV1x9zY7us2g/zD1IUzJUV+oD5ijWRMvc63uhLBEmU93mXNVDi8kc2CINDZn1w==
X-Received: by 2002:a05:6512:a93:b0:4a2:6bd4:e9d9 with SMTP id m19-20020a0565120a9300b004a26bd4e9d9mr12808993lfu.100.1667567644380;
        Fri, 04 Nov 2022 06:14:04 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id t27-20020a19911b000000b004a95d5098f2sm457050lfd.226.2022.11.04.06.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 06:14:04 -0700 (PDT)
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
Subject: [PATCH v1 4/5] arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI bridge
Date:   Fri,  4 Nov 2022 16:13:57 +0300
Message-Id: <20221104131358.1025987-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 61 +++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index e1a4cf1ee51d..9522dd29a38a 100644
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
+	lt9611_3v3: lt9611-3v3 {
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
@@ -349,6 +371,27 @@ vreg_l7e_2p8: ldo7 {
 	};
 };
 
+&i2c9 {
+	status = "okay";
+	clock-frequency = <400000>;
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
 &pcie0 {
 	status = "okay";
 	max-link-speed = <2>;
@@ -394,8 +437,26 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <36 4>;
+
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
 };
 
 &uart7 {
-- 
2.35.1

