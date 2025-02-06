Return-Path: <linux-arm-msm+bounces-47019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2B9A2A59F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 11:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6720C3A5991
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 10:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E2C226554;
	Thu,  6 Feb 2025 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SQgIAvT1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3784213240;
	Thu,  6 Feb 2025 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738836822; cv=none; b=ny1e7okPSi9fmO0cy+lpHlieFd+u9weeuLoFQTc+80riHKj0/RaxkinubF8booLrtQFVxvjd00idV5IcPZZEq42O4Yc5w5kbYqfxmsCRzYRXyZfMuCNmbzcBKy16O01NHmg2h8y+FjUkmJzyjxLB/9hKD3QysAFDeQjlzAE0BtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738836822; c=relaxed/simple;
	bh=rdTveDpp10yymSkxLT+sNEAxdAaUcA2ukzZiJpTYxZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=WtgsXh6T0Ae/LtIPg7FmcOPHxtE4hlngysLGFy5DPr3nwyWwjhjL2//nvSMMvESV2QN06Ga2ekb3dN7VGxtGyKF7D3v/Ym9L6MUqM2+rEZxScwQN6Xu7jU0lP8a8eCum/2OPyCC5zFXyMolSHUdLcOuyTffPFD0H/yzMtyYi2iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SQgIAvT1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5168bSkM014547;
	Thu, 6 Feb 2025 10:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BqHoH2QYFuCT4MTB5ZuvWx
	WKUhtIGikKRKLFjBWKpIM=; b=SQgIAvT11drhv6w4r61ctdChCK5fioaUAH/frI
	A3ERfuQiFv5xljXCkh5Sn6DYr6498WW/dYwMzLQnhLZavg+k07aurFK+azZznNre
	AosOS0e2FC+ssYsKDqWOFkGEZwqj5HMSLhVecBQXDwNqQLcuuoQGcThbDsqvFuNa
	bHW8Rwxa7CpH54j98qIs0sUg9VcLUfomiu7DfagM5+ZI/NTPYqYbNGEVar3X2Z71
	/mp97VsKFukn2HmDu3RV3y+NMMVtBTqOd2XGbBML8YJrCfQtHs9kkseBMa2AXnNS
	Mf9eU5PoypZcgvsmykY07ivbGO1rvfyImIcr53jPBWWt71sQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44msr108jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 10:13:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516ADa9Z018784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 10:13:36 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 02:13:32 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 6 Feb 2025 15:43:21 +0530
Subject: [PATCH] arm64: dts: qcom: qcm6490-idp: Update protected clocks
 list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEGLpGcC/x3MTQqEMAxA4atI1hbSogW9ioh00jgT/Km2IgPi3
 S0uv8V7FySOwgna4oLIpyQJa4YuC6CfW7+sxGeDQVOjQau2GA6mg/1Ac6Bp2GmxVYOqQt2wdVZ
 7/ECut8ij/N9z19/3AyqyyZFpAAAA
X-Change-ID: 20250206-protected_clock_qcm6490-4019e6a61d0b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uV7Hpzt1gsR6kLY5JgV6x_pPCDS3A3GG
X-Proofpoint-GUID: uV7Hpzt1gsR6kLY5JgV6x_pPCDS3A3GG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_02,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=685 clxscore=1015
 mlxscore=0 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502060084

Certain clocks are not accessible on QCM6490-IDP board,
thus mark them as protected.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Mark few clocks as protected on IDP of QCM6490.

This patchset is separated out from the series[1] to remove dependency from
the LPASS reset.
[1]: https://lore.kernel.org/all/20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com/
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 9209efcc49b57a853c4dd55ac52cd4dc98d7fe86..346b9a377e611cd3e32cf00d44e87b363bada07a 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -759,3 +759,24 @@ &wifi {
 
 	status = "okay";
 };
+
+&gcc {
+	protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
+			   <GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
+			   <GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
+			   <GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
+			   <GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
+			   <GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
+			   <GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
+			   <GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
+			   <GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
+			   <GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
+			   <GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
+			   <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
+			   <GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
+			   <GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
+			   <GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
+			   <GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
+};

---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250206-protected_clock_qcm6490-4019e6a61d0b

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


