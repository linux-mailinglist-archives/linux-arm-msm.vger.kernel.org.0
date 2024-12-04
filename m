Return-Path: <linux-arm-msm+bounces-40414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 078FE9E4888
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 00:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB269281AAD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDF4202C36;
	Wed,  4 Dec 2024 23:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MiToF2r4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3B719DFB4;
	Wed,  4 Dec 2024 23:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733354334; cv=none; b=CCdBGY7cTXWBJbjhglxRK98DjuF11CB4gmIqko0l24cyLJZsBq4uFqbQoGb8APlxRv8PFMvwalqyM9KQi1Yuy2z4HPrpii7aYRL7eTD3ZlMiuYAKjUw1yLCtRrr5+FjB1f0xCJ8hm2qoE2XapfkSYlnfCf7DufWEaIuvO4KiHrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733354334; c=relaxed/simple;
	bh=kO7MwWdiM4AG+x7YQdOgVuSXUwY5fFp/QzN8WcM/PoQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=P1jrWQB6SIQSTenGQ0aNIpF9lfZIeMRoFtOiv4nJSwtbrMs2A94JbhXiZ+EKVmkIxJVqJKkFwMEvPp29kvg5n53V7PRt22Hm+ERziobNCbz48If04uNyE8g7sU8TzLPZHahBb2fDeB40g8K/aMeAEFiqt11rVfgnIZ/JcTBAgfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MiToF2r4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4LvJiU031658;
	Wed, 4 Dec 2024 23:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jGsn9P0xO8ecD7EeEfGnlR
	h+FsBMMz/72Pm4+DZwJRw=; b=MiToF2r418pJIYevyglRIUzkgN8KmV4+4uxs8c
	f/9PWYl6SU+O8WIW7NcyVvFdD/L00Y6gjTo8rMA4k3A7irkDcdBWpXu6jq+wSBbl
	6DhuyqHABZlYDjXiP1ao5xAqqpWPciAQo4/RDT39mfWiyWzqVqj1MhQg0QmEphKz
	LhgWs5UdO0Q1ubeyqXX65F+WuYhhcjXN5H+4X+yjyX18jcd7xFPyrOeqaCv3wC55
	4/R2FLY3HLXWp3x7ZSk8Ilsf9h7OKIJATwF3I8zf0lCXNkYyLftsUEM805Tyt1/a
	9yFpKb5ZntbnTRrZ5X5qiCWutPqAMjSaYZBecqke63NrYwSw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ayem84pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 23:18:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4NIgwW029808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 23:18:42 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 15:18:41 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH v3 0/7] dts: qcom: Introduce SM8750 device trees
Date: Wed, 4 Dec 2024 15:18:00 -0800
Message-ID: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACnjUGcC/42O3WoDIRBGX2XxugP+rK76KiEEfyattLqpmiUQ8
 u61DaW9CeRm4HxwDnMlDWvCRux0JRW31NJaBoiXiYQ3V14RUhxMOOUz43SGlvUi6SG71rEeYge
 mAhfR06iFIkM7VTymy09yt79zxc/zKPf7+Be204NsKuOGtRQMvYGk2gRpaDyitJsg/397mAgf7
 w2QK2TezEx59bTZcj4D1Wpx3gij9DD5c+YpBuCLROkoFYjBbuxb9K4hhDXn1O1U8NLh1yf72+0
 LcAI0KIMBAAA=
X-Change-ID: 20241204-sm8750_master_dt-16c23db0d836
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty
	<quic_rlaggysh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733354321; l=4638;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=kO7MwWdiM4AG+x7YQdOgVuSXUwY5fFp/QzN8WcM/PoQ=;
 b=BOpQnrIJ5Rd4iqV/aOtURe7M27VeIfy7NuZD9E+yepIrKDDN67MxZTa6YS2WhDqGqoxi6QQ/b
 KwbwaTbYwJWDZnjQVnYrdNkGFSxIf/ae/mOMR/6WwR6vEZpWcNLQwkj
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M391r5N-uv_P5jX7cKNMwFs0AJ8OqUsD
X-Proofpoint-ORIG-GUID: M391r5N-uv_P5jX7cKNMwFs0AJ8OqUsD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=657 phishscore=0 malwarescore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040179

This series adds the initial device tree support for the SM8750 SoCs
needed to boot to shell. This specifically adds support for clocks,
pinctrl, rpmhpd, regulators, interconnects, and SoC and board
compatibles.

The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
consumer mobile device SoCs. See more at:
https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/company/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/documents/Snapdragon8EliteProductBrief.pdf

Dependencies:
clks: https://lore.kernel.org/all/20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com/
interconnects: https://lore.kernel.org/all/20241204-sm8750_master_interconnects-v3-0-3d9aad4200e9@quicinc.com/
pinctrl (applied): https://lore.kernel.org/all/20241112002843.2804490-1-quic_molvera@quicinc.com/
regulators (applied): https://lore.kernel.org/all/20241112002645.2803506-1-quic_molvera@quicinc.com/
power domains (applied): https://lore.kernel.org/all/20241112002444.2802092-1-quic_molvera@quicinc.com/
misc bindings:
- https://lore.kernel.org/all/20241204-sm8750_master_smmu-v2-1-9e73e3fc15f2@quicinc.com/
- https://lore.kernel.org/all/20241204-sm8750_master_pdc-v1-1-3a06cb62a28f@quicinc.com/
applied bindings:
- https://lore.kernel.org/all/20241021230427.2632466-1-quic_molvera@quicinc.com/
- https://lore.kernel.org/all/20241112003544.2807368-1-quic_molvera@quicinc.com/
- https://lore.kernel.org/all/20241021230500.2632527-1-quic_molvera@quicinc.com/

Changes in V3:
- split PMD8028 PMIC and PMIH0108 PMIC into two patches
- added critical trips for PMD8028 and PMIH0108
- updated commit msgs to all use uppercase for names
- updated cpu idle states in dt to follow previous conventions
- enabled msi-controller@16040000
- reordered gcc clocks to match bindings 

Changes in V2:
- split dts and dtsi patches into separate patches
- changed eusb-repeater to phy
- removed empty chosen node
- lowercased phandles in dtsi
- added system-wide domain idle state
- added leading zeroes to applicable regs
- corrected gpio ranges
- removed some unnecessary comments
- updated timer size cells
- separated pmics & thermal zones into their own file
- added chassis type to board files
- added reserved tlmm nodes to board files
- corrected regulator-0 supplies in board files

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
Melody Olvera (7):
      dt-bindings: arm: qcom: Document SM8750 SoC and boards
      arm64: dts: qcom: Add PMD8028 PMIC
      arm64: dts: qcom: Add PMIH0108 PMIC
      arm64: dts: qcom: Add base SM8750 dtsi
      arm64: dts: qcom: sm8750: Add pmic dtsi
      arm64: dts: qcom: Add board dts files for SM8750 MTP and QRD
      arm64: defconfig: Enable SM8750 SoC base configs

 Documentation/devicetree/bindings/arm/qcom.yaml |    7 +
 arch/arm64/boot/dts/qcom/Makefile               |    2 +
 arch/arm64/boot/dts/qcom/pmd8028.dtsi           |   62 +
 arch/arm64/boot/dts/qcom/pmih0108.dtsi          |   68 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts         |  794 +++++++
 arch/arm64/boot/dts/qcom/sm8750-pmics.dtsi      |  188 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts         |  792 ++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi            | 2907 +++++++++++++++++++++++
 arch/arm64/configs/defconfig                    |    4 +
 9 files changed, 4824 insertions(+)
---
base-commit: ed2e49e900fcf3ea198df034facb67bf8d99f44e
change-id: 20241204-sm8750_master_dt-16c23db0d836
prerequisite-change-id: 20241204-sm8750_master_interconnects-5089c590dfe5:v3
prerequisite-patch-id: 2129d2b0d43098012e7e63a728971870eda5a891
prerequisite-patch-id: a4c4f081f8e050b93f33730fa63af4e8413834bf
prerequisite-change-id: 20241204-sm8750_master_clks-e26e1b9416b6:v3
prerequisite-patch-id: 6746978c15f8c943df3ca44013b1692668d7c60a
prerequisite-patch-id: ac3e8d8cbeac3f1a77f8d54751063dba61642a01
prerequisite-patch-id: e0affb2c25d8c566c875994970503aa446983ea7
prerequisite-patch-id: 70df483173f5546f676427883505bd135663583b
prerequisite-patch-id: 8897202725dcee6119e018c8c3c11dcc2a5337ef
prerequisite-patch-id: 5e652ef99d655ab31e4c86cabb7fd58b03ad7437
prerequisite-patch-id: 551a78c20b5320c0d51b262f5de9772d8f554d0a
prerequisite-patch-id: a4db6036b69abd4f25ec8d44a9919e8a1b5fb7da
prerequisite-change-id: 20241204-sm8750_master_smmu-0867ab939686:v2
prerequisite-patch-id: 05669e3fd6558fd8a03082bb0c42347cc74e4b4c
prerequisite-change-id: 20241204-sm8750_master_pdc-275e5a003eec:v1
prerequisite-patch-id: e02a35925d37a2e61abbf240cc8963208f54e1c0

Best regards,
-- 
Melody Olvera <quic_molvera@quicinc.com>


