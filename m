Return-Path: <linux-arm-msm+bounces-59869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38420AC8ACB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 11:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E6A61BA78E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 09:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F9C229B3D;
	Fri, 30 May 2025 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gRDjdDlg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0434227E8F;
	Fri, 30 May 2025 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597354; cv=none; b=Ul3X2DFWF9+3MT1rGAJ+M0GEPy13ALECoBvwNscrJfx0J8LmOZ3wlwvwMsWLtn4uoMSVqxB5Y9H4B/JaC9K9QQEYMsYoWmIUa+JWIDQ/mm+CPFmd042uRdzKOZaU1kxhuvK8ey85x4u/rndARzmkb8mHox0nWMuNAPpJkfMCJTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597354; c=relaxed/simple;
	bh=ZEybsHDXyPCaqq5mNJW+mpZvnSf4f7JjB5O+755MU3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X691093w6eExPcHX2ZQDig66/ZysXyTfgwUhu8kdEDhAE3LxL5MEm5gGkwyxrcPQV+WnDokfooJJL+Kw40jSd8CtAZ4amzzA9+uVJj6H9I3lIvNrY8ru742A/hAGdgWTBp2RIVm9RiwPCUgs4YnoMMjfKA2zQHE/HNqNVU2IjoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gRDjdDlg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U0T53G008030;
	Fri, 30 May 2025 09:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tzmvSRrblqgZgKJaCs+zrv
	qpz5Rlg71VuyXyzdUPXeM=; b=gRDjdDlgopV3yajHmhLV/TvaqgRArmvhCFeiIG
	xhfQg3TSpo34Tc4I7EK3s+84a/PcKpnAKXIcLH0rrMYTvGVOIA8mQ3nOz31zoatv
	nPy68UGt//IYiktcVo6XvmDuL6sM7dl2kXixPRyFxXJVR6EicM7tnM1f+vsnX95o
	W+4HNI7cjvMVBOLfmYzZdw+CgCs4eVuOZV8S91nbK5uphQdlwkN4iQ2n22dzf1RK
	8XnpzE8L+FBZw0K6D9Ivyq4AEScQGtvtKi8gGHGnOLs8WvS8hDc6lx9WCIawvK5n
	BUqMkIZuY+HaHS4a9qEZ73qZB0Mwm0ajeRag1dC81sBAY+Mw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf8x28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 09:28:57 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54U9Sq8u008752;
	Fri, 30 May 2025 09:28:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46u76my9gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 09:28:52 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54U9Sqf8008720;
	Fri, 30 May 2025 09:28:52 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 54U9SqqA008719
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 09:28:52 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 27DF259B; Fri, 30 May 2025 14:58:51 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v9 0/4] qcom: Add support for IQ-9075-evk board
Date: Fri, 30 May 2025 14:58:43 +0530
Message-ID: <20250530092850.631831-1-quic_wasimn@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=68397a59 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=u6Jdqvu1gAsBJA_3vmsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bCPyZCNHn_0psLFWJTWRehzF6fSOhSb1
X-Proofpoint-GUID: bCPyZCNHn_0psLFWJTWRehzF6fSOhSb1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA4MSBTYWx0ZWRfX87BzHTAyUUvr
 KevXIY5/L7DHZolCNjsZ3qC3XXmBIWOkVuGGYxaZ/pV4w/UxQNtKzHx4Qywc810h7iE814COeUy
 gqYkZhsxWiZspIO6w7FFT69DogvnVURVxGiJF6ilB2m0hQ8QxoMHO7wl0k8f7C5ESK+ZuwHbFjL
 74A9ToIgUSF+32GeRiV31Vsvgf3Ncs9snqpjz7UbA1j1UrOLmnhScwCQeZp7vOr2merdUXicucL
 PW8JubjEjCUN48fjvaKIH/SU2W9PcvfZeoRZzOZe1rgXyx4ArnmRINFs/U1w3x85Y4S5hv39ejz
 zRYN9VJ3AFY8QhVy51Zds9Dz4gJQqFueT1DBGVowq72k8FSW2Bv2UV5MKVoQm/i4d73VXdHUOgP
 +LFiVaW6D4aLIrMmv+vyJy9BavlOkPElol07yPnxonBTKCem0d1Gg5jfAUPHO/p9vgIeXXOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300081

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

v9:
  - Retain earlier tags from Rob Herring [1] & Krzysztof Kozlowski [2]
  - v8-link: [3]

v8:
  - Squash UFS support [4] into initial board support patch.
  - Remove uart10 pinctrl settings from board, it is moved to sa8775p.dtsi.
  - Arrange ufs nodes in alphabetical order.
  - v7-link: [5]

[1] https://lore.kernel.org/all/173142574295.951085.7523517676553074543.robh@kernel.org/
[2] https://lore.kernel.org/all/20250430-enlightened-enchanted-jellyfish-7049d0@kuoka/
[3] https://lore.kernel.org/all/20250528122753.3623570-1-quic_wasimn@quicinc.com/
[4] https://lore.kernel.org/all/20250513084309.10275-1-quic_sayalil@quicinc.com/
[5] https://lore.kernel.org/all/20250521140807.3837019-1-quic_wasimn@quicinc.com/


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


