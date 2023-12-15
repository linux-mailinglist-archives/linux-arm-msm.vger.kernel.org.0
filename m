Return-Path: <linux-arm-msm+bounces-4949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6E4814F03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 18:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39F881F2220C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 17:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B627282EFC;
	Fri, 15 Dec 2023 17:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mIarOCv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5BA82EEF
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 17:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50bdec453c8so1012648e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 09:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702662118; x=1703266918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkZ0d7wqWaT2Oid/3peHdN8kAaqN3lW46U8589k3qIY=;
        b=mIarOCv+IT/rqIjg9GlRLCJmvHsWMr4tZHNQ2X/KO8RsEYFHCuDi5qeF3mEFSWdLfj
         QTC0W4Slkl+r/ZpuLw5CmQBRMCiFZc4cFk5A9C7dwqEoCdzxNbiqI/+6M8XS/U1yOYEb
         JYLlHVuFePhAfyhewCakOYGONprWjKXh0e3bmMt9HjENcvvq6qsV/jfwiqpxZVWDPwdc
         unDwPqEt6fpP9rC6QLZcloI85+HIz/4SbQGkSnzI9JLnUKhviHoeyksUXMPluN2iv011
         yTxYJyFxvdmrlHrTNa0FqDq9oxtiBaW9ZJqIs40cMdgTjfo3yl+LdtoCQTN+rWx5Sfaf
         Ke/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702662118; x=1703266918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkZ0d7wqWaT2Oid/3peHdN8kAaqN3lW46U8589k3qIY=;
        b=DphTwOfbvn3Yrw8iuglCZz7NgOgTb6Z+ZY1MVHxVMYQ2IRnFB2tucIjzXs9pOhpnIk
         f3LhWNQjYt72fFRT6BQqvZgRICRw4PCnDquo2iFKNr+q/qn6/5Wd26kEV+4R04d9hvyH
         wEPMXJJUB7XD/cEAY06dmn12WgFsRnw7Bd6l2AU+g4xJfWYrGWY7yQ1wmz0nS8khOQPD
         e9XJbHco0uoouQWv5v9+uPVmwVRWqnqcmnTRLol2FTk5XK/KyN0KKQ7RVoTkRi6oSXbz
         9X3fhVi5j87BuVKW1/hPFjhYUgwmkph5GNczGyCakn83PJA7xjbWYjHZUeExlTLL1yRJ
         uMlQ==
X-Gm-Message-State: AOJu0YyINVy3MCt+9mscMsDKuOuFoqKp4+gUnYTXejL2tqRMCNRujMK7
	jWQmoLMNHRVoJYHH8RfWH0hzew==
X-Google-Smtp-Source: AGHT+IG6asdVxl3ZeJA5fGQH0/rlG1vk8xcqUDsS9ognza44Q/oogrHhARfDGbPNCDjGQm306HdzZQ==
X-Received: by 2002:a05:6512:36d2:b0:50b:fc6d:bb8d with SMTP id e18-20020a05651236d200b0050bfc6dbb8dmr5348985lfs.56.1702662118229;
        Fri, 15 Dec 2023 09:41:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (85-76-13-188-nat.elisa-mobile.fi. [85.76.13.188])
        by smtp.gmail.com with ESMTPSA id c16-20020a056512239000b0050dff5bb793sm1389263lfv.143.2023.12.15.09.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 09:41:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/7] arm64: dts: qcom: sm8150-hdk: enable HDMI output
Date: Fri, 15 Dec 2023 19:40:34 +0200
Message-ID: <20231215174152.315403-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215174152.315403-1-dmitry.baryshkov@linaro.org>
References: <20231215174152.315403-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DSI outputs and link them to the onboard Lontium LT9611 DSI-to-HDMI
bridge, enabling HDMI output on this board. While adding the display
resources, also drop the headless ("amd,imageon") compat string from the
GPU node, since the board now has output.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 128 +++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index bb161b536da4..6a036f9ba1c9 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -54,6 +54,17 @@ key-vol-up {
 			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -359,12 +370,112 @@ &gmu {
 	status = "okay";
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &gpu {
-	/*
-	 * NOTE: "amd,imageon" makes Adreno start in headless mode, remove it
-	 * after display support is added on this board.
-	 */
-	compatible = "qcom,adreno-640.1", "qcom,adreno", "amd,imageon";
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	lt9611_codec: hdmi-bridge@3b {
+		compatible = "lontium,lt9611";
+		reg = <0x3b>;
+		#sound-dai-cells = <1>;
+
+		interrupts-extended = <&tlmm 9 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s4a_1p8>;
+		vcc-supply = <&vreg_bob>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_irq_pin>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lt9611_b: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l3c_1p2>;
+
+	qcom,dual-dsi-mode;
+	qcom,master-dsi;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_a>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l5a_0p875>;
+};
+
+&mdss_dsi1 {
+	vdda-supply = <&vreg_l3c_1p2>;
+
+	qcom,dual-dsi-mode;
+
+	/* DSI1 is slave, so use DSI0 clocks */
+	assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+
+	status = "okay";
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_b>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&mdss_dsi1_phy {
+	vdds-supply = <&vreg_l5a_0p875>;
 	status = "okay";
 };
 
@@ -402,6 +513,13 @@ &remoteproc_slpi {
 
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <126 4>;
+
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio9";
+		function = "gpio";
+		bias-disable;
+	};
+
 };
 
 &uart2 {
-- 
2.43.0


