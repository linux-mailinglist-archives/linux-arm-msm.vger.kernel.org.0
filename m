Return-Path: <linux-arm-msm+bounces-21128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E61A38D4EA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 17:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55ED0B242C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 15:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD3C18397C;
	Thu, 30 May 2024 15:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rXb5kkcX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AB717F50A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717081579; cv=none; b=CK0YxyjooI5kEGdgpzfHYoWmDC2Evv4NmKZbDxiIAszVxwF0MPnjb14mKQIxIyoiMCvyIRY/0MaznSRKANLmkxf92yJ3R031R9g4MsOzqIj+Z60uoX7XcuJj2txHno5HIJntYtMuNXz3buSl9JJEFeCq8bRYXJ8aaXyf6v29MoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717081579; c=relaxed/simple;
	bh=Rx0i5stw3yHTMMFsfdlHmWgjJoZmgrVRjC8hBNJvukU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sbZ7C2F47V+VpbEPeu6t/AhHYBWdQY88BlkSAQuVQ11shfQD3vA3r+N6PtZt0ytsFlLk47BrEzfJ8DMNnqCsan1BfMqEPKYll3h/1V8gmuuHJXPnD3VGVOlNmeDn8lHzGcQI8mYwp478DYSVI2AIL8FPpCyq40hw7vpaRiU2DAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rXb5kkcX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a5dcb5a0db4so103727866b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 08:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1717081576; x=1717686376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrmTbKVzlO/dGi20qcpezNa/am8OdKspXFwBntBzr0E=;
        b=rXb5kkcXa5ZBR30f8NUpUHoUYO63ExH2wo9aVkN1Jmcm4P4rn60370ymiSBNI74XpQ
         cfY+RiSy3gaEhGHHD+morHcReP89mb33ZMjNNkMBWjmpuvU9OjfqGJBpTNUBLjgOAv9n
         aYf5WaCZirM7V0lCy4g0ZKglpa5XdxuLRoxqKk4sXSHzt9BIxoAsa9RJsO6yPse+Imre
         VJL/HeW1tJK5BjScY5DdzghMd/ReXsK3tALwXAmxmXLxZTumIFwNn4X20aX5F22MuzbT
         MBZpu76eCAVNDAVcVK9Kd5mq9X8A//Z0nml78sLLdljmYABFGcSLVT8tj2xhiLNTLpUp
         tVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717081576; x=1717686376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrmTbKVzlO/dGi20qcpezNa/am8OdKspXFwBntBzr0E=;
        b=aLi5a1JjwrwTKR4McHxOZtZeePkoHq9+PkJ5AFYP6WkbAdXEPlk532gZiBxBWW5qh3
         QO6ZbrM5iiy36T3HETrOJmAHmek5v+sVfWhU1r07+zL241VtWzWR17d+QbaYEkxKRuqy
         GxB74hBnEppim/LFfCwREic/fe/8JO0w7M6osEYeRU4TdeGPaVp2Z+uj7bPZ+DPsKtzE
         x7BMtUYS5KfxnGTYDejIlFXHYYtyJ4y+mhdd4YUOkbs5CsAbK4ccyGzIRthbYDAqqXJV
         eNSc+fEh8A5IA95X8KmMIJ1M4+rA3Nhv2ia8kKMzO2Yxfg/0V5ugv1Vesivc3tbPVRxI
         5yXg==
X-Forwarded-Encrypted: i=1; AJvYcCXecsaZmca1WeFREAjTaKJLmq7kKQlRi55wQTYxQoJR6++C5vZMyBiaiNhzGxe5uQeda/gU6cNLezYHzi5Yn2u1UxptWKoFkLcVancvsA==
X-Gm-Message-State: AOJu0Ywy91DeBPslwxsggnuit3QRE3fAvJjvOZlsfvzTfYbddnd/oZsO
	3Ux/8k/s0KFyBvYeSUcCrwjN0/ETiroXipYCI7bCEFzpcu74sqW1OjKcpPa1viY=
X-Google-Smtp-Source: AGHT+IE+urq3VyYXg2gOQDWo+mznsKJWsMrKlQtfLzTcxHU/kvLid8mqwS3XsbK1Ga7ajMo1n6L6zA==
X-Received: by 2002:a17:906:5615:b0:a5a:84c8:770b with SMTP id a640c23a62f3a-a65e8e7a1b3mr144527566b.36.1717081576006;
        Thu, 30 May 2024 08:06:16 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67430f8457sm13531066b.122.2024.05.30.08.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 08:06:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 30 May 2024 17:05:49 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 role switching
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-fp4-tcpm-v3-3-612d4bbd5e09@fairphone.com>
References: <20240530-fp4-tcpm-v3-0-612d4bbd5e09@fairphone.com>
In-Reply-To: <20240530-fp4-tcpm-v3-0-612d4bbd5e09@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Configure the Type-C and VBUS regulator on PM7250B and wire it up to the
USB PHY, so that USB role and orientation switching works.

For now USB Power Delivery properties are skipped / disabled, so that
the (presumably) bootloader-configured charger doesn't get messed with
and we can charge the phone with at least some amount of power.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |  1 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 50 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 58 +++++++++++++++++++++-
 3 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index dddd6e44d280..88ee04973a2f 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -375,6 +375,7 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
+	/delete-property/ usb-role-switch;
 	maximum-speed = "super-speed";
 	dr_mode = "peripheral";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index acf0b0f73af9..1ac626d963b8 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1715,10 +1715,39 @@ usb_1_qmpphy: phy@88e8000 {
 				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
 			reset-names = "phy", "common";
 
+			orientation-switch;
+
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_1_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
 		};
 
 		dc_noc: interconnect@9160000 {
@@ -1894,6 +1923,27 @@ usb_1_dwc3: usb@a600000 {
 				snps,hird-threshold = /bits/ 8 <0x10>;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+				usb-role-switch;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs_out: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss_out: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+						};
+					};
+				};
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index bc67e8c1fe4d..d2632f011353 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -19,6 +19,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm7225.dtsi"
 #include "pm6150l.dtsi"
 #include "pm6350.dtsi"
@@ -543,6 +544,53 @@ conn-therm@1 {
 	};
 };
 
+&pm7250b_typec {
+	vdd-pdphy-supply = <&vreg_l3a>;
+
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		/*
+		 * Disable USB Power Delivery for now, seems to need extra work
+		 * to support role switching while also letting the battery
+		 * charge still - without charger driver
+		 */
+		typec-power-opmode = "default";
+		pd-disable;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pm7250b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pm7250b_ss_in: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
+&pm7250b_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <1500000>;
+	status = "okay";
+};
+
 &pmk8350_rtc {
 	status = "okay";
 };
@@ -726,7 +774,11 @@ &usb_1 {
 
 &usb_1_dwc3 {
 	maximum-speed = "super-speed";
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+};
+
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm7250b_hs_in>;
 };
 
 &usb_1_hsphy {
@@ -744,6 +796,10 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm7250b_ss_in>;
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&vreg_l4a>;
 	vdd-1.8-xo-supply = <&vreg_l7a>;

-- 
2.45.1


