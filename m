Return-Path: <linux-arm-msm+bounces-98656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHz7Nguwu2k8mgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:12:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A79D22C7B4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC511301CCB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 08:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A3A3A900B;
	Thu, 19 Mar 2026 08:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2BXP9CLt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B90D3A7F42
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 08:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907976; cv=none; b=FSMqdJETga2LzHk9KtFywGppTh2ZKj69Isr4LtPkKEjN6pqv9ZRanUKCjn9zOe9cjBKy0G5Q2q4ZcQs5BorUuJh/mxVQDbH40tGNYrlugJI7PnEXie5On59IDYOQp7HbT4xwdOYM05plbSpdce6CpVSXsNGPSRWvGDL6DVm+1TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907976; c=relaxed/simple;
	bh=dCF7jFFNaQYySPXUIQSlxZ6rCDW5AOggp+NK02rLQ9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ov0uJK1dXFK90JsJ1iBzSkP1QZ8t+a5sZHZLOLVZmKMTIzF8aE8dZNNKO/VgZvgzv+hqrtsKWqh10ELLT/MBtpdfA4pej3Aq3bHT6NT4RttWGtshnVQTN5+Cn5Ij6UN6IlhBf1Z9barOFcb4jl+rCRdiVLmPfH5W0ESKsLlb4qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2BXP9CLt; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-665634cb208so1297154a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 01:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773907973; x=1774512773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaq6NxVT5tVwElid/gqEsdCBP+g0Me0eNhL3OknSzdM=;
        b=2BXP9CLtcY5+rg+kFDCY6Xuv1dDbmYEINxUzYMoL+ezlLDkC7GWkuDPopeFZe3hNyd
         PLYpWA7TJSTjMBF19t3BS7J4qKDcn8NkesYC9dRLXDLP5O712XU7ifswkktwy5cwGCqZ
         hpZ3dAAidPKvylPfPhwSktVRWpY8FQ1R9W/W1jNLrVV8oljhbNbz47QF7TVeND0yn4MQ
         LVgIlAPKLc0UzSn3YCA1jy7Kl0n4IC5OE46OFRNHVSi1F9WpL06HL5UPSqF+5zpumPIO
         +AOon8kX6fy+bmxijntL71UQwqIPAQT/QPPZttO62/GPh8uuwGnns9PrYFuK/IpnFmk+
         lRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773907973; x=1774512773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iaq6NxVT5tVwElid/gqEsdCBP+g0Me0eNhL3OknSzdM=;
        b=mYqlaAaYIYKEs1YvbpkIstqo4Sa3kYU5FK6fiesPGZ04nEMEBr3MOqIHH3Gw9PtGFZ
         9SR6agiAOw5IQ8AMo//AcywQHO0cBWekDsjXKKmWBH4YqsF395BzQMJvmvlEhaZKYyvK
         DEqw6sBUs0vjtf/IRsJL9237B/9Dc+7Nq9OiGbaQ6jV98jT7ck62IhwWF1ZrcNSSN5Tx
         TrkGpH0h9V/9n3X/XK4Do9KSTwFamKNv+8xv241ah7nbOncqtLo60yl1rtoZwxMl9eRW
         3HLPTcKXTEsnfFjwpzkKOytbUosjtfY9g3kBoQoAvwvR/W9XMDaKXrSGNDmX6dWnMpsV
         zq+w==
X-Forwarded-Encrypted: i=1; AJvYcCWOc+pEOF0cRdkBSfzGJw1YnvGRUMTJ79YRZut/2AX4LyxJxG1t5j5pOEsZRnFpP2ZqtmV4IsKr6LB/3Dyi@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcIJ5wZZMK6evKlsUKWKSeASPGiDdB5Vl/GACIFptToQ2Slit
	PBYFAwhrekv6VeJ+V48S1rPHlSOu7VJl/pDM3PjbmrzTsOvoaeWvvsD+/F7M0cuNzxE=
X-Gm-Gg: ATEYQzwP2jHFdIDTPMdeiwqghgIH8otbym6QXgL57eP4TGWWtbysgaVVKsWG86X7FEw
	YHWEvOmrjI7+gCKNZ0dikHZDY09Klj9VXFAYiauIuFY7edMSlYUFfVsTzQaJ4lHaqqst1lfU48N
	Iz7JnV+5H3QymuisgBo+zQ5FtQkCSek2QWczERKq6KD41PG5eshjkFL3sX3TWyPrYDfhGxwkbo9
	0L1DNOvdduQIqqE5wQWtoitmIVTchuEr7UObYr4d6BY45MtyBlCsROJJztK0q/6x69bqMta2VF8
	f1g4LTGqfbufuTr+L/iByduoQWHDlimzPKq9nOorlY5h0WsttpHKkcohS8vxWzestbxr1OoqzUx
	/sLfoXAoIwBExYYr/nMDjNyn4sPz1UfO0aup5n6Bpwvp+M7K5kpeiQTUQzPPlgaZ49CJ981/yX+
	RkgjHNQoS5szGo6EAdpSPBe2Bwzu1eDHGo1JaneIJ60x9gEhlMT8S/G4JWsf5AOZtCPKauCqL9p
	x/xRA==
X-Received: by 2002:a17:906:f582:b0:b93:5744:aee1 with SMTP id a640c23a62f3a-b97f4a1ac1amr400205566b.51.1773907973433;
        Thu, 19 Mar 2026 01:12:53 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1751cfesm399884566b.63.2026.03.19.01.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:12:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 19 Mar 2026 09:12:50 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add front
 camera support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fp5-s5kjn1-v2-2-6840da94c574@fairphone.com>
References: <20260319-fp5-s5kjn1-v2-0-6840da94c574@fairphone.com>
In-Reply-To: <20260319-fp5-s5kjn1-v2-0-6840da94c574@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773907970; l=2916;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=dCF7jFFNaQYySPXUIQSlxZ6rCDW5AOggp+NK02rLQ9U=;
 b=Lg7tagahpr79rZwic5irOFY1Y6rXaDP0dI/gdq5cOsOUQX9hk0x4C5VGhOQsJPwZfnDKuJ1/t
 2zLHPyffFz/CyZIfr11WNDcX/IzO3io1CE+s7whS6K13W4xyQpytKzP
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98656-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.10:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,0.0.0.3:email,0.0.0.51:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A79D22C7B4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add and configure the necessary nodes to enable the front camera
(Samsung S5KJN1), connected to CSIPHY 3.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  7 ++++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 47 +++++++++++++++++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 343da1b18095..6cbf6ba5fbc0 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5774,6 +5774,13 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 175>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio67";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio69", "gpio70";
 				function = "cci_i2c";
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index c9c24c36ba7e..aaba40478891 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -626,6 +627,24 @@ vreg_bob: bob {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l10c>;
+	vdda-pll-supply = <&vreg_l6b>;
+
+	status = "okay";
+
+	ports {
+		port@3 {
+			csiphy3_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				remote-endpoint = <&camera_s5kjn1_ep>;
+			};
+		};
+	};
+};
+
 &cci0 {
 	status = "okay";
 };
@@ -666,7 +685,33 @@ &cci1 {
 };
 
 &cci1_i2c1 {
-	/* S5KJN1SQ03 @ 10 */
+	camera@10 {
+		compatible = "samsung,s5kjn1";
+		reg = <0x10>;
+
+		vddio-supply = <&vreg_l6p>;
+		vddd-supply = <&vreg_l2p>;
+		vdda-supply = <&vreg_l3p>;
+
+		clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk3_default>;
+		pinctrl-names = "default";
+
+		orientation = <0>; /* Front facing */
+		rotation = <270>;
+
+		port {
+			camera_s5kjn1_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <700000000>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
 
 	eeprom@51 {
 		compatible = "giantec,gt24p128f", "atmel,24c128";

-- 
2.53.0


