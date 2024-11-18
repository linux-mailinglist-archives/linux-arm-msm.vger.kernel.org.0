Return-Path: <linux-arm-msm+bounces-38177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 998899D0A1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 08:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61935B20D4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 07:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAC21741D2;
	Mon, 18 Nov 2024 07:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oGPK6YBd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E2A170A11;
	Mon, 18 Nov 2024 07:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731914354; cv=none; b=C38429lV9ljgAOEE9TIeeOSU1nHUSoki/xqFbSSjAoXbyGTg0C6fnIi2kUTwdvw2W2uQfAKtswl7jqhALYqSCmLw8yAd0NF/plYkzIe8IMrRVpVtGxm9ZWNUa/eKY11ckTfQ4E9OV9kPvQyIr7YNOSRnKCcXVkVjQlS6MAR3cEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731914354; c=relaxed/simple;
	bh=3bxfRBHE/JIbDZV6kH/PDOaY38SWgLe6s/OxbJ26gtQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sg5c8ipjShSDyKXUTulrRerIZVSjdNyyQG5L2iy3FTZJmjpekuxPcLeJT26qPV0vYdK3k1vvoWW1J3jRyHdH38jJgz5KpS7JJesVZu+O6sHL80bJ3n/gro5RWHAxbEv3XLnWULAkXu1YMxCQmLoKl3eDbzer0lX/eRD50WwEOKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oGPK6YBd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5ResV009604;
	Mon, 18 Nov 2024 07:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2kgtJu57HdcuP3a7g0FwUcJBcvmo2vus5cIa7lTtKc4=; b=oGPK6YBdg7MPgPY5
	zqC230aeXip5cImtx+Dt7vTRdwOrjIL5Wx7uxXTxEzQ0UZsEzF9wlIYq60gQGXfS
	aZMKw2wHiK8J+F3eRQCQIt5huxfW23XO90kvbinE2os9zNLxPNkDyWng75DZ3FK1
	YHSDdcc6IroaobUS143EOOV1o07CGi9Vu8R39Zcp9e8ZV/yfkwfylYZzp7E0wPCY
	Fgm8SraUoqiimXGeXKg65tHWCj52P0MVteU8/8Tk6xt3dloIuLsjbZm5MrCAYNKX
	PfsHDEAwQDMR5O0epyEuh9Vz7LccweXcNdaWFOK43cIG65RqHhviiGNv72LflBYX
	VZgaww==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkrm3pqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 07:19:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI7J8pN029334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 07:19:08 GMT
Received: from yijiyang-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 17 Nov 2024 23:19:03 -0800
From: YijieYang <quic_yijiyang@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <quic_yijiyang@quicinc.com>
Subject: [PATCH v3 2/5] arm64: dts: qcom: qcs8300: add the first 1Gb ethernet
Date: Mon, 18 Nov 2024 15:18:43 +0800
Message-ID: <20241118071846.2964333-3-quic_yijiyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118071846.2964333-1-quic_yijiyang@quicinc.com>
References: <20241118071846.2964333-1-quic_yijiyang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oNBNv9O0dZVDdVDGS0HF2FAo-sEMMeRa
X-Proofpoint-ORIG-GUID: oNBNv9O0dZVDdVDGS0HF2FAo-sEMMeRa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=820 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411180060

From: Yijie Yang <quic_yijiyang@quicinc.com>

Add the node for the first ethernet interface on qcs8300 platform.
Add the internal SGMII/SerDes PHY node as well.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 43 +++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..bf6030d33e56 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -772,6 +772,15 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		serdes0: phy@8909000 {
+			compatible = "qcom,qcs8300-dwmac-sgmii-phy", "qcom,sa8775p-dwmac-sgmii-phy";
+			reg = <0x0 0x8909000 0x0 0xe10>;
+			clocks = <&gcc GCC_SGMI_CLKREF_EN>;
+			clock-names = "sgmi_ref";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		pmu@9091000 {
 			compatible = "qcom,qcs8300-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
 			reg = <0x0 0x9091000 0x0 0x1000>;
@@ -1308,6 +1317,40 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		ethernet0: ethernet@23040000 {
+			compatible = "qcom,qcs8300-ethqos", "qcom,sa8775p-ethqos";
+			reg = <0x0 0x23040000 0x0 0x10000>,
+			      <0x0 0x23056000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+			             <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "sfty";
+
+			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
+			         <&gcc GCC_EMAC0_SLV_AHB_CLK>,
+			         <&gcc GCC_EMAC0_PTP_CLK>,
+			         <&gcc GCC_EMAC0_PHY_AUX_CLK>;
+			clock-names = "stmmaceth",
+			              "pclk",
+			              "ptp_ref",
+			              "phyaux";
+			power-domains = <&gcc GCC_EMAC0_GDSC>;
+
+			phys = <&serdes0>;
+			phy-names = "serdes";
+
+			iommus = <&apps_smmu 0x120 0xf>;
+			dma-coherent;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <16384>;
+			tx-fifo-depth = <20480>;
+
+			status = "disabled";
+		};
+
 		nspa_noc: interconnect@260c0000 {
 			compatible = "qcom,qcs8300-nspa-noc";
 			reg = <0x0 0x260c0000 0x0 0x16080>;
-- 
2.34.1


