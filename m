Return-Path: <linux-arm-msm+bounces-38752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8175A9D5856
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 03:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FA03282926
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 02:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B671632D4;
	Fri, 22 Nov 2024 02:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nr3Hz46v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FA715B13C;
	Fri, 22 Nov 2024 02:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732242816; cv=none; b=TjnBYfRio55PqxalthomT3lgqs+zTda/iXAroRWb0KR9RnRm+fFEqeJS9PbbN++aIU9f/ml21cgRBju55sOiK7zL140Kw0kxbKeiU8Ng+O+KIOSWsrl97ZiNHEDxWuK618sDA6+WkcYyIBd+dURr5EMSa5nEUZiSOSVCeXRLh3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732242816; c=relaxed/simple;
	bh=Wv8aaKMNXf5fFFoMivRouy3WF3ZddCnD93YPIXhVAak=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OXRaVkGDtXODYlyKWa0fNNRniBfxi6eAXGnJWOEsetWHBdrttHpJReNAvjAhALwIHGFCNcs4W3YG16uUKl/W0ugosSPqozkBWtYXR20+4bqaze18kx3l0lWb5IwGjK3AJIihTdJdRsMJEv55F3c7vP9UqWhmowrje9u88bGnZIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nr3Hz46v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM2MnQo027670;
	Fri, 22 Nov 2024 02:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HbaacPoWw+zHbgHVwFJSi1KfOdWJJI5d9BS
	LFWotaX4=; b=Nr3Hz46vxRrE35c9rnFbg6IOGTV90qJra/1vxm0FkqfGEdvV1OZ
	pTu2xwYnfrWasACE7PV5C5RZyTlcUciHYKRTixPK1irdsXR2R2SYx4Pfnka21qdp
	pECO7Gwr4GeYlzO+Y/1FCaLuGsP6iR3uAZZCgSWn8SZLdQvs9Qy0VoK2HkO3h1xL
	G/iQUfHBzVA9dyr9CF8fLYQMNUmP1XRre54NllvRdlpkCfdQNwMbo0SLFwH4f2Uj
	5iWLQwFnxeGKnwkamfNRNAMD9xfErc0TSIrWkbUe09UPw2Lxy6PHUUvZVdOzMqsg
	kj0Ttq3/eYrMMuybRZAjlrNil4Ess/Tz1IQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432h4dr0qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 02:33:23 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM2XKTq014105;
	Fri, 22 Nov 2024 02:33:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 42xmfkuj8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 02:33:20 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AM2XKaE014099;
	Fri, 22 Nov 2024 02:33:20 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4AM2XJYe014095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 02:33:20 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4438065)
	id 7EDBA17FB; Fri, 22 Nov 2024 10:33:18 +0800 (CST)
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
Date: Fri, 22 Nov 2024 10:33:08 +0800
Message-Id: <20241122023314.1616353-1-quic_ziyuzhan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: VHTHthiz7Zm4uUP0Cjwvhf89zYjEefSV
X-Proofpoint-GUID: VHTHthiz7Zm4uUP0Cjwvhf89zYjEefSV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=779 spamscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220020

This series adds document, phy, configs support for PCIe in QCS615.
The series depend on the following devicetree and smmu.

Base DT:
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/

APPS SMMU:
https://lore.kernel.org/all/20241105032107.9552-1-quic_qqzhou@quicinc.com/

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
---
Have following changes:
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


