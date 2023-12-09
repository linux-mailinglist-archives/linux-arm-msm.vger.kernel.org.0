Return-Path: <linux-arm-msm+bounces-4111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBC780B78E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Dec 2023 00:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DC98280FB0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 23:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E874120DD2;
	Sat,  9 Dec 2023 23:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d3xp09Fd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE9D1A1
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Dec 2023 15:21:42 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c9f7fe6623so39898311fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Dec 2023 15:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164101; x=1702768901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CB+gYpOOF5znwwoZmws+FfZHIzH+rl1BpCW0+2oHpfo=;
        b=d3xp09Fdnd5tosEwSWsfNALi1B0TZ6EeKmROgdO6NPApzyalsQoW3xsypWtVgbcySi
         XlYH52JYPjZP8cV0mq2fqnknMjB9FDXJexaCDid8OMGYjWSU8JPZ9dXprV6wquA0xR/j
         OgyCsmc2fnxAvjdsnWomGikSU4vjnWTQwwj3vLbv7H3Xp9E4KuCIaqw5pkMFHSyxhAUb
         zTJcBxrLRR2Vst44xuf4wu5GAlvbeoOW3xH4l4AKycMpJOII8UV9zaeSBHYnokvspOXB
         0HmfDG9xs8SZlVKCxV1yRArc6tvsJIPUY2rfBVoUdUbHGiVCQDgLfX5F7LGjQXC8Fueu
         JP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164101; x=1702768901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CB+gYpOOF5znwwoZmws+FfZHIzH+rl1BpCW0+2oHpfo=;
        b=OT/hRTdQLBi25mHb0igzocg3yELmGonXWIVcZcFE21rJzUJBIWtyWMbHj2ck43CbRc
         gVUCsR0XfkfcDVIjDLnHfGbGWkZqRXoJiYJfLgp9mhYZ25MjMET1F/4PGbd0s+HvhwAN
         rfxVegEtHHE3+8N1BIahhJBkFnAq3Txz0k5m1jGI9pNJ4rRk48IVW3hOOmEAL9P+hSRF
         a3f+y0/OjI6tEacvJnGdrVHV4q7AeLj8caZP5EU6rcWuu1iWdxa3kJ138iY1iGZQ8Mau
         b/c5Ragwwz7m/f+7rdq63RiPqete6Q9BFbs2TI7Qjo0r9f2c3Yssds110WaRJpCv3qxP
         8kYQ==
X-Gm-Message-State: AOJu0YyXKHkxYFZKKcOnDWDQ+Dg5SnLtg1jCyXFdN36I/RMuuMSpVkDC
	Gc3vNxg7I1BZXzZU2fTqTMThyA==
X-Google-Smtp-Source: AGHT+IErepnmxlUSSu2LtUamdHgtGjBYsOtJfnOnFgtxzoGlTjAlnVsfcK+Nm6HU/oPr4UL1C2+jSg==
X-Received: by 2002:a2e:380b:0:b0:2c9:f874:d93a with SMTP id f11-20020a2e380b000000b002c9f874d93amr563537lja.59.1702164101144;
        Sat, 09 Dec 2023 15:21:41 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:21:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 9/9] arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode
Date: Sun, 10 Dec 2023 02:21:32 +0300
Message-Id: <20231209232132.3580045-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the USB-C related functionality for the USB-C port on this board.
This includes OTG, PowerDelivery and DP AltMode. Also enable the
DisplayPort itself.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 124 +++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index ea4d75308ac8..3b9499b0bbe8 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8150.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -374,6 +375,10 @@ &gmu {
 	status = "okay";
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
@@ -382,6 +387,29 @@ &gpu {
 	status = "okay";
 };
 
+&i2c4 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	typec-mux@42 {
+		compatible = "fcs,fsa4480";
+		reg = <0x42>;
+
+		interrupts-extended = <&tlmm 152 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc-supply = <&vreg_bob>;
+		mode-switch;
+		orientation-switch;
+
+		port {
+			fsa4480_sbu_mux: endpoint {
+				remote-endpoint = <&pm8150b_typec_sbu_out>;
+			};
+		};
+	};
+};
+
 &i2c9 {
 	status = "okay";
 	clock-frequency = <400000>;
@@ -436,6 +464,15 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&usb_1_qmpphy_dp_in>;
+};
+
 &mdss_dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l3c_1p2>;
@@ -483,6 +520,65 @@ &mdss_dsi1_phy {
 	status = "okay";
 };
 
+&pm8150b_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <3000000>;
+	status = "okay";
+};
+
+&pm8150b_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "source";
+		data-role = "dual";
+		self-powered;
+
+		source-pdos = <PDO_FIXED(5000, 3000,
+					 PDO_FIXED_DUAL_ROLE |
+					 PDO_FIXED_USB_COMM |
+					 PDO_FIXED_DATA_SWAP)>;
+
+		altmodes {
+			displayport {
+				svid = <0xff01>;
+				vdo = <0x00001c46>;
+			};
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pm8150b_role_switch_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pm8150b_typec_mux_in: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				pm8150b_typec_sbu_out: endpoint {
+					remote-endpoint = <&fsa4480_sbu_mux>;
+				};
+			};
+		};
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -493,6 +589,10 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
@@ -568,6 +668,19 @@ &usb_1_qmpphy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l3c_1p2>;
 	vdda-pll-supply = <&vreg_l18a_0p8>;
+	orientation-switch;
+};
+
+&usb_1_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp_out>;
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux_in>;
+};
+
+&usb_1_qmpphy_usb_ss_in {
+	remote-endpoint = <&usb_1_dwc3_ss>;
 };
 
 &usb_2_qmpphy {
@@ -585,7 +698,16 @@ &usb_2 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm8150b_role_switch_in>;
+};
+
+&usb_1_dwc3_ss {
+	remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
 };
 
 &usb_2_dwc3 {
-- 
2.39.2


