Return-Path: <linux-arm-msm+bounces-49529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 560C1A461ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 15:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB89C3AC7FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 14:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883C32222BA;
	Wed, 26 Feb 2025 14:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PVHYO+rQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48254221721
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 14:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579041; cv=none; b=kESTMYpUQ70RE14ocFHcF01AyOysyMG5Gp6TXxHQ91lk7jIExQEy+Cj08BMcC6/F0aLd4AxzqPX1SpKBKGKwnBzsDjEqckLxJbHEl0EQFkxHlIlNY/ejvb49TqnN8OLks0v6ur1Tsvgc7wrD2emI5pdFkxbNah2lnL7ZnInpDAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579041; c=relaxed/simple;
	bh=jU9bP4Mevi28z4mPolEH/9pPHLL5anepUjOBwlJrpXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mg4DRfdciXIjNu2UFTZRBk8duhYF+uaHTF+am30eP/q5OyL9eZHL1sOhbRpm001qaeRAO8p0c0038Ek9HhKnDij60clRZUWbc8qp+Efi9aCJKFVS6uqKJKCYKLEv0hc6fCNrP7bn6JoXM4Qe8hQp65GMrtPv6iNqhDRQx0Nm0dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PVHYO+rQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so5828755e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 06:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1740579037; x=1741183837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAT4u+/uJ5imo15stVtgVe9wUV96DCYMIACZut5nP2A=;
        b=PVHYO+rQ0V/RZDGsH+odWxxEo7VkvvJwtFfZe/nzuf10jzrBQFwEBDpFrHs1ioDLRS
         O9tdYZwzh1eKOiv1Uag6vmAJ46sxVztBAvw1/uUs+bF/OAW3F86VRz5gq3AyO3y3LqWb
         UoZn2LfuaGiQZsV78AxMHZi5xXsvOOOukH0nkVySoMbi6pDfhqeRHWBz6wH/OYGjXCcO
         fsn/pKAKJNheHQl4u4qfFCkkGjauO4Hsfyldpvpf9FLSycZtCARbRBbVUedo0P6Vp9Gt
         sQISh7l1JOlXfiMdoMDD/bO9RK6Lh814iTORMMNCXMDSh2BIdxFvFTcFaeEHCMRMzD1x
         sJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579037; x=1741183837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAT4u+/uJ5imo15stVtgVe9wUV96DCYMIACZut5nP2A=;
        b=L64T10OIVBDsTYCxFs+1gn7H3k+0k2Gwyfozghe4IWvJticpr1LzKfaQdIZwmf0Kn1
         TBRq85QMjuNv9EJ07b3AxO9Bz0IgHXBOg/8uP07X6iFCtbi1eg6sNCOUTzIEt1cEjtIN
         ETfa6TukJfBdSEYnNf5gzdCOo6r9eOhXOFbhPEOe+2ELYO0hKONrzDl6JQYihxmx8Plf
         6irtfa/mD2nUGnSXqF5ct9aYBuZrVlSoZsfvWMUkONRPDqZ17Maa0Egjb/3cuBoJkLBA
         C0whd+zIlM4yIMlur4mIRLmfBj0+cYxJE+4vX5WQ1ySmZQQ7aloHJS1njUjNjm7y+4or
         QrHg==
X-Forwarded-Encrypted: i=1; AJvYcCXkU4tzp4hM2eMyOuYhl0v6L17lRbJthiteGk+tqeZ9VMttov0Y+9fN+5LjBVJdLaXax3/cfSZxTOPRp45/@vger.kernel.org
X-Gm-Message-State: AOJu0YyCSaaVmcjtR8lhNtHb+lNDKzRfyWtg3kPXXPIGw0A8yiS4smzB
	Qz51dCRpL9wszx6Kx/f+k6yqy8cjCXtr2a9vhZ/mgWbDDyn5EVewUiDEa013RHY=
X-Gm-Gg: ASbGncsGzLex6mo6bkwBoDjw/Krcakwn58PRTC7wLurQYjWrsOvBfZvGlyKCawr+Vly
	Rw4NNHCV9IbL4nU/faYg2wQXA9XpiTYcx50bspOfOFrOBLj3++SqbXpwJ0QEyh8zDDuRvgNk7/v
	sJ5BnkdSQHoy1YewiJKu0qPakrs7y3UXA8JaUYvVuHB/InVJQmbsn9mXI2wA3Wl0YWKPU3RPB61
	LXpL+kkYUbvXLCAavnHQweSVGA8I60kzg6pf2DO2eI7ryXgJnhYjxZjKSkof4Biwz+jjmEk78er
	Q5lrL1Fk1MrjbmYr/jNKXBbEQq7a4UUEXiTcaJEFZ2BXRv1u4PFpBlLF1PSCqqgdadETx6mI2No
	=
X-Google-Smtp-Source: AGHT+IEW73T0RZgHfTkWoMYSVc1JTOxc4fkJmuGHHmtx8K5z4z2geomVN4O4Jg/GiEohBaBNVo325g==
X-Received: by 2002:a05:6000:401e:b0:38d:d414:124d with SMTP id ffacd0b85a97d-38f6160faedmr20603355f8f.19.1740579037448;
        Wed, 26 Feb 2025 06:10:37 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd70be4csm5755889f8f.0.2025.02.26.06.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:10:36 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 26 Feb 2025 15:10:20 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up
 DisplayPort over USB-C
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-fp5-pmic-glink-dp-v1-3-e6661d38652c@fairphone.com>
References: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
In-Reply-To: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
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

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 67 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  2 +
 2 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index b3fc37dba51523ce5678ae6d73f7d835f8b26d9e..1e04c7ec7163538d93543f36094203e58212f600 100644
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
@@ -758,6 +766,16 @@ typec-mux@42 {
 		interrupts-extended = <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
 
 		vcc-supply = <&vreg_bob>;
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			ocp96011_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_sbu>;
+				data-lanes = <1 0>;
+			};
+		};
 	};
 
 	/* AW86927FCR haptics @ 5a */
@@ -778,6 +796,30 @@ typec-mux@1a {
 		reg = <0x1a>;
 
 		vdd18-supply = <&vreg_usb_redrive_1v8>;
+
+		retimer-switch;
+		orientation-switch;
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
 
@@ -799,6 +841,15 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+};
+
 &mdss_dsi {
 	vdda-supply = <&vreg_l6b>;
 	status = "okay";
@@ -1297,7 +1348,7 @@ &usb_1_dwc3_hs {
 };
 
 &usb_1_dwc3_ss {
-	remote-endpoint = <&pmic_glink_ss_in>;
+	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 };
 
 &usb_1_hsphy {
@@ -1326,6 +1377,18 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&usb_dp_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp_out>;
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&redriver_ss_in>;
+};
+
+&usb_dp_qmpphy_usb_ss_in {
+	remote-endpoint = <&usb_1_dwc3_ss>;
+};
+
 &venus {
 	firmware-name = "qcom/qcm6490/fairphone5/venus.mbn";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0f2caf36910b65c398c9e03800a8ce0a8a1f8fc7..4880d26e745566fa7ef906a0489e3772f2426ab6 100644
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

-- 
2.48.1


