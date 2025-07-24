Return-Path: <linux-arm-msm+bounces-66606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E2FB10F46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 17:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA7075872F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD3F2EAD1B;
	Thu, 24 Jul 2025 15:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOrgotV7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4094A2EA482
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 15:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753372629; cv=none; b=cPlec77hWpsXx2Bh0VMw2JjSZpZcMHEFx5I+PGQhD286/vZx5oZR61ZBjoLI4Qg4fGxgr9Hjcwa31FYvBhgiIIL3AHtvml9zINlJwAwXodEyHYbX5/B2x8irvADJLJrzI8vAWqtN5sFOIvWXRIzLOoLPGJ2NmZlJSrv/pD3rSGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753372629; c=relaxed/simple;
	bh=umsb48Ong4T1nOiCoMdmvnXAz7c8+fwKJ27Q0qldwX0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R9OblBoDdFVX08sSI/aYjvq6ZWZ6e0BqgCHCrS93KAzqDxcgIFGEfpNMx2mm5SipfvxCt0/JjDdGsvV6daSUGzgw+4r4DCAgwMTtpNaMpBauS9T5wWu9dqDTXCdEUdXDBu0nkhQKZuQkb1jv5hmd7CB/H5ErEzhYbBcEYAyMyT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOrgotV7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9aGoB022538
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 15:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UeDruGvRAt3
	KF+PfRUx+xqf61GD6IP44c+l01qnDpEE=; b=oOrgotV7OQkU8KQ6BFGki8G5NpJ
	ujQrIa+gjOaN5mmo0tlbof7qwnZGEYFZHtAfVR3C4+FNtYlwog+sU22HzT3MrnzD
	bNWHeqGt1Cn1QTQEw8fiX0r3ZIK2ZZM+7F0oMBL83KLkKfj8xauMAYSEueTcFoOS
	0dP10RZ5isan7qw6f+WkmabeeSPfdCHkGTq7Q7d3PrI98UQpQT3LuiSeVGSCd7Te
	rgP2P3fXtA10oAofRHv93Rn+6DGoqqZrmke+8OfureZyNuuFD+b4UgaeqyP5UD3S
	rrOFpUOpmWZMMp2ySP94Kul9XXM+ZHQYgAsssBzGV7RLQgM1tRHI3qq1MMw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313km0h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 15:57:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74928291bc3so1136397b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753372625; x=1753977425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeDruGvRAt3KF+PfRUx+xqf61GD6IP44c+l01qnDpEE=;
        b=AcKpKdHMnWPeprppjygthiOhDKwN4OX5GtVOxn4B4tnGa/VzGA/vyGjB+DtfrBdQSG
         N2xrhtNEWXdbNu821Mt3N6okrC3CnjudTSUBACAN3CU0cB0SOQaqog2qCEz9CFSGrpZs
         SJ/MF3lUAzms7lfzMq1c1BepgwCf8MXrQJjvrScPufdd2j1NENgO9Fi+VEe6tus0iybP
         Cd+R3gqKwyvlM8UfMSIGouL9kGAAKnmguwsyKrETA5PeAtmmsxs78II2OQ8MsB80Ze0c
         MG0ktW9amSd19Q7aQCEMIYG4kdf9WvqaxV8If9xiLT6DsEoegkzLLTbo7yIK1m+T/PRH
         gfHA==
X-Gm-Message-State: AOJu0Yx727eTEisaxbn0l7XIJ0hQDe05dXUYxu95SN0Armw+6N9e2uhN
	xiEgm+fu91GOfAjCy7IW8m60WGVvQ4rRlS6If9taypL9pi//Metb7l5D1cGkMafTTpQKz9SG8+j
	P8IjTwcEh6OAx20X2oU9LQbCT/yoPdTGsBDrYGO+rxP3LqvrsqS5FAgxkBPF54+LIirk+8TRCqy
	mJ
X-Gm-Gg: ASbGncsou0ubyfvU1XuuSebwLm79fTZSTR11T34CA9ToxqfJDyP9aZO25T/aO1vIi/d
	q8BsaXl+V0U6tL0d6mL69Jyxq11l6LPWxTxAjUEMz8sKrBQgdbUmkIq5k6+TpVBEETcF0oYbpHi
	y8Lk8Cqq0lSzFzOuV9LkMoumgFwJbZPqRA0yGyBEge4lyQqpiqetmA47+fszH4zth3+hCE7gluN
	Nlx3npRP0QfdHbGrWxFJ8VdemqzLUW11fsWxzcqZuuO3FtA+rkBSXgIFJPElkhmhCe3X5WW4oy/
	RWsWiKIlxxDzhNzWrw8k7i+tDLOPWqGQGWdald3BpwUVTQA3iLjnw7/3m3a+hMal9GNYa3vNrnO
	1
X-Received: by 2002:a05:6a00:190b:b0:742:3fe0:8289 with SMTP id d2e1a72fcca58-76035df576emr11304975b3a.20.1753372625433;
        Thu, 24 Jul 2025 08:57:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvuWCmRKXhz79mvWr6MVo4OpCx936GLXUVovsa9HxGIr86dvQt9VQoSA3e1Bk+URTfxaD3/A==
X-Received: by 2002:a05:6a00:190b:b0:742:3fe0:8289 with SMTP id d2e1a72fcca58-76035df576emr11304938b3a.20.1753372624973;
        Thu, 24 Jul 2025 08:57:04 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761b05e8498sm1988516b3a.98.2025.07.24.08.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 08:57:04 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v3 2/2] arm64: dts: qcom: qcs9075-evk: Add sound card
Date: Thu, 24 Jul 2025 21:26:32 +0530
Message-Id: <20250724155632.236675-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724155632.236675-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250724155632.236675-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEyMSBTYWx0ZWRfX1aDiXIgxooDO
 g35NJcqbQiyNEpby5LGMZZtssZ5fW2cxDcAVvUgpYfuL9LMviDJzy+S5+Vsd3EBIvTGavXZTaZ3
 tPR6SHXx2ZVm7Dy7s6/75dksRqgwH1kjDFTuoPrn5uqN0F2No28MvWlffRL/BxX6LDpWZd/GZ6z
 DoPRcsK/z0jtUtt8zj0eTIn+fEdkF0Q3cFTPzoQTJ7h24GPKTS32pwReKUx/orb9oustXxmEgSU
 3F8FuDMDeO8beipxTEzBlag1piV5A0ARWOTO7fr4WI6iJffDFQoEa7/Dv09nBxXIhMfFfCYsHI2
 pyNRz4ECDa4kSeo/bwHbCeKcPEePuKBOCBr3VgEjztPgpw1P7pjD54s7YqkoVOFsfVdz/TDAQi7
 ZbSRwY+oBCAU7XR5zjnvGTrwG86xJJfuBxB689SLHja7PdJG3QYNqWYh0O3qI80Wu26tN0tS
X-Proofpoint-ORIG-GUID: -t1qmBECkSYLlyMhzHmUOiulYlZw3-_7
X-Proofpoint-GUID: -t1qmBECkSYLlyMhzHmUOiulYlZw3-_7
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=688257d3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=_dDu9j5-v2Tbu4HaPncA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240121

Add the sound card node with tested playback over max98357a
I2S speakers amplifier and I2S mic.

Introduce HS (High-Speed) MI2S pin control support.
The I2S max98357a speaker amplifier is connected via HS0 and I2S
microphones utilize the HS2 interface.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 14 +++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
index ba8a359d8fee..a2d9aaa641a1 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "qcs9075-som.dtsi"
@@ -20,6 +21,57 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	dmic: audio-codec-1 {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <1>;
+	};
+
+	max98357a: audio-codec-0 {
+		compatible = "maxim,max98357a";
+		#sound-dai-cells = <0>;
+	};
+
+	sound {
+		compatible = "qcom,qcs9075-sndcard";
+		model = "QCS9075-IQ-EVK";
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
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9bbf273ffce1..74e8f6746872 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4993,6 +4993,20 @@ tlmm: pinctrl@f000000 {
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


