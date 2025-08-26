Return-Path: <linux-arm-msm+bounces-70944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5749BB3722E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 20:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C7544E2394
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 18:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA9136CC83;
	Tue, 26 Aug 2025 18:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ef7EOomc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC863728A5
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756232512; cv=none; b=J4CYneGlQ+jLfp4VcepLVGz3ovJmXtouSdcRJUqzWC0i+itkKf+wm2tAuphgfPWeT4xvRSAoKIgye3oded+Hs/SQzUzbXl6Du8MkUmxgsSn+Z78iNW4cQw3b6fhqQAO6ZIJORyFTxgoPwba2Al34ra3DQrQ4aW67Eqc4zODdpds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756232512; c=relaxed/simple;
	bh=611L3O+47ctGIN5esrQ9A5H4Oub7w7q3hEDu5ciaR7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R7xzxofzpNWBrfkSuMSsdXhjtA1bD4D6+pLu64EviT55Rx4luke6GgGpvqApEIe3+WvvvbjWoUAq+oIj/Fi3Q8ECKDsAtn4JA63NZzlzqb8dyyeaa8kUlvkJUSw724JEx/l3i/I9la5xB1xrKZ1VxNZN2oouA66O7ngL9Yyrp3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ef7EOomc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QG1kbW018268
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHo1gjefBDo7Rz4UcCwYzZ4ege4oDD7nzc30CiMEuYw=; b=Ef7EOomclIE0NqMt
	u2pygFc2Tnw1cYmgZdOprkOU+vhXdWC+ovShZFd8GHsw0K6Ag3v1HVAGEi3GvkB1
	E+PVgfXslUljEFoRsob1Vx2jmYw9/zj3pxwevIJniqO1uDE4yOHJRI/xYBzHlH7W
	/EBXbM7rJRja34lc1PwIPF2PXlqK50lWdLfTxBejuHFvCisA84ekzAdNIDZMwLY8
	o+PRIh7NK10gKVKV47kauwLpyroXDOzXPkWUWvsuMU2K8PQqM0U/8vZ+/t8GHrYz
	UY5+kXE6+WJXCcyb63SYzJTumyviYibu1UoGgpjfhE3A28gJ2L62Uh+YJK39u+fB
	afuT9A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unsup6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:21:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4c229e2a42so1633280a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756232509; x=1756837309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHo1gjefBDo7Rz4UcCwYzZ4ege4oDD7nzc30CiMEuYw=;
        b=ZFjflKhsQcsxLutc6Au112johczpi5BPATKRRTDeagl6+LZa1bwnRB2++7cAQUVARb
         MOHoHu+1EFFZc7TIrz4GNPTv1GRgzLc6gzsQk7+7O70qT1o4SfzCoY3E3eH/xhrGju89
         CA3khaailbfa4hZLBhffZAz30izfldSSb7w8U4OZDqvveKjR2McZ0eQcLBn8SQWkYos9
         oLSMRAszDNFdUVt0Iy515yF39XWxWFa0Sj10e+M+MJYjLXB8MTySL3Xzwos/sTHVuoEY
         9OdXRYfrFwJ793Ohz6Yw904n7aDaQ2s+OwR3/XGjbpzwsQFIyTH9bYz2Znf2qCTgSsJN
         F38A==
X-Forwarded-Encrypted: i=1; AJvYcCWkdtLc3mVuN9g+AWDX/7kXJ7st6nPrRNxzh8FwQ/uHDmNvhk7aCI6DZ4Y8uruwoIC7n23x90d5LNPfq46k@vger.kernel.org
X-Gm-Message-State: AOJu0YyEpO0e/yH4zlW+bMiM9MOQn4Xhold8vV/+Azul6Yt2PHAjchkQ
	i7RC/fcUO2BO2b0c5behnBlqYpIsm5QOXVcYZj9P/5Dj4OTup9h8wF0Xu9PYmPdLEwc/kMjPqsz
	8o30DKiqnaxbK2N9Rz5H5uAkp28fzfLtO2jzyfv2gpp3ZbMCCAN2z8jiWi5dhmLxEK4+R
X-Gm-Gg: ASbGncvXdrIxRsvJnHTzDxW2b9Ia2k4bEoTakuKarS79ZVuxm53qGwefHPor95c9hQ5
	jyA/hHDRlFdO0wU2Dvf0vM0IGnuetjMU2qIHzLPhrrx+VhFqgwWWNkRrFSNU8NEqPs5ZPSMgyVM
	exBwoqy2hYYIm6Ez/NtUdeqb2uZ2n1VyQXv6yOGrSFhjj6giErTZTUGQTe8sc0VFMoQMWrmgSXs
	+82KwZKdOt74a/6pLT4J5vcwrWfRqd7WOs9affUNA0GJIRQBQkRcZPUDSukqq14sceQrFTdZnex
	e+Vw+7mhPoMJsfao1KMuOhBPpuqQVCpIEqamxgzbMbg+/C2JUnR7fNcsaqeNkfIg27ey
X-Received: by 2002:a05:6a20:a10c:b0:23d:54cb:2df6 with SMTP id adf61e73a8af0-24340ad1f86mr25124340637.3.1756232508574;
        Tue, 26 Aug 2025 11:21:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7ijJ29Va7yrV4zp5p8NjWdZ782LaBYYQF/4cU8PsHszSgbxWHP1GGb2H0frlcDXBmyhlLlA==
X-Received: by 2002:a05:6a20:a10c:b0:23d:54cb:2df6 with SMTP id adf61e73a8af0-24340ad1f86mr25124289637.3.1756232508052;
        Tue, 26 Aug 2025 11:21:48 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77048989fe6sm9881803b3a.51.2025.08.26.11.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 11:21:47 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 23:51:04 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: lemans-evk: Add sound card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-lemans-evk-bu-v1-5-08016e0d3ce5@oss.qualcomm.com>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
In-Reply-To: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756232476; l=3032;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=UMnWnX+QTp0SrMk1v6WQGdCaQDzxYKHt7lrDS4z1rOc=;
 b=vvOwPlUHfYZYBlh0B2Im01YpZHJDFfRJ5ZkGHfDe3nN4FX3P1X2ntIbChYdre22CGaot++nfI
 /ezJDoCRq3uCO9DepaefrgxOKiQuc5ngAhs497ny0q5LZGpYX95mE1y
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: KX0rD13mQNodHLEN_nFf4VtG8Qdw4yrE
X-Proofpoint-ORIG-GUID: KX0rD13mQNodHLEN_nFf4VtG8Qdw4yrE
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68adfb3d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=gcRert6Kt2c8YO7gZrEA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX+oDRjWgDPLRk
 se/z+YqoeFORnY1PyjD8X/j3L5FqoPons5VZwaamwlwgjVcY7St8gIDh+V7BPsHfkjTci7ZoWhd
 BhwAZsGKgHn7Da7CoiO2a4K4jOrWfHTKqszNLQ+FvUxjqZcxoCob81HQ53e5XUTTNNP6a0A5Y5+
 P8oxqvMDe5jEhKewK7IDN6jPKQEOZuqrMpRmxhsMqUsalix5ntteszjv+m95zOzwEhh/3pnVNFq
 2rVy9Luu7ppp+PtVMtDohbei3YowaF2tHg1DuPnFvTPXG1Pi5v+UeEriWlOa2W1rlEDeC2WEsGV
 MjSHRa4CRLehgjJidIx0QH402nvu1QCpPNpRedMND2rujXacixBhIy7dQxlrsYysoJaUG886VCl
 U2mTq4dJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add the sound card node with tested playback over max98357a
I2S speakers amplifier and I2S mic.

Introduce HS (High-Speed) MI2S pin control support.
The I2S max98357a speaker amplifier is connected via HS0 and I2S
microphones utilize the HS2 interface.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 14 +++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 642b66c4ad1e..4adf0f956580 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 #include "lemans.dtsi"
 #include "lemans-pmics.dtsi"
@@ -26,6 +27,17 @@ chosen {
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
@@ -73,6 +85,46 @@ vreg_sdc: regulator-vreg-sdc {
 		states = <1800000 0x1
 			  2950000 0x0>;
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
index 28f0976ab526..c8e6246b6062 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5047,6 +5047,20 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
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


