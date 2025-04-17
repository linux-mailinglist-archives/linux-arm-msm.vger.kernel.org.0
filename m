Return-Path: <linux-arm-msm+bounces-54611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D493A913CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 08:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3382C3AE898
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 06:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E956D1F416D;
	Thu, 17 Apr 2025 06:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lrAx2peY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8EF1F4720
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870395; cv=none; b=tGRyjUHUgL3cS+RZPv/7hunfIfsXzmhrKTM5Wstc14Y/Lq6JQVvrJIDPuVT+Eqlgu3FNrMqBbt39BJvvFA/4KfQOUw+3lhdi1euo6C+ovUUiWeh8/U7yTIvryCTFZuHTaA6kb+5lWgqSIg0agIWOcaiB2O7mK4/E0iu0z8V3oLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870395; c=relaxed/simple;
	bh=5wEKSaaIElIrln7MKj0H/8fe0RJx/DulNpStYJPl65E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=quPiwqoXWQxczigreFQ55CRue43QEyPpWtRUiDIvj/5e+U0gnypp8y5Hzpjn92EuHHx3ANR4h/bvJZSq2YKOSYo2vutC+sfnRIjonMgOKUEByNr6j5w2b0ASMp26wQG3lO6RnNHpJ03V944M+nEUDWxcvqzjpY3Cq6TcUt0Nyjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrAx2peY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5l6cf009482
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k/A1762tIbG
	XzcJCFvgZRsnEsolyVs/jKUdui8SuRg4=; b=lrAx2peYSsz1xu1D9QPr0Sdgm2/
	cDUU/lzV98V0N1ID2v94SgLNreIBqMO/+wql4KfgvI/cN/pQsEOTJlOTJ0ko3IaW
	tPdnagWDAwmFcgAiBFK+IMLZNYntMFD2Icve1BPIE3CGtgVZ/pSDjI2mXwt/C0TC
	5biCly/vGLjniAJdlJ9R1BJSU/l3d2vNOtQii3KUNY3k0L4KBnoFAN0TlWcc98HG
	mfj2H0fJglOb0x+Pzu8NvBAbmLhCudzCdiKDdOY2w7JjvjvDAE/aU3oSPgsATiq/
	wzzIBedG0lQ9qoY6hieaA4N4O3bfCtCEhNBRXFB6KRSNJaUKaUa3OTPgJvQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvb4c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:13:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2262051205aso4094045ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744870393; x=1745475193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/A1762tIbGXzcJCFvgZRsnEsolyVs/jKUdui8SuRg4=;
        b=cDqTBYZX1mD2YXUyTlk2M3Q6lRcFhHMgc+vdkKX+wj5HCIoj/Bq2tuBVhKCtQOSIKx
         mFFhNZVu+alCYD5t8q8UdMApFpLxwobNyuNmfg4UE98dPE2eAvfagCzlzf0o/GiEC2Pt
         DQ3wipV0dVQvDAU47+W+515whn8L5OUpXdIOBfCMT+e6GY43pkyHkv9GZ6KR9Ta5IgMr
         VOJsUMhqj++oHsKbbSEsN4+dzBpfLAs9A0T+JmetvUtJ+tegFMA2LKuTv1JkSUk9dYRO
         7tBk9RqanZYBQwCFCshugDqrd8Uiwr6NKeId/b5WhOPLdde9r8Ydumg76ANY1bGmSKc2
         TTDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrX6m0IJ2pPRym9iv2BfOOfzJaWOeXM7O1VP8GBD7z92nthB+Hb1d8FBL/3u8VwS0wEXfi4dQdNxP3gMLB@vger.kernel.org
X-Gm-Message-State: AOJu0YyHzwuHSIQgbPtux/Q85GZqkmW5Ilaylovqc7GuuLpVVhSJrR7H
	FPGgNjWxGAB3DdABrsEJjuFQPSGX+2qvW7rhuHK4Jm/o0a5fw6hfmXBXqYtpnl8B+NhCkNLm/R+
	iiNGqTCs3puzATLqcfLNTQctrd1AVYkbLa6wx1RNLyIlQj1t6gLbtEhEg8DmMK2Qk
X-Gm-Gg: ASbGncvAkm0Gg5PfqDJAdic/dgN5ph5nCsTtqsbG3SQArMOzu765qPxLA22NFllPw8z
	PBaVhbEcsSD9HfvU9wNFW9oclMuu1pQi9y7RLdaeu72nQTxSnQlH28SgmLvZizkQdR14BqLUMs0
	AF6ttxDV79bBfML5/nwvI3tNLGdeYKSe+uGByqZ+oAbDo4JYFsJZIDCZQu+kZnS8oRM6pQBQbJP
	OvyaZgPCu7UnoSD3wXIK3yZowv1+y9bvH5mszKYsan54TCv4pycY8mBOHZx+ULDspqYvy7VEx+4
	yQw0jjqDNba15Pehusd+t4d0ZsDp7eBqMhnlA/eW6ROzg3qp7oFIAITqmI9v40+idek7KzO2qp5
	qkPjofFK9YH2u1GASyso0SZ62CLwlsxuiLNI=
X-Received: by 2002:a17:903:110c:b0:224:2524:3047 with SMTP id d9443c01a7336-22c3590cf9fmr74412595ad.26.1744870392806;
        Wed, 16 Apr 2025 23:13:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsl4FFXYlgtOzHcMaK7cxloCi/PaC2flZVw/c8ba7KC1YuY+tSK7ZSPg1detoPP8IsNEWg9w==
X-Received: by 2002:a17:903:110c:b0:224:2524:3047 with SMTP id d9443c01a7336-22c3590cf9fmr74412325ad.26.1744870392406;
        Wed, 16 Apr 2025 23:13:12 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcee11sm25159725ad.191.2025.04.16.23.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 23:13:12 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V5 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up q6
Date: Thu, 17 Apr 2025 11:42:45 +0530
Message-Id: <20250417061245.497803-7-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TwlJ20p9pyodoHK2644tsOmh7MEmVHJ0
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=68009bf9 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=nG0a804IO7H6KQc07wUA:9 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: TwlJ20p9pyodoHK2644tsOmh7MEmVHJ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=917
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170046

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
changes since v3:
        - fixed firmware-name to use .mbn format

 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 60 ++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index db69bff41afa..ae34894d90ef 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -3,7 +3,7 @@
  * IPQ9574 SoC device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -226,6 +226,11 @@ smem@4aa00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		q6_region: wcss@4ab00000 {
+			reg = <0x0 0x4ab00000 0x0 0x2b00000>;
+			no-map;
+		};
 	};
 
 	soc: soc@0 {
@@ -1251,6 +1256,35 @@ nsscc: clock-controller@39b00000 {
 			#reset-cells = <1>;
 			#interconnect-cells = <1>;
 		};
+
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq9574-wcss-sec-pil";
+			reg = <0x0cd00000 0x4040>;
+			firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
 	};
 
 	thermal-zones {
@@ -1482,4 +1516,28 @@ timer {
 			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
 };
-- 
2.34.1


