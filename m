Return-Path: <linux-arm-msm+bounces-4239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F3580CFF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 16:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D0D71C21440
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 15:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6524BAA1;
	Mon, 11 Dec 2023 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bnyiioDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F95E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:55 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50be9e6427dso4780168e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702309494; x=1702914294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8dkuDe12KUDih6A7/RQFvtHwM9BSgTJEf5IzSsqtrw=;
        b=bnyiioDKEHiW/sHwV/EYXnsH2zQrLqkT/aw9XAZnVcMdz7+MH3Yphu1UuARivfrX0b
         d8379ePKPivNW+HoU24AUv96JCnfSwbPoL3d5WhuZKHmkTMW/g/q1VpP5754Ec4WGfuz
         vzR1Asr5vr0tv3OQN78gpMogCmmgu2KCjxeRaCrroqAHr+u3Nef4GGzO9rZXzh3Ld8D4
         +yfOC7juKWHdqb7TGcVvzMrcZFcaHcIAXDSdHyiWj/QoX805aMQSylF1AEs+CibMrWmf
         O6QFwCP4vHLL3qSKTiFUeGNJu60WXrTI7C2aMvaCl8FOhXfmRNThtmafVPwENw6nShLj
         pBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702309494; x=1702914294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8dkuDe12KUDih6A7/RQFvtHwM9BSgTJEf5IzSsqtrw=;
        b=n30gxNeXb0TUOCTbxvMBnsjNNB4FqH5wvo7oiHPs55WAmW4Wo5BE1xY3UDTqRDmD6w
         I53kdyeRSytjrHv6+ox6SLPMq0d8ur2prnmdSHVL0ls4A8e2N4gbFnZ9Jem5fCBBCT52
         vNUWCXpMQMfu+nFnNMTCBPwBw+MSOSMfOzfMGQWtgiZ6By8ik4xjhMBYTi1SyPqLU4fO
         ij67WPv50lxF5TDHxslNWmEO5PSo4uT1TAZlhzYY0ekownO6crkeinoSLViOR/wkUGAP
         zZyGkKSw2Nd8TAchG9IjshZFJ55TQgqnYFgfZlLf+eglFEDhg6e/2Toahb92JLiUK5eF
         XBDA==
X-Gm-Message-State: AOJu0Yy8bNfh6wETBpOyki9ia21al13gNO5ObTtwXfsRnbngoOFduy4E
	pF1LAFQ5VhkBU5OWQ1mobKpBkA==
X-Google-Smtp-Source: AGHT+IEO27rtGBmhegZ3X6tTcN+fT+yJyjxtK061Yf/preFBXtMv1vIIngTGSawIZYXmuAOoHNYEcg==
X-Received: by 2002:a19:ad4b:0:b0:50b:df82:3137 with SMTP id s11-20020a19ad4b000000b0050bdf823137mr1798023lfd.43.1702309493631;
        Mon, 11 Dec 2023 07:44:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:44:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 8/8] arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode
Date: Mon, 11 Dec 2023 18:44:45 +0300
Message-Id: <20231211154445.3666732-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
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
index ea4d75308ac8..de670b407ef1 100644
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
+				svid = /bits/ 16 <0xff01>;
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


