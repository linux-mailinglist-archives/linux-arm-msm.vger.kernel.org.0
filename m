Return-Path: <linux-arm-msm+bounces-33758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD11997AD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 04:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DEC51C2376B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 02:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3F21885A4;
	Thu, 10 Oct 2024 02:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e6NnE8AH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15767179A3;
	Thu, 10 Oct 2024 02:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728529068; cv=none; b=cVGFK3S6vhnW13XpfTARZpYtlIIJ4lgLooXuv59X7SvYSeVE84uq+uqZwwgjVP5WcBh/O7Mixr0LnnWF5oLJzzTNxYcVDDk0H3s2zYkMrF3IFJfUvUmyWFzPdK4j77mQP81wz0ak7NnYjX/8erFXPlskpHou6kZAN+GAbPg6IzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728529068; c=relaxed/simple;
	bh=iaqSMLc3QNBuxVTN1N+Fj3j3TlNbzdkT0nZ9xBlyk6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ER3bmGrMGcgPYj36Xl+NxBxyzsRo9akdtsS17NOeEDXzsSWr5T6spg4Lal2lbDfpM3tcHEAQjc1aofhCqIZ9ncwxkUrGZPpkvebQbyne7y1CB9m87C9zAW3dzNt53fnC/DqsWcnzaXj+it3WvCoC0oUxb0hEnG8gpB2yMFD8N3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e6NnE8AH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1bNZH022439;
	Thu, 10 Oct 2024 02:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4+hgc1LVw70QJY+V4ECEEzJXp70/fdYXvje7yF07JY=; b=e6NnE8AHFodXp9xT
	lnebs9IzvhQWGmSfYomPbuFakd9W56ywHeLjJEiECEFWue9BZQspYQCSlk/b1k3W
	pDrq37PQ6Qkiom4YTdx6S6enVNPeN6tnTceG8XxpOAsdJ94tEfjl+Ep5CptVr0ka
	2iOr818iJDdjbsd2eK/DX5QjuDXB/mbIV/aeomWZqHeM2GYVb5qutEbzdvxcLvLH
	EfxGfdv3G2eZvQagAtYIzr2N6nohLklA9vYFq2ow3lYt1Arr03Ay7YUOsZ+Wi0r4
	BIv7D9ynuEwLunZGvAk/2bfNg91CasdGH33pUNyDnnbSXxCV1p2t4m8zCBoN3tIl
	sLtZTA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425xpts2x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:57:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A2vfQ7017578
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:57:41 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 19:57:36 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Thu, 10 Oct 2024 10:57:16 +0800
Subject: [PATCH 2/5] arm64: dts: qcom: qcs8300: add the first 1Gb ethernet
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241010-dts_qcs8300-v1-2-bf5acf05830b@quicinc.com>
References: <20241010-dts_qcs8300-v1-0-bf5acf05830b@quicinc.com>
In-Reply-To: <20241010-dts_qcs8300-v1-0-bf5acf05830b@quicinc.com>
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
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728529047; l=2198;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=iaqSMLc3QNBuxVTN1N+Fj3j3TlNbzdkT0nZ9xBlyk6Q=;
 b=rVok7YNyjTpEjLbBE2hzPqODH0DGWafWQ6mZK5EpiVTNY04IsICy3g74ioOl7h003c0SI4eDx
 jJFYB1pGgADDSf2gLZ8bDbzomjNL6+jvLMPkgfV/WEiPIrHWTNrUx7J
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kR47oiugNYvkBvSbU8gK1sfk_C1hSMvK
X-Proofpoint-GUID: kR47oiugNYvkBvSbU8gK1sfk_C1hSMvK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=710 lowpriorityscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100018

Add the node for the first ethernet interface on qcs8300 platform.
Add the internal SGMII/SerDes PHY node as well.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 43 +++++++++++++++++++++++++++++++++++
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


