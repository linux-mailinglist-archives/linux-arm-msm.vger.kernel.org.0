Return-Path: <linux-arm-msm+bounces-38739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EEB9D5801
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 03:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37159B238EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 02:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7AE61632E6;
	Fri, 22 Nov 2024 02:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mx2Zds7F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD9D15B96E;
	Fri, 22 Nov 2024 02:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732241006; cv=none; b=r7dseqmVIz2soaauqAV3wFZepYFN4phiKm2rMERKLCCGrUd4WTsYcsggtCq69KgTEb/sgZLVexXGCFIdRfrDWEng/rJF1nkeuRG9+udkqZqHZFRPUJwZD6HygTsAVH8ldEoCAVL3qezh99Y/DOkCw2Lv9fsBg9SCLnZrpnmfRDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732241006; c=relaxed/simple;
	bh=CuZQFI9lXH6emYAVKMo8am6WBp94GsXPPsOwXkJGOUo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JmDBoEQhfRzq6YpTd6Ad1rg2jAdrw9LJX9m/MEmb+NUygmaMpvQBAl298egq8WW5TfeKBJjzKl0jDjG0rcon7ejB61XeieIlcVz8itQg3wFrH114aGSiEg/2IPHhaGVm/xt3P4oOACAm0UJrgqXgfEIPVkQ8KYqdnE9S+Oau5h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mx2Zds7F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALE5Y2a019756;
	Fri, 22 Nov 2024 02:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pi4p+pBaxk/Du159uXOPys2/oXLhK4vU/BO
	PEvD6pv8=; b=mx2Zds7F5Ej3+/LNASUTlzQCDfmQOG3BPhn0kzOpbCFvuxBW40F
	QKZUjq0ittVhyB5eEjffzI9oen4Jpcp+Vn+FCTD9zUOJpaUQvjgmS2/1JOt+nauq
	/TwQ6buWrJs3fX8iUyOyGiJwZMtm6E/dU6gV9hHVrJNUWsSfJhuC/sddFNCFPB4M
	YeL1w5FeRIvw7GEQ4vFZOraglOu8g3JkBW5IJ7b4QwoYM2ti6zl/IQZ5W/UMjoIl
	6NYELxLxTzsJcCcENMfeodC8LO4uOTQ29r9jbUMHGQYBPc7HH6kvga2OwzntHHR2
	YbjCwWDeTFwnqq62xbiu++Ukmvy36r20Ztw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4326at9ka9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 02:03:12 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM239cj017837;
	Fri, 22 Nov 2024 02:03:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 42xmfkueuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 02:03:09 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AM239vk017824;
	Fri, 22 Nov 2024 02:03:09 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4AM238Yc017815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 02:03:09 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4438065)
	id 4B1C017EB; Fri, 22 Nov 2024 10:03:07 +0800 (CST)
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com,
        lpieralisi@kernel.org, quic_qianyu@quicinc.com, conor+dt@kernel.org,
        neil.armstrong@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: [PATCH v2 0/6] pci: qcom: Add QCS615 PCIe support 
Date: Fri, 22 Nov 2024 10:02:59 +0800
Message-Id: <20241122020305.1584577-1-quic_ziyuzhan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G7qfe_-YaK_qL1aYXvwolmgRUskeTtgc
X-Proofpoint-GUID: G7qfe_-YaK_qL1aYXvwolmgRUskeTtgc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=791 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220015

This series adds document, phy, configs support for PCIe in QCS615.

Base DT:
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/

APPS SMMU:
https://lore.kernel.org/all/20241105032107.9552-1-quic_qqzhou@quicinc.com/

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
---
Have folling changes:
	- Add compatible and phy compatible for qcs615 platform.
	- Add support for GEN3 x1 PCIe PHY found on Qualcomm QCS615 platform.
	- Add a new Document the QCS615 PCIe Controller
	- Add the compatible for QCS615 PCIe controller.
	- Add configurations in devicetree for PCIe, including registers, clocks, interrupts and phy setting sequence.
	- Add configurations in devicetree for PCIe, platform related gpios, PMIC regulators, etc.

Changes in v2:
- Update commit message for qcs615 phy
- Update qcs615 phy, using lowercase hex
- Removed redundant function
- split the soc dtsi and the platform dts into two changes
- Link to v1: https://lore.kernel.org/all/20241118082619.177201-1-quic_ziyuzhan@quicinc.com/

Krishna chaitanya chundru (5):
  dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the QCS615 QMP
    PCIe PHY Gen3 x1
  phy: qcom: qmp: Add phy register and clk setting for QCS615 PCIe
  dt-bindings: PCI: qcom: Document the QCS615 PCIe Controller
  PCI: qcom: Add QCS615 PCIe support
  arm64: dts: qcom: qcs615: enable pcie for qcs615 board dts

Ziyue Zhang (1):
  arm64: dts: qcom: qcs615: enable pcie for qcs615 soc

 .../bindings/pci/qcom,pcie-qcs615.yaml        | 161 ++++++++++++++++++
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       |   2 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts      |  42 +++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi          | 158 +++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c        |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 105 ++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h    |   1 +
 7 files changed, 470 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-qcs615.yaml


base-commit: ee5d1329f3de0b8cb77084715c1179627a9d599c
-- 
2.34.1


