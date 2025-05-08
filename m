Return-Path: <linux-arm-msm+bounces-57227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F5DAAF547
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 10:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25CB37B6D5C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 08:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB2F22C322;
	Thu,  8 May 2025 08:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dYIkN4t7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5653821ABC8;
	Thu,  8 May 2025 08:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692155; cv=none; b=r0YWWuCrLscMsxigkf2KHJh8wRhURi0qkPCeP+6TRylAUboupFoHoiYHQgvzJa4UWaHmhz1Y06C2wF/X5g2/9pTr+40ksJjLJmkjlH6tHyVxIZs4eeFZO4NHt8X1jrdgItgByBs1TfaXnzHqi2H29v4/72OwyhtypYR8gLFN3qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692155; c=relaxed/simple;
	bh=/Ip66Tz+23274kIDtequxZdP52nIgtue5he9KEReO/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MZMVQ8U5+JgifzelbNY7K7ZHbw7g3lSeLDOP9LhQjByc70vToYFVYL7fRNr1oZ5ET3KplVAkc18LSgXN3gLh/OkQ0n2zVEEFaHI97dOuOArAviNJtU9tKw8DOiq0QBUe7LwiipEg9Rt1VFdg0Ot99QG41YWG1Kk1xC7ASikQkPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dYIkN4t7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484XEF1009418;
	Thu, 8 May 2025 08:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ARiW1L4tiT5iBYOOQbCx0ZDmWGO3FEV9285
	jooej9Js=; b=dYIkN4t78AWUQTqDyDoir8+ic1Zcz99PzSJDdu8VmSKah8VjRKK
	/5xPU89w52dqKD7tj74RBnMyzukw4yRWRofqe1UEeDWRLrlI+ob7pD2kE0at1PyK
	WKxsULdzkZO11/6F7+V5tqbeMp4T3nErCds6TBixl6vwIDAqwU9O+6Y+lXcE+A75
	Qya/OlRN4Eevr7XJFa7VZ6HTW0Bn6Pm8Qb7y6MW1Oyig/n0avwjCAZ0uJ2PUw1VR
	eBsdHCFxXT1VEe74BiC6u4iubu8Q46ruT877R9AnDW0+S7i6PageGwNT70k7DEXJ
	g5Bk/SFzlc08tWutvm874CUTowldef0XpNA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnperh5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:34 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5488FVjD015212;
	Thu, 8 May 2025 08:15:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 46dc7mq5f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:31 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5488FV2t015199;
	Thu, 8 May 2025 08:15:31 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5488FUvP015198
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:31 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id CBF9540CFD; Thu,  8 May 2025 16:15:28 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com,
        quic_wenbyao@quicinc.com
Subject: [PATCH v3 0/5] arm64: qcom: x1e80100-qcp: Add power supply and sideband signals for PCIe RC
Date: Thu,  8 May 2025 16:15:09 +0800
Message-Id: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA3MiBTYWx0ZWRfX9Rl2cXH2JA+e
 gS5hPybH3+FlvOLrpRNHOJiFwppLc9Y+i5+X2nD3jcXQDEyntulxKHq89z1t5nZldbdNuwoZJfD
 MgY+5wZELbGcakg9zSeZtWKOYCn1pJfSETexwEv1VZ7GmjnpmUXBS1wD7e8Afe/s9rIPL93RXmE
 hNFMdO03CqKHYi1PL1TcuiQ5gNDEHsSRbjGJM51dcITZ7bjRoYbg966jC2FlNHtWXl8gijEPNUu
 LvuxRlfcB/zDmYwqj7kulMseHOMZkKPWHaOyzRgHgtSMMBzefPZ17svWK/Y43y29gIInAy1zskq
 BSAwd6H6hUsLDt+8g0efBs7uEz4urD9O30UlgbLgq2Wc1lhp6RgQAIbkUAmEZYz67KzQMTFZ91P
 38+i1IGPxU6O9iwWS3U8bywyIMg0R9qYhqCTLKyaolHJYfGQ3Ai2CbG+B1DblqmbaPDE0rU6
X-Proofpoint-ORIG-GUID: dxZEV0NnWuBV0HwtqCE43qcJprTz0pQm
X-Proofpoint-GUID: dxZEV0NnWuBV0HwtqCE43qcJprTz0pQm
X-Authority-Analysis: v=2.4 cv=Yt4PR5YX c=1 sm=1 tr=0 ts=681c6826 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=gQCXtSsaVPIGO4BefbEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_02,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=872 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080072

The first patch enables the PCI Power Control driver to control the power
state of PCI slots. The second patch adds the bus topology of PCIe domain 3
on x1e80100 platform. The third patch adds perst, wake and clkreq sideband
signals, and describe the regulators powering the rails of the PCI slots in
the devicetree for PCIe3 controller and PHY device. The fourth patch adds
qref supply in dts nodes of PCIe PHYs. The fifth patch requests qref supply
for PCIe PHYs.

The patchset has been modified based on comments and suggestions.

Changes in v3:
- Replace PCI_PWRCTL_SLOT with PCI_PWRCTRL_SLOT in Patch 1/5.
- Kepp the order of pinctrl-0 before pinctrl-names in Patch 3/5.
- Add Patch 5/5 to request qref supply for PCIe PHYs.
- Link to v2: https://lore.kernel.org/all/20250425092955.4099677-1-quic_wenbyao@quicinc.com/

Changes in v2:
- Select PCI_PWRCTL_SLOT by ARCH_QCOM in arch/arm64/Kconfig.platforms in
  Patch 1/4.
- Add an empty line before pcie3port node in Patch 2/4.
- Rename regulator-pcie_12v regulator-pcie_3v3_aux and regulator-pcie_3v3
  in Patch 3/4.
- Add Patch 4/4 to describe qref supply of PCIe PHYs.
- Link to v1: https://lore.kernel.org/all/20250320055502.274849-1-quic_wenbyao@quicinc.com/

Qiang Yu (5):
  arm64: Kconfig: enable PCI Power Control Slot driver for QCOM
  arm64: dts: qcom: x1e80100: add bus topology for PCIe domain 3
  arm64: dts: qcom: x1e80100-qcp: enable pcie3 x8 slot for X1E80100-QCP
  arm64: dts: qcom: x1e80100-qcp: Add qref supply for PCIe PHYs
  phy: qcom: qmp-pcie: add x1e80100 qref supplies

 arch/arm64/Kconfig.platforms              |   1 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 121 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |  11 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c  |  37 ++++++-
 4 files changed, 165 insertions(+), 5 deletions(-)


base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
-- 
2.34.1


