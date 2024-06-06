Return-Path: <linux-arm-msm+bounces-21960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7828FEFE7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 17:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A110289D79
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBEB1B3749;
	Thu,  6 Jun 2024 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jwSBurQK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C245C196C75;
	Thu,  6 Jun 2024 14:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717684856; cv=none; b=VQ0h17a/FIVs71vRTVDe0msPdRvIPJL3zrtjsmYqu2xDxLyCxm3++gWu8jfEVeFuhnTKkUjkRFvmGAERE+s5zC35XxddMTo6L5zcQaRYhyfsgpnFuHc0oZy0wd1bpUua3dK9Rtt59MQTjo9OUFJmE5gfJjoP86w8alhghCZhI9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717684856; c=relaxed/simple;
	bh=uc7VVWG9aVC2KKTrjHYKS8R9toqfqD1KtSeHw7AAq7E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DAqkDII58NIQv2udWrdacR4vTO+vs2SIcLFsqPgE+3y5ig1UoO2eeKti+W70tKQLGhkepZGbqR40jw44BWx/6thfmJWPqD6cKiJbP5sORSYPhNNF779Q0k3D0dwaNs7X0cD/WwErQUL4eo5jVQQN9HlaNNbvoOLzKJTB8GWplbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jwSBurQK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456Ae2rR031662;
	Thu, 6 Jun 2024 14:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2pAfR8ZGYLwY1Br/yLLG39A4
	rMvj4vC+b+3cwrWKo4E=; b=jwSBurQK9bDHdIuitzZL311zBsXhd6Oy1Ch43g8H
	4GQnQ1+9nrJpJ5EopiF6yJZ1kXFnD+kCai6CcNnFI37u8iqycXv8acRXLBmYy9cq
	cbpQrzsUwT1mSwEZ9xIGm5VhjBhEYy6KUrK5N7beaCwVS42jU3KSKFhxc96wKB3+
	c/+rea5PLzwf/yqV0dFpNk+WXdSpU2uWQj5PFkjP+Wayza4hZ+9VsCZomaP9yJA6
	IN8MmZF7oT6hCPKmo0G8wRJM77tmzzH4HMejLR1SzZjkfMSfuBLebt6tf4cwogD6
	jVftHhSXpEjPXKCrEODU3UeFba1eXAm2MO22KhW8loRhHQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjk89by5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 14:40:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456Eecjd010156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 14:40:38 GMT
Received: from hyd-e160-a01-3-01.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Jun 2024 07:40:34 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH 4/5] arm64: dts: qcom: sdx75: Add remoteproc node
Date: Thu, 6 Jun 2024 20:08:57 +0530
Message-ID: <20240606143858.4026-5-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240606143858.4026-1-quic_nainmeht@quicinc.com>
References: <20240606143858.4026-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T1fcBqAY2GU6zMIZJ8JSjYTDtlan2fWu
X-Proofpoint-ORIG-GUID: T1fcBqAY2GU6zMIZJ8JSjYTDtlan2fWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 mlxlogscore=776 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406060106

Add MPSS remoteproc node for SDX75 SoC.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 47 +++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 9349b1c4e196..25d3f110abe1 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -890,6 +890,53 @@
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
2.17.1


