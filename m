Return-Path: <linux-arm-msm+bounces-33765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C82F997B08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 05:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EEAC1C23650
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 03:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B20D1925A3;
	Thu, 10 Oct 2024 03:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VTxXZJkR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D871917F4;
	Thu, 10 Oct 2024 03:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728529566; cv=none; b=FIcT4vfG1aF1exOUPsKpueOE0CCgW69UuETVa8SSp309LUPD+GClWsT2pR+HQI9DOMJcBizL+i6HFqM0e9oNtJkwyCjRpnWDeOgbKgRKvGEBXrj0HAI3/oRLUXWl3Ak+vMIplGfiq12dP9pwkYxzWPFAZp0Aea/BVw91KdD6F+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728529566; c=relaxed/simple;
	bh=gQTHgU72v6NobzfU99RWmbWOhxcnHToTjo0Oido5hsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UrOe4nLjnAaQfktoRIDG70CVJDZrh24QFn/qsFVvvf+hK1SKyaul6JkDaML4Zbo99T4ANcKyjXPJxqQMrHpp1KRb581rNR/Ak6hARxdCb2yYr9s/AEiyrpL+vKfGwIsIP4a743mYbN0Rns24yCNCvOosw726wyDQ8UGQFoUuB4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VTxXZJkR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1bcct030620;
	Thu, 10 Oct 2024 03:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XUB7ZziiG/ug1M0WtdopM9yIek+dOcXTHi3s59G4BXw=; b=VTxXZJkRBQURh3Ox
	CMnwyk1MKXU0w1/Fa8SXjok3wywLYQQVbyf2XWkNbeqGeNt+E5BsIu+4ofgF+tM9
	48Kfb5qgYpT9YfmLijydKTB8He8CRrlRj791NPzj1Nkw248mdgrcus012yTbcgs4
	i3loqzjZaEoDsZB9wlnboER9TI8Jd5FCwkB6CFefygzvsqsXvbcNe5HYLdChqon/
	/bDX8OfXHYZePU1I2EhfzJYQCYS5bE+erS4BewS+7cISKZ8mMVAI7zVWdRVZun9s
	Q/VqxjdAe1vDf9pInp6kbbTWmCLeFBBpy/OQ8l8aLuvaBQuqg7UdnlNuWVZ8azlp
	WgAQ/w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424x7ry41q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 03:06:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A35xKR027727
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 03:06:00 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 20:05:55 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Thu, 10 Oct 2024 11:05:36 +0800
Subject: [PATCH 1/2] arm64: dts: qcom: qcs615: add ethernet node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241010-dts_qcs615-v1-1-05f27f6ac4d3@quicinc.com>
References: <20241010-dts_qcs615-v1-0-05f27f6ac4d3@quicinc.com>
In-Reply-To: <20241010-dts_qcs615-v1-0-05f27f6ac4d3@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728529551; l=1458;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=gQTHgU72v6NobzfU99RWmbWOhxcnHToTjo0Oido5hsM=;
 b=qnpgGSbEr/l3XKTYqQXrn9KE2gkGrFYlpN99S2pNa1g0WqmE8koBCXeO7Uv0AQ1Gu5DG4M13T
 /bfJ2omXGfaAjsof/fVxjLdGVLws9UxUeq/IGqGE2Ps2j6F66nlKs6Z
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ob9M2aDsEEIsTCG6Tm2XKMSDE5iiycMc
X-Proofpoint-ORIG-GUID: Ob9M2aDsEEIsTCG6Tm2XKMSDE5iiycMc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=624 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100019

Add ethqos ethernet controller node for QCS615 SoC.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 0d8fb557cf48..ba737cd89679 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -420,6 +420,33 @@ soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
+		ethernet: ethernet@20000 {
+			compatible = "qcom,qcs615-ethqos", "qcom,sm8150-ethqos";
+			reg = <0x0 0x20000 0x0 0x10000>,
+			      <0x0 0x36000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			clocks = <&gcc GCC_EMAC_AXI_CLK>,
+			         <&gcc GCC_EMAC_SLV_AHB_CLK>,
+			         <&gcc GCC_EMAC_PTP_CLK>,
+			         <&gcc GCC_EMAC_RGMII_CLK>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
+
+			interrupts = <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+			             <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_lpi";
+
+			power-domains = <&gcc EMAC_GDSC>;
+			iommus = <&apps_smmu 0x1c0 0x0>;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <16384>;
+			tx-fifo-depth = <20480>;
+
+			status = "disabled";
+		};
+
 		gcc: clock-controller@100000 {
 			compatible = "qcom,qcs615-gcc";
 			reg = <0 0x00100000 0 0x1f0000>;

-- 
2.34.1


