Return-Path: <linux-arm-msm+bounces-22827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF44190AA30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 11:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C665B219B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 09:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50FD194AF2;
	Mon, 17 Jun 2024 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E9iVFzS6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401301940B9;
	Mon, 17 Jun 2024 09:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616960; cv=none; b=oXOVPJmifOGHp09E84PcozAQP/Z4BOGGZLqYBq+BuDw5C+D3r4LgO4fizVWcTqvAHx+07lbX13SbSZ5fDtsnyfdIJ0vjOH+yeB0+xdotGlPN9QE7Nn9oB0Zk555A5Xuh5AtYze7TKMeQTp9nv5ztX1wEXWnG30AQ8CsvnB6nx+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616960; c=relaxed/simple;
	bh=ci2/fwb/ESVvkzh4G1Jj0Z+5xcYFSQ4vum1bYkwnW0E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KtM972i4vht7dobk7ma2LGbhANBVwtgKZqev5XSS8fNT9xz+FbjKk5A/Gn+QOfBbK5TvUeLPdo+GUa8OJEf9vVYTuECDYq2KwOyJI62rnmta9uLlXTLbpBkE4uvUzf5LNb0BgPJibYekKyCtseKgosJdGReE8WODAlNj3IdZ+Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E9iVFzS6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H0kddE008599;
	Mon, 17 Jun 2024 09:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBmxvmcWo4A0c+cTMLkp/mM6HExYTUV2++NUJHhy6x8=; b=E9iVFzS65j5MJ++Z
	2kGJVXc+btPOI25D5NHKpgfejl2cE4X2lyPVskwuIY+aX+tvUSnvj+cw0tgMVMQC
	5bYVXMOAv5dfJII4ER/+vUrXlvJ3FF/wqtXIAwibISiMFdqL9NJ/6rnH15qVRytD
	0Dn+y8gxQjcDN20e/hXPJhYyA89wHolQDDXcO7r2fPPgQejlei2048coI6Zd78++
	v3WNJb3ZLgMPjbZLcPxQOw3etzKsZ1SWUiWt+/BMYt50A5utBzlyMHkTyO7Hbhbk
	yOUusB2xCaoS5yy9zUgZ6HG7BiXk20Zy/lSFvKeky+RWuMKQnMmv9FLrcHnJZt/q
	SyZG/g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys1y6u99h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:35:55 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45H9Zs6H003088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:35:54 GMT
Received: from hu-nainmeht-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Jun 2024 02:35:50 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH v2 4/5] arm64: dts: qcom: sdx75: Add remoteproc node
Date: Mon, 17 Jun 2024 15:04:27 +0530
Message-ID: <20240617093428.3616194-5-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617093428.3616194-1-quic_nainmeht@quicinc.com>
References: <20240617093428.3616194-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iifP_49_xVWUu307k74eir_EWq_GdFvQ
X-Proofpoint-ORIG-GUID: iifP_49_xVWUu307k74eir_EWq_GdFvQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_08,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxlogscore=776 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170072

Add MPSS remoteproc node for SDX75 SoC.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 47 +++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index afe84270b84c..db042ec2640e 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -890,6 +890,53 @@ tcsr: syscon@1fc0000 {
 			reg = <0x0 0x01fc0000 0x0 0x30000>;
 		};
 
+		remoteproc_mpss: remoteproc@4080000 {
+			compatible = "qcom,sdx75-mpss-pas";
+			reg = <0 0x04080000 0 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MSS>;
+			power-domain-names = "cx",
+					     "mss";
+
+			memory-region = <&mpssadsp_mem>, <&q6_mpss_dtb_mem>,
+					<&mpss_dsm_mem>, <&mpss_dsm_mem_2>,
+					<&qlink_logging_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_modem_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
+							     IPCC_MPROC_SIGNAL_PING
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_MPSS
+						IPCC_MPROC_SIGNAL_PING>;
+				label = "mpss";
+				qcom,remote-pid = <1>;
+			};
+		};
+
 		sdhc: mmc@8804000 {
 			compatible = "qcom,sdx75-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x0 0x08804000 0x0 0x1000>;
-- 
2.34.1


