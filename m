Return-Path: <linux-arm-msm+bounces-70427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CC6B31935
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 15:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2463F188D5CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4E72FFDD2;
	Fri, 22 Aug 2025 13:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DaKYv8m1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89AC2FFDDD
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868775; cv=none; b=RjsuZIdBC6g0Ec4c+C3bzolTRfxfAL9zKFbPhiG3Uf8CdRyn3/FnRM5VzPXhMrTVihQewSE6zZbj7t/p/zOilJ7+1C8I83anD71SKqtm3Uy4bTow6KJEkTQKF+xNh+ed6VBOzRU0h47u6F+e0etN9x9unrRvKqvxds4hvKWIAdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868775; c=relaxed/simple;
	bh=p1lojM5nyeVH0L3ungCLAGrmlI+pOzLl59WmtGTtIF8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OQd841I4IdSHVhIAFs8JO9EX62fXrk0BxnIJMzDsVAbdlDeVhzOwFumIPPaGF1V+FmTh4cLNBYawlhVyn9aZCe65LO6uajSBL0Z2vtdXEwzxBZvhQvhnGnc7Lu2QcNYXx0INCz6d2qTBqXNOIBzh5UvFjZJiBkqt3rcJwerETsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DaKYv8m1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8Ud64025041
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 13:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vNUipRbE5fx
	ce8vnIsbMIrjSIDj5rZHRbC1GeB9L/KY=; b=DaKYv8m11fBqbvyOGHLxvD4QQ3a
	wXdzjKyD+MH9W6GwVr9PGwHhw0oZojJGPMHnJBPzj85IQaaKWqClAAjd6wcnKt59
	JZyIk5hQwcmH9HW8Qa3PNuygOj961/ByBzojNYUgOMLvIwF9EKCC39+REWTci/Fq
	7OA/8aqMxb82YqE+NNNmwnloQZvsPVV2hZEGm+fo86exczZet3AAzBZp5vDyv+/x
	Jx3vizvwFI9rsEoucys2ZYkDtqf7aPU8p3X8L4OZ45cuMAv8T+cKVHXZ9nTk5yJC
	lhhVHeYVNzEjvlQBZvolkqqByWT6Ik9hloq+A61GHODFYIaa8rFEXB78Q+A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ahcwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 13:19:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e54a1646aso2261916b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 06:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755868771; x=1756473571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNUipRbE5fxce8vnIsbMIrjSIDj5rZHRbC1GeB9L/KY=;
        b=mDGeeG4vAUP1jlsgsyH4XI5BGwFpqCdUWfy+oIfyNAL3y5Fe8aB4RjnEeisN2TUP3S
         Ky2sd+snrKq7n0PS1vta4x+OMHQkayRwqiXnE5DGJNp/6CCpLdKtttnz29T5fIqRyGIa
         SJybBf23sE0KS3Sb5pRfk3MEEneeiVWiegtqccRvOsHsq+F5j11qMyMpL0kabMdgTEhi
         7GkoG8WT+jk1Y5x4eif3C+2ut0/dGLURMVhs7mzYti5rLqkg17GXIPLzD1KpozR1nX5/
         9owpSSxccW2EybuOmGA135TZ1mhCcNZibSbgteOARj/H+abdCRyTEKYw8rxzLMcWnjY7
         wsUg==
X-Gm-Message-State: AOJu0YznPJ5pvGBElF003V/ArSq516Fb7RUbPQCIJ36pTOlDp/S/47vr
	k2nz+7M9ea3MmqSi9nBczeHTBv2RWaOoYLKRMqwLj00CuVZwdDyY2pqdB/RhsLUQNy+0vNsONta
	lrb6UYPID0lec8XuMU+2Iq8p9P99XlWA/Ab0FUrG3n2TH8xs9APoFjHlHygl2me1RNlss
X-Gm-Gg: ASbGnctpMCWow13B279rh5Zt3Xkcil68eZblUsTRKh/Kt6SGelhxtnWZ6J+MpF1ZrB9
	R7SL2NJpJ59WuLhci1FhuYgF0zJHPF/9vb7irkVpiLzWH4AAuyf2Ez4oTgr2TeGgM8paWj7ScoN
	K4ZseLsF5JgBDj263a9ErWDmuZJnfPijbHjP659Kk1IynSL/GSNUfNuIVpzhIxDFq+cMjr9Fgd6
	PhCSzYT2cUvTFegRn1JmIa0foUP5Y0VOYyv2Y8Np+XTsYZvg3bgPcuwEAzS3YMwB0ajLqAmul5C
	Jv5uJok+vJaofYQflMC8J5W2pixQo5VWaXK8atsv5+vNrX5/VMEyWfhf9BGelpjHnh7tjCN9mbQ
	8
X-Received: by 2002:a05:6a20:7fa7:b0:220:631c:e090 with SMTP id adf61e73a8af0-24340884ecfmr4535897637.0.1755868770951;
        Fri, 22 Aug 2025 06:19:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs0KFkP5BTa+R2QlhzOkxpGvgMcS67+Ki+Y7hGXCge7fxFOeBX3xAEM0bX/4I7Gp2cRnOFIQ==
X-Received: by 2002:a05:6a20:7fa7:b0:220:631c:e090 with SMTP id adf61e73a8af0-24340884ecfmr4535857637.0.1755868770475;
        Fri, 22 Aug 2025 06:19:30 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7703d2b7301sm405621b3a.93.2025.08.22.06.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:19:30 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v4 2/2] arm64: dts: qcom: lemans-evk: Add sound card
Date: Fri, 22 Aug 2025 18:49:02 +0530
Message-Id: <20250822131902.1848802-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822131902.1848802-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250822131902.1848802-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xGLPANEB0gEGxql0ihC4o5j-zO4-A6kx
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a86e64 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=_dDu9j5-v2Tbu4HaPncA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: xGLPANEB0gEGxql0ihC4o5j-zO4-A6kx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4N7H1MLN7oY2
 DRZhpnWzAwg+EvJZmdvtovPWJvdEgUUPEgreKeB/njn2J1iOgu49daudIfuT529CXVl/7YUDgyA
 hc9rdI96pYxVsZopkkqGprSJ+VW4i8VLVGUEv+02Nd2y9EztZopNdpKT1E+fFij6bQLCccfs2+Q
 knde+G46iHfYYhvZj5ghln4w8Dm7ciijypqFIR9LRfuxUhRzwE7vcpCIIs5ybVDiOSQXOiUKMnS
 srbx12d9uQWuhtaSIX6ukCLjY4/r2LfxB+Aoqd/h3WSXb7PuLuVT2UhX2czgb0VN41j4cfoM+UZ
 bCrdwxIrv50/wqF4cZgajGB9q/DlXHqOQ4bdBe88d8JtL2umz2gAha4pnaMzWMrPNr9V1l0I808
 N66xjCv8x0CDt9LooAcBFXdmZMFOow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add the sound card node with tested playback over max98357a
I2S speakers amplifier and I2S mic.

Introduce HS (High-Speed) MI2S pin control support.
The I2S max98357a speaker amplifier is connected via HS0 and I2S
microphones utilize the HS2 interface.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 14 +++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 669ac52f4cf6..d67a9307cc75 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "lemans.dtsi"
@@ -22,6 +23,57 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
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
index 7026f25877c8..d73037d6d97a 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5005,6 +5005,20 @@ tlmm: pinctrl@f000000 {
 			gpio-ranges = <&tlmm 0 0 149>;
 			wakeup-parent = <&pdc>;
 
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
2.34.1


