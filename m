Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E31364512A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 02:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiLGB2N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 20:28:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiLGB2K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 20:28:10 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9245214E
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 17:28:09 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id l8so19206214ljh.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 17:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9Bijc6xAvrurI7rmLzETeV+DVE/8v/b0T5kGTcy6SY=;
        b=K/t7Nful85ubYgrqzW2KWc0N3JPTcAhTIK8qpf7Ow4FABvU1hKsbiZ3WjSpimn8STp
         y46wTJ9Ud48OFa6JrD3HFKe68RkFxZL0u2wVvHx+sqVU4aKqtHh5tuHXnPJcg1unztpv
         waHJmV8P/YrcDNM2rOO/VGf5HyATK6KvtZj0fYIoRzRlW3fYUl0ReTBN9bGm3GNevFxT
         KX7lAvxr8TApC08ri/KW/X7OhZrgP9x1mwqHh3dwv4x15x2Dg4lfxOm5rRc3PyvQiL0O
         DWft+nr1tmewnRt266w491UqlrFA6gn6KTR3eDVqXzRqzmTyovwBT3PuNbvrnkI+UA1K
         1JwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X9Bijc6xAvrurI7rmLzETeV+DVE/8v/b0T5kGTcy6SY=;
        b=RnE5yEoATFPb2VTUTfoWzZPB7qaeW7cikD0zs4VZyo91W58SJ6fgMbCuE7pizmNG6i
         Y4N5kKUlvZJBlvitELPpCkg1NXWbD5hXxtDAzcHUAGxGQYL8keJRDFIRBqtvXBZrmEXi
         IDzMltts9Y2WvcvRT7YW4+LymawfsDejUlTvGXPcffXEKylGL5PVYMMlVheS0wOh/Ex9
         ZE1ge/w/1akyDlnEAbNDZ+KmXMWf42kAAwR7a7ane1IoXHcHh5z8/iYbv36sFsNVSVot
         sVxVCWgZEM6OYjGi1ZFMiaTsIdE5YRXQs+8vcsyZcBfrlv+DDe9gKUYkRTHUjBcHJ8t6
         AXeQ==
X-Gm-Message-State: ANoB5plrQ6KDAoQ+ZkXdQb8uXhMrDFiBWOulLrDuMw0mfAz3f906F5Yt
        k4hQu6P7WXbV+QeHXy1UXDfySQ==
X-Google-Smtp-Source: AA0mqf7YNIryjZBfn8G3maAvd9s9XFKUXB75CCdK6j4CEaekf5vXUMrCPeVENaQ8fZOeCvDVzsla6g==
X-Received: by 2002:a2e:a810:0:b0:277:9e5:6cc8 with SMTP id l16-20020a2ea810000000b0027709e56cc8mr26130001ljq.105.1670376487850;
        Tue, 06 Dec 2022 17:28:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id n26-20020a05651203fa00b004b5626ef9f4sm1461157lfq.262.2022.12.06.17.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 17:28:07 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v4 4/5] arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI bridge
Date:   Wed,  7 Dec 2022 03:28:02 +0200
Message-Id: <20221207012803.114959-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
References: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 58 +++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 75b7aecb7d8e..4f345786352a 100644
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
@@ -353,6 +375,26 @@ &dispcc {
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
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -416,6 +458,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default", "sleep";
@@ -431,6 +477,18 @@ &sdhc_2 {
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

