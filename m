Return-Path: <linux-arm-msm+bounces-59697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7492AC6948
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1295A3AAF4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 12:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D09128641F;
	Wed, 28 May 2025 12:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LEMILHrV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA4F284B42;
	Wed, 28 May 2025 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435285; cv=none; b=Sq1vtTbFZ1qi+Okb+2QmCJkgpLwzpm34zoLAdSudGTiQfwQcCj+1PN+lkCKPd5JJSBuSXtZADFd1wz2r4vql08rE0CPeYEjYZB0N7o/HJI6uDIi/2pFnViBDCyZMXsjSu81EeydlOfAb7pMtn7EZGqe0sWzPCmQilary0F/NRrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435285; c=relaxed/simple;
	bh=1SccqE+9BX0fANM+exjNH/3hOFGHMYAaS5gFivtJWGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BBr/87yJQA0grzt5KBuGERXhNMuuB9BUnM+xJFY8JvxFyVcf0msrgc/ooa2yJRwN8POLjsZ9VY69H+SDd0LkmAZ7CeceENy4378Q7vChiWCjVUNYcORbSym73eARAcCM8jdiccQFCy/YFv/NGFI7x284aVHjWjM7u6Cd9doLNtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LEMILHrV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SBBXxL022698;
	Wed, 28 May 2025 12:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+JENbwl/gu1n814nWNwrxR
	lRfAq3RS5W+s34BCA5xRw=; b=LEMILHrVE8nbRALbSDjlq/g99mVnZmS4EcWOAE
	z9gqOrNKheU05uYxVf1E6uz5tUbwy3NUxe1p5OTR2stLPumUUtVCZG6REBulIRih
	KT9sXB72TZ3yokpKgcwFWbRz1Kn13HCpiHrFZlWdQocFLP2t70YGvlAJXcPNH6lv
	AjTm8R0VUS9MGhkgYYGV45HL/ogdC+Ak9RVZvnPL6wOquWEV9T8aE4NLm3mXBTLs
	nSGUYTwE2LJg8ysZDgIe+Ql/+HujJOUaFElhT+RNtpwCWyGP4QpwlhV763HsGBIK
	lZSFOoqm0+iJgkOQ+QhNQOB3h46v4+L4OquC1GD9cgjUzXbg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjt7gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 12:27:59 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54SCRue0011485;
	Wed, 28 May 2025 12:27:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46u76mxk34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 12:27:56 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54SCRtQW011460;
	Wed, 28 May 2025 12:27:56 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54SCRtRM011454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 12:27:55 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id DD7485A7; Wed, 28 May 2025 17:57:54 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v8 0/4] qcom: Add support for IQ-9075-evk board
Date: Wed, 28 May 2025 17:57:47 +0530
Message-ID: <20250528122753.3623570-1-quic_wasimn@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68370150 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=u6Jdqvu1gAsBJA_3vmsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: JxI-zCkmZGXduQcCguaCMgC4O1INe56G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEwOCBTYWx0ZWRfX8pg9u0HkDQGa
 cBDmFtUzck7B4i05eG1LD266gOlXMNLYgihuV1olfkwxUHMK+xukZSJbhiAcyO9kQmakifHvqZl
 7dBPzOY2iE8XKupI1otGiZMOjdWR7ypQ2+wJI4zEjeTEM5BXurbdJLTPBjS4znZJyJFbGw9A3I2
 PAjfhU4Y2SeaYNpcaNDN47SR+pfgVG3QQUYBPbu/H3A79hpitFkC5nrO5ojnAh3sbPL0K3vqNbF
 Lwv5n1ZEp8UKzGTVDG9BWZ4xhKpau6/aluDDGy0Oa1Tx2E5jLGlEAII48xzH6CYdiJ7VPlh6x4G
 dOSIWEJbgs3ie5YvcwJvJECyF6g2381+sadgEDLJUbXm9dpLBUgXTZKpNr0kcMI/1geOOFJso+O
 Gc1YjA39BQw1YdcUa+taLCxDk/HunHzFc9rpNjBOhOVego7GBqG59mJNvroiI3YFl34q4KO5
X-Proofpoint-GUID: JxI-zCkmZGXduQcCguaCMgC4O1INe56G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280108

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

v8:
  - Squash UFS support[1] into initial board support patch.
  - Remove uart10 pinctrl settings from board, it is moved to sa8775p.dtsi.
  - Arrange ufs nodes in alphabetical order.
  - v7-link: [2]

[1] https://lore.kernel.org/all/20250513084309.10275-1-quic_sayalil@quicinc.com/
[2] https://lore.kernel.org/all/20250521140807.3837019-1-quic_wasimn@quicinc.com/

Pratyush Brahma (1):
  arm64: dts: qcom: iq9: Introduce new memory map for qcs9100/qcs9075

Wasim Nazir (3):
  dt-bindings: arm: qcom: Add bindings for QCS9075 SOC based board
  arm64: dts: qcom: qcs9075: Introduce QCS9075 SOM
  arm64: dts: qcom: Add support for qcs9075 IQ-9075-EVK

 .../devicetree/bindings/arm/qcom.yaml         |   7 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 +++++++
 .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 289 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs9075-som.dtsi     |  10 +
 5 files changed, 420 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-som.dtsi


base-commit: 3be1a7a31fbda82f3604b6c31e4f390110de1b46
--
2.49.0


