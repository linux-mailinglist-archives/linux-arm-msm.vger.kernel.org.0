Return-Path: <linux-arm-msm+bounces-51144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C43A5DC39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 13:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6873166C28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 12:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05192242918;
	Wed, 12 Mar 2025 12:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QovM9UDQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50360241666
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741781118; cv=none; b=mq6r4ObBGLQnCMEteHHBcWM2UdrLl0rVmmUw/jeAiBntyYi7sNk4rROO+Ny/8LXQUGCBEc03w2vRToHmgz7315TbPzVsexth8lc8J77vn0lBbxG9X/ncCwYhz9OseaK09Q6SH3VNDQLAZPvTREJV0zGj9rwd5GBu0g5vSOfV9Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741781118; c=relaxed/simple;
	bh=+RdyBIwxd6mquveTbaq2IR0uSqOPWfpJivqQDnRoaZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OI1Ony/909qfxETKwqS9dIZfIxwI6HKD+vKugHjdh1jl9ha6opyB/7GUu0+R/qJvHeWA63HHLMqFOMcz/vjMouK6Bk6c7IV0xnyzmTm3xyH0OG9lgpTYpYNKgK6U7E4jUNZhVxj31wAeGYyJf/KcJdg0I9SpGbf8J/hZGCsIgqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QovM9UDQ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912c09bea5so5385924f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741781114; x=1742385914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YkMjxLDjnh1hw80WvyyD7v+50HISC6qgR19rphkV2/g=;
        b=QovM9UDQ/gSKcsC5VJpoQZReOd8+8vfS7x1xxvKET6IakH3wzvnHcOLEbNXBypEJeS
         yNfY5rM0U707e/N8GWUEOIfce7VCHBwm8JqYNUCdSbks3HAyThNVnp35uwpuzC81XL+f
         BxQZRyM8X7bkFHPZmFo9oJ0cfXmDFzduOPV9KsuveCgu56ok2GPOjT+Rgumio8dneE5b
         BnlDq5/RoxiIjjKE8+vPnDfn1NlPUt2TgaPMzQktQumMvUJcVqWFmIOfEavpE4cAAnNR
         Su1pJpaW+BQWk3a085z9fVx/wJ8C38LoV1tJtclx3euZbl8SnjeSigUn3+JrE9vJqGM+
         NpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741781114; x=1742385914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkMjxLDjnh1hw80WvyyD7v+50HISC6qgR19rphkV2/g=;
        b=hHMsgrSsk4dLUKVd1LUttp5lY8ghBGmCrDWmhkZnDnrHIBikUcNFVBdl1e9lPkU7KY
         /sb1AFw6aJVGqr1BLMs/a5C0d4je/ixF2+fW7IebQGGm8F2Q1Ear4VDxdzzNUGpvcFv4
         NICZoboZi0nXLIe+lb0ccT7PQgWqLratfQwCmW1PgLYGK8DwVT1iQTkKmwu2CNV3o222
         noRdVEyfh7Brj5P3L+I69o7jtwBi+UEehgqQhYaqutUhcpc4c4aUH8VEeuokv5sDTCzs
         Lqp+gc64qZXWedHa9N4WgoAX1BPiMiW0U96bXDQqX8kyySiGTnoUmUQqMc1MSWHV0RgW
         Ln0w==
X-Forwarded-Encrypted: i=1; AJvYcCV2zsvECEFXcqYOkhohh0cYmJRn8ebS6Ooyxmx4AYEyGQ5fph3F7F+AT8WvMfQPQYaoDf2bnLjwe1cz7t4D@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu6YZ/SFiyGLH1DsxJepCFi42CV0Y9+700FQC4DHdWdbUQJkGz
	a6R7JGx61W6Ejn6tRac93cJPWqS1+ioSgecUCLyYDch+yQiISq80ge55FXK/q/8=
X-Gm-Gg: ASbGnctierd7cz57XVub9zEWPMy7+s3gY0ztaYW/95ihiDdSRF964g1ipHcd3MFCgT7
	j0myAERtTdntozi+4J+zazZkLrwFTIiiqsGhdpcrnArfIRt+eqwv5ZSe3HgHl8Lh6aV1/T7X24h
	/0t7XLlXhM5PQFctfLzRlbQFfXdQocj1qgfHaMYjkbX+UC7rOvTnGpslE5ZZVzWAW+c79VMiJyP
	ixTyz6tttm+SJC1J+V27ztk/Dk2j0cxhH/7xrEDUBzPCxNR3yTY4qRwD+K4s0I74B47UKvo9dYd
	dulcpi344v/hu3w+gmAcj24paI7kWB9XMIIjTY7vpjbTbuPqekEVjesjbsRGxgTRhvGPzINPzVA
	QQMGFa9I6T+hdOBDd0w==
X-Google-Smtp-Source: AGHT+IHbpprc/stqmYEX3tnPU/ZmItrK6xJD8r0+wEddtT9FgyChhU1SApLwR6TYweT37ILVW9W9Bw==
X-Received: by 2002:a5d:47a3:0:b0:391:329b:893e with SMTP id ffacd0b85a97d-39263cebb08mr7537227f8f.5.1741781114430;
        Wed, 12 Mar 2025 05:05:14 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb799fsm20810608f8f.2.2025.03.12.05.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:05:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 12 Mar 2025 13:05:10 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up
 DisplayPort over USB-C
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-fp5-pmic-glink-dp-v2-3-a55927749d77@fairphone.com>
References: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
In-Reply-To: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Extend the USB graph to connect the OCP96011 switch, the PTN36502
redriver, the USB controllers and the MDSS, so that DisplayPort over
USB-C is working.

Connect some parts of the graph directly in the SoC dtsi since those
parts are wired up like this in the SoC directly.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 54 ++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  9 +++-
 2 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index e0470be9142caa4bac4285a191725bbd60e706fa..9e8f9fb57c4723a24704a8239a86c6081910916b 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -101,7 +101,15 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_ss>;
+						remote-endpoint = <&redriver_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&ocp96011_sbu_mux>;
 					};
 				};
 			};
@@ -761,6 +769,13 @@ typec-mux@42 {
 
 		mode-switch;
 		orientation-switch;
+
+		port {
+			ocp96011_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_sbu>;
+				data-lanes = <1 0>;
+			};
+		};
 	};
 
 	/* AW86927FCR haptics @ 5a */
@@ -784,6 +799,27 @@ typec-mux@1a {
 
 		retimer-switch;
 		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				redriver_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				redriver_ss_in: endpoint {
+					remote-endpoint = <&usb_dp_qmpphy_out>;
+				};
+			};
+		};
 	};
 };
 
@@ -805,6 +841,14 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+};
+
 &mdss_dsi {
 	vdda-supply = <&vreg_l6b>;
 	status = "okay";
@@ -1301,10 +1345,6 @@ &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
-&usb_1_dwc3_ss {
-	remote-endpoint = <&pmic_glink_ss_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1331,6 +1371,10 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&redriver_ss_in>;
+};
+
 &venus {
 	firmware-name = "qcom/qcm6490/fairphone5/venus.mbn";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0f2caf36910b65c398c9e03800a8ce0a8a1f8fc7..f008694a5bebf6af1797a961e56ba0c355ceace3 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3639,6 +3639,8 @@ usb_1_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			orientation-switch;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -3654,6 +3656,7 @@ port@1 {
 					reg = <1>;
 
 					usb_dp_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
 					};
 				};
 
@@ -3661,6 +3664,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp_out>;
 					};
 				};
 			};
@@ -4267,6 +4271,7 @@ port@1 {
 						reg = <1>;
 
 						usb_1_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 						};
 					};
 				};
@@ -4820,7 +4825,9 @@ dp_in: endpoint {
 
 					port@1 {
 						reg = <1>;
-						mdss_dp_out: endpoint { };
+						mdss_dp_out: endpoint {
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+						};
 					};
 				};
 

-- 
2.48.1


