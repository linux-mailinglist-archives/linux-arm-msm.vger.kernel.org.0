Return-Path: <linux-arm-msm+bounces-36890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0E59BAF35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 10:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF1E61C23D10
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 09:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A211AC459;
	Mon,  4 Nov 2024 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gInoj0cg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F369E185B4D;
	Mon,  4 Nov 2024 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730711455; cv=none; b=UiYvChSVz8PBGwf3/+jf0ZWUFsKbSjykxQwpCGuh4M+aN1PUsHWfi797TnbnKVWJONU+7DbUaSqfQje5wjOG9Dep4u5sHSY+Uw5XNdQyxCrPyd6Nhe4seYj7ggb6CZYeHMm/OXJqLYqfSI7CBqxXQerwC0juZBouNrorw5moVC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730711455; c=relaxed/simple;
	bh=TOiLZB9+TUCbyQ6juA160AS0UCAnllOUb5owxKncID8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=nK+JjSMTN2Rj0z0HZ22zsZcDGTapbR89ZwXgrMYnpDDO5k/RWfbpXTOt5R7srN4JRYq9xzPWgoNAuxu4ZPFThO5GPzOeY0oE4ahviAedbW+YEB8OPOz9SYBUMQddZeYZB3hQwOmmd4GVUN163G2EZlp210sHkcuG1Vmgx2P8vJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gInoj0cg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3Nw1ku032546;
	Mon, 4 Nov 2024 09:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VVyP+kG/x/vvff0g4CI/xA
	Tpn2KE+IcyF3JSkSbQ9Zg=; b=gInoj0cghHJriHPZrAghmX7V+6y3k9xHXe0RWg
	+LXoRP6qeM7y/nLOOUNtVS0xfopsyaYWZUGbgDNOrgNTMp1DqEUz8VibMkQNvmw0
	3qUyhV5rgFXJJTwquecUc3VaAvYM9JH4dE4hjowi1XH8NrR+Dv8GnOCTBs/omiTZ
	IbKW45C0bCTMrtpZDQzEASi/D9RV6OjD0fKHSPAuQG/RfO8By0hDiPvniF2mS6TX
	f0LaS2zlj5RxhZJFj1a/NoFln1xcUAvJeTIdUGuZHH97nINIzP43AjcqhiUky4Zg
	5+eqq3+SEkAj1yMT75B6c2mK99jVOJwvO0Ik//Sd1p1HjsWg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42p5ye1qa6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 09:10:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A49AT11017116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 09:10:29 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 01:10:23 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [PATCH v5 0/5] Add initial support for QCS615 SoC and QCS615 RIDE
 board
Date: Mon, 4 Nov 2024 17:10:07 +0800
Message-ID: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCPKGcC/62RwW7DIBBEf8XiXCog4Ng+5T+qysLLOlk1Ng4QN
 1WUfy9xUjWHVr30OCv2zexwZhEDYWRNcWYBZ4rkxyzMU8FgZ8ctcnJZMyWUllJobp1raaREdt/
 G4zT5kNreh/YAsZSGl0IbUJWslelYhkwBezotBi+vWe8oJh8+Fr9ZXqc3tFDqL/SsueDCGiOhd
 G6l1eZwJKARnsEP7AqfzX8CL7f4AfM0Urrd8N1KU1x9RC1rfufB3sMbd4FmDNytte3QlXVldDN
 r9ljo16oSS8R3m2Dn/LbNtpNN1O3xMSYiVLYCBbXKJPUjScqFdOin4IffOKtOqL7s7Vpik7vPn
 M5G5Pn1QKkpRjwlfv9nmc+/fALYWC1mHQIAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        lijuang <quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730711423; l=5567;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=TOiLZB9+TUCbyQ6juA160AS0UCAnllOUb5owxKncID8=;
 b=yFhKjOYgT/VpkN3LvicTpOnL/CLsEY2c5kSJOyfLJWuBmpy3krJ47+R2k8KElL2iK3x6geIoa
 tSGBseBo7/SCSzHg+g0YSSR0xDbRWpONdi97pq7DO4s3wxSEH1JPzb6
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: c1YygsRHlWKqlAfTiLzitq83E_FfM9b5
X-Proofpoint-GUID: c1YygsRHlWKqlAfTiLzitq83E_FfM9b5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040081

Introduces the Device Tree for the QCS615 platform.

Features added and enabled:
- CPUs with PSCI idle states
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- QFPROM
- TLMM
- Watchdog
- RPMH controller
- Sleep stats driver
- Rpmhpd power controller
- Interconnect
- GCC and Rpmhcc
- QUP with Uart serial support

Bindings and base Device Tree for the QCS615 SoC are splited
in four parts:
- 1-2: Binding files for QCS615 SoC and PDC (Reviewed)
- 3-4: Initial DTSI and RIDE board device tree
- 5  : Enable uart related configs

Bindings Dependencies:
- watchdog: https://lore.kernel.org/all/20240920-add_watchdog_compatible_for_qcs615-v2-1-427944f1151e@quicinc.com/ - Reviewed
- qfprom: https://lore.kernel.org/all/20240912-add_qfprom_compatible_for_qcs615-v1-1-9ef2e26c14ee@quicinc.com/ - Reviewed
- tcsr: https://lore.kernel.org/all/20240920-add_tcsr_compatible_for_qcs615-v2-1-8ce2dbc7f72c@quicinc.com/ - Applied
- tlmm: https://lore.kernel.org/all/20240920-add_qcs615_pinctrl_driver-v2-1-e03c42a9d055@quicinc.com/ - Applied
- interconnect: https://lore.kernel.org/all/20240924143958.25-2-quic_rlaggysh@quicinc.com/ - Applied
- rpmhcc: https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-1-3d716ad0d987@quicinc.com/  - Reviewed
- gcc: https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com/ - Reviewed
- rpmhpd: https://lore.kernel.org/all/20240927-add_qcs615_qcs8300_powerdomains_driver_support-v2-3-18c030ad7b68@quicinc.com/ - Applied

Build Dependencies:
- tlmm: https://lore.kernel.org/all/20240920-add_qcs615_pinctrl_driver-v2-2-e03c42a9d055@quicinc.com/ - Applied
- rpmhcc: https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-2-3d716ad0d987@quicinc.com/ - Reviewed
- gcc: https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-4-3d716ad0d987@quicinc.com/

Patch made the following verifications:
- Successfully passed dt_binding_check with DT_CHECKER_FLAGS=-m for earch binding file
- Successfully passed dtbs_check with W=1 for dts
- Verified CPU Hotplug, idle and online CPUs on QCS615 ride board
- Checked pinctrl-maps path
- Verified watchdog functionality with "echo 1 > /dev/watchdog", can trigger
  a watchdog bark and later bite
- Verified functionality with UART console on QCS615 ride board
- RPMH controller driver probed successfully
- Sleep stats driver probed successfully and checked qcom_stats
  node on QCS615 ride board

Signed-off-by: lijuang <quic_lijuang@quicinc.com>
---
Changes in v5:
- Remove applied patches 2 and 4
- Update the titles and commit messages of the initial DTSI and ride DTS
- Update the commit message of defconfig patch
- Pad register addresses to 8 hex digits
- Link to v4: https://lore.kernel.org/r/20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com

Changes in v4:
- Configure vreg_l17a to High Power Mode (HPM) as it supplies power to UFS
  and eMMC, which can be utilized as boot devices.
- Link to v3: https://lore.kernel.org/r/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com

Changes in v3:
- Added interconnect, GCC, RPMHCC, QPU, and RPMHPD related nodes for UART console
- Enabled UART condole on ride board device
- Link to v2: https://lore.kernel.org/r/20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com

Changes in v2:
- Collected reviewed-bys
- Removed extra blank line
- Removed redundant function
- Renamed xo-board to xo-board-clk and move it and sleep-clk to board dts
- Renamed system-sleep to cluster_sleep_2
- Removed cluster1
- Added entry-method for idle-states
- Added DTS chassis type
- Added TCSR Clock Controllers
- Added Reserved Shared memory
- Added QFPROM
- Added TLMM
- Added Watchdog
- Added RPMH controller
- Added Sleep stats driver
- Link to v1: https://lore.kernel.org/r/20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com

---
Lijuan Gao (5):
      dt-bindings: arm: qcom: document QCS615 and the reference board
      dt-bindings: qcom,pdc: document QCS615 Power Domain Controller
      arm64: dts: qcom: add QCS615 platform
      arm64: dts: qcom: add base QCS615 RIDE
      arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS615

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 219 +++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 688 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   3 +
 6 files changed, 918 insertions(+)
---
base-commit: ec29543c01b3dbfcb9a2daa4e0cd33afb3c30c39
change-id: 20241104-add_initial_support_for_qcs615-6045c281925b
prerequisite-change-id: 20240919-qcs615-clock-driver-d74abed69854:v4
prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
prerequisite-patch-id: a57054b890d767b45cca87e71b4a0f6bf6914c2f
prerequisite-patch-id: 5a8e9ea15a2c3d60b4dbdf11b4e2695742d6333c
prerequisite-change-id: 20240920-add_watchdog_compatible_for_qcs615-eec8a8c2c924:v2
prerequisite-patch-id: 3a76212d3a3e930d771312ff9349f87aee5c55d5
prerequisite-change-id: 20240911-add_qfprom_compatible_for_qcs615-e3b02f6fa71e:v1
prerequisite-patch-id: 8a2454d5e07e56a6dd03f762f498051065635d85

Best regards,
-- 
lijuang <quic_lijuang@quicinc.com>


