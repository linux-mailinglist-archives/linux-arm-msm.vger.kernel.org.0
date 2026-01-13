Return-Path: <linux-arm-msm+bounces-88725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A0ED179A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D54343093B08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F41738A9C1;
	Tue, 13 Jan 2026 09:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUsqiOyA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="byGfG5yt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A77D38A9B2
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296072; cv=none; b=iMiYjWf+oYtFn76RlnKIA7bje1ygLWReerzc6/dCivtfkdjJwg9I9p1FrjsBHpAgJRKO+DGAP9QNRnxBAj9+cYAh0pPidXqye6pLeii2nP5bTmLXDhpEUazLKtfBkByivsAYY7G3ou7+pcjW5t+7LToNW5KVz5bvcxkMlOCcBOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296072; c=relaxed/simple;
	bh=RXEbaiuftN4WfQZpnRxRSWyxt4aqWkvUyEe1N/0MvHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hhnU3IwCSLwyhGnOwsXIyaqwsMEBB+E9KuGGMNCZK1Fed6Me5tZS/IM6gqP9HLwSAIq/SpQUqZW7msgUa+u1PUVZAXdD0wxTx6i4B7/l5cyInh4ofhnaV4KnZbm5p6IA8a7drxzOYxUCXjfULr3ecxvLog9lw1w7P2c6gR5TVC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUsqiOyA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=byGfG5yt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5nNU93734996
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2x6gl7UM4ir
	lhhEFgnuugLaTx/vGRAbxEZci4ghQ1KY=; b=BUsqiOyA/0C4VSsXPilLEpEYzJQ
	UPior1Rdij0LirhB9RT3hGplJvTEDm/Psxnj+KiivdWVUrTKYtdEeU0kUYp3f/Wz
	wb2dvjfrYFmk3Sp6UiS1NTBvYEWH9tY7GhAb1yp8xg2YtvXH2TK6QAJ+vkPRsAVa
	dWdLf0uMNYWKM7YS5fIR+WDpMas5IgmypXqo3U1rFvBbshqOl2OFwiEItswUZ9yl
	tcGGHlH/g4YqPAlhGjNMNuGwwZHhktubH8umPh4u9b2T25pQFPWFP/JMGLjc+Bxo
	Ft7B5xFO7lNsHhYJcV/IbnixgvEp/TqA7aRvqk2xn0LoADVDYHIkdwPLSPg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng878kya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:20:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f8e6a5de4so72483665ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768296053; x=1768900853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2x6gl7UM4irlhhEFgnuugLaTx/vGRAbxEZci4ghQ1KY=;
        b=byGfG5ytk2HMEfypKtkX9VaNB8/GkRpr4/VGAg7bbpCVWMDmX/5PpKZyGbRwqsAJRm
         wk3/lDSvC9T8qIm/aVjMsXLYDrwJ7bWcEst8SnnK1vNLkstSZqlkWX+vp24IX/23TUGN
         EMNV9dUKfqHq6mV7o12IIoMYtuZ1sC+40xk9s/U/cXP4Vi6irPMpZsLWEStc4w1OOBxj
         EGH+6viKGBxHnIYSUuAIxMiS4kk8QQfGs6kzZE0sZ7d4BV/91HgFX0NkG1LPD1hdyj+0
         Y+eTjtFUdqOfgD6MbIWHd1iACk0VKhu6vgH2qfE3GEUV6eBkf8ARJfGNNmXHWS0gPH1J
         1qpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296053; x=1768900853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2x6gl7UM4irlhhEFgnuugLaTx/vGRAbxEZci4ghQ1KY=;
        b=wvBdItvxhNDvhhD0f674IGbhnPWHOCsqCA9spAdhPnbW3yOecsqYvvly1BDQBQKDOz
         YiqHrGqi1N5A/9uBUDW7jiWfdow5dhUSGC6guGly5OyeDOZGAdHnskF2qyQMAavo6hyM
         lRbWNjAiGJH1zEEbffj8aUZVTxMxRzhD5Z7mz9TOruBNAw97bCZ5O7ixgaHmMutdUWfC
         lpBDoezZf+xMPW4J0l1J1QyMuJ9nKihajSfV/LpRGSTXl7lA00a6J/eRr9JtF+KLqg8d
         FbASmPuqNIvyeOCyYWOY16yXGt2nrWVu+5XOr/BHeI901mYVn39+5wP/SVOE7QBoxPOe
         P6/g==
X-Forwarded-Encrypted: i=1; AJvYcCXO8wxLtpobYHwtadZcfiGHaYtEerEfJOA7y9jnyEehZhoAfimuXeHqXuFlAEWzinLBfCmXzxp7Z16+1mZT@vger.kernel.org
X-Gm-Message-State: AOJu0YzP41JrpKBx3U/pePa/U5SCsQIALIYHZqzFfTPGAaflQfcR1Y3c
	TaphQSaezDZAvai1A50ArBBZpoTUsY1nZ5IjulKmm04U02T2ZDtsiuYlSqBmGfEPajh9MqsnR+B
	6dTAJDIYsOisZigGTYGSPQfYD3thgA6ZMy+wsmMAkgcGZNTWoTswrfXN+NUA+fpyMqXkN
X-Gm-Gg: AY/fxX4A9uJWlEdbma81vlm0p33sA0D+Sd9NG1lD/uhieqO6tkhK3VibnV9nbam2TlK
	q5QqphhCb4KjdO2obiqR9ZFpnxndSK+nVjuD0JALbpgpvp9BF4svS5rOTm1+oaAwR6LHrnl9QG1
	RW02AL769RswUp7C1Ogvl9iidgfUwRuzyofiThOyS/I7w61fQOUGMOW2YfeqRTDHL0v/p2M0jch
	otP1xxhz3EMdW3U8annkzYG8x6J4O//wrgVH3tyyYEiipzn/byqTwpvbKLFt0yiBSW9FGx6Gj5f
	ykiCL8aTc3NNGITllT4uZcBINSpEOjfkno10Gy5P7A6Uvm4M4RTKxM0rlfRjoqhy3KFft6q5qLT
	A4kr5DiFZBKpuyTQKWkMO7SJgUmCAOx8mHZNcHy4wbTE+rqjxFVfFQQ8UIY89Zh9fJGvmyl8CkQ
	T3PGj97UMIat18e/9Wrhjm4732/4KQ8IzeMQ+k5+Y=
X-Received: by 2002:a17:902:cf06:b0:2a0:d662:7285 with SMTP id d9443c01a7336-2a3ee33e1aamr198417995ad.0.1768296053494;
        Tue, 13 Jan 2026 01:20:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDPnzoPrXStTklTA4MBEI+FzFY0SJXLlzUhccTwmg/os1uz2t73VIY4+5ANrpyV7q11REnsA==
X-Received: by 2002:a17:902:cf06:b0:2a0:d662:7285 with SMTP id d9443c01a7336-2a3ee33e1aamr198417725ad.0.1768296052995;
        Tue, 13 Jan 2026 01:20:52 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc794asm196314945ad.70.2026.01.13.01.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:20:52 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v10 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up q6
Date: Tue, 13 Jan 2026 14:50:21 +0530
Message-Id: <20260113092021.1887980-7-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3OCBTYWx0ZWRfXx77SEE5QcThd
 NfJfy9K7TdjEHRr2vvmrZKKRja8YPpH5F+tYQzCf7n2S7kHn8KSGG+I0Rr2fvHphHKalqawgUdD
 oZEDa5sgqmFC3hP96TAbjGFIJECXqIf+6XukpQ5WtgUdT0G0s7qL5U7noMQNuUkf5QOuuqXumVi
 mNbiMSZ3+DIElKavXIf/NeFS5hrdfXYwLulaD9w8sx3vYYMRjBavcFJ0c4Tc4PjhyBf4LYFTEk0
 7cA6G2LB4wLfpRcNsm8UDXNV50j/QXiXE/o0CmcRLXidgJeZn9hU8ERIC3snMGtW0bvd0V7kNwQ
 wqOh23JOCb3WvyUys/ezIzu/JSUeU98tSvdVMZvVnsqIGKFt6HYcmeo/sxCX8GKS15szRGOLg2Y
 HMjmTnGdRaHln7ofQP84a1+62EhuNgPyywx/UwjQl9HgYvEPmv9rS1kG32aP2MdhN0h3BqYbG3/
 Jx7JOPfFOBvcYJ2fgwg==
X-Proofpoint-ORIG-GUID: IubSQg3cETMcAf8ho0Iug0c0klUtd2s4
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=69660e76 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=nG0a804IO7H6KQc07wUA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IubSQg3cETMcAf8ho0Iug0c0klUtd2s4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130078

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v9: Add R-b Konrad and Signed-off-by
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 60 ++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 86c9cb9fffc9..6d513fe6ad58 100644
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
@@ -226,6 +226,35 @@ smem@4aa00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		q6_region: wcss@4ab00000 {
+			reg = <0x0 0x4ab00000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
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
 	};
 
 	soc: soc@0 {
@@ -903,6 +932,35 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq9574-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
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
+
 		pcie1: pcie@10000000 {
 			compatible = "qcom,pcie-ipq9574";
 			reg = <0x10000000 0xf1d>,
-- 
2.34.1


