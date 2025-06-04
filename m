Return-Path: <linux-arm-msm+bounces-60194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A67C7ACD942
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 10:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B97633A742A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 08:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D28228C5B6;
	Wed,  4 Jun 2025 08:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oSE8SrGC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ED01F0E24;
	Wed,  4 Jun 2025 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749024186; cv=none; b=cMoLMjgsNaAN/IzZ11G4XuEsU54CW1LJlgWvNhpO/6BzZ/yVc4AeSsUxz6DPwJ86SkBrRl/nhwkNNBJtOx+0U1IZ7kvEX8oq+LoBsZYQGmo62apNkkCO/34a2yZJds8DhGA7cDpllj02asWwxnyXuHzhSMInZSe7bp8htQRPKQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749024186; c=relaxed/simple;
	bh=ffpe9H2AGyWvAtUDKYO5q1a8AYZUW941LlYAH45pzRg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MgfuMqicefvtBNxOIIqoKpSlGdJMWeTnKYdvNJ4TDj1KLCtOyBmYbDi50ohQkTavsUQuqAeAqMl5U6O+wtyTNyisJSEttWQwAMfOGqf4sifb75udJiAXOkspv81M8W7ixc/bVFvWH4TCBXbA6JnB/+Amzyse4zgjQwXLCB7HzuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oSE8SrGC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5540FG8Z013323;
	Wed, 4 Jun 2025 08:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WvPOB5jmVHirrF+ZgOg9OU5FJ+cx1ttj/y1
	9N8lrRAE=; b=oSE8SrGCFKAwjT3n12v7OzCtlvxurfjfQIwD5gwDAl5PnYfH2m4
	P5P6gPdnLjQ8D7oHF6lNbvI8obtRip8IdaQ94EsukOaCR5y+nJjkPlDr6dybRKqm
	qqzO+tNhNAsU1F3n/bEvAXZpplS3lVzaiTmrDdB1v9TTIJH+wLSzW22BcWHRUDgI
	RkoxaTiBB1+sln7c0tG8QFYkj+fKyts+S2e5p5To81sALdCMtKPV/ZJmcHW9iDmz
	6WBt93SYa/xDpRPInkNqUz8jfHEAw/Fa/wBpaVSJEAKLbpMeb/YDSQwHpiRcmiJI
	j3+x1LOX9C7fOYyT9mRsrs+OJ/3cNUAAoQQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be810gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:44 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55482fVN003901;
	Wed, 4 Jun 2025 08:02:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 46ytumenrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:41 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55482eFm003893;
	Wed, 4 Jun 2025 08:02:41 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 55482eLp003888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:40 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 8FA7E40D25; Wed,  4 Jun 2025 16:02:39 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com,
        qiang.yu@oss.qualcomm.com, quic_wenbyao@quicinc.com
Subject: [PATCH v4 0/5] arm64: qcom: x1e80100-qcp: Add power supply and sideband signals for PCIe RC
Date: Wed,  4 Jun 2025 16:02:32 +0800
Message-Id: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=683ffda4 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Bg7XDE4CPuCW5LNoTQ8A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: oxCH5CblYAdxVFJljLq4RirJs-ofu0RQ
X-Proofpoint-ORIG-GUID: oxCH5CblYAdxVFJljLq4RirJs-ofu0RQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2MyBTYWx0ZWRfX/aDIFhGjh4lq
 ROf3g+FmqCt45a9ln5oLfuUyxPENEEIcMmb8Ug5pXuXc/cM5DPtA24crJFz3ZPgXR1U3VeIJMMM
 zHukVV8dOlVCGAP4GIm4L5YsNAFAkTcoAz5X1JItUj6VZ09dpm3oqwpQpW4LxIKO9PRDJqfWzdk
 So3Nx2vKCwijFxjwRLCF1MaCDtHsmyotXIhlQptyc17wOVN3s/L+Scx77KE52rvhx4nNIOijXeI
 0m4BCl2GPRuaw0zHa1+hS8llPKLBv+Q/GTC1JhD4nvQCRy+sXvSSQ5ubHmD5Xo3BdyeSMEOw3Lh
 vWJHwBDfMSGT7d9+5rI+DXTK2flIpIHfEgE+zOgVvz1E7rhUeXPFdkqJx4gmFXLy6n+BgnPH5nt
 mpWYALNce4pF/8VrQXptOeiklEr/bTYGN5NbGbtlwZA0cwnQWSfgSuL1/wrQ2R60O2O8vW+9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040063

The first patch enables the PCI Power Control driver to control the power
state of PCI slots. The second patch adds the bus topology of PCIe domain 3
on x1e80100 platform. The third patch adds perst, wake and clkreq sideband
signals, and describe the regulators powering the rails of the PCI slots in
the devicetree for PCIe3 controller and PHY device. The fourth patch adds
qref supply in dts nodes of PCIe PHYs. The fifth patch requests qref supply
for PCIe PHYs.

The patchset has been modified based on comments and suggestions.

Changes in v4:
- Replace pcie3port with pcie3_port in Patch 2/5.
- Add restoring the vdda-qref request for the 3th PCIe instance by
  reverting commit eb7a22f830f6("phy: qcom: qmp-pcie: drop bogus x1e80100
  qref supply") in Patch 5/5.
- Link to v3: https://lore.kernel.org/all/20250508081514.3227956-1-quic_wenbyao@quicinc.com/

Changes in v3:
- Replace PCI_PWRCTL_SLOT with PCI_PWRCTRL_SLOT in Patch 1/5.
- Keep the order of pinctrl-0 before pinctrl-names in Patch 3/5.
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
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c  |  41 ++++++--
 4 files changed, 167 insertions(+), 7 deletions(-)


base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
-- 
2.34.1


