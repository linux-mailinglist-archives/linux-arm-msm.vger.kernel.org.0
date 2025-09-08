Return-Path: <linux-arm-msm+bounces-72508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2337EB486DF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D796E3A634C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A940D2ED871;
	Mon,  8 Sep 2025 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjT7TGvt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1B32FE06B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319688; cv=none; b=FMsfz0q3PTO/l7xl8/M4EZgKQzFxAGBeJ9jfroEFZ4yONitUlWygvXf9X+4wtoBZmMlK3bi7NIGrMHBeQTMe6Si3NlA73DnAvVAbxd2YFcLWFiBBm/riSxYJDOsyQfdkgqSDEIMcbWcfTmfwwTIcuA2yW4D7rgK1XoQC1A+CL+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319688; c=relaxed/simple;
	bh=pfsOZa4PQYY8ac16EANnBDTYwGzm0MqE+SKKAoXxTtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t9c8uWfVJXKwnGqZKTGJvSpFYq6Dw1sDGy2Qa6luzvPMNyToRS6XWsUWGIXoIITxWAYrEnp6D66sH+izrdnaVkfe3lrRTY0zngJm9Kv9zMK7ZeI6RQ+y2S2/6hZtXbqAza9xkMsAeyLtLtjFUXypbvi3AMHILNENc84jrDNx4Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjT7TGvt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587HvC0n009866
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yAyd7qftexqllcMjL67Owuu+ieAa57wWfH+BpQoRfrw=; b=KjT7TGvtaOjQN/tj
	VTlDc0TpIiPpacl9OSFExWLQUYrWoEnt3RoS/DZEuoF8QprwFasWaEwU73WCIOf8
	28ttUJ8G6qwetkefvzhJZ8H+fFCget9BOswkCScU5j/lAPhGmSmaR5uexABtDQxg
	+8ChXJQVKoHwUH1bcTRpTceGEgSMXNANEPPODx/xq8ibVva+aC58K8xYpkHcSkBs
	pk9gngOlBH6+UCbC925T3I+p973UR2RZC2xY1XJigPPTektLOfz0gmAaWsAIDJL0
	YhpjO02ITwlU4CqaHSCzROUAn1fB7ulDBpcofNfn1SN5vr3BJmLMRajlSJC4sJ7v
	15qV2w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j3ura-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:21:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4c46fbb997so3976582a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319681; x=1757924481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAyd7qftexqllcMjL67Owuu+ieAa57wWfH+BpQoRfrw=;
        b=HGUjvGqOgoi5KQQCGiHocNVvUv61iLIszcnRDi0dcoFZB5K1BC7Uu1igMqOjBwaEIa
         MDKFUX7eU4+4LbkTOSA7GJjOEp2DWhCkBPs5rKrvLBGDBOK7Hh4oQWqTVlikIhdFMkf3
         /yFadjz0+CpodWcNfpV9INUhwTVVcOOA3TgM8oVwEIjwrgC2KdCPzeuumPocMt8IJbmw
         YqlKcaUmxCzL5Rxy/s01h84WWBSpj5ORh5F62QlkwIST3OQExfyJyL9SRVyfGJAtqE54
         frMwTX1hgX+PVD1cXh2cwUxyNy1IlR4jX4R8yOb5eRSoNJfvBzHQoYrUZSZJUXzMwGnT
         U2xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV7r5fFF0LxU0GklnuSHqxnoSkmQYn3IqNW4VDVESTcKcwvXXNSZF3Zr82dAVEkgz6V1fYEP5tIkZjtST7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxame0sq4xZn47u6qS7boy2gdZBellKz2c60xjt+6zxMUSpOrL0
	IbMV+jiOg2gR5RTpS1Y9v2+lEWSekEGgTogS5ETMizAEClVaEP/DEr7iQXOQhP50lnPtPTzVrmW
	wcfbWeBkjd6zMVlARGV8AuOjb+JNcPa4/0LhjzhJ3UNDTWwhN+q0hmxktha9RNaPbZLjg
X-Gm-Gg: ASbGncv9Ld0ZeBWMpp7XkFgBrtH2gYehbgySHtXsqD4+ESg6r5QcGb6N9RroOedn2Cj
	iyDKz9dgVaDiNZc1uWqNG5924hWgPSmD/+dhQFTA6m2s60DzhD7Xk4vd3TP03kzWrrVk5+WIkKb
	OKgFOUq8H4laKKjyIs5B5idkn29LCnHejhEOZi06BrZlqaQ7liXZdzbwz7Gg1XywkfGTo2kP8Bi
	aj7iJszq90sfNPegDqLSCi8ulKsSWtzhj8Iea4JU0mBs7XNCzJM0Y/j+b+dLk+0tCatSaUBE7JS
	+VDQPr/VaWtbLK5fsQ6cYtF/o+PLkvFpi8ySx+THhiBKF/tymQELva97pTwrSXvtUdel
X-Received: by 2002:a17:902:f68c:b0:24c:e3c0:936b with SMTP id d9443c01a7336-25179688478mr92179465ad.22.1757319681049;
        Mon, 08 Sep 2025 01:21:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmABtt2GoCd971FxcFmc/bDoto8qOZ35qz+jN0b6cZzDBBoxXLL3v4k0ZFbMFrSlC5E9xARA==
X-Received: by 2002:a17:902:f68c:b0:24c:e3c0:936b with SMTP id d9443c01a7336-25179688478mr92179205ad.22.1757319680571;
        Mon, 08 Sep 2025 01:21:20 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:21:20 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:50:04 +0530
Subject: [PATCH v4 14/14] arm64: dts: qcom: lemans-evk: Add sound card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-14-5c319c696a7d@oss.qualcomm.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
In-Reply-To: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=3176;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=bSqKsovKabLEYEVRmwx3HGTS8mP1U287xBU61TzdZmY=;
 b=o3CtxlMysGZgkeAJBohsMTbDQzN86uBLmuhboBJBOgpjaHKKB81K1vEjyT1BwlOQG+nTgPRqb
 MIx+0ysJ0VNB4WKSngJ0XSsDlznsxiH03tTKXOSc3Uu6mOXaBc+7sX+
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfXy9HSFXfiSK5S
 9qB3GKXyIJXpQo7jzif9qINDFgqaqFMIpYEdg3nTEOblcEMW1i8/Fi4/ZaSmoyTL+VdGAgQzRdw
 ILPjgl47bolsTOPJV26Yo7J+xz6Vc8BpSEMR0IwQpJjxKdwruiT1KWEGXVXzdPMM6eRHrFkk3LL
 MNPZ1QUi/er5kDsuWHh/cHJhK4kMWTXRDn2Ridgl5ZpfNv9dg1KFO8oChMYZPcXgf4wfLkvjZrg
 Dmv8FdF3Q9Qw+LMPFlJSAbNu6x4G5F6W/Y4ui77VnGzop3kQ613b/tdiq2aZC10C3OByzCXiCMj
 gIibQjPgj15OF67rAZBYTMbYBcpjxYLFSlTHvGGskiPDmPx9ujQJwsNvVi1r7kNq8hE6z8aTGHq
 ju7xOHRU
X-Proofpoint-ORIG-GUID: Kc3bI5RdJIDZo1rFJ0QqdZpvJwiFgal5
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68be9202 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=WTMWP25ZRELiBA-utRQA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Kc3bI5RdJIDZo1rFJ0QqdZpvJwiFgal5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add the sound card for Lemans-Evk board and verified playback
functionality using the max98357a I2S speaker amplifier and I2S
microphones. The max98357a speaker amplifier is connected via
High-Speed MI2S HS0 interface, while the microphones utilize the
HS2 interface. This patch also introduces pin control support
for the High-Speed I2S interfaces.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 14 +++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 3e91ac928fa5..11ff6cf19832 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 #include "lemans.dtsi"
 #include "lemans-pmics.dtsi"
@@ -25,6 +26,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	dmic: audio-codec-0 {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <1>;
+	};
+
+	max98357a: audio-codec-1 {
+		compatible = "maxim,max98357a";
+		#sound-dai-cells = <0>;
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -70,6 +82,46 @@ vreg_sdc: regulator-vreg-sdc {
 
 		startup-delay-us = <100>;
 	};
+
+	sound {
+		compatible = "qcom,qcs9100-sndcard";
+		model = "LEMANS-EVK";
+
+		pinctrl-0 = <&hs0_mi2s_active>, <&hs2_mi2s_active>;
+		pinctrl-names = "default";
+
+		hs0-mi2s-playback-dai-link {
+			link-name = "HS0 MI2S Playback";
+
+			codec {
+				sound-dai = <&max98357a>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		hs2-mi2s-capture-dai-link {
+			link-name = "HS2 MI2S Capture";
+
+			codec {
+				sound-dai = <&dmic>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TERTIARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 068acfa9a705..b7e727f01cec 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5069,6 +5069,20 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 				bias-disable;
 			};
 
+			hs0_mi2s_active: hs0-mi2s-active-state {
+				pins = "gpio114", "gpio115", "gpio116", "gpio117";
+				function = "hs0_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
+			hs2_mi2s_active: hs2-mi2s-active-state {
+				pins = "gpio122", "gpio123", "gpio124", "gpio125";
+				function = "hs2_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
 			qup_i2c0_default: qup-i2c0-state {
 				pins = "gpio20", "gpio21";
 				function = "qup0_se0";

-- 
2.51.0


