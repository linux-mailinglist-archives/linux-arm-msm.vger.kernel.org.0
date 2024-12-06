Return-Path: <linux-arm-msm+bounces-40638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAA89E6371
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 02:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D20131884E4D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 01:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3327113C677;
	Fri,  6 Dec 2024 01:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jtQqeMK/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D081A269;
	Fri,  6 Dec 2024 01:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733448971; cv=none; b=cMmy2irOsSj0QXjkwYP8w8UQjy2AtXsybfg9RIkz4ywr005XvL7JvgJqFYMVrnwRO5z7IL6UMjuzovGMFKYvTx5nF9u2gAQ6fO37yIx2L3mTQNcYOqwf3c9o6IACq7Wc1ZynvJwcJLsY+cHun4zOLjsWSLaQE/WmWtU2vckgRhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733448971; c=relaxed/simple;
	bh=5MW0SX0A9kAKllCDwhphLy7UFNK4MPJnB6Q/RSldtmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=L4spexaDsY691Ko8tFWOFNlqnG1qx+wfxITJpsXn+k/1wqnMWN5Xrh5Z1FL4CzBGziEFCOaY3j7/96KlJQFA1ieqlXLw4SRi0vgdoe6RZyGzLs+fdM+tuuu6cLLEZGAg6RhdEIVvZq3auhexTXTEF0Ku87YPj7GUnvuENVkSK/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jtQqeMK/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaN3L031102;
	Fri, 6 Dec 2024 01:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XgzHSRMcOFi0aKpi8BombL8Fol2V4Pq7g5V9h9w4sek=; b=jtQqeMK/LDlJWHcV
	29Tldh/U4ox9NNPfWW88sB/Suf8TcgvDE107LcPNK71qlT8jmuPs4jk+PtVQOrb8
	e9r047cpCvufxdBK2DWzdSV9bb2sHC7yQ/37fJkaM5LwF91TFy1pYIrjOOlvYY2L
	T+N+oQPHCn1Pz+tl2wZp5APQCMFYuDCsJOz93pH+zUmNSBh03v1eLlAvZq6ymnac
	6RXKNKX+JFynvo0LaGJ2svtcso6VVLxfjJYOAVQDd3FyLkUr92hUdaBVxsHZySDq
	yhYbZUpv92lpECdF4MzlcMD4B+ISO1uRf+lCQx0jVHXIfU79SFG+NAu3j+CQocT2
	SduolA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be171gqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 01:36:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B61a0LB016843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 01:36:00 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 17:35:56 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Fri, 6 Dec 2024 09:35:04 +0800
Subject: [PATCH v5 1/2] arm64: dts: qcom: qcs8300: add the first 2.5G
 ethernet
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241206-dts_qcs8300-v5-1-422e4fda292d@quicinc.com>
References: <20241206-dts_qcs8300-v5-0-422e4fda292d@quicinc.com>
In-Reply-To: <20241206-dts_qcs8300-v5-0-422e4fda292d@quicinc.com>
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
        Yijie Yang
	<quic_yijiyang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733448951; l=2280;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=5MW0SX0A9kAKllCDwhphLy7UFNK4MPJnB6Q/RSldtmw=;
 b=KdDeePnsQ6MjpFUdH+UH0VQEeYTJRlw41Y6gYIIPSmIR+RDVj+Q7DPbMafxK/vlT9exF3ej/u
 dWiBIv3L/1kC/yYy2cGg8hC8YxQwwZ+pQYs9zFAFDOR9FIEJoLwb+wW
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: powJX0FEPQyeUTnqzBAGFiWHBCT5MMuv
X-Proofpoint-ORIG-GUID: powJX0FEPQyeUTnqzBAGFiWHBCT5MMuv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=757 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060012

Add the node for the first ethernet interface on qcs8300 platform.
Add the internal SGMII/SerDes PHY node as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f289d5e2e57e0e30ef5e17cd1286188..4e37a3ed29f302192dfb37e1489ec325c84d6ea8 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -772,6 +772,15 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		serdes0: phy@8909000 {
+			compatible = "qcom,qcs8300-dwmac-sgmii-phy", "qcom,sa8775p-dwmac-sgmii-phy";
+			reg = <0x0 0x08909000 0x0 0x00000e10>;
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
+			reg = <0x0 0x23040000 0x0 0x00010000>,
+			      <0x0 0x23056000 0x0 0x00000100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "sfty";
+
+			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
+				 <&gcc GCC_EMAC0_SLV_AHB_CLK>,
+				 <&gcc GCC_EMAC0_PTP_CLK>,
+				 <&gcc GCC_EMAC0_PHY_AUX_CLK>;
+			clock-names = "stmmaceth",
+				      "pclk",
+				      "ptp_ref",
+				      "phyaux";
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


