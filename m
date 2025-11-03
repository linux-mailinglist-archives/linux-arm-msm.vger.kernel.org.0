Return-Path: <linux-arm-msm+bounces-80065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DB9C2A959
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 09:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C37B3A8114
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 08:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95AD2E03EC;
	Mon,  3 Nov 2025 08:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDBvXRE7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KeJL1tiH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3090B277C81
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762158974; cv=none; b=JnZoBaGHcmGXMorY9cfS8y9EPM2DG2KKqlw7kmT2y6iUZe0G8n+jpkGGpLRTMqssD+29LekO++G8H2FJnom5qPg/yIS6a8LIbMNKlSk7pqc/27vafctedNFoqbKqB8bbnyRr1MLsCwLV2RWumol7Hj+WJ9DX4/bAklzO7nBg+Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762158974; c=relaxed/simple;
	bh=IdS6SXHIusAtp5KUe3Y9+AjGoEUlYjkheTmAl5fxO0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k9+lNIBeTeBf1qaUAGdABBN+3ywnJdrZRwUYzyIbWdTz1Af/8GGmml5QHQ2d1z9TheGu7sDrNQg8hHPud9DSCYdTO1aVdsu309IiqBuxFZlBXxUT333tgCUeFGT8z6RITs7QYuUf7x3NT1bC384AHFPvGeoZZhqiCmqcckb4rdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDBvXRE7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KeJL1tiH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A380mDp631564
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 08:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FHHbu1mL53msShGeS1bqrw
	jBYht1bcw//M+fHwQIchQ=; b=KDBvXRE7/kLZfhaM23aC4Es8wrCJWi436ZThfo
	KF1IqA2h9vlL6l2dAH8pM7vcV7WLDv38BaNz8ksS3Dqhr4Iw65FQWt4D5pujksS0
	LZ1T9er+Nefq/lxfjwEAarDTNQUTjJJ/fEE9HWE7I23Id5VWDyP5SQdFAFxUyLrd
	T2zEK/UXydPdTB3G/s+iPoUhghK9vPNkRoRCq7vBio6OTv5Qhd+/e1o3VItKQHm3
	vRo8+TzfdtGxACnTWkt4RS7ZShfcYF7NBFv7TSXHxsSdRLjH+9YRr5XkyqSJnFsj
	NS0R4wE8pM9f+2wltm40ALP3qCPfztyv2Grgcwl/HimuMNlQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57wec4wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 08:36:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a998ab7f87so2426582b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 00:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762158971; x=1762763771; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHHbu1mL53msShGeS1bqrwjBYht1bcw//M+fHwQIchQ=;
        b=KeJL1tiHTcA2W8gGcqOzUasaJEmycPvtfKBKgg6rvfGSagVGief7sLYOK0OlFuJhAx
         ijDIW7X/izWaA9leS2yqmpL98/hnk2FMMrn6CLM/5z4SuvGvm6suAwNba7/cyD5zV8w9
         5FcWuSJagS6QLODUkHnIZXvtJ6VfrA9jII1dWMgTYb0sTBwk/L4Ya1+lWA6dgdAfYCfB
         T2zROl0/X+0fPmi8TKewBuDm8w8ukWzPbvvUUqygYD8bgyC062VVtfTvKoyF4HGF2+rK
         c9gGztkX+8mJ++ncd5un5iGW2sJrXimkTOYhzC6wEQPvOTcBw8aVO8LyVrQ3nPWiTZG5
         njGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762158971; x=1762763771;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHHbu1mL53msShGeS1bqrwjBYht1bcw//M+fHwQIchQ=;
        b=kpfRSUUVN2k5XnBIgUZ+3XfjSK5acJWamvOWAFSiCa4LoJS5MbA0K5o97+6TBTjTlz
         E4qFAw3sTTByoxwrWLxbAip+AKSjWA1IJFrClB8K4wHHwZKUMmmKDI9iCndbAU0Rl0dH
         1in1Eu/TP8vt8KqnXSUeNm/Lv5Nz4yUdptZOItrjPtn5CdHHVBK5qJ8OVpyx8ptALYyx
         HPIaU1KbRAMm2x9XqCHFZmesnogiDzJAmRM2NKFc1r9UoC435eCQhSsd1snoxW3p4JBt
         Bc/UxGGIJxP0QlHGr3vb62kDHQJV0gtavQrv1NdEa2SMXZW4mTMI4aMYS0s0wXKipZFI
         nRbg==
X-Gm-Message-State: AOJu0Yy9ffRz3PaFgi4yDdEIqFft+vLtvfEHFqGsA3YCXVn9I4uTwR4+
	DIQqLMUB29o87SCIzIuazb0OZrr3qSUQjslHyNRURdm0cgaggOdqPC+IqnPNf8+Ht2BjgmYdFyw
	fA1ux3Pp2veFJBbL+synlM3x1akMktVxAb45gSSbsRNhvaba6DVQyyy9D4KJxMQTr+RMUeKRDCm
	sbznA=
X-Gm-Gg: ASbGncsfOkoYhUPlDRuhpJ9pyTb4IWyH5Qi2He/+pT4I+L8Pxb2wPLuaIHmIn00be4g
	oMDeAaEJ2zko0bvwuXJzoSYEZhkl88yaggEWiz2bbpUHIpnDd2P7dxSwpqQI2hNO+PC2/DRjE/R
	JS8OlKF79gFHuc6gWbFHMdBHXQnB2CCdSW+ZgLzIxprRuietbGl2FUbusS2taUuw+Mbe+mjVQL+
	DmIPHPHnAYmqK15uH3nAIv+0T7kIXfxpqUzuWdAjcM2hmQ2bqgZbBUSBO/evj6vFEIZ4OqhJqah
	/PWSyvkUAcr6UfKHrSL7RAkCNynY4RQARFjmplk2iH5yAR0NyBOkKaULpB4wYfylfOs7m7U5x+j
	0THLp95Lux/hatVcS78iOU4MlrsHTMuSMgOFQYbaSBCXdYlXMjup48xQ5MZTPzg==
X-Received: by 2002:a05:6a00:a24:b0:77f:50df:df36 with SMTP id d2e1a72fcca58-7a778af1ea0mr14578043b3a.18.1762158971216;
        Mon, 03 Nov 2025 00:36:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVH8BWM9D3aJunPqzSJPf2bjDS4CvbRp6lp2vqJsrfAL6inV70CBFe5S8ADyZAZL6OB82YLA==
X-Received: by 2002:a05:6a00:a24:b0:77f:50df:df36 with SMTP id d2e1a72fcca58-7a778af1ea0mr14578008b3a.18.1762158970695;
        Mon, 03 Nov 2025 00:36:10 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7aadc2fa339sm3313766b3a.71.2025.11.03.00.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 00:36:10 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 16:35:57 +0800
Subject: [PATCH] arm64: dts: qcom: kodiak: add coresight nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-add-coresight-nodes-for-sc7280-v1-1-13d503123c07@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG1pCGkC/x3NQQqDQAxA0atI1g3MjLZKr1Jc2CRqNjOSFBHEu
 zt0+Tb/n+BiKg7v5gSTXV1LroiPBmid8iKoXA0ppGeMocWJGamYuC7rD3NhcZyLoVOfhoCvQPL
 tmFLfMdTIZjLr8R98xuu6ARBgl3FwAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762158966; l=7430;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=IdS6SXHIusAtp5KUe3Y9+AjGoEUlYjkheTmAl5fxO0I=;
 b=Ch3Cso1QW1iKzrJzDjsD31ZTu2EjIu+Kgha/UlBh9CIchRwoFbYUQcQFDDI9SxT/Sdkb1LaEU
 HTPgda9+zAoBPjSogaEVMeXXIrZXJJCgkXm01FQE2zmLYS54QcRLl6C
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=6908697c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CTXohUMGNYBRon0rOZ8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: eE5cjANfe89lyqPFf8Bqa_jHm_dlvBmT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA3OCBTYWx0ZWRfX7fi5OJlpZ8Hu
 vRabxGJCkpNiQYObJ/OrTbZXO7T2sPao8WdNTFhJH47S8qEeDDYPM3MfLRZAU3gI/QknWZR232c
 Xrp4OtfYNZHOHe01bgt+KqjesGgrjn2bv09cGiGBPI0eXFHltEU/JYAgAadZ7p8DpoeVKQZjPjp
 Pzvkiinzviedg8DLIDD+dog6823BSyXG0wBxeUpsOBcM58mn31I/qTha2VU0gaPrmHBN/kKcwqJ
 D7tmByzCUQGL135S2bhG42BR4WZOdQkelD3mLXxP0CBAgqyIK4oiHLuthmBXx0Mn7cGi2n4I2MK
 Gb8zx6gfiocVyHTMAWbXwxCPgJ4DkPCWBQVx3N221LnpLM1rN6KBj6ovGwg5bvx+lMYTIAxUfWk
 rdm8xUA5TqvpWowgkmCZZNDN39bzDw==
X-Proofpoint-GUID: eE5cjANfe89lyqPFf8Bqa_jHm_dlvBmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030078

Add TPDM, TPDA, CTI and funnel coresight devices for AOSS and QDSS
blocks.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 290 +++++++++++++++++++++++++++++++++++
 1 file changed, 290 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 3ef61af2ed8a..09aba1645408 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3338,6 +3338,85 @@ stm_out: endpoint {
 			};
 		};
 
+		tpda@6004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x06004000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1c {
+					reg = <28>;
+					qdss_tpda_in28: endpoint {
+						remote-endpoint = <&spdm_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_tpda_out: endpoint {
+						remote-endpoint = <&qdss_dl_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@6005000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x06005000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					qdss_dl_funnel_in0: endpoint {
+						remote-endpoint = <&qdss_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_dl_funnel_out: endpoint {
+						remote-endpoint = <&funnel0_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@600f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x0600f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					spdm_tpdm_out: endpoint {
+						remote-endpoint = <&qdss_tpda_in28>;
+					};
+				};
+			};
+		};
+
+		cti@6010000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06010000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
 		funnel@6041000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0 0x06041000 0 0x1000>;
@@ -3357,6 +3436,14 @@ in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@6 {
+					reg = <6>;
+
+					funnel0_in6: endpoint {
+						remote-endpoint = <&qdss_dl_funnel_out>;
+					};
+				};
+
 				port@7 {
 					reg = <7>;
 					funnel0_in7: endpoint {
@@ -3471,6 +3558,38 @@ etr_in: endpoint {
 			};
 		};
 
+		cti@6b00000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06b00000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6b01000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06b01000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6b02000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06b02000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6b03000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06b03000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
 		funnel@6b04000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0 0x06b04000 0 0x1000>;
@@ -3490,6 +3609,13 @@ in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@6 {
+					reg = <6>;
+					swao_funnel_in6: endpoint {
+						remote-endpoint = <&aoss_tpda_out>;
+					};
+				};
+
 				port@7 {
 					reg = <7>;
 					swao_funnel_in: endpoint {
@@ -3548,6 +3674,170 @@ swao_replicator_in: endpoint {
 			};
 		};
 
+		tpda@6b08000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x06b08000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					aoss_tpda_in0: endpoint {
+						remote-endpoint = <&swao_prio0_tpdm_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					aoss_tpda_in1: endpoint {
+						remote-endpoint = <&swao_prio1_tpdm_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					aoss_tpda_in2: endpoint {
+						remote-endpoint = <&swao_prio2_tpdm_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					aoss_tpda_in3: endpoint {
+						remote-endpoint = <&swao_prio3_tpdm_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					aoss_tpda_in4: endpoint {
+						remote-endpoint = <&swao_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					aoss_tpda_out: endpoint {
+						remote-endpoint = <&swao_funnel_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@6b09000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06b09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio0_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@6b0a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06b0a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio1_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@6b0b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06b0b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio2_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@6b0c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06b0c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio3_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@6b0d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06b0d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in4>;
+					};
+				};
+			};
+		};
+
+		cti@6b11000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06b11000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
 		etm@7040000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07040000 0 0x1000>;

---
base-commit: 20e1dca0f0d16ca3f0937a5969a789addedc0f29
change-id: 20251103-add-coresight-nodes-for-sc7280-60ceb4dc274d

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


