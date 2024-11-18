Return-Path: <linux-arm-msm+bounces-38184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCC29D0AD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 09:27:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D701AB2173E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 08:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12BC17BEA2;
	Mon, 18 Nov 2024 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VyYMSHuY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D63150981;
	Mon, 18 Nov 2024 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731918401; cv=none; b=gpSwh8dR2tQYnUAoZYYT5TEVRLKXrN8r8P74SvyC/9OFS7cRPykpmftn1kE7KkCYMyU2+fXGeHfp6pmxEkdc5HuOmAHCloILodlCORxRcWlQ9Ia0201GhWgqeeGbn3b5/JpyUy3rbowybBmAnf47LIzGyMAAld22z01DT2dGmE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731918401; c=relaxed/simple;
	bh=gDrMeV9MwwBzYsuzQ3TyVJ0KayhyC79x0oMfymSEO0U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u3O85TQMmGyZIi5b5P4HPi/sPrebj6usRcjapF/k2Nghk2mz1miY003RFDIcOKgokUK5Exj8KvKuPt0eciWBuEZAvu2DZbwb+zyaPl154W8JJJeuGsQXhmBwAX6XuKnCHVBJDkyo4jX/lFL+5MY9iqithITVsk34FpkHYLr8nKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VyYMSHuY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5RpKT003126;
	Mon, 18 Nov 2024 08:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EGYM5UI0/CHTzaZbEclW0boEFuOVhs4u5Y7
	OeKVJmGc=; b=VyYMSHuYdc0P6UpfhsxrBOEROldbQSU8Ih3tpA/douZ8B/7NPfH
	Lvc8MgMdJBoiFKqVdTa2gaseiLdW1IzRE9PhB5z+zDaVEqRBYjD5rA6OY3qOITWp
	exnPhsvFVd8rcRIFyw5+ot8/eWs0DhrA2Vkxn0Ae4AfSCg9ICmeIX1ID3Xyl0sRA
	YmgDIq9lX3OJ8Kwofun9z5qlZifAegRSH8Gq/FuvaSecD2LJ7R3vEM6JlAK1gO3d
	Gl2hsE5lfDkTRjJ2lqU7ogmqjKgvsbbIcPik9+Fxy53R4Xf8gcdbr7i9+et/EyPE
	aoybcag+EgAjkK+ZPkuJvZxJvlRIVke9yWw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkv9uuu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 08:26:26 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI8QOe5010288;
	Mon, 18 Nov 2024 08:26:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 42xmfk9tc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 08:26:24 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AI8QN0V010282;
	Mon, 18 Nov 2024 08:26:23 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4AI8QNEt010281
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 08:26:23 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4438065)
	id DB8DF176D; Mon, 18 Nov 2024 16:26:21 +0800 (CST)
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com,
        lpieralisi@kernel.org, quic_qianyu@quicinc.com, conor+dt@kernel.org,
        neil.armstrong@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: quic_shashim@quicinc.com, quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: [PATCH 0/5] pci: qcom: Add QCS615 PCIe support
Date: Mon, 18 Nov 2024 16:26:14 +0800
Message-Id: <20241118082619.177201-1-quic_ziyuzhan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Ea1OId-dyM6fcow3BHCb8OonsayJLODm
X-Proofpoint-GUID: Ea1OId-dyM6fcow3BHCb8OonsayJLODm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=732 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180070

Update the relavent DT bindings for PCIe, add new config to the phy
driver add pcie and phy nodes to the .dtsi file and enable then in 
board .dts file for the qcs615-ride platform.

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
---
Have folling changes:
	- Add compatible and phy compatible for qcs615 platform.
	- Add support for GEN3 x1 PCIe PHY found on Qualcomm QCS615 platform.
	- Add a new Document the QCS615 PCIe Controller
	- Add the compatible for QCS615 PCIe controller.
	- Add configurations in devicetree for PCIe0, including registers, clocks, interrupts and phy setting sequence.


Krishna chaitanya chundru (5):
  dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the QCS615 QMP
    PCIe PHY Gen3 x1
  phy: qcom: qmp: Add phy register and clk setting for QCS615 PCIe
  dt-bindings: PCI: qcom: Document the QCS615 PCIe Controller
  PCI: qcom: Add QCS615 PCIe support
  arm64: dts: qcom: qcs615: enable pcie for qcs615

 .../bindings/pci/qcom,pcie-qcs615.yaml        | 161 ++++++++++++++++++
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       |   2 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts      |  42 +++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi          | 158 +++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c        |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 105 ++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h    |   1 +
 7 files changed, 470 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-qcs615.yaml


base-commit: 075857dab69e8d673eeaa4aa7f5228796a4c010d
-- 
2.34.1


