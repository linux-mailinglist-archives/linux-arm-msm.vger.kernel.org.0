Return-Path: <linux-arm-msm+bounces-66374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1168CB0FCC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E087D189170C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCC7274643;
	Wed, 23 Jul 2025 22:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8OXm6jX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B80273815
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309681; cv=none; b=WgM/4DSSJARAwcKrBo7erym/iceHit/M77SGJ5/8Gef5aXi3U9xP1CxePmxN6so5szsBZbPdwaUwkIxqD1SCY6b25l6UhzUigvuB0aP2ylPwVZ6Sfl7nk42XWTbNYXaEZyocr3R17LuOgoonht53m9vdCB2BzLNO6j6GAVm1/Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309681; c=relaxed/simple;
	bh=pvf9JF7jjZfMEX1LsRfCZnTjM3hSxhl1Eal1wQ6AyDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n9c7b6/uMY4QLmTQOaVpnWewKWUZ464qlWmYkLpkPedOh55iDqzV1/1X+2x35mhlZaTOr+fGrglv8YOF1XCzv45q1BqxgBcBXbXWjJB84mS6eIAoF4ewzne6oEZUVJLWaxKNBJlUKsKkNGAee7Sb/LP4Gu/kVbNkm+CAE6gD1bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8OXm6jX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NDxLnd002853
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rGjVOGGinto
	CGY8gtHt3SxU3lDJJ/TxmoFuDubqT8pw=; b=C8OXm6jXBVJheqfFrBZJHRY7Cn2
	xVsEejRTwvcKgKO4Avic8ITYUQl6X4pNnpEQVo3RePrFi4YFHTZQPI9alj6eGXSA
	vE4p3R5OXcGFxfcOt11u82W9GHOFM8pP/7NNpK/x9qF8269Nu4pGIpHi3oI0lnW6
	AaxTri5yJKwinxDDyFWHd6pYx93tcokielYuci/d4wyzszdsVugxdVX5NYimc1Pr
	PeZq1huDOdz+ykWEs7+SNi1O8dX3+tX8rdbW6ak06wCFuuaNlipat5EbQ9Un26JL
	OJvGCYh/5BR6RgJ2ID8dNKQS/wpLJFVc6FItgkO1v9Ga3I1idI45Tz/d+3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313khb3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:27:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e3452c060eso31094185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309676; x=1753914476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGjVOGGintoCGY8gtHt3SxU3lDJJ/TxmoFuDubqT8pw=;
        b=ipEckW/4TltOFvP9b11VTapVHpSqIG3M5WZHFh8E8Gf+iP1xM5gdqGE/eduPlcufem
         RqHm50aL3dpO83cK/DxWMHWR3WdgxLIbABH+bMC6Yz4vJLEPuSExIp5qQA6CCsyHPedg
         C6njiKPnMBapYQ+NDhYLkUhAOgdQ5efLaor6cvUBwmZrSqKJRyYWSOMykHotmdBlMtI9
         9oa3MQk78Ikge4Fa9FJs8lFSL0YshXddgmPY3+dpgtWgCqrHRBRCTn8GsUbV4SK1RyFy
         deTTt/V7sZWObXQWISn3CAbAdVxEshMf+81EIujF4PNCahoNrKO3YtO3S7Ws4UjTV5Qu
         bZAw==
X-Forwarded-Encrypted: i=1; AJvYcCVUDe8wYErqbof490e7KgbORFCyYVz8GXeU/2SdgLuaRdLTCnryHNwuFJs7h7L8rPUEQ+VgrmRP6pTNWFtH@vger.kernel.org
X-Gm-Message-State: AOJu0YwLdr6QQ+fD6IPTH6BAGLaKDD1wOH6+9bZvbqEp86tXg6NTsY7F
	n3X8N8NwYiHaBKN5B22tN1B0MMqQUHXTAakoY7wHKcu5t+3ymSElc+jpNlOsELzzkQ3JdjEmWqy
	3kuHs6rlPXunoMG6vcHVPVM9wU3ang1CHJXjXaxB9WAz6QkOyim4K6rCalYE5aXwPP8dQ
X-Gm-Gg: ASbGncuNLu2EMHc4gs6JaJ7CSQr8CLcY55MFmDY9LePnzYoXN689dlC538H4N6uXHj+
	vuxq+iVk3v96wqa2Iyrv9v/ctDGK7YsZmvxYg2EtVGlAanqcRvu+jZyItj8+UX0aAnTqJP+KCAd
	gDBoHTG5lU1qET9qHht5NkDDL9ejRSQ6p1wIeq4+mlvUpCF7ID2wMUPV1XDnDkH+S7BGCHrOCBP
	U0I10O8kiYsbU9+XkePrKpF6wbAL8e06m1MQCxqrSSQDnNhkx2gSpPlauLN6Vb6i0fO6ua/kV3I
	TMgUGFCcY2NQ0H9QF6IRx9e33ykizSha//x7yQrE1DAoQiXuwqno9A==
X-Received: by 2002:a05:620a:a214:b0:7e3:4014:f322 with SMTP id af79cd13be357-7e62a15a1dcmr550437085a.31.1753309676347;
        Wed, 23 Jul 2025 15:27:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9/popm4R1FR3yrQuWg7/603rsZW/SNKsaARZFwMy/ev531tGkN4vqxS1mQt3rOFlyoBAujg==
X-Received: by 2002:a05:620a:a214:b0:7e3:4014:f322 with SMTP id af79cd13be357-7e62a15a1dcmr550434785a.31.1753309675933;
        Wed, 23 Jul 2025 15:27:55 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:27:54 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 04/23] arm64: dts: qcom: sm8550: use dedicated audioreach dtsi
Date: Wed, 23 Jul 2025 23:27:18 +0100
Message-ID: <20250723222737.35561-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MyBTYWx0ZWRfX082rUjusTCJ3
 eIdmMlnJurLrWbt+1Xo1JRxuY1AkrA5DsJeZkA0XF3ENUKR/C6ZE9Zr/wRiX1Rk+dmq3dD5SM3n
 ncJO091cagRl0Vc03sTCZq+U4SD+JlMw6aDpWn4La+viTDq0FBBZXwqvHDTJ8O9QnhaJZsXsOxm
 y2gj60ugqe5BhMRJIqkOqwv+tkjRdcDHs404jycDs/a02Z3+TnZcJNUAuhPXQ+g6pICvaaFvuRV
 AHJ64uD2n+/S/VpvoPnn/x6L9751N6a4hdEii9mGTZdjzAB80ALQpu0tKujoV2+9SPHOVuqQtol
 VxhgkbSoWyyFIjSt02oACg6sRTcDGtvoCAnCioXKRhSXT4X7z3QMAdvunAU20hWG+DckMZmV2Wx
 V5SUj9RO8c9bfDu9tJCCVrl7vyQwhAfpFL8PQu2J1Hh0q8x/plBdnY30CpG4TF87JdecWIag
X-Proofpoint-ORIG-GUID: SUok8iDtCGPHHACc8Q3loZu_Tng6f8RP
X-Proofpoint-GUID: SUok8iDtCGPHHACc8Q3loZu_Tng6f8RP
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=688161ed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=-ddZ981MevGtOgwbEi0A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=539 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230193

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Make use of audioreach-audio.dtsi and remove the gpr nodes from SoC dtsi.
This move removes duplication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550.dtsi         |  1 +
 arch/arm64/boot/dts/qcom/sm8550-audio.dtsi    | 10 +++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts       |  1 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts       |  1 +
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts       |  1 +
 .../boot/dts/qcom/sm8550-samsung-q5q.dts      |  1 +
 .../qcom/sm8550-sony-xperia-yodo-pdx234.dts   |  1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi          | 44 ++-----------------
 8 files changed, 19 insertions(+), 41 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-audio.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
index f0acdd0b1e93..8cdb14ed8b53 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "sm8550.dtsi"
+#include "sm8550-audio.dtsi"
 
 /delete-node/ &reserved_memory;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-audio.dtsi b/arch/arm64/boot/dts/qcom/sm8550-audio.dtsi
new file mode 100644
index 000000000000..14ae50e72e4b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8550-audio.dtsi
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include "audioreach-audio.dtsi"
+
+&q6apmdai{
+	iommus = <&apps_smmu 0x1001 0x80>,
+		 <&apps_smmu 0x1061 0x0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 9dfb248f9ab5..c17851945b6e 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -8,6 +8,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8550.dtsi"
+#include "sm8550-audio.dtsi"
 #include "pm8010.dtsi"
 #include "pm8550.dtsi"
 #include "pm8550b.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index fdcecd41297d..9decdc32622b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8550.dtsi"
+#include "sm8550-audio.dtsi"
 #include "pm8010.dtsi"
 #include "pm8550.dtsi"
 #include "pm8550b.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 49438a7e77ce..6b80888c030d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -8,6 +8,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8550.dtsi"
+#include "sm8550-audio.dtsi"
 #include "pm8010.dtsi"
 #include "pm8550.dtsi"
 #include "pm8550b.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index 7d29a57a2b54..2c36e9ca78c2 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8550.dtsi"
+#include "sm8550-audio.dtsi"
 #include "pm8550.dtsi"
 #include "pm8550vs.dtsi"
 #include "pmk8550.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index d90dc7b37c4a..98c722915d4e 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/cs35l45.h>
 #include "sm8550.dtsi"
+#include "sm8550-audio.dtsi"
 #include "pm8010.dtsi"
 #include "pm8550.dtsi"
 #include "pm8550b.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 45713d46f3c5..d35d2b9b438d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -20,7 +20,6 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
@@ -2746,6 +2745,9 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				gpr: gpr {
+				};
+
 				fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
@@ -2794,46 +2796,6 @@ compute-cb@7 {
 						dma-coherent;
 					};
 				};
-
-				gpr {
-					compatible = "qcom,gpr";
-					qcom,glink-channels = "adsp_apps";
-					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
-					qcom,intents = <512 20>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					q6apm: service@1 {
-						compatible = "qcom,q6apm";
-						reg = <GPR_APM_MODULE_IID>;
-						#sound-dai-cells = <0>;
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
-
-						q6apmdai: dais {
-							compatible = "qcom,q6apm-dais";
-							iommus = <&apps_smmu 0x1001 0x80>,
-								 <&apps_smmu 0x1061 0x0>;
-						};
-
-						q6apmbedai: bedais {
-							compatible = "qcom,q6apm-lpass-dais";
-							#sound-dai-cells = <1>;
-						};
-					};
-
-					q6prm: service@2 {
-						compatible = "qcom,q6prm";
-						reg = <GPR_PRM_MODULE_IID>;
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
-
-						q6prmcc: clock-controller {
-							compatible = "qcom,q6prm-lpass-clocks";
-							#clock-cells = <2>;
-						};
-					};
-				};
 			};
 		};
 
-- 
2.50.0


