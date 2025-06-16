Return-Path: <linux-arm-msm+bounces-61378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B564ADA8DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 09:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 405F41892563
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 07:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD321F8724;
	Mon, 16 Jun 2025 07:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1UB5XK+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F8B1EEA4D
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057474; cv=none; b=FIyyswJKGIM32xf2XKnI7wuiIcSdGsahx0ekE681+fzpzjzaiVuKWQEVeMvCDmXHe/iANOzlIO4IMYOHdq80Y+uKnAImSNm0Pn9vh1L3iIlzMeHVuEy60WKINHyXJzYIdbZF2pmW4TpBF4MsOe7xlF7lRd4D8NL1Axn027RasRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057474; c=relaxed/simple;
	bh=Yku77j1H71JfQ/twHVlYKlXs/8EsIDDQPIPX+lny6TE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QxjiN6kYWUqkiU+S15DUNBIVmvZdopYst4BXksZJalE37/wq6xom1OGqqSXL5rTwNFyClfJ17aYWu7X065fsUvX2E08ZVJpvTDjV0NKggKxEIAaJM1HAuuPqHDXz1jHSoq5kC2R1r06SJQo7QudfPgjNUVEvdipv0doIuQZ4FVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1UB5XK+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNcabV022895
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=REn5KerYQ+u
	Iw8V+Q4CeAOn6cwn/KOHFnel4TKPwLg0=; b=n1UB5XK+pPGGziBWq00WJaLr8nr
	3AK5zDJWCYD9pKiSfPPy3D/Ypf3wF01kOjTz/Ffc/kME+bk+NrSXKNNPoES5b0Mj
	lQByHt1SM+493a9ifjl/GgZTuNeAR2U+LdGcJTnDRxPLrAxYdsuPzRJMK/i444xD
	V+ailudOxiuZKT57v18Q0P5jnPqbIyrmEvL7Yzf+UrCRteXuyl1HVFJTR5WIQ4sv
	/mYDr35ic5dhaJpO8AAzo48EMQkIqRATR6dzQ0p+d0QNNRbqmdtMFx9slhO2Y6ke
	QBKrCuJYybyjl+W/NxWEiYofCAZUppJVY0G2nVwYNfLPXlzgE5qmm6rTswQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcudaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:04:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23632fd6248so37548375ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057471; x=1750662271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REn5KerYQ+uIw8V+Q4CeAOn6cwn/KOHFnel4TKPwLg0=;
        b=Ghd7jZI8InmM/jZCkkw4eTlJttU9KYs9PhUe5nJDWWbFecV3+59ql2fwFXUSmsm7M3
         PlwVUJIcsDmIl+I1uKiWv7q0sh98IEowhFExruBrviZ++jhzD3lP/bnYd+hs0nSzrZQy
         xxUxCai8rGhLYr98xC2FDGVp4bo+yUD5F6PJcD9uzyPw6CJMFzzfL2WxrjUi6gd4AuR7
         77uXAkzGUIoYogTRzfQC6WvQv4PU2knSN5zhu6edCyOZmFAos0WXrB8+jizHuujGwiha
         v5PQ90BfwzXdyxhzCNk4HP1Ic3nwiMrvIdS2gFSJ6lH/fCvQg8LcdIVGIsz62qwsYBGq
         PwMw==
X-Gm-Message-State: AOJu0YwLznyCZz3EW1yPbHrlEPgUgQXfE8vMRhnIRX5KA6q98lPpgJTC
	echLf0SDxI498vQQpNpFHMLjmjt61xoJmVf2eMHzUWAMyy8X6Ch9+BvmsspUIA9DaAMuLmiQ5bs
	iIy6fmE4Ga38PHIO4JpSyGZ0F4gPER2msMzgw349CKU80l8xaDY3dLXb2d0ITrR9mLcG3
X-Gm-Gg: ASbGnctlyvU7nainWPm42EPFNxgwZHBNZVek6my6DNjcLOvITNkUUL6I/r4ilU7YgPh
	T1k5IXjs0HRGAZ2OyMYukKPTtvkjAPfzZzQJQXkVcWll+ndPTjU4yTU1ofAt4/nQuRW9VkRvsJB
	/Tv+VJZq7GZMXDiJBlN8BPqNy8H9AmZJfU8+/0ihOXwl6Fm4vXVXbvJCzdabpVGSe4MJPskWdZ9
	wfxYjfGjAU+a4iLmR1PO42dGLieU64VP4NeUnOrJc0LRBy6kJgIHeDRzNV21uh+WvEg35GMrzoE
	ij2Y5a/aykvCFIVmzpYiw+sY2NjBW6muuOBO+MnyX7JUNu7dW5pJcCAVJlU=
X-Received: by 2002:a17:902:e745:b0:235:27b6:a897 with SMTP id d9443c01a7336-2366b3c5ad3mr121973615ad.34.1750057471221;
        Mon, 16 Jun 2025 00:04:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIjOGzxocwotSO3DLN7Z1O8JiPGy3RDCh5cpXniIq3OezTeuvNAfTP1/bRoL/5jWy743us+A==
X-Received: by 2002:a17:902:e745:b0:235:27b6:a897 with SMTP id d9443c01a7336-2366b3c5ad3mr121973315ad.34.1750057470817;
        Mon, 16 Jun 2025 00:04:30 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a19e3sm54435825ad.82.2025.06.16.00.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:04:30 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v2 2/2] arm64: dts: qcom: qcs9075-evk: Add sound card
Date: Mon, 16 Jun 2025 12:34:05 +0530
Message-Id: <20250616070405.4113564-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616070405.4113564-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250616070405.4113564-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA0NSBTYWx0ZWRfXxx5/kAJ/mWUD
 7IVZPZNhwlIMBkoRncDsrD9/4/a0OUjUQ5T02pm781dQiFgdTvqwJwjvZQIIhDNkn6Ukrly55e/
 zPZ1+rt3AGXL5l5pxDpRlAg36QqKo4UETFNCefITzsjS8TQhy9Pv0XXZ3nFsciG5uCarugHNeCj
 hkdmcC67dXW53l4w/PnZASKhjAPLOydZn67v4/5yB9eY6LB5TTx3QeAJPonvZYE5dt/XfDEQOpt
 EihaTSGeAlEBC2/beOo9Hrv7l5yeCQ072SNEorwz/sIi88cSoncvlfcCQwsLVZwxVvDSWIbztJP
 tbW2myfE2MAz1JwVATGaMQ6ACTmGqgkiHmPBp8NNHjBz+lUUhBKy1CQPp8+ZrBHZUHafF6AVyuq
 jjGA7jxlBL/v8B7QP3fgVmsWUArRm1YdlJESMrxIOv/dDoTyyy7vwiqyc2Wn7IirHlUR/Jwz
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=684fc200 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_dDu9j5-v2Tbu4HaPncA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: LT1EHcAtFY6P6muCMzSYOh_j3Gb80j_U
X-Proofpoint-GUID: LT1EHcAtFY6P6muCMzSYOh_j3Gb80j_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160045

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
index ab161180d1d5..d073c6f95d4c 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "qcs9075.dtsi"
@@ -21,6 +22,57 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	max98357a: audio-codec-0 {
+		compatible = "maxim,max98357a";
+		#sound-dai-cells = <0>;
+	};
+
+	dmic: audio-codec-1 {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <1>;
+	};
+
+	sound {
+		compatible = "qcom,qcs9075-sndcard";
+		model = "qcs9075-iq-evk-snd-card";
+
+		pinctrl-0 = <&hs0_mi2s_active>, <&hs2_mi2s_active>;
+		pinctrl-names = "default";
+
+		hs0-mi2s-playback-dai-link {
+			link-name = "HS0 mi2s playback";
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
+			link-name = "HS2 mi2s capture";
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
index 07ca6dd4f759..968730da180d 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4711,6 +4711,20 @@ tlmm: pinctrl@f000000 {
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


