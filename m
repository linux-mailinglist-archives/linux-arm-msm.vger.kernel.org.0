Return-Path: <linux-arm-msm+bounces-1043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6037EFDB2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 05:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A31BB20B23
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 04:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722EBD27E;
	Sat, 18 Nov 2023 04:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DrGehSAV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68996D72;
	Fri, 17 Nov 2023 20:28:04 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AI4D98Y023608;
	Sat, 18 Nov 2023 04:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=jUI5kbNVf/1FMYk4A19JfXE3UZu/sfvc3lv2Q1F5K1w=;
 b=DrGehSAVD3gu9Bby7HQcohYyDBKa+rN/pczLiZctWqUzZh9Zzbynw3Kitr/US4CUpAeB
 cNzlDF/cTo5qD344wUinjQbG10Y+XhXRGfqEaLdOboI9j0I1xGX1s8kSrTHL0pT4cNF8
 GWJYNT+Dl4U57tmaXIoxB1Y0uvQB+S+MEDGVJAdGHQia6xn+ZIifKABu8B2UDKpND2kP
 Bqb6FYDSqbyu1R2gNLsblyLvjd4/oaDwrpvZ8m2HYknyvoIPkL5x+iU8aeaFqNL82t7e
 yPfU9EpMYILFrjj6DQJ4wGcWzBKZkKlmldMDlQxtOR+7XJ6UG/WBYaCdpj3ne/OrHlMN 3g== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uenne81cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Nov 2023 04:27:43 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AI4RgJF032712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Nov 2023 04:27:42 GMT
Received: from hu-c-gdjako-lv.qualcomm.com (10.49.16.6) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 17 Nov 2023 20:27:41 -0800
From: Georgi Djakov <quic_c_gdjako@quicinc.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>
CC: <devicetree@vger.kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_cgoldswo@quicinc.com>,
        <quic_sukadev@quicinc.com>, <quic_pdaly@quicinc.com>,
        <quic_sudaraja@quicinc.com>, <djakov@kernel.org>
Subject: [PATCH v2 0/6] Add support for Translation Buffer Units
Date: Fri, 17 Nov 2023 20:27:24 -0800
Message-ID: <20231118042730.2799-1-quic_c_gdjako@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8JOfhQ0I-ti3QSgwp60sOsseosNNGr9M
X-Proofpoint-GUID: 8JOfhQ0I-ti3QSgwp60sOsseosNNGr9M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-18_02,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 mlxlogscore=838 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311180032

The TCUs (Translation Control Units) and TBUs (Translation Buffer
Units) are key components of the MMU-500. Multiple TBUs are connected
to a single TCU over an interconnect. Each TBU contains a TLB that
caches page tables. The MMU-500 implements a TBU for each connected
master, and the TBU is designed, so that it is local to the master.

The Qualcomm SDM845 platform has an implementation of the SMMU-500,
that has multiple TBUs. A DT schema is added to describe the resources
for each TBU (register space, power-domains, interconnects and clocks).

The TBU driver will manage the resources and allow the system to
operate the TBUs during a context fault to obtain details by doing
s1 inv, software + hardware page table walks etc. This is implemented
with ATOS/eCATs as the ATS feature is not supported. Being able to
query the TBUs is useful for debugging various hardware/software
issues on these platforms.

v2: 
- Improve DT binding description, add full example. (Konrad)
- Drop Qcom specific stuff from the generic binding. (Rob)
- Unconditionally try to populate subnodes. (Konrad)
- Improve TBU driver commit text, remove memory barriers. (Bjorn)
- Move TBU stuff into separate file. Make the driver builtin.
- TODO: Evaluate whether to keep TBU support as a separate driver
  or just instantiate things from qcom_smmu_impl_init()

v1: https://lore.kernel.org/r/20231019021923.13939-1-quic_c_gdjako@quicinc.com

Georgi Djakov (6):
  dt-bindings: iommu: Add Translation Buffer Unit bindings
  iommu/arm-smmu-qcom: Add support for TBUs
  iommu/arm-smmu-qcom: Add Qualcomm TBU driver
  iommu/arm-smmu: Allow using a threaded handler for context interrupts
  iommu/arm-smmu-qcom: Use a custom context fault handler for sdm845
  arm64: dts: qcom: sdm845: Add DT nodes for the TBUs

 .../devicetree/bindings/iommu/arm,smmu.yaml   |  25 +
 .../bindings/iommu/qcom,qsmmuv500-tbu.yaml    |  89 ++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  82 +++
 drivers/iommu/Kconfig                         |   8 +
 drivers/iommu/arm/arm-smmu/Makefile           |   1 +
 .../iommu/arm/arm-smmu/arm-smmu-qcom-tbu.c    | 504 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    |  12 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    |   6 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |  12 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.h         |   3 +
 10 files changed, 739 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iommu/qcom,qsmmuv500-tbu.yaml
 create mode 100644 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-tbu.c


