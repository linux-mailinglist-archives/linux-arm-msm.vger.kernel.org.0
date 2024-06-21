Return-Path: <linux-arm-msm+bounces-23579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 841D991247F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 13:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A76D41C25846
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 11:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89FA17BB32;
	Fri, 21 Jun 2024 11:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X+hWPMkh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F883179957;
	Fri, 21 Jun 2024 11:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718970512; cv=none; b=GqIV4/IqoOqvOg16ssal/VGY/3MmC2mlBEAql9sGIpYd45VCYrc9dGu+pxWsuLuZFYyO2V2vGXm/6Wo2hiG95k/2wl9WUxVh1rBuvujCh0cUb0v9b6f2MLW8K6ZzSkq0khySTzrCY9MnnO84zuixktdUbrDXWk5JhpMqwZBCeF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718970512; c=relaxed/simple;
	bh=kK+CYhDBwSYd9RKteb5Hl+5P8kIGVSm0CknTCQDEf18=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q/gXEydTgMm+/cRgkWJyVqgWPahAKlcwcAvN/CEZKtipV3XLGzh0nTsdrv1XoTt5PaOOuzuFpeEd7kzn+QHPW/78A+3C/vp4M+MCl2YITFWpnB5W8Jb1U9X6LFsMwS1eL9HaxVINDNExuzERYYCfeJwyP92X6Dhb0rXAMGtk+90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X+hWPMkh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L6SHvJ002676;
	Fri, 21 Jun 2024 11:48:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bf7KhiWfBHaoT2Nru7+lMffsO3Gffx0fXUz+3Wj4GyQ=; b=X+hWPMkhr4+LBlqj
	hIwV8Uk4f4ghstc7SWUup01eE8DuYsHrYVTMdNm0LDJbrbOOmNffNZCWU36eXqoJ
	2ksokARlymxhq/i6odZ/L1yU3B5f0Mi9WxYynIUxv1J9uT5Jry1poRhCPP9zEIwT
	GPWFrl65TUm8/zoosRR63h4j9MITbhU0/4jIoU5Jv5LgshBvNgjR2/o/HViJ+TEp
	4eaZVGcvNvvCfyDu/6HjscB6RWHyJTjUah/6Ho/lYyxkrx5rR67TG74yzrrNxL1H
	gx2MQhdw1GS4EV7ZHt4RtVY8nttp7KJeUFKCwD0D6LvCZ0fQ40tRimEqPxOrUPBf
	pzKR9g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yw49eru39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 11:48:02 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LBm1nl024358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 11:48:01 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Jun 2024 04:47:56 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <sboyd@kernel.org>, <andersson@kernel.org>, <bjorn.andersson@linaro.org>,
        <david.brown@linaro.org>, <devicetree@vger.kernel.org>,
        <jassisinghbrar@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <mark.rutland@arm.com>,
        <mturquette@baylibre.com>, <ohad@wizery.com>, <robh@kernel.org>,
        <sricharan@codeaurora.org>
CC: <gokulsri@codeaurora.org>
Subject: [PATCH v9 8/8] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
Date: Fri, 21 Jun 2024 17:16:59 +0530
Message-ID: <20240621114659.2958170-9-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: K4y2fgFGU1hyP4QDY9A8qD4or23a2v4Q
X-Proofpoint-GUID: K4y2fgFGU1hyP4QDY9A8qD4or23a2v4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=984
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210087

Enable remoteproc WCSS PIL driver with glink. Also,
configure shared memory and enables smp2p required for IPC.

Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 80 +++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 92682d3c9478..b98766cce0d6 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -108,6 +108,12 @@ memory@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x400000>;
 			no-map;
 		};
+
+		q6_region: memory@4b000000 {
+			no-map;
+			reg = <0x0 0x4b000000 0x0 0x5f00000>;
+		};
+
 	};
 
 	firmware {
@@ -117,6 +123,30 @@ scm {
 		};
 	};
 
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
+	};
+
 	soc: soc@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -824,6 +854,56 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq8074-wcss-pil";
+			reg = <0x0cd00000 0x4040>,
+			      <0x004ab000 0x20>;
+			reg-names = "qdsp6",
+				    "rmb";
+			qca,auto-restart;
+			qca,extended-intc;
+			interrupts-extended = <&intc 0 325 1>,
+					      <&wcss_smp2p_in 0 0>,
+					      <&wcss_smp2p_in 1 0>,
+					      <&wcss_smp2p_in 2 0>,
+					      <&wcss_smp2p_in 3 0>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			resets = <&gcc GCC_WCSSAON_RESET>,
+				 <&gcc GCC_WCSS_BCR>,
+				 <&gcc GCC_WCSS_Q6_BCR>;
+
+			reset-names = "wcss_aon_reset",
+				      "wcss_reset",
+				      "wcss_q6_reset";
+
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "prng";
+
+			qcom,halt-regs = <&tcsr 0xa000 0xd000 0xe000>;
+
+			qcom,smem-states = <&wcss_smp2p_out 0>,
+					   <&wcss_smp2p_out 1>;
+			qcom,smem-state-names = "shutdown",
+						"stop";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+
+				rpm_requests {
+					qcom,glink-channels = "rpm_requests";
+				};
+			};
+		};
+
 		pcie1: pcie@10000000 {
 			compatible = "qcom,pcie-ipq8074";
 			reg = <0x10000000 0xf1d>,
-- 
2.34.1


