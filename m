Return-Path: <linux-arm-msm+bounces-35367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6119A9D80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23D5B1F23DB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656FD19005D;
	Tue, 22 Oct 2024 08:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OaghMSA3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F8B18858A;
	Tue, 22 Oct 2024 08:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729587309; cv=none; b=uIav4Wf2LWOiAHlH4IL5aCnKMfzqF+fZaJR6zFATo+PQYgbfH1pFvAtwqdJTGtJrB4NhkdMi1drL5VxP53h8FgMivoWdhceHGNUsHuK4sDBgnKtNvf66ETIqWmXATIkJJP6yg3PPsh9WzJ/2cJTIkcYpdQNrQh//Mt44UxXjqEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729587309; c=relaxed/simple;
	bh=56ZEjGyJpvN/pHe7QiH8G0yQBpXJHYkIWsw00tD/Vg0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=PC15djRufNF5cYBraVptTOC9T714F62R39hpFzbZ3G7DVhp46aLVKq2o+NBqH1NXIu0aunGw57upYK08VVqzalkjVnMv8Qq/5/bwYG+e0G8SBcb6NKJEHMCZ0Qbq8b5JRcvaok+wtiUw4kyiYSwh8XRq5P219lNyxrUVJd0wF6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OaghMSA3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LKJuSd015846;
	Tue, 22 Oct 2024 08:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zbm+NJDocCkq/9Zwsl8D2F
	O9rpHC6KIc5yQ1RMZECps=; b=OaghMSA3PN42rTs2qaWByZIAPfOKjm6LSSYINz
	HU8mfLmIS22Ju6v/aUEIxf00YCDlCG1DnEQ2VrD5/AGnmS9f1ueUx3rIixn07JBm
	CwXwM6H0xEZ2owC5B7ckWV1Ffowauf1pLrCnfDckauyOgxyx8aLE6gFiPV5MNgjV
	eXkTKTVlAd71nkPVQmHQWSs9htyM4VdZf4fBEQQ4K/A7bql4nKs/j7U4A9oThcer
	C2xtu0ilpFhzs812/kSzuKsMMOjNJkTgvT5Z0FjSzNA4Y9t7PEjcZ6tJMzN3xGFX
	grBZjDBQYwGRbajXylySaKDE5R/VcfiFj489uc1NjjCwN5HA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6rbfmjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:54:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M8spm9015520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:54:51 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 01:54:44 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [PATCH v4 0/7] Add initial support for QCS615 SoC and QCS615 RIDE
 board
Date: Tue, 22 Oct 2024 16:54:28 +0800
Message-ID: <20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEVoF2cC/4WRS26DMBCGr4K8riNsjAGrqrroLaoIGTPAqICJ7
 dBEUe5eh2SRRasuZ+T5/ocvxIND8EQlF+JgRY92joN4SYgZ9NwDxTbOhKdcsJRzqtu2xhkD6rH
 2x2WxLtSddfXBeMlyynkuOyl0ZbggEbI46PC0CXzu4zygD9adN72V3bYbOq24/A+9ZjSlkBWSF
 VAxI/n74YgGZ7MzdiL7613NQdx6DHdJMoH3+pbiQyWvDyXBRFbl5Y7nlNEbo3aj7vuzH56Jb+S
 5A5Xcj1lFH3bMaM0XbR2u4GhbCN1AK6syF2rNfj3l6ZbwWwcztLavo8aiAzYjPKcEMKUuDTfRp
 1r57ybYRjp0i7PTX5ysSXknO10wULHpyGm0BxpfTxhUMsMp0Mevstje9Qf1RlQzCwIAAA==
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
        Lijuan Gao
	<quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Swetha Chintavatla
	<quic_chintava@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729587284; l=5542;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=56ZEjGyJpvN/pHe7QiH8G0yQBpXJHYkIWsw00tD/Vg0=;
 b=fq7TDTr+zk+92aG6wCEoOFmQ9R58qVZMSdNhCDJrwS4EZzgRm2EGZxQC1SSQuCSxDSCMTJeLs
 6H07W46gEU8A5Vs0Ay+cUceb1Wl1y0yA29MFZJKDkewmI/blUSHPrOk
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oEIEDmjoL8scxHGQnFxVahHs1RFRLiKC
X-Proofpoint-GUID: oEIEDmjoL8scxHGQnFxVahHs1RFRLiKC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220057

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
- 1-3: Binding files for QCS615 SoC and PDC (Reviewed)
- 4  : Soc table entry (Reviewed)
- 5-6: Initial DTSI and RIDE board device tree
- 7  : Enable uart related configs

Bindings Dependencies:
- watchdog: https://lore.kernel.org/all/20240920-add_watchdog_compatible_for_qcs615-v2-1-427944f1151e@quicinc.com/ - Reviewed
- qfprom: https://lore.kernel.org/all/20240912-add_qfprom_compatible_for_qcs615-v1-1-9ef2e26c14ee@quicinc.com/ - Reviewed
- tcsr: https://lore.kernel.org/all/20240920-add_tcsr_compatible_for_qcs615-v2-1-8ce2dbc7f72c@quicinc.com/ - Applied
- tlmm: https://lore.kernel.org/all/20240920-add_qcs615_pinctrl_driver-v2-1-e03c42a9d055@quicinc.com/ - Applied
- interconnect: https://lore.kernel.org/all/20240924143958.25-2-quic_rlaggysh@quicinc.com/ - Reviewed
- rpmhcc: https://lore.kernel.org/all/20241016-qcs615-clock-driver-v3-1-bb5d4135db45@quicinc.com/ - Reviewed
- gcc: https://lore.kernel.org/all/20241016-qcs615-clock-driver-v3-3-bb5d4135db45@quicinc.com/ - Reviewed
- rpmhpd: https://lore.kernel.org/all/20240927-add_qcs615_qcs8300_powerdomains_driver_support-v2-3-18c030ad7b68@quicinc.com/ - Applied

Build Dependencies:
- tlmm: https://lore.kernel.org/all/20240920-add_qcs615_pinctrl_driver-v2-2-e03c42a9d055@quicinc.com/ - Applied
- rpmhcc: https://lore.kernel.org/all/20241016-qcs615-clock-driver-v3-2-bb5d4135db45@quicinc.com/ - Reviewed
- gcc: https://lore.kernel.org/all/20241016-qcs615-clock-driver-v3-4-bb5d4135db45@quicinc.com/

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

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
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

---
Lijuan Gao (7):
      dt-bindings: arm: qcom: document QCS615 and the reference board
      dt-bindings: arm: qcom,ids: add SoC ID for QCS615
      dt-bindings: qcom,pdc: document QCS615 Power Domain Controller
      soc: qcom: socinfo: Add QCS615 SoC ID table entry
      arm64: dts: qcom: add initial support for QCS615 DTSI
      arm64: dts: qcom: add base QCS615 RIDE dts
      arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS615

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 219 +++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 688 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   3 +
 drivers/soc/qcom/socinfo.c                         |   1 +
 include/dt-bindings/arm/qcom,ids.h                 |   1 +
 8 files changed, 920 insertions(+)
---
base-commit: de938618db2bafbe1a70c8fc43f06ccdd60364b2
change-id: 20241022-add_initial_support_for_qcs615-2256f64a9c24
prerequisite-change-id: 20240919-qcs615-clock-driver-d74abed69854:v3
prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
prerequisite-patch-id: a57054b890d767b45cca87e71b4a0f6bf6914c2f
prerequisite-patch-id: d0c5edf9c06568ae2b3ffacba47e57ebb43acb15
prerequisite-change-id: 20240920-add_watchdog_compatible_for_qcs615-eec8a8c2c924:v2
prerequisite-patch-id: 3a76212d3a3e930d771312ff9349f87aee5c55d5
prerequisite-change-id: 20240911-add_qfprom_compatible_for_qcs615-e3b02f6fa71e:v1
prerequisite-patch-id: 8a2454d5e07e56a6dd03f762f498051065635d85

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


