Return-Path: <linux-arm-msm+bounces-88750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F058D1805F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E499300B9CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6013238BF77;
	Tue, 13 Jan 2026 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bffAnplp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XnCkiaNP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B45A3314DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300118; cv=none; b=tlElZWpMLsupnyq6kPw3ilLDTeipwtqpsaPsLN3vOTCgEUhyLSGryPBWNg7flZw3tTiANRO+nfYqCAL79j4Cn5rGsnERSiMOwaJ582MeG6xzThu7cYh2ConOIbcm1L79G4c0QvOyMQidahWyUrCRWXhkWs0basKyAEpp7+8P8mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300118; c=relaxed/simple;
	bh=6mMtc5xJf9aaSBo0jlfi1EFAq546qQQijdCjuCH5GdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pdZb/3FULVdEWg9IBkKVh2lagps48fZagPl9rBwSBGv0zHEDpqh4Ff04QDssKl76Pbjmy/WItsb03j7ZU/aNAFpdWJTocjJOdLWVppiQi9JrlhVCC8MZfZONb2CSzdZf3CM/oUyWxWZz5VoVVzZq/AGsM9HzuWmhBBmrF+K0MdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bffAnplp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XnCkiaNP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5SsQt3868837
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SofZ7mdfxae1YBje0a2PwPaNyBz8Q1ao9I+p/9f9P1U=; b=bffAnplpQaMeZ3F3
	szRC0On965/YU3AXwRPRTkgXh9u0CW4Z58eMe9WqFBAEM+Wf1EMssTjnpJB8jCjo
	22X6waPlQ42PY26oliwppKuqI6xw43C3KxFa8g77yyzbOFLZJKzTo6eVBpUzRpWq
	PUAg2O9CNxoX6QPkENwbC95SjL0dB8tH4ndclbPx4ZWv+Fg4DmPms86u9SQ1ZfSG
	l+ZUm4kUEE+otDPz56rZkeu8z78TS+FyzzOc6EQSwf+7nzeNu0esbJdFD03NMVs0
	NmKXlI9WyLaV9iNxGoKzEAn3GLRzyAs+P4YYH2jossqIAdapzhDICj/Sf4JkCw7/
	8iZN8g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk8w3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c6cda4a92so7942528a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 02:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300113; x=1768904913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SofZ7mdfxae1YBje0a2PwPaNyBz8Q1ao9I+p/9f9P1U=;
        b=XnCkiaNP58qIeMamwN///zJYwxhnv36cdVoopnW5iKDFg7jckW0B4MoolCqBhhmrnU
         92jkFABmLb4veg02oW6lUEslpbeI1Wt8LUlnZ1Si1gVkvAvD8O/AvY4hvqOLSP5I/qTC
         IvOLemf4OymduabvzkFtGOwsbS1u741uh4V+fXwXK+3XLneURvytJoDEkNj0XniSZOgt
         jnubF7QRlgEtJQfxfbt8iHOAld8MDjykNCFXmluCPue769U/f6x6nmG6sVWD8894N/tf
         VBNo6FoSCpj2Fnfvgd55G78HZsqbwZyx8XqwWW4ffqoujshHVJT2usyQTGx50CdcjtxK
         Izig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300113; x=1768904913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SofZ7mdfxae1YBje0a2PwPaNyBz8Q1ao9I+p/9f9P1U=;
        b=w/6L68cwWZm9cv5gJLemv55dzSW88w5vum6pAEGNDdwzLNIXRoQ6FK7O80TcxvSWF1
         VOShWYf4h6TNJDUilEThxbxPQB4AB73Xiz9jgNO5lwuiKj/giBKjMtBjogD8u1Ubb3Xk
         IlX6P2C942VvXmjD/UCdjRfO5uK840LBcR6L18EayhxyFNRxFnit1LQTqssj49JEmXG0
         C+2Yw29X4jgD8fLQufIsGzeOrtlI3xQvsUPAr9iwtgg8RN1/ZG7KAFMJcL3P96V+81/y
         7o66JaMBUdpr3Ag7WWH3+QpLrjMwuGyah5qSkdJzPJzzJdT5Ox+bnPUFlx/YnyDOz/yp
         9rhw==
X-Gm-Message-State: AOJu0Yzzj/drsLVSBtxSJVuD+RcksOOFKJwDedaeW/YmI7ISbWOLaICL
	f/vgjvzzwPdwznNWuBaXlbTM1DrDWTY2iRKcmu9MLTbCeTZgRR8JpA/Isn3EicIbSwqx7a1lDmh
	dyGYNkiODwvzRE8UUcvv0lTev5HridJEySR8xq/HV+LwPUbjTUGCDclgUHP45+Vi9MkPp
X-Gm-Gg: AY/fxX5KB3eVFpZnpfZKacyERIsAube0H5aKBfqUpIceSUbzTS469B+b/8FaO1eTGw3
	LrGe5zB1t+ucYeVOq9G78c2wc/u/j12s9IpNAhl7XPw4eETp+83dWvfrnwyZMuS0TshCO4OvCKL
	C57JSjWvkRnBXGMFQ0G1kRWgUuw728u6hSGEdL3EPK042c+lG3E+msPhztMpQtNnKtcW2nqMpFM
	pmFFOQO5AQT5kr0CBU14Z10ndS2ax6AywZmy5WhtQQD+diHMQOp0BMXJe1HvX5Ac9HyYzE2YpES
	Np8i+K2wpVSxq4puhBiWzuz0AHt70cKMqMbCTjzSH1hQz9rCUAnX7ozN1vQewMEV8oBiXb+eHVn
	65/yVi3irwUzMWNoRJP+UAfqM9BqtEuGQ1eLUCpWOoZx9JyWYZMj1gYr58wMreeY6xbytpoBziq
	Q=
X-Received: by 2002:a17:903:18c:b0:29e:76b8:41e5 with SMTP id d9443c01a7336-2a3ee4c107dmr195544685ad.30.1768300112938;
        Tue, 13 Jan 2026 02:28:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtBCwFIaX/jp9PbrO0cEkVLrGfU5u9Ctro/Cim54KPcMP0G5rT0IOrimXAxGEVrdzA7YDVkg==
X-Received: by 2002:a17:903:18c:b0:29e:76b8:41e5 with SMTP id d9443c01a7336-2a3ee4c107dmr195544455ad.30.1768300112472;
        Tue, 13 Jan 2026 02:28:32 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8d76sm197125265ad.84.2026.01.13.02.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:28:32 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com
Subject: [PATCH v3 3/4] arm64: dts: qcom: Add PURWA-IOT-SOM platform
Date: Tue, 13 Jan 2026 18:28:15 +0800
Message-Id: <20260113102822.590677-3-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com>
References: <20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DqI4MQcnjEHui1zhhO5RD17IAjottI5Z
X-Proofpoint-GUID: DqI4MQcnjEHui1zhhO5RD17IAjottI5Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4OCBTYWx0ZWRfX5ig2ophVJ1ne
 F5uiLWE9XX8zIFl8deNjWBnMX5yuwWWB+N9y95uMu8PddItvigxvZSlZc6mIh48pRV6PxjSbqxs
 cscgt4O0jbg4eoCSTC8+Cux3RzWyjBk3GhND789GyQ4k8PPhWNo3Xsu7YDUM0Kfcgldn1Vd1IQM
 StrGRg6vl92eZd1s4Zp5imB26oLXl4ZLza2fW4MrXEPRNSLupAVZh7DZkvjs6OY3jm6pBPP/1in
 WSp6Vl7noTBIzoA1A1t4kCg2aANECJtWjJwKAALPbKt/UIdzE4rbLutIKarN9CQaCUKVAFE6k0a
 Ul5PCzApHq3mKD2Uqx3IzgzKhSkTftZFWNXB4iixQqPzYgCNCosfIoKtBDRpmda/KEVq4sYfClz
 kMy7RBMGJaNV1VpROzgIId9OhCKb5srZn+4w4ExZOhq/4BcO6cV1s/QPOQydCiHP3o6fBU49NJS
 ggL2/PwMggWEe25ReZg==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69661e51 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=93V5M4jBH0hLqW-x8QsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130088

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

The PURWA-IOT-SOM is a compact computing module that integrates a System
on Chip (SoC) — specifically the x1p42100 — along with essential
components optimized for IoT applications. It is designed to be mounted on
carrier boards, enabling the development of complete embedded systems.

Make the following peripherals on the SOM enabled:
- Regulators on the SOM
- Reserved memory regions
- PCIe3, PCIe4, PCIe5, PCIe6a
- USB0 through USB6 and their PHYs
- ADSP, CDSP
- Graphic

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 .../qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi}   | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 copy arch/arm64/boot/dts/qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi} (99%)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
similarity index 99%
copy from arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
copy to arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index b8e3e04a6fbd..fb90beb1096f 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -3,11 +3,14 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-#include "hamoa.dtsi"
+#include "purwa.dtsi"
 #include "hamoa-pmics.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
+/delete-node/ &pmc8380_6;
+/delete-node/ &pmc8380_6_thermal;
+
 / {
 	reserved-memory {
 		linux,cma {
@@ -378,16 +381,12 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
-&iris {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 };
 
 &gpu_zap_shader {
-	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
+	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
 &pcie3 {
-- 
2.34.1


