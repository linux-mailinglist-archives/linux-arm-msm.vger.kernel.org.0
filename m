Return-Path: <linux-arm-msm+bounces-87670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02216CF7E5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 11:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FCF63012ABD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 10:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF1B30C372;
	Tue,  6 Jan 2026 10:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FVvN8dng";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XT06ZzjT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D529330B28
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 10:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767696883; cv=none; b=t5zKL/IrVSvY6opX4f0yTcfhI0Mv2T17uFimIel8EOEzo/g7FmKBQBp0nOEggsnqK4payhtLfR2BX8voTAgLN0Nr+6pfi0ZU7ZD/lk3+0QFRjNss3iy96tYbO9zeaPGgrnW+BHjt/aNFaWitdUX7lE8Du8Hcr5zvzKIme2QE6mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767696883; c=relaxed/simple;
	bh=JdAUp26u1k029dM1clb3upkxXr+n1jntFq6kpHX7GN0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K9ni3NB6yxCiJGccl6iJ15+kggvomZxmaifAXi5MRIuBRPK0trAzldY/ASvAsWuXxtJ0lPc4NdaH4XdNiQjl3wpC2/8oC7TiBWwVw6MWQLdPc0L3oCcD2YOyACbj9HfbAlyFV8l7x1uMpsboaA/7D+YJ27Ts9o41sQMoRSAs4Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FVvN8dng; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XT06ZzjT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AfGOV3443141
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 10:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pmdgkY+NJHC
	qIKKVVqame9s0BsDIY2GpxBhP5WwsSLM=; b=FVvN8dng+tjgAYDN2B5BHbbAdaL
	vPVUFX024rzudG6OTHuBqk3yZB3ubZAn2h5XWEYkgegh59nrXxAOKcH1s56n/95o
	oDHY1XvxY0dvexG9NDEpSx7vQ8ynbarR54Z9dWFwWqAZdq1R6RyJ0avyoacTjqwA
	6LTjDZghJi/Itbzw8xcFyR1TsqAycPgdPKkYsj0hjv2oBOjNNq2IazAFePKlA+50
	jRFUOlvu/L7v1lzmb7khro6VTDVS08ar0bxrNFSjQK4NlzTajfumC0fL2or+Sdor
	Xd+sWVlrpBNGK0ZfiWy5m2HD//1QXOXN/ZTyfkyrAVStxZFm80UrJ9HGCtg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgmnha3r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 10:54:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7d24bbb9278so1962057b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 02:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767696879; x=1768301679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmdgkY+NJHCqIKKVVqame9s0BsDIY2GpxBhP5WwsSLM=;
        b=XT06ZzjTtr1yTibOxkbM1Rxe9nSDvZnxGL5ce6ZuP+qgkSaheJbOlnb8NwT4oejytq
         1POuBaicZGQiFo37VR4eT4mmxQaJLSpAHz+Z81wZnnp3oOc1HCB3kM51tqK7H8f9Zqwo
         0VIqH249uItYP4/omSR7PydMvg3YUKxmqBtjXYc+IhF6jSd11k+DfKSFkSxf+U7kgqgn
         CQ1Syb1ZAPVobQwPtIMUKelWQXJTb9DPB9kIzVDKkTxFPwEBg/SC1/k3/BlWsRZKY3I0
         VyvXWoZnXhG16jjMdgffFABX1DVyri5dSA26H8i6+ZLD4oV+FkeEPZ7/nqSB9MuPgoYx
         JPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767696879; x=1768301679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pmdgkY+NJHCqIKKVVqame9s0BsDIY2GpxBhP5WwsSLM=;
        b=a1uVa13r6FSgrInwJ/KXhu92+iZ+TfZXZDc2EB9LWnCvHTdrLsyCk1myfp1Zt/kKF1
         hwsup7lloQhjXkFbEYDfyfzFH8/hlBVjBG63DDF0D0DYV+sH2XGzcuVpWmtmSa9CAlBs
         LXvLKENJU5JicaMu0Q0mCEoTXd3Iq+89Z8if9TBPqs5kqlDEg9ChyrvP8bg6E31ddJUT
         dJBYn20hJuoRWP+O+0LlLMBslska1XENs/NV9yWHnBiAzHg+Hf3kmZPQS683c5XiZC9r
         ouih9QvDgQbLzIwPFEb8KG5ubDXNmOtjuimvnfG00a5IgyzKoFaWVNte9MUkBqps170u
         2Vxg==
X-Forwarded-Encrypted: i=1; AJvYcCXlKxcfizxkflrvNo0moBkN7jl9gwIXjqFU3JYkRaYws/1z0MdgEABltSg7vLrMMPmqQT41Kle27rlg93So@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0tg/xIy4WW1JiniFEPNNJV/9ysoNEVKEkhk8fLf7hf7OxKehv
	389g2pXYoFxEX1Kx74X/DoVftOcscjwRD9sFL8ppCAEWXAaI1k3qn58fVxX5gb5FlDW+NxKIiDt
	b/il4QsfsddwSmrau4uelokANPEG6TULKXwwviJ3WMC2fwPKEdM6NYrQdLvCqhcNCz5I6
X-Gm-Gg: AY/fxX79yb6CEyKlptF+o9piuqKtvn+1I4AYhVATzknJc12D2RoLrfYa5twj/itVt0z
	iyZOrhr6BUt6DNq+CrEnfK9By6bhcLh0OLNddXtA94aXYGIYbM4C2bYgIRZk9YJAv6awilF5uh7
	L5DU83q6pX8i9AkzhDLyFEBNtJoe7d98OT7L4hjPtP6kAaWr1Q8TeoUpIo4XRUvTsVt8DVJ1efy
	81o2I5AuBFaOd+WRSDLexK7+iLb5rGAWYxUzDKSjcb2Sx1F4uUIgykVAgh4LwkSSpO5qQu8Oa5L
	Y7V+uX73Po2zR0b96M2PsrwCJXrazULP4NiG1SOcoHpsjdm8eYyHYxEFRByCbSD/L1ZzNqh6JgL
	MKbVeHa6LiiQEG6VR6lmnC0hShYWBXTcEECb7XG3dXu2h+ES+raL1iH6DxcRlHC2LqKttgEqwTb
	DWU8H4hjHcVcOG3Y7ziakxeWFqJym7jumAi+fT76w=
X-Received: by 2002:aa7:8893:0:b0:819:baee:ee8e with SMTP id d2e1a72fcca58-819baeefc82mr1966129b3a.0.1767696879498;
        Tue, 06 Jan 2026 02:54:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGX2GerPDQkl+6vch3c+/0Q7qVuKNyAcIUOoWr+coGBHvXMsffTIvaNw8AXD7i4U2YhPECflQ==
X-Received: by 2002:aa7:8893:0:b0:819:baee:ee8e with SMTP id d2e1a72fcca58-819baeefc82mr1966102b3a.0.1767696878958;
        Tue, 06 Jan 2026 02:54:38 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b98sm1855121b3a.20.2026.01.06.02.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:54:38 -0800 (PST)
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
Subject: [PATCH v9 5/6] arm64: dts: qcom: ipq5332: add nodes to bring up q6
Date: Tue,  6 Jan 2026 16:24:11 +0530
Message-Id: <20260106105412.3529898-6-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BQMJ8GiX-McjDH3z0WnfZ5NpCI-o0pMj
X-Proofpoint-ORIG-GUID: BQMJ8GiX-McjDH3z0WnfZ5NpCI-o0pMj
X-Authority-Analysis: v=2.4 cv=Vscuwu2n c=1 sm=1 tr=0 ts=695ce9f0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=wvtPTOKNElVcqRjrzWMA:9
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5MyBTYWx0ZWRfX7GbyyhR5w4I9
 rax+dJDdLupAm12eNtxMzHtNtF+TJXfY0PLtnjhS7AKX8ZOY/x24meyLqVw1AjG5ndfqJQleYjA
 Qiz8w9AGN+q885ODYxh8tlApQPN3eSrGqFsOwVSKwPIgBJsVe0Xwr2N5YgGw7IBcjSt3MYFixzp
 VpB6OKrKlr46UzqdIz7r9qL06dJvi9oaygGfhT3XpUdqPWJjUMUwwa2mMtTlMd6MoXe0HisNt3Q
 OH6dFAmEziljPSkDGAUqlXP7gAg3LcTiYxYCp7ehTWYUGhgqNdlj4Y7HSSUXeWaMUrhjPTNYEsN
 zHqt9ml9wjYq47IVjmPPN6fjTNYNgewi1q/OKmV8D6V2n8OlHfPJBxuAWZz6LITj6vwRGfRyzdT
 bfYtzOs4ejnP3j+w0Wk7CuhtKIlOsKdgOeUaWQgwBjHA5LPQjQeyEnyPcU2vhr7f1zRZL678GHu
 1y/MF98NYf/44PnZRZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060093

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


