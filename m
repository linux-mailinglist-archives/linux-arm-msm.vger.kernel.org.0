Return-Path: <linux-arm-msm+bounces-58920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C53ABF731
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 16:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A7BB3B7D25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A79A18C002;
	Wed, 21 May 2025 14:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FN4Qk1dr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02A1178CF8;
	Wed, 21 May 2025 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836501; cv=none; b=L+P4VQvt65hH6coIptZ18nQTWu4xr+gAnTKacGNnCBVoWhJCvLWWQ9z7D0jw29rIOFEl6q2pkPIaMwsdg0IYgXVZSxoUBv3DO3+7Ce9fZGsYfgiQm8oy/rMaUyj9oZmOO/fwzJXl340guiVkzMeLEFsfaa3XeUx/vIU13ydd+Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836501; c=relaxed/simple;
	bh=eTzfN1Jmc82z1cYq9rqLrN9Y53sT1ZgrxaRxVtti4R0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TOeqebhETLygcE9o3DOqVV2GukAO7cTuLv3MPVSWwFjLEMxd0nVzTnRVLfq4rCXbmeJr2E4U/3/uBe/XBaZeS02i7bdF0KLHQ0vA3RIkFJl2J7EfbQGghIfqtVitIfi3xu/eJHiV14vXux8dmGY99LUe+k/Hg2NxNAgb+JoNdG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FN4Qk1dr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XL8B016585;
	Wed, 21 May 2025 14:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GKtdfgY1nKwkXMeemckBO8
	iih2UThR/hXEHkbjqeLiA=; b=FN4Qk1dreOmwncjzcdvmEFU71rF4Llc7z/5IqF
	YFTzBZ9nG6WwQbwO6uG0vernxlzlqgXtaNo0tIU07ioME2DVn1uxPKL54DNMBck+
	pXrn1B8OCxsrwXt5eu7qt/dsSqS/1wymRuZSnvQfvitKp02AHWz+EeejbEjzgZKj
	+QmkLQY4/Xv2+f+sknndLibNmIToLVOx1oollyzaJLjR3pm7hSEzGdMs5d1/Ydkh
	gnmlOviU+KaSbJPoM6MU9qqtq//i3LNWc6O+GcLL1Ev7dJP6+4jhjNtKdiSGvlUA
	r+VFMx0QnKL/lYjwVLc6WizR1XGtVngdk0uCbc+EBZhvrFug==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9u6tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:08:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54LE8BsH005917;
	Wed, 21 May 2025 14:08:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhmjbac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:08:11 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54LE8Bsk005892;
	Wed, 21 May 2025 14:08:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54LE8A1U005887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:08:11 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 0835A5A9; Wed, 21 May 2025 19:38:10 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v7 0/6] qcom: Add support for IQ-9075-evk board
Date: Wed, 21 May 2025 19:37:59 +0530
Message-ID: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682dde4e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=u6Jdqvu1gAsBJA_3vmsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: X95554wJ7iERx0wrZ_VIeSZArJfhqndH
X-Proofpoint-GUID: X95554wJ7iERx0wrZ_VIeSZArJfhqndH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEzNyBTYWx0ZWRfX87dNJXVGjAen
 xpc8SQhKnaRsALY3/K/TIEHFLZJlEQjHPtRNDXFA1hOkitxh6+wvtII2em6rVWQqMGzww+mz3Yz
 SXcb5y+Uc58L7xF0RkbQHmLEFC8668yCP+wmDAwIzSTaBi7bPgP5jBbnlfeG5+emehDp1pIer54
 fCaYiExmpQNVNpOF7x9ym+S/9sHuEykWzLkM+pwC2rtwVorw2jSlnismYDQJRZ8JOuZ9HZlz36i
 JRTey2fvST3ZoYanc7MgEsoc96AybUE+uDjvdw7th6HboROoCzhcNYtOpRqiJ0p+A6e4Smvdbqt
 2CbdIxGcHG6oK1FqzvJz8KF9IYLTxdcxZ1TEDwSwd+e3E+VCERWDFyju7BO1+FFobV4E/C8cFeS
 PcbO4rTRtDslSsKhuEKrye6oYVaMsnhe8wlUjok3SmpsRKPaej/JK1SQ3lL4Qk2iPwmNYdA6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210137

This series:

Add support for Qualcomm's iq9-evk board using QCS9075 SOC.

QCS9075 is compatible IoT-industrial grade variant of SA8775p SOC.
Unlike QCS9100, it doesn't have safety monitoring feature of
Safety-Island(SAIL) subsystem, which affects thermal management.

In QCS9100 SOC, the safety subsystem monitors all thermal sensors and
does corrective action for each subsystem based on sensor violation
to comply safety standards. But as QCS9075 is non-safe SOC it requires
conventional thermal mitigation for thermal management.
In this series thermal mitigation changes are not included as it needs
more discussion whether to include the change in DT or in drivers.

Below are detailed informations on IQ-9075-evk HW:
------------------------------------------------------
QCS9075 SOM is stacked on top of IQ-9075-evk board.
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

v7:
  - Add UFS support along with l4c regulator from [1]
  - Remove "qcom,qcs9075-som" compatible and keep only SOM dtsi file
  - Increase camera pil size
  - Update commit text as per new changes
  - v6-link: [2]

[1] https://lore.kernel.org/all/20250513084309.10275-1-quic_sayalil@quicinc.com/
[2] https://lore.kernel.org/all/20250429054906.113317-1-quic_wasimn@quicinc.com/

Pratyush Brahma (1):
  arm64: dts: qcom: iq9: Introduce new memory map for qcs9100/qcs9075

Rakesh Kota (1):
  arm64: dts: qcom: Add support L4C LDO for qcs9075 IQ-9075-EVK

Sayali Lokhande (1):
  arm64: dts: qcom: Add UFS support for qcs9075 IQ-9075-EVK

Wasim Nazir (3):
  dt-bindings: arm: qcom: Add bindings for QCS9075 SOC based board
  arm64: dts: qcom: qcs9075: Introduce QCS9075 SOM
  arm64: dts: qcom: Add support for qcs9075 IQ-9075-EVK

 .../devicetree/bindings/arm/qcom.yaml         |   7 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 +++++++
 .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 295 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs9075-som.dtsi     |  10 +
 5 files changed, 426 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-som.dtsi


base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
--
2.49.0


