Return-Path: <linux-arm-msm+bounces-39378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E39A9DB368
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 09:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53D412823FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 08:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A60514A614;
	Thu, 28 Nov 2024 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IHxtX5sI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228EB1482E1;
	Thu, 28 Nov 2024 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732781479; cv=none; b=Z7rH5PekcJFItd1cxmOhxT+wSeLwr7Ag0fr5jdIn6ztJAdE6w94L0Q3G4rlNyUuVAyrrcYoZ9hQgEpLtRXxef9hlxGfA6+BZkxmH3aY5pPlyEmcHOKNd09u3lAgfL2LQyJClLNlHaMi3Snu6RF45HgZTb5LJa+K8Jb4PS/a/Xuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732781479; c=relaxed/simple;
	bh=0Yjlv1zxjtWwFzCEJUFhvv7UJ/t+8eJGMcnnnPP0aZw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cXEGBD83UmloNfslrkCeD8NmBjqAJ1RyHokzAtNkBZ3+3BZ3k08fJwxzp3rQnVkW/0oaGXbw7UTfOYIQpg1+VQLPgL4WgBOyV7s2g0Qy5NTb1gBYDZrlmszFT2+HFbfdCHOxsux/kU5TQt6jdPSu5zUrSBavdzVP2JZZHyrR1Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IHxtX5sI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARGS4wh006720;
	Thu, 28 Nov 2024 08:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=u4dNUwyK9c1dBOXv1H5Bh0Gn4Lm7Xo7ifqK
	dIbjjRz4=; b=IHxtX5sIZo9uay8RN51eYClSVd8VQpws2wqlRf21Yy2ruxJ9aEB
	FJoFpRtseU7cJGZnlk3b5TxXP8Ylt7U8kRHrZ2lpTYqvFgp+zU7lrGO5l/m7/qez
	jOTId/H9iF+XGgCAkWiregpw5FBciX7Sv763oqPcSGuXla1cWFIjv6bAZm7b+ZAb
	i1dN8xzecWfAJrg34RLfRMhH5d+1ZRs3MAk+OWmuUS9yDhVDtkpAfpzmTxpxZ2cF
	NjTioaKgpZb5vmB/jpS8Z3RyoOVJEiplEACLCbmg8xfgqaIsIBkAMlpgYbJ4eoEI
	3Pahv0/evFyRktTdK6xjU9XAQS8HZx3Egdg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xvssn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:11:03 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS8B0C5002552;
	Thu, 28 Nov 2024 08:11:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 43384krmkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:11:00 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AS8B0D1002540;
	Thu, 28 Nov 2024 08:11:00 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4AS8Axfs002535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:11:00 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4438065)
	id 42E8E18F7; Thu, 28 Nov 2024 16:10:58 +0800 (CST)
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
Subject: [PATCH v2 0/8] pci: qcom: Add QCS8300 PCIe support
Date: Thu, 28 Nov 2024 16:10:48 +0800
Message-Id: <20241128081056.1361739-1-quic_ziyuzhan@quicinc.com>
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
X-Proofpoint-GUID: hChESRiYJE7ubjtSESWSx9ks70xBn3q0
X-Proofpoint-ORIG-GUID: hChESRiYJE7ubjtSESWSx9ks70xBn3q0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 mlxlogscore=638
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411280064

This series adds document, phy, configs support for PCIe in QCS8300.
The series depend on the following devicetree.

Base DT:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
---
Have follwing changes:
	- Document the QMP PCIe PHY on the QCS8300 platform.
	- Add dedicated schema for the PCIe controllers found on QCS8300.
	- Add compatible for qcs8300 platform.
	- Add configurations in devicetree for PCIe0, including registers, clocks, interrupts and phy setting sequence.
	- Add configurations in devicetree for PCIe1, including registers, clocks, interrupts and phy setting sequence.

Changes in v2:
- Fix some format comments
- Add global interrupt for PCIe0 and PCIe1
- split the soc dtsi and the platform dts into two changes
- Link to v1: https://lore.kernel.org/all/20241114095409.2682558-1-quic_ziyuzhan@quicinc.com/

Ziyue Zhang (8):
  dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the QCS8300 QMP
    PCIe PHY Gen4 x2
  phy: qcom-qmp-pcie: add dual lane PHY support for QCS8300
  dt-bindings: PCI: qcom,pcie-sa8775p: document qcs8300
  PCI: qcom: Add QCS8300 PCIe support
  arm64: dts: qcom: qcs8300: enable pcie0 for qcs8300 platform
  arm64: dts: qcom: qcs8300: enable pcie0 for qcs8300 soc
  arm64: dts: qcom: qcs8300: enable pcie1 for qcs8300 soc
  arm64: dts: qcom: qcs8300: enable pcie1 for qcs8300 platform

 .../bindings/pci/qcom,pcie-sa8775p.yaml       |   7 +-
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       |   2 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  86 ++++-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 352 ++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c        |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      |  89 +++++
 6 files changed, 534 insertions(+), 3 deletions(-)


base-commit: eb6a0b56032c62351a59a12915a89428bce68d1d
-- 
2.34.1


