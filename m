Return-Path: <linux-arm-msm+bounces-37523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE5D9C4B38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 01:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 615ACB231F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 00:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12B420102B;
	Tue, 12 Nov 2024 00:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LpE6pqMt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8BA200CBB;
	Tue, 12 Nov 2024 00:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731372621; cv=none; b=hdn8yFVQl6L+SWYw5NoCl9hrUT29rcZKblOG0vFPI+la3xODpYqaS/F682fyt2I8twT5ZI6AgEmlKb8pfcIMt++kFKlcJ1flKBsdAeMO5ei6LR7CuL57M/XZQss0HsiS530THqMYL0nHQw/psvpUNZfD7M2+QMxur1VgEPtHinM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731372621; c=relaxed/simple;
	bh=Vi+Na65JaduyR3qjgc/a6Jn7pkM6el+5yWfyriM5ab0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jE74KX04/SZqBwljTrjVKESM7yUXymPAguDzrlvZ8Ztg1PkcR3dGt0e1CDydZmsrpzr6thmNBhnbG5EuTircmBsgh8MvkmBP3okf7mfZVxnqiAXDbC1LUX5t+lCG9gcsksdB7cnLwk60cVOuMWx/hyen3t+GTRgYpS6x+t91HOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LpE6pqMt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABC9Eia019676;
	Tue, 12 Nov 2024 00:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NVIuvcN0ZMYMkb/pY/tVXi
	ol5WGKrj//jazWF7CVjTo=; b=LpE6pqMtcsWWuW8kXAnApgaToXKmGeOp3sH4NL
	vth4y/jw2OdaV3AwqZ8DAbxrcCb/xlPvvrVaNtcJVVDcp/r97rx/e2PHbzY5/IEb
	MPgpyfHAv6mQ1tEl49G37Ppjomsdi5KMn1rwbr7diQE9GjzWBm2BUTN2XcIQVFIX
	u632mz6h8WTS781KAtUIDk8CGQYrBZ4MLn0+1wKmus/8ogLEpUK1Gg7dfqGgSBa1
	EDi+fvJMWbjMCsErISvzIU8sx2lQFm2PmxMidAwaZnmwuavvn17osebz6hmXlSuQ
	kdavUhLngb+oczBlvV9IO3y7wcvoIJn337eb1KViz5JIR9hg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0465p9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:49:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC0nvxO026742
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:49:57 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 16:49:56 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH v2 0/6] dts: qcom: Introduce SM8750 device trees
Date: Mon, 11 Nov 2024 16:49:30 -0800
Message-ID: <20241112004936.2810509-1-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gTllFbuONkCx3yNajB8rNRPDcyIhDNIs
X-Proofpoint-ORIG-GUID: gTllFbuONkCx3yNajB8rNRPDcyIhDNIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=980 impostorscore=0 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120005

This series adds the initial device tree support for the SM8750 SoCs
needed to boot to shell. This specifically adds support for clocks,
pinctrl, rpmhpd, regulators, interconnects, and SoC and board
compatibles.

The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
consumer mobile device SoCs. See more at:
https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/company/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/documents/Snapdragon8EliteProductBrief.pdf

Dependencies:
clks: https://lore.kernel.org/all/20241112002807.2804021-1-quic_molvera@quicinc.com/
interconnects: https://lore.kernel.org/all/20241112003017.2805670-1-quic_molvera@quicinc.com/
pinctrl: https://lore.kernel.org/all/20241112002843.2804490-1-quic_molvera@quicinc.com/
regulators: https://lore.kernel.org/all/20241112002645.2803506-1-quic_molvera@quicinc.com/
power domains: https://lore.kernel.org/all/20241112002444.2802092-1-quic_molvera@quicinc.com/
misc bindings:
- https://lore.kernel.org/all/20241112003544.2807368-1-quic_molvera@quicinc.com/
- https://lore.kernel.org/all/20241112003217.2806556-1-quic_molvera@quicinc.com/
- https://lore.kernel.org/all/20241021230500.2632527-1-quic_molvera@quicinc.com/
- https://lore.kernel.org/all/20241021230439.2632480-1-quic_molvera@quicinc.com/
applied bindings:
- https://lore.kernel.org/all/20241021230427.2632466-1-quic_molvera@quicinc.com/

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

Jishnu Prakash (1):
  arm64: dts: qcom: Add pmd8028 and pmih0108 PMICs

Melody Olvera (5):
  dt-bindings: arm: qcom: Document sm8750 SoC and boards
  arm64: dts: qcom: Add base SM8750 dtsi
  arm64: dts: qcom: sm8750: Add pmic dtsi
  arm64: dts: qcom: Add SM8750 MTP and QRD boards
  arm64: defconfig: Enable SM8750 SoC base configs

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 arch/arm64/boot/dts/qcom/pmd8028.dtsi         |   56 +
 arch/arm64/boot/dts/qcom/pmih0108.dtsi        |   62 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts       |  794 +++++
 arch/arm64/boot/dts/qcom/sm8750-pmics.dtsi    |  188 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts       |  792 +++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi          | 2917 +++++++++++++++++
 arch/arm64/configs/defconfig                  |    4 +
 9 files changed, 4822 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmd8028.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmih0108.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-pmics.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-qrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750.dtsi


base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
-- 
2.46.1


