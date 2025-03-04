Return-Path: <linux-arm-msm+bounces-50271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA347A4EFAE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 22:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AE4B7A3F80
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 21:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429842780FB;
	Tue,  4 Mar 2025 21:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QuM4YPpw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3DA24EAA8;
	Tue,  4 Mar 2025 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741125479; cv=none; b=LFJdXP01FfvlhcnW3bmdgfoqN1CXqh+lWhUhBKZVmuAJ4om1avLxpKjpxuTubPNrwfqGrSd6WCp/9BezufykSGl5FoqBS63VM11qHjAYceItW+KZD5h2yVv6PzjQWl3d6AWtK/pSnlU+H9IJvPufdJ0NziJTKHkzXi7hJkcnjO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741125479; c=relaxed/simple;
	bh=9rRYFsEsVrMx37ehmR6fho88IeXrskKIXHekpFyUXWI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=X3rhG6NvBCtlhA/DUkW+Y7isB3zhTl9gjPzaMMkSwDb6NFYuA0bx/cEoqgC0jAkj0TQcpCv+hygj0LI9PrFuI3LPK35hPzT3Rdq7rLwy2cgYYd9OZOHCWD1ENiAH/4peGBdWb2k6K0W/1SVWsgTyCxWy67RBgR2azmW+G1F+sYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QuM4YPpw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524AZBvw010211;
	Tue, 4 Mar 2025 21:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cOIIZ8FZFU7mksi3tzXnVO
	LfsOb/+Dn0c8S1ublaoZo=; b=QuM4YPpwNKad2gKeH3kn1SbIzyGb/BNNpA/SDH
	LaCfbCvLjqCvrrZ9vEHnIzpJxXkeMN5bJlR9n8FEUBu2o5giU/4eFMpZAtAoamIy
	O3oz4T0HCpoEBix2Q4GZWFPVPDPnZpjtG+h2tgleVu3J9RmabbrO8bssP+XpdDuo
	MxCbgrZdUYHOZJG8xv0wSdxYGR9sphtyza4O+zLAvYkt0RchVwyBw5jbt6V1Srxk
	ymc3ijmmaAgulVncuAn8HifsX0pn6wIO76Mv6u4bfsqPDlwEhol/zj+wgZ0YBrb+
	aMYjEAldMVXzkCv97fGuhVTQjinAPWLVBtbE4GzW1pV1SHcw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6wk8y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 21:57:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 524LvaZl014462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 21:57:36 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Mar 2025 13:57:35 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH v2 0/9] phy: qcom: Introduce USB support for SM8750
Date: Tue, 4 Mar 2025 13:56:33 -0800
Message-ID: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABF3x2cC/22NQQ6CMBBFr2JmbU07gqgr72EIqe1UZgFoB4iGc
 HcLLty4fD/5700gFJkEzpsJIo0s3LUJcLsBV9v2Top9YkCNmUHcK2mORa6rQW5VY6WnqAIWlnw
 RDj7TkH6PSIFfq/NafjnSc0jq/jfWLH0X32t3NMu6JHJtzL/EaJRW+mQDGe8wx+ySfI5bt3NdA
 +U8zx9jxdHoyQAAAA==
X-Change-ID: 20241223-sm8750_usb_master-f27aed7f6d40
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741125455; l=2726;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=9rRYFsEsVrMx37ehmR6fho88IeXrskKIXHekpFyUXWI=;
 b=fMWjktR0b5uW/W+F3cLpeOXO8pcUgj/FLwrrdfa0eQzDYpTW3IgRwaXv7Ia42XrK8muNO3r4p
 6srtgStylaBAQ0E9wTPuDWGfvlE0xN6w1Ege5Qh8+xV623Ju2HelmiQ
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EZcyQOmC c=1 sm=1 tr=0 ts=67c77751 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=wn7q5I4-uf_KSUSPJ7EA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: P1C0mChZInZXEHFmkKKOr-y0o5WpRfNA
X-Proofpoint-ORIG-GUID: P1C0mChZInZXEHFmkKKOr-y0o5WpRfNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=946 suspectscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040175

Add support for the PHYs and controllers used for USB on SM8750 SoCs.

---
Changes in v2:
- Added new QMP PHY register definitions for v8 based QMP phys.
- Made changes to clean up some code in the M31 eUSB2 PHY driver based
on feedback received.
- Added bulk regulator operations in M31 eUSB2 PHY, to ensure that
both the vdd and vdda12 regulators are properly voted for.
- Removed external references to other dt bindings in M31 example for
the DT bindings change.
- Split DT patches between SoC and plaform changes, as well as the
PHY subsystem Kconfig changes when introducing the M31 eUSB2 PHY.
- Added orientation switch and port definitions in the DT changes.EDITME: describe what is new in this series revision.
- Link to v1: https://lore.kernel.org/r/20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com

---
Melody Olvera (1):
      arm64: defconfig: Add M31 eUSB2 PHY config

Wesley Cheng (8):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8750 to QMP PHY
      dt-bindings: phy: Add the M31 based eUSB2 PHY bindings
      dt-bindings: usb: qcom,dwc3: Add SM8750 compatible
      phy: qcom: qmp-combo: Add new PHY sequences for SM8750
      phy: qcom: Update description for QCOM based eUSB2 repeater
      phy: qcom: Add M31 based eUSB2 PHY driver
      arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
      arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP and QRD platforms

 .../bindings/phy/qcom,m31-eusb2-phy.yaml           |  79 ++++++
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   2 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   3 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  24 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  24 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 163 ++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/phy/qualcomm/Kconfig                       |  16 +-
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c          | 296 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 +++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 +++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 +++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 +++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
 16 files changed, 1034 insertions(+), 3 deletions(-)
---
base-commit: 20d5c66e1810e6e8805ec0d01373afb2dba9f51a
change-id: 20241223-sm8750_usb_master-f27aed7f6d40

Best regards,
-- 
Melody Olvera <quic_molvera@quicinc.com>


