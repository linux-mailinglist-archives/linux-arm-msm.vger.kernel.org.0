Return-Path: <linux-arm-msm+bounces-32469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3993985744
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 12:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E8B3B2228A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 10:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA0615C12F;
	Wed, 25 Sep 2024 10:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bCCDEdf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE84A1304AB;
	Wed, 25 Sep 2024 10:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727261044; cv=none; b=aZSk2+NI2TY0BHrl1wVQn/oTeRdRe4a41xrFf8oT9dx5ZRwMI1VbXhQeChOUWs35YYNP6o0O1PQ6jJSaKJtGd902SX1YXWtbHxlOZH1qNgcCixa5/83WM66IlPGVGqwWsgiEhQQ3cYdocx3Ij6pd29+DvnMQ6HFUXH7ZihH3l+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727261044; c=relaxed/simple;
	bh=L1HoHQHuchfwFS1VghL0sPLR1w8kjOBVdi6ZTuTCmag=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=URMpGiRWRv/tG3BSWdfJcyhyd88eS2CYJRyDf/LlM6/7fmbtFMpZ3Q27zgNGZVP9+SAQD8EBA3Y1p/PCJfzzRVQ5IZJobWke/r3sLXtTi8amVpFkC91MR1XZhq9rhKsB3IIE8Z+llxkouApjLXUo1rQp5jYxIWygT8d1UM627O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bCCDEdf9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P7aRGI030180;
	Wed, 25 Sep 2024 10:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Nwr5j3VJIL3xNleJgcAwdN
	+arKX0c9YffWpb2NDMe+M=; b=bCCDEdf9mQZnpRQZZzZ7vPuLZ3kvcQGMmH+G9P
	4wcEFI0qvQ+RGb/6QVdGk0J000zIgOZ2aXFrNz2rry1aw8lJ6jprsg6zUWuaKj5b
	pqtdHP3OdjrAzx8nLFCTmW5Y2aVph0Rl31K2Ae02lyW5YQhXhQ38nsa/oWYMEanI
	8ppH6v6Y8VE6GQnKmmYknzlf4H2/Ou244mYKjMfyxotnOiS4oT0l0KrXSNkzg5cv
	Olt23P8u7JNEnPFyx5fSxzZFV7WFiQNFrIhLE58I4MQI4QZ+Zip8QoFRbu1uAsla
	xKKH5ZCq22I93+prU4/jR2k2mtCICTEcfSZPXANx144+pVgg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sp7ukx3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 10:43:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PAhpel004072
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 10:43:51 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 03:43:47 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Subject: [PATCH v2 0/4] Add initial support for QCS8300 SoC and QCS8300
 RIDE board
Date: Wed, 25 Sep 2024 18:43:31 +0800
Message-ID: <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFTp82YC/22NQQ6CMBBFr0Jmbc20FBVX3sMQ0rSDTKIttEg0h
 LtbiUuX7yX//QUSRaYE52KBSDMnDj6D2hVge+NvJNhlBoVKY60qMdp0KhFb9jyxubduSizIHKT
 uSFellpCnQ6SOX1v22mTuOU0hvreXWX7tL4j6f3CWAoVDMrXpnEU8XsYnW/Z2b8MDmnVdP8rxR
 xi6AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, Jingyi Wang <quic_jingyw@quicinc.com>,
        "Zhenhua
 Huang" <quic_zhenhuah@quicinc.com>,
        Xin Liu <quic_liuxin@quicinc.com>,
        "Kyle
 Deng" <quic_chunkaid@quicinc.com>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727261026; l=3388;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=L1HoHQHuchfwFS1VghL0sPLR1w8kjOBVdi6ZTuTCmag=;
 b=2gBpebP84Ps+5kiVqsSd/qCU9ZOT1plBSV5tuUHXhr+ATdeT68TPMVAu2bqDl8F1Dzz7q4cab
 jUAr65lNSY3CalHjlHQIqNJ88CzwBFm1wupUBzBccxP6bePyk6lDwig
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z0gN_lrEgOKGI2oLAKeyaKGacmb6-4z3
X-Proofpoint-ORIG-GUID: z0gN_lrEgOKGI2oLAKeyaKGacmb6-4z3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409250073

Introduce the Device Tree for the QCS8300 platform.

Features added and enabled:
- CPUs with PSCI idle states
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- GCC and RPMHCC
- TLMM
- Interconnect
- QuP with uart
- SMMU
- QFPROM
- Rpmhpd power controller
- UFS
- Inter-Processor Communication Controller
- SRAM
- Remoteprocs including ADSP,CDSP and GPDSP
- BWMONs

binding dependencies:
- remoteproc: https://lore.kernel.org/linux-arm-msm/20240925-qcs8300_remoteproc_binding-v3-1-21b0c52b142b@quicinc.com/
- ufs-phy: https://lore.kernel.org/linux-arm-msm/20240925-qcs8300_ufs_phy_binding-v3-1-c1eb5c393b09@quicinc.com/
- ufs-controller: https://lore.kernel.org/all/20240911-qcs8300_ufs_binding-v2-1-68bb66d48730@quicinc.com/ - Reviewed
- smmu: https://lore.kernel.org/all/20240911-qcs8300_smmu_binding-v2-1-f53dd9c047ba@quicinc.com/ - Applied
- ipcc: https://lore.kernel.org/all/20240911-qcs8300_ipcc_binding-v2-1-ca15326c5d0f@quicinc.com/ - Applied
- qfprom: https://lore.kernel.org/all/20240911-qcs8300_qfprom_binding-v2-1-d39226887493@quicinc.com/ - Reviewed
- tcsr: https://lore.kernel.org/all/20240911-qcs8300_tcsr_binding-v2-1-66eb5336b8d1@quicinc.com/ - Reviewed
- rmphpd: https://lore.kernel.org/all/20240920-add_qcs8300_powerdomains_driver_support-v1-1-96a2a08841da@quicinc.com/ - Reviewed
- bwmon: https://lore.kernel.org/all/20240925-qcs8300_bwmon_binding-v1-1-a7bfd94b2854@quicinc.com/ - Reviewed
- others: https://lore.kernel.org/all/20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com/ - Reviewed

build dependencies:
- tlmm: https://lore.kernel.org/linux-arm-msm/20240819064933.1778204-1-quic_jingyw@quicinc.com/
- gcc: https://lore.kernel.org/all/20240822-qcs8300-gcc-v2-0-b310dfa70ad8@quicinc.com/
- interconnect: https://lore.kernel.org/linux-arm-msm/20240910101013.3020-1-quic_rlaggysh@quicinc.com/

patch made the following verifications:
- Successfully ran dt_binding_check for binding files
- Successfully ran dtbs_check with W=1 for dts
- Features found on the SoC function verified.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v2:
- decoupled from the original series
- Drop compatible for QCS8275
- fix property order and add line breaks
- move sleep_clk node to qcs8300-ride.dts
- move l3-cache nodes out of l2-cache nodes and remove cluster1/cluster2
- add BWMON nodes
- commit-msg update
- Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com

---
Jingyi Wang (4):
      dt-bindings: arm: qcom: document QCS8300 SoC and reference board
      arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS8300
      arm64: dts: qcom: add initial support for QCS8300 DTSI
      arm64: dts: qcom: add base QCS8300 RIDE dts

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts       |  267 +++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi           | 1375 +++++++++++++++++++++++
 arch/arm64/configs/defconfig                    |    3 +
 5 files changed, 1652 insertions(+)
---
base-commit: 4d0326b60bb753627437fff0f76bf1525bcda422
change-id: 20240925-qcs8300_initial_dtsi-ea614fe45341

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


