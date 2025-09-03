Return-Path: <linux-arm-msm+bounces-71832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B885B41D93
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF1783B3007
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76641303C83;
	Wed,  3 Sep 2025 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ce4un2Nb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1653302CCD
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900118; cv=none; b=Z4+kZNvhF7U9P+jmYkyeUjmcKgZulBMavuVbFo61zk6mgL4V4ejAYUR3kjuMhyCKTrwPoNbIc1ukGf4uxw5Ta0HHFYzCrxquvdy86yy7eg4Dx5skQfKawgnKMebG1+G3Zbe17wfv5s6a05sOVAPgl22BL0urIvPv24TLMuvNS+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900118; c=relaxed/simple;
	bh=JsB/vM+vDg1pqrgFnPVYbAfiodJ6g4Ketnyr07QLJjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qtZVTRFCeQcX+8i8jFr9Ss6qHE8OZEAoP7+sXkirlbwXMG5bHt0FPboyPrjlj97wmZdTyU5Q4MF+qF/FhuLDO/iWVT2W5KWhR3FjGZMdzDtAdBSv4D45h6BYi+eRrVD/DPQkBNv4afqVCjsV4hwqa+KQShHHhH+9V3XrR+3Nj8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ce4un2Nb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF44R004619
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QI9++NezeeQHxyb4K/k5RMtpPMwIn4t3wPgvkRjOclg=; b=Ce4un2Nbz2f7tBH8
	A+oBYYn+QMFrrQv3kWkzxsoAJF0d2GatqTa+QXX4OLtjw8Kq8exbf+1vYgknz54R
	ZmriU7M1cRin5gY5Sko7jAWkQACCiY1BrekIHa0kUNIA0y+gi3UpXgFxnIRzZFqY
	9uCyjqLcDiQr3heu9v1+Jy1JucpRm5aPG5GT6YZOlSpWIVUxGB8DoBmtf1v63Hn8
	J/oIoD+lCzG5L/jRkJgt4BMNaPxEr/CTUtGQjDqP3OjqdNB3R4VJrrbDgou26dkl
	objG50RllRq/06DWS4hoRPFe0Jm2Qz8AlFX6sxc+BOd6aUQCtp2xp2qVR8jh2Jai
	Zp1eIg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpbnv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:48:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4e1675ba95so791945a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900114; x=1757504914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QI9++NezeeQHxyb4K/k5RMtpPMwIn4t3wPgvkRjOclg=;
        b=PPnVlxs1lieOnp81paZ5RMzYIoIeAKVeMrr0kzdCsKcj0qu4KLqCUUqWZb0hoW6P1P
         LsxJu8XEBJWSojYHJNV37yngS9A3Fv+QIDQs0tv14cBUz7iaMuOpk0b7XAo0WJ3xmsmD
         p6MsaZ6nTudT9vvMHHdiNggXjiBAthk4btAt1ScGpQbtf06QNzWH0422OkNhKYQu8gtL
         jlZqrRtQY1RPCfpCB5jTkrWRePtcRYa2LRKQLFDV/euinP+XiPf+F3NrL64IayMr/xZu
         66sbvF2tW21DyC1Z+ZJkB1+36HiF8Af71xGiyM3Bhcvvdhgoy8KQnuG5qJCY4oVQusrl
         eXsw==
X-Forwarded-Encrypted: i=1; AJvYcCUt+aDd2x0pawuCPMvNkDslDJlonQsnTUaJi854hTI+8vG27vGIGW658N/kduwVbUn0fLE8OkfqBjM/TLNw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzddhto3gRygI+/EeysgNTsJLDc4V3MiIJ5lpIsgydl0aRJ4I1a
	YKllIEfvPmMYV1UbS2L+jWx8ZwRTbUSpxWeQrwuG9219MxCZiEU11f0ZhvJ1pzXE9giVXccKsiN
	cU2Twa6LD1oJ9GvUxG1lh+ckMCoRAw8kXn3H2pbyawg2kOcMQaVa8NE7SnkFVtXGwBl6B
X-Gm-Gg: ASbGncsQtvzZ9JnzLveh9Kvv0I3k7iHSR54WlAKG3vyzdaXrUcKNFxDkdrJW8yHANpW
	x6xM2+AKnTUwzL6lCdRw0H5zGW+oFFWr50+smI072P5uT+e0E+yVPcFQsY9Rm6RA75avGEwMwPy
	7CzckI3/uz8AZOJXzn2qGDVOreWDowNFM78TM2j4l72p/GuiKq7/Oaih30J3f9qLetbAwU/ytII
	MjFAB/7mB2/LF6sK3widE76RQCVC2wrQHDwT/PYfbDlUkdxTw419Gz4p+Uh6T9prNoInGCDNvl/
	hNmKg2aHFl0ogzS95LbLhKnHGziWNn3HD7t6qbcmxit+GqTerPmCVf8knjVcSCXKr/pq
X-Received: by 2002:a05:6a21:32a6:b0:247:55a7:695a with SMTP id adf61e73a8af0-24755a77066mr3480284637.15.1756900114349;
        Wed, 03 Sep 2025 04:48:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3NjxqXFYsOho+XHvlskDWQdVStPAKzQQGePA4tis9XWfYdQEn5D+B3PKJy3PtGYOByW+HNA==
X-Received: by 2002:a05:6a21:32a6:b0:247:55a7:695a with SMTP id adf61e73a8af0-24755a77066mr3480224637.15.1756900113649;
        Wed, 03 Sep 2025 04:48:33 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f8a0a2851sm6584074a12.37.2025.09.03.04.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:48:33 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 17:17:14 +0530
Subject: [PATCH v2 13/13] arm64: dts: qcom: lemans-evk: Add sound card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-lemans-evk-bu-v2-13-bfa381bf8ba2@oss.qualcomm.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
In-Reply-To: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756900050; l=3115;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=rsQ70XuuzikTEL//lunyv8DprTTtt6yK/Y2Nh5U3LqY=;
 b=Bi1icvmEuhZPp4acn7G3T11pofXg0hfMgKG2V8vfOCqLQ3al20o4FihRTpNycjFQw0mE2l+mq
 v0HawdkxcZBAzqiiRqxbue21LsgiJbQRXaPmfeZK6370Qm18IuGpWJq
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: FQ8CbWDeQKn42H2sQAJAaczs0nkzI_Gw
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b82b13 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=WTMWP25ZRELiBA-utRQA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: FQ8CbWDeQKn42H2sQAJAaczs0nkzI_Gw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXy7NXcjtQAXws
 hrg+rf5DPvlufR3n3UsapVZJsLEZD6MyUEhPUnaefel+lkLPb8xQQJWBArNi0dD5xQvCjvxJlRz
 Z6YCN3dmNVQp7UQPo+pBb71RjXd2czwoYp8mR6ajROJa9NUfBNvYmqdAyXEkxLTql4V/LTh/sKr
 riosdaJ7KwEw8S1mDqb8iJAA8yyAVGUnLzKYNbTZL6WZwAueKriilNTBinf/mJ24ZGErR279RG6
 jKr8uYv5M3WsyQ/AgyFI4FnffFViXHV0AdfvLAx7ZDe7IzoqCq6NSHqguRk99kW9ffKsIyFcI8V
 7y0kcYHNY1b2tj8Wp/0OXgWU9DZpqQq+s6KAQ/+pIE5C3gOx2Owtl3WnKDeWw+N2TI0Dhtk6UF4
 iaciItCU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add the sound card for Lemans-Evk board and verified playback
functionality using the max98357a I2S speaker amplifier and I2S
microphones. The max98357a speaker amplifier is connected via
High-Speed MI2S HS0 interface, while the microphones utilize the
HS2 interface. This patch also introduces pin control support
for the High-Speed I2S interfaces.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 14 +++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 69ce6a60361a..7802fd830aa0 100644
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
index 41003d8878f0..de8f5d78d0d2 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5068,6 +5068,20 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
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


