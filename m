Return-Path: <linux-arm-msm+bounces-47852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16629A338AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 08:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAFD0188AC13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 07:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1112E207DEB;
	Thu, 13 Feb 2025 07:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F7u7AJQ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4BB2063FC;
	Thu, 13 Feb 2025 07:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739431173; cv=none; b=ouxaQOjQRvYOqoluJyfe/7ZZbmmcd9peReEJ1tC21AfJxZW6ggrKXIO3mKAru2busD5D+PB1PdfkZBDlwlQ2jnhkDTeq6r4gEP1/scYovr1p+DlC8vykf3e2/s9adyfoAkvqi+r16jggZOc8Jm9JjbpPmJybyHdu+ezY+5ncA4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739431173; c=relaxed/simple;
	bh=ChDtJt7/F2s8e/YUIjnaDBZMZQhHOz7ElbcMlhf0Mvw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oOmnP68KO3EJvvipfvT/d4ZR6F4446U4f31qpq5i8rTLPbr8kPWugThBUJABSv4YInFEHB9Rx0U4QO5S9a2ZMIffyZoIAXqCf2BkxOKjJgr8vN12UIHA08PyImP6kay+pIbeiwaeGkNopC+FtyvKcyLMG2cRKaD+DZlwhLsgCf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F7u7AJQ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D7HSuO001046;
	Thu, 13 Feb 2025 07:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sIzO4T1+Nex+xFvfuy/Nuz
	x/LjoO4kO3SV00AdD9sNY=; b=F7u7AJQ6yuWKO2VCPzInpwIDhRvB5EPB3fA5Br
	k139pwX15YhpQgkvQJymhgs5MjYQHU5sGonTiRiPaY/ITS6s+k47of2xsuicTroa
	JmA6vT98zwy6YLf57OmD/RAcZE4CtckHuV08wWJ0tcNa00LJaFqQ1Bm55diiq9Gv
	lR2cWEYc/hY3kbptv9pKqE4UFeuknVWxXl6zIGjw/c81LhbWuxU6raRsQV2TrLoT
	4riiMiphAkjbfCoq7gzPn6JVfvVj0KMExedncDVTX5BGMZxy1HFvqNtXvA5+KLC3
	1gTQdL6nVX7RNKEy/BpNpYQIRrEGSZ/t44HmvE9Zt4p4v6qg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sc7b805c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 07:19:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D7JPe6016257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 07:19:25 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Feb 2025 23:19:22 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v4 0/2] Add PCIe support for IPQ5424
Date: Thu, 13 Feb 2025 12:49:10 +0530
Message-ID: <20250213071912.2930066-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r5sjGarlz83l2eMqiGSBqCMHtZI7V1lV
X-Proofpoint-GUID: r5sjGarlz83l2eMqiGSBqCMHtZI7V1lV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=491
 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130054

This series adds support for enabling the PCIe host devices (PCIe0,
PCIe1, PCIe2, PCIe3) found on IPQ5424 platform. The PCIe0 & PCIe1
are 1-lane Gen3 host and PCIe2 & PCIe3 are 2-lane Gen3 host.

Depends upon [1]

[1] https://lore.kernel.org/linux-arm-msm/20250206121803.1128216-1-quic_varada@quicinc.com/

Changes in V4:
	- Dropped patch #1 because it is already part of the dependency series.
	- Dropped patch #2 because icc tags are required only for platforms
	  using icc-rpm or icc-rpmh. IPQ5424 doesn't use icc-rpm/icc-rpmh,
	  instead it uses icc_clk APIs to register with interconnect
	  provider.
	- dtsi
		- Added mhi register space in all pcie controller nodes.
		- Updated pcie nodes unit address to align with parf
		  register address space.
		- Moved msi-map before interrupts.
		- Rearrange nodes w.r.t. address sort order.
		- Dropped ICC tag from the interconnect paths.
		- Removed bus-range from all pcie controller nodes.
	- dts
		- Added a new line before status in pcie2 and pcie3
		  nodes.
		- Dropped 'output-low' property from pcie2-default-state
		  and pcie3-default-state nodes. 
	- Fixed all review comments from Konrad, Krzysztof.

V3 can be found at:
https://lore.kernel.org/linux-arm-msm/20250125035920.2651972-1-quic_mmanikan@quicinc.com/

V2 can be found at:
https://lore.kernel.org/linux-arm-msm/20250115064747.3302912-1-quic_mmanikan@quicinc.com/

V1 can be found at:
https://lore.kernel.org/linux-arm-msm/20241213134950.234946-1-quic_mmanikan@quicinc.com/

Manikanta Mylavarapu (2):
  arm64: dts: qcom: ipq5424: Add PCIe PHYs and controller nodes
  arm64: dts: qcom: ipq5424: Enable PCIe PHYs and controllers

 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts |  41 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 515 +++++++++++++++++++-
 2 files changed, 550 insertions(+), 6 deletions(-)


base-commit: c674aa7c289e51659e40dda0f954886ef7f80042
prerequisite-patch-id: 56fe29d9207ac31ab08ca54712adc2a865b7be89
prerequisite-patch-id: 0b5601861c398c7f60e6a0e0c817e6ad7d172a2c
prerequisite-patch-id: d601672c1349e162e394cdd6780abfd98b168cf6
prerequisite-patch-id: 56f37c165f7fddb0897c94dd6447dfb85d11f736
prerequisite-patch-id: 03a37b3dd40a88eb2bbede21fb40d2ad791c3b54
prerequisite-patch-id: c4b0edd16bddd3f102f464c4ab8095ca083ec10d
prerequisite-patch-id: 79ded164c537cfe947447c920602570626eddb3d
-- 
2.34.1


