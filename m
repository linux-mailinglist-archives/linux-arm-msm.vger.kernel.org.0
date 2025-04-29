Return-Path: <linux-arm-msm+bounces-56017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B1CAA0209
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 07:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1931E3AB4F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 05:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFAF2749EE;
	Tue, 29 Apr 2025 05:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UhO3Gqvy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BB7224AF9;
	Tue, 29 Apr 2025 05:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745905762; cv=none; b=Oi96cSO6MLKtqyNLLAE1N3yIpPBMLstk+RU7S51WTOmPSK5EoZYJl+irLdIouaODGlqcG/0GGZWlA7z29KbVFZ15W3/gtZpdGlGw62ShbCXwiV/l4im5s/G8AwiWEMg0cZNaL9yoKJMiABGtXysGkyXqtKIR9T6EhueOmqs3Zbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745905762; c=relaxed/simple;
	bh=odt4BvtRQCAZwHMR4seRzeiLOow/lp91qKjPibzrn1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mMkHjcgjZNfHH3J52aTbZbHybWZZiXSZZYiLdrTeKiph1+B3RM6sYKO1DNqdeGDZHiObXI0fIByJlxDyi1XUxP8S1swYfYZqRwOISDQyFS0p6kjBRFhqjFrrFNQ6djXcuHdsOZHeYcnVus7YmqEwe/LFbS+p+ICfrgBAml0TMsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UhO3Gqvy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqKsm012626;
	Tue, 29 Apr 2025 05:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iW1XVZ8l6CJyFrlX5XcyWr
	a0zw0oiwZNvz4GD/HpHkc=; b=UhO3GqvytDaYfCLz9Lb+hGV13QJ7eEDPAd8VQv
	yYPXxZGaltYYuCTt9hNvDboSMoUtmnoNL+c426zpFK9SgU87AABH1haD54ig3Jh+
	ioTQ4pMQ8MAvumQ1E6vQ8BZkF0BGb+2zoyP0LV9LlxIKYeSG+qGBPoF2Ji4xwmeP
	WzZsu9bjPhA7V2cn/ishCRQcNd7RyCtvctBrMnHJ6DPk8dODuDSTA4FkwH7HNTar
	RBZ5IVGr1Dt7BMnBchsm1j2nEopfJsJPXqDVDPSHOTmUSTUPttPbSAbco67hSX0o
	ks3wQbOgGuqSS6ufxCkiBBBS5MVgGmFO+NF2mhtyqTvOoT+w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q323bfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:49:15 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53T5mmS5029225;
	Tue, 29 Apr 2025 05:49:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 468rjmfqus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:49:12 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53T5nBUc030237;
	Tue, 29 Apr 2025 05:49:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 53T5nBju030223
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:49:11 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 9C6C45A7; Tue, 29 Apr 2025 11:19:10 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v6 0/4] qcom: Add support for IQ-9075-evk board
Date: Tue, 29 Apr 2025 11:19:00 +0530
Message-ID: <20250429054906.113317-1-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=6810685b cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=BkoitdVaJjL6tbVqwpAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: B8EggLNMhnza9TaW0NLEYT_YrEBzCy6v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0MiBTYWx0ZWRfX1BBu3NMDwRAq dZPwPcZmbd9pb54DGLN3RVDwFg9NBaNKLSKjcIPXWH8DU6baJa4lYonOUNEISjTCfuhhWRKIZpC /boz37QyA43zsFNXQUD/vNuFBbcN+l+UtsOkajX6noCQ2uNk55HySql7Y7c6di+zsQRBJYvFhJn
 y1h7Sk67woC2LSvU3L2RKLioK/3vTw1Pd2Tkd908nQDHepGt8zGizjrZFDbuYyxJJ3kqG9D24UH /Vr6jNhCuMdCT30NttCJ/m9Eu1wViUOhoAi2vfOHYg+MlFs8zoyBDLw9buNr7GWUceDnst+W9I3 zdXjdsnLNTcgNFc+oLx2JULUXLMz8lInO5+eo0p5j6ixiXIphooTMw1l2PUOkc/nZxYBJ663piv
 IYIzVwLqzLYzK5KL3tsRT+/prXwFpmz4mRz1w9IkAM0sD+cOSGRRxDbw9oqCu3cw2QQdmTdH
X-Proofpoint-ORIG-GUID: B8EggLNMhnza9TaW0NLEYT_YrEBzCy6v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290042

This series:

Add support for Qualcomm's iq9-evk board using QCS9075 SoC.

QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC.
Unlike QCS9100, it doesn't have safety monitoring feature of
Safety-Island(SAIL) subsystem, which affects thermal management.

In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
does corrective action for each subsystem based on sensor violation
to comply safety standards. But as QCS9075 is non-safe SoC it requires
conventional thermal mitigation for thermal management.
In this series thermal mitigation changes are not included as it needs
more discussion whether to include the change in DT or in drivers.

Below are detailed informations on IQ-9075-evk HW:
------------------------------------------------------
QCS9075M SoM is stacked on top of IQ-9075-evk board.
On top of IQ-9075-evk board additional mezzanine boards can be stacked
in future.
IQ-9075-evk is single board supporting these peripherals:
  - Storage: 2 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
    eMMC on mezzanine card
  - Audio/Video, Camera & Display ports
  - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD
  - Sensors: IMU
  - PCIe ports
  - USB & UART ports

Currently basic features are enabled to support 'boot to shell'.

---
Changelog:

v6:
  - Splitting v5 and bringing only rb8/IQ-9075-evk changes.
  - IQ-9075-evk is the new marketing/product name for RB8 and files are
    renamed accordingly.
  - Introduce SoM for qcs9075 SoC.
  - Introduce Memory map changes for IQ9 boards, currently enabled
    for qcs9075 based boards only.
  - Remove l4c regulator as it needs more validation with UFS for
    over-current check.
  - Remove thermal mitigation change, needs more discussion for final
    change.
  - v5:
    https://lore.kernel.org/all/20241229152332.3068172-1-quic_wasimn@quicinc.com/

Pratyush Brahma (1):
  arm64: dts: qcom: iq9: Introduce new memory map for qcs9100/qcs9075

Wasim Nazir (3):
  dt-bindings: arm: qcom: Add bindings for QCS9075 SOC based board
  arm64: dts: qcom: qcs9075: Introduce QCS9075M SOM
  arm64: dts: qcom: Add support for qcs9075 IQ-9075-EVK

 .../devicetree/bindings/arm/qcom.yaml         |   8 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 108 +++++++
 .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 268 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs9075-som.dtsi     |  10 +
 5 files changed, 395 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-som.dtsi


base-commit: 33035b665157558254b3c21c3f049fd728e72368
--
2.49.0


