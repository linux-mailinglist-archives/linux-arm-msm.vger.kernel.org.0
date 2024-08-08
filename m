Return-Path: <linux-arm-msm+bounces-28162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8E94BF05
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 16:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 507E428774D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 14:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B1218E049;
	Thu,  8 Aug 2024 14:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UK6ZUoBp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1468918DF6E;
	Thu,  8 Aug 2024 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723125853; cv=none; b=T9L5UxNvqRR39zAeHXr1JGQ1Tzz09+BS/EReF3H4pwxhvaMBprGPb3thLvHWLNP3prRNZSdLW5HcVyrtMPejoare+sz0f8w/txUwG4G0v0CjliAPn6KdZCWwdpknn7EZQWyTbKUuW3t62oE+zjHV+vpnXaURwsfkv9rmsGV3SjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723125853; c=relaxed/simple;
	bh=Rgg4UP3uOFU/PU5X1arLl/LJ7lDSFFKnppjVFyV3iKQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=sE4ePL51lq0e7+0IN9QpXHLG/iMBwdspJR45t+zXX6d0l/TqpKU4XanFr+QdnziuL1d49+pVooQEjBJ5Jlx3txoTRp+K/SNF9E1rZZ+HRH66W/kuZZPKJCN/FqlA0AeTR+g84YozrFpe6A+kkwHH0QtyfhuQIEHbp4WC0LV39xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UK6ZUoBp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478CkqFH011735;
	Thu, 8 Aug 2024 14:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GXNSOE3LMIcIEssk6yYbUv
	4z7SZcnKD1O0nvXqgO21U=; b=UK6ZUoBpXoqjUun035y2rICqLy29XmkIFteljM
	6kEn6tDEfl138n5pa8/P3xQbsCVXRtY7iTzktxJaZUj49BZ/X40ExEYL2R4nXvDW
	K42LmisR1DpgPHdlwyncknjMyH7EqmoTA4pRYaD+ZonreKW4Gr/KxZEdm5m3ZeAi
	FmBYVbQ4nk7/GX1RLVF19jRsw/4dMsvtZVgWsBj/mwpew9GFgv5J3mOE5SW7Mnge
	DAQvwuTHdiVKEazaRAzcbuCw6PI3x8rGp3fEfsy2nsTzaliIQIJNgW9YSpYAe+zE
	EbZuoqVjBHKV260LwYMJRbPk+PxaXJkIOiK09XsTiratco/g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sc4ydy7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 14:04:01 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 478E3xuH021816
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 14:03:59 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 8 Aug 2024 07:03:55 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH 0/4] Add common PLL clock controller driver for IPQ9574
Date: Thu, 8 Aug 2024 22:03:11 +0800
Message-ID: <20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB/QtGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwML3cLk/Nz4zILC+OTcvIKcHF3zZENDQ8skI1MDY3MloK6CotS0zAq
 widGxtbUAlISBLWEAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723125835; l=1714;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=Rgg4UP3uOFU/PU5X1arLl/LJ7lDSFFKnppjVFyV3iKQ=;
 b=MphMmobq0EAcRqXeWn095ni4rm1JYaClP9ZejPIFYUXLb2sW2rn8VkjpL2drXC6dwslD4sPzN
 UZM9wH9spxhB8Yj6E3VeJa7YkJcJXdApO2nfuOXZ/Fm5w/23XH6ULy2
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: efyYWyX_UVRv2AzI22L3EbjAfLV5YTwp
X-Proofpoint-GUID: efyYWyX_UVRv2AzI22L3EbjAfLV5YTwp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_14,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 mlxlogscore=848 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080099

The common PLL clock controller in Qualcomm IPQ chipsets provides
the clocks to the networking hardware blocks that are internal or
external to the SoC. This driver configures the common PLL clock
controller to enable the output clocks to such networking hardware
blocks. These networking blocks include the internal PPE (Packet
Process Engine), external connected Ethernet PHY, or external switch.
 
The controller expects the input reference clock from the internal
Wi-Fi block acting as the clock source. The output clocks supplied
by the controller are fixed rate clocks.

The driver is being enabled to support IPQ9574 SoC initially, and
will be extended for other SoCs.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
Luo Jie (4):
      dt-bindings: clock: qcom: Add common PLL clock controller for IPQ SoC
      clk: qcom: Add common PLL clock controller driver for IPQ SoC
      arm64: defconfig: Enable Qualcomm IPQ common PLL clock controller
      arm64: dts: qcom: Add common PLL node for IPQ9574 SoC

 .../bindings/clock/qcom,ipq-cmn-pll.yaml           |  87 ++++++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |   6 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  22 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ipq-cmn-pll.c                 | 233 +++++++++++++++++++++
 7 files changed, 358 insertions(+), 2 deletions(-)
---
base-commit: 222a3380f92b8791d4eeedf7cd750513ff428adf
change-id: 20240808-qcom_ipq_cmnpll-7c1119b25037

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


