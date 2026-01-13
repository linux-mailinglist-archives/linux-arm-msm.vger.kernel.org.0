Return-Path: <linux-arm-msm+bounces-88724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A571D179AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD1E330279E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CD038A9C8;
	Tue, 13 Jan 2026 09:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4djYiGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4Ywrrba"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6675A38A72F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296064; cv=none; b=EVrQgWSEJozZG6mOmQ0KBpvSSoabTSYQlnFeSvJKAqCmIzC8eDzGMbn3dNAHa5n/WnjEvSbY759N16W1JfBpZ4kRNljaQuArcs+dSmy0IGFUszdcIatZ0JXHEUmk0eHBeJ2zmJcORwFu82z4hdAc1TF0IXYWmA66Wm5NeKpUjBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296064; c=relaxed/simple;
	bh=JdAUp26u1k029dM1clb3upkxXr+n1jntFq6kpHX7GN0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u6/eQqbPgvlqp4HaNdsIEsci5ALde01I7sAMjY0DcZR7fMi65wWWHnSYlZmL2kC2Fw26hwtYeWBe58Ddg5U+qsGk2gngXNlupGUcK9M4gS14nb0vKW9xPg/2eu1Zbly17ehklxkAaWpvA6YLiAo3KFRbD+OSDuCVWLBqBf1rHQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4djYiGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4Ywrrba; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D599ti2835172
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pmdgkY+NJHC
	qIKKVVqame9s0BsDIY2GpxBhP5WwsSLM=; b=D4djYiGR3ahFCxFPGhs5uAEBgMY
	aDv9Hn132BhCvy3/tc/fDDDLrgdHJdWGXLjK7oEiZiwP8pUOKfOmfBLpzQPdlWu0
	g3rU6vGY29FQVR8qS85BYKLqKPXTDUu7E3DV3tf+pQyn55r0w6KDZpJe/Gfj3IyO
	GgLPFm1FkyqDfG7aEKUsqbZhy4e3JoUNB+w5jvAJRh0kv9f1FzP7hdh9fWDWNTw2
	hk2LSws/9X256RljaY9Zd6RoIsJii4uybrzqFn4LEcpqaLJkAZ4Y6+qK/38gzS1u
	f2aWW21FqIf4ObMZy9iiyOPOTJp3c0I7oo3FbhkKdGh7JL8pdiSxSzf9Unw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfn9rqbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:20:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f29ae883bso55331095ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768296049; x=1768900849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmdgkY+NJHCqIKKVVqame9s0BsDIY2GpxBhP5WwsSLM=;
        b=M4YwrrbarjgCydkg26Z1N3lTCEp9Iaa2GPN8lfSrRpt9QYzPsYf9YY80tNcuGsn0If
         phf6WG1biBpcE2GYnS8COnJDKXa+gzq33CkSdYa2FcC7STN8AzrgdkORa2p8Y2rkLSQz
         Ld/V5lLYpW6Rybm0kB2pO6MOReeSZrWnT2/5+/4vLNbSESHgd68Xi1875/NvIflP+w9H
         auyQ5OLnaWZueSQVX75E5ILZNUhHbkhoJcOqJo867zS9MfBB++xGD/+RfEmPNt2fQhek
         BJ844x32WpJ3f+2IX2UEnTqkqsBqH8JNkijPwBInOC7Os86eum0Q9V1ssZAA96DlpGC/
         DyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296049; x=1768900849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pmdgkY+NJHCqIKKVVqame9s0BsDIY2GpxBhP5WwsSLM=;
        b=b5u+R+dYhgAPA5OAfbh3155wHjGy/Gd0St9t2bg33a8ZRUdrOJxkW2kpmzNsjWdEK0
         l5rwmyJKcaP5tLEg/DLMqTJpeJ8KiSMfYCh1rg9V66brXj/8d951h22LTuYwBl7Ye3Fw
         tJTSp8XS4/5urxIitJWdpNgb5lMoGrFUoW8YapE1gSBdlt92ghaabDpIpSQaDWq6SaOW
         eHt4/5FwFJkzS8D8UFoKrRRoui1/2i8mjfQgCvKCQf/VdaqUbfLtGTfMzIc5YVm/9k9G
         lGMb/Wx8id1t0anWJp0dZ8DZHmzLxx5mOqUkJWGREbnovUBv6Yg4IY95YTCam39SBec6
         bMcg==
X-Forwarded-Encrypted: i=1; AJvYcCUbHfIBu1RGWmcqYIEPTU+Yb0ipT7vRFdWm3M09ale757qNeK6DWUZcoARJ/fRpTBMXhhAI5Uk/9qocrKgu@vger.kernel.org
X-Gm-Message-State: AOJu0YxD+IT6tKcRRpSMi7xj+GQpiRpB95UDGrLZ18/kWlkw4l8/Q/xs
	N3AG1ViXxj+jSgnt9HykkkmLVMo1pViSOBosUv8CpeS1LPZsHqG7ehMkTwK4CEBqH3zpSzswS89
	UX/7Q1FfJ2xxVcKAxcnRXpapTN8FN4n/tjpXv2WT8ym04tcO7Ua+QhWHWY2U6CWDXvVAo
X-Gm-Gg: AY/fxX61+CetsxQ94uXhZflpZdnOiaGZggd96joZAN6ZoqshckgCSwzCc+TCPRwQhVn
	prM2QTtgcObmZfgGVEKzj5TDJbplWbSBNizawDxNFNYHzh0gdseQU02I4T5leIlU/W13PCm9kDM
	0sFYU8YB5DyTmvSY04DZwOA0WvSunzH1nv/nxbH2IsycRuAbQl+K/E5eNcjX1QcoaLIUgSjlm8C
	ra+Saal6kSqrmd8EnSygUm+l5jvaCDqmBFBh/Hj8IGkuP6bTni/t97hsumpajQ/jGWnTbGGLQ5O
	wsYIFVNgmzKDSZoDyHqc/9Jp5MhlQ6rI/WWjSqauNwUZB346Wi8HvnR0dn2wIXkFbAEZQWGWqFn
	XK3thYDuqduNT5fbuCfJzNGl8VO7JZg8YDMEgIq/DgLAOPnb5iRjt/lm7ioy2y7oatR9HEdUa8Z
	GCtYPutWBlgBZjWc6SBtVlNKGQ6GU5vwY3EysoHR8=
X-Received: by 2002:a17:902:f64b:b0:29f:2944:9774 with SMTP id d9443c01a7336-2a3ee4c07bemr199421505ad.33.1768296049143;
        Tue, 13 Jan 2026 01:20:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdFhKiyb3NK9S9PVlVStwIfxBdf96J96mS5DZaLP16Py/RVk1oNR9194gpKAagk8eRrqs6uw==
X-Received: by 2002:a17:902:f64b:b0:29f:2944:9774 with SMTP id d9443c01a7336-2a3ee4c07bemr199421215ad.33.1768296048644;
        Tue, 13 Jan 2026 01:20:48 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc794asm196314945ad.70.2026.01.13.01.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:20:48 -0800 (PST)
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
Subject: [PATCH v10 5/6] arm64: dts: qcom: ipq5332: add nodes to bring up q6
Date: Tue, 13 Jan 2026 14:50:20 +0530
Message-Id: <20260113092021.1887980-6-varadarajan.narayanan@oss.qualcomm.com>
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
X-Proofpoint-GUID: p1hRkY3ni9zOQB60hED6b6vDx62kIFWZ
X-Proofpoint-ORIG-GUID: p1hRkY3ni9zOQB60hED6b6vDx62kIFWZ
X-Authority-Analysis: v=2.4 cv=HN/O14tv c=1 sm=1 tr=0 ts=69660e72 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=wvtPTOKNElVcqRjrzWMA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3OCBTYWx0ZWRfX9LBUAggsBPji
 NuzUgpxXkf58RTtcT22TXIRxIkPwTAgLM2t6HFSCC7hmh9ZWomjAAm0JpnRTiDXvriId6Qvm4Pb
 qqJEnx1Pt7s4rXcTpEXHxQuzbHLmS1BGPgdxfOF2983Gt5burOlTbVbSpyFlMz6FTiYmnzvMgmJ
 YiVmatizbpvQl5aw0lq+RkzfHa7m036i2ogTQaQiKOqZ9VxLQIScTny53bsuQ8ZB7ScV0BqWOnI
 3IEJZIaUE5hiCVZDPPeUJB+zI1XOETXmlYAlPNZ0gsw7xjVUgbwBXaNPCintjcsg7+A8tzTBA7y
 AugxI3JOwykJEOszpFVcWS3eDtG+yjD1uDkLO0bTqnK7NucV/stBmwn1qdEN2DyUu8UiPsMg02t
 i7VFHSMytomjbQ8WAPgmcvzBlMkQmoFP7IFzDHOmHAGR11LwL0OZw6oTUuLfTriL72M3ghom4Zp
 AgqJ2sPRy/Sx9S0hGKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
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
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 45fc512a3bab..c31b6906355e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -2,7 +2,7 @@
 /*
  * IPQ5332 device tree source
  *
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -146,6 +146,35 @@ smem@4a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		q6_region: wcss@4a900000 {
+			reg = <0x0 0x4a900000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
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
 
 	soc@0 {
@@ -586,6 +615,39 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5332-wcss-sec-pil";
+			reg = <0x0d100000 0x10000>;
+			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
+			interrupts-extended = <&intc GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
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
+			clocks = <&gcc GCC_IM_SLEEP_CLK>;
+			clock-names = "sleep";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@18000000 {
 			compatible = "qcom,pcie-ipq5332", "qcom,pcie-ipq9574";
 			reg = <0x18000000 0xf1c>,
-- 
2.34.1


