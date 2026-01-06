Return-Path: <linux-arm-msm+bounces-87669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC1CF7E64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 11:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8B033043796
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 10:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623EF330D3B;
	Tue,  6 Jan 2026 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzEVWMFM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZ8+JGJS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DB532ED34
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 10:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767696878; cv=none; b=AgJkdU5PhSR4/e4JDgvROsUunSUl85Gp6A++AeJeij1X53oREQX+MDA1kV6QB1hsbcvT4pAZF9MAIFnAzHZA2Uf0EWhJ/Ax5siK7+VxN2Uv97ff19Fi3D/Euti6wNQFF89AOU9Hf4R7gFvxke6GvAeEXdhXrkrpCtBzLX9ZCZPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767696878; c=relaxed/simple;
	bh=blcX1nouYNXC6ol/gZDD5PA42jcTWn6mTJAJP1lU+68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mPv6SPbfcnD7JsSj4iZxcdrZc8Nj9qr+7IYHM/XA5Hs/1yR+z3I/CaV0A0vmhnKyJFP8XoOHRrKBt6SlxhzIffeUqhreo9Sy7tjdgkF5sc+tTN1kRrliOI8qgE5tUmGnCIFeHijiExvJ1AdVUVMXr7SyXjQdVtZdrrGAs4ydqSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzEVWMFM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZ8+JGJS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AFm9J3271888
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 10:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JegHHkHOmY4
	/gMghUonjYHVmA1DHiOImuLkaeQyWjyA=; b=CzEVWMFMICO8/Q4bAgMAeAWytfS
	ATkn3VB7Qwj+LwpOqaX4fWxDTT3bGbnJuyfxYAaTuw7S2EWcKZLbfR+BERoJXzll
	FmPH5rbdGSgklxK/kYJHNC/mRdaAntLIICbl/S610yKkbMh7J3xgtGB4C2G0zI77
	OtVDBCgSRCFFcvSzwOXakbMcmigUqTcQ9WWZAWa8s7I0USA0J2uucDhKzGqYbh5/
	OUZhRwK2E6BsojNEzSiCq9usdl3sEtEsaDwP32rkks52N/F/0wXqfvvtKz13J/7P
	lwiwyJAlBOvPP90YMJkO4+9zHajWSahoJE36zDOCWB8QaXESzspja8ey1Hg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv030qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 10:54:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c21341f56so2579362a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 02:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767696875; x=1768301675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JegHHkHOmY4/gMghUonjYHVmA1DHiOImuLkaeQyWjyA=;
        b=NZ8+JGJS5uX2zKwKkQnXwe4XEU0Jvs6bHCz77DPH6m00a1W1BIq5d/dZxIsop7k/2I
         zqW5evHVfCLtMx4bxdMPZBpQoDfzHYaDRmd86dH6fgnHGzmlfZaxAMFQ35UeNHnMnx8E
         Nxm76avdgTtfHXWdrvCArudGnQu4tu0FxVmM7DpvLBExktGVNo386vCrLEM5EolmKSgJ
         XETEH8ZQAOVKIATwJEk5vgo2/PpK3OuD/LiVoJ4V30gvYXvL5UkuH2P/hzkYvq9ypfCu
         gf0QYBI2OqIsYvdNvu7pN0lai6ube/sQ5H34TZnFaF3AIQKC8cn2m+7JqsxxisWv1XGp
         FbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767696875; x=1768301675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JegHHkHOmY4/gMghUonjYHVmA1DHiOImuLkaeQyWjyA=;
        b=AuGCikgRSn3ijwgtYPWoekmgRTMu14ldF0xATSOHyJYq4fmtA5sphTr4r7is4stlvy
         oRl4I9mkdqcQUB2UifJKEfee9ehvbXh5GKTbp6raaN6tkzM/RnxDZW4VwSqgllAV4MwB
         p1WCpviQ2rdPn9hgBR7lgCsxhnFMKkY0NXNUa8tc+pPVxXCqsm8BkCP5mVV7ot3INC55
         wfb0QUzdQZtyx1MF0Huu0pylPrYhKO2PO1tQ2Ej5Ev+8fUlelsT9bdTyd4NHcYxG6Z0j
         xt+9fRRpA7Y5JcMwVnw8C9taTSvw6MKWKudg3njK7/VuhWRp+mAZitjpVSjh8O4Hz6OF
         Tkog==
X-Forwarded-Encrypted: i=1; AJvYcCVPLkhICMJT8Q9sgCPfuIuVrGUML2JaGx3gfrNc+UhcTx2R4uoUO0COpFg96lt4Dsqw4FF7Y6FEXpY1bsAa@vger.kernel.org
X-Gm-Message-State: AOJu0YzS5DcPtlN5ooB+oiJ4RLUFwJcNyZ7FW9XBxkRfw+HKy9I9cwTj
	25DRgJIsFIF05ZNHmfi+KwqD5fUdyWHduEo08Sz4xZJoEY0h29/jGbcAYcKWOnl1qAliAd2ojCm
	0oLTXTq3VCpJbe3g2iW3tRzbM1b7oTABZLhV2ONMn+ZcKqmPHiuIfYlDRf0wCMNogQBKw
X-Gm-Gg: AY/fxX6OhsMOkRzc2Ti3vl6OukPRaHWmmlHMQ+ArrUKjh2kynHFpSM1FiDoB9vGBJTk
	j2r9j0Y2LkcqraYAkT5qzrU5mChEHwq7TvY53VfbtMjRxCqppxpJBCgFA6QIbSdgswjzqZoV41w
	+nH9GR+XRIItn2L33z3aHNN0HgTjgPlRCFUU5ubO9nR6Jt0BzoYb5Eo7AUopYYVeJ96iu0t1RBI
	a+cH3BtuW53gCpCwmciSQTOqqSDll9bY0J2akuT6oQdmxYTlRR1mxfQoHIY5FTZldGY+rPipEdn
	RmrQX+wJQ6kOWtLJY/6C/xOizrNVCwFO5Vyq01BpSRmP8AbHyoAq64SL9fRExIYyPvQekJ3HTw9
	rA2u9fEQTI4jsTaGcdijSIYnUD0QRZZhPF1dl9pnmhnsvWMR65MJJx1lev1DURZRQF2ltpMPvZQ
	MdeSLnB6WTDH+jg/mrc73dKBslw1qRgnQoUznvK0A=
X-Received: by 2002:a17:90b:254b:b0:336:9dcf:ed14 with SMTP id 98e67ed59e1d1-34f5f2fb28emr1979022a91.23.1767696875160;
        Tue, 06 Jan 2026 02:54:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH24Y+VI2/JRT98gY42T5Rh/eAzRgd2+jme58pQ62UuGpcFMVyizG4IRQNsPYhUzhuBi3wREw==
X-Received: by 2002:a17:90b:254b:b0:336:9dcf:ed14 with SMTP id 98e67ed59e1d1-34f5f2fb28emr1978998a91.23.1767696874693;
        Tue, 06 Jan 2026 02:54:34 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b98sm1855121b3a.20.2026.01.06.02.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:54:34 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v9 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up q6
Date: Tue,  6 Jan 2026 16:24:10 +0530
Message-Id: <20260106105412.3529898-5-varadarajan.narayanan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695ce9eb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=etOpb5xliKOozrl2HNYA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: xtGu7R0lcVaajUzN0viAlxa01LagqzrN
X-Proofpoint-ORIG-GUID: xtGu7R0lcVaajUzN0viAlxa01LagqzrN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5MyBTYWx0ZWRfXzg8tU7Yno8u1
 iljt64NTrgiYgKOU/CP1XlMmeLjWoGduFHNbVcY8GCtvB90jK0IMvgLcZn5eO5ezWrjYHBmP8Lk
 H89AUd0xbN8AiIlXWxQ9+b5HJ2W/Vbb1qE+wRSawEmjHcDquffL8wCgwLbvTqnb4fJrm5X51jGJ
 l88Ndp23265r5xWqS1h/IIFTcLopU/VQULrhSYN1seMgSIPHpB7HPZG9JDLHpMuYgQgJQ49f8ro
 swkwhYPhQS42x0gtc84GR3CC2IMNg/mT6E7QnUEGlY+bFgJZf7Gdkdnchh9m/wpD6teUhwuvAHM
 qD1Z0KnqwOFdsQrDc3kc9fq7qjOna4/N9EJmvsOTS5qzqHU+zAxjdr9z6cz6PRtq7qZnZTLSijr
 hG8oLYl6DuVEMT7y49o10K/MWHd3GXIDQBlQh1glkXiskFh/JGOJT22PJ538a2r6mGLam/PGzCl
 q0l+OYoy0mL5sVlYm9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060093

From: George Moussalem <george.moussalem@outlook.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v8: Swap the order of the items in 'qcom,smem-state-names" to resolve dt-bindings-check error
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 64 +++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index f024b3cba33f..d077f0ed9e46 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -158,6 +158,35 @@ tz_region: tz@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x200000>;
 			no-map;
 		};
+
+		q6_region: wcss@4b000000 {
+			no-map;
+			reg = <0x0 0x4b000000 0x0 0x1b00000>;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -717,6 +746,41 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq5018-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_SLEEP_CLK_SRC>,
+				 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>;
+			clock-names = "sleep",
+				      "interconnect";
+
+			qcom,smem-states = <&wcss_smp2p_out 1>,
+					   <&wcss_smp2p_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@80000000 {
 			compatible = "qcom,pcie-ipq5018";
 			reg = <0x80000000 0xf1d>,
-- 
2.34.1


