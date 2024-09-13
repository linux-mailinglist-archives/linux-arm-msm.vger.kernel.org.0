Return-Path: <linux-arm-msm+bounces-31703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 736C0977EF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 13:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FE801C21F22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 11:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9611D1D88DE;
	Fri, 13 Sep 2024 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e1gN8txB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69E71D88A0;
	Fri, 13 Sep 2024 11:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726228565; cv=none; b=Fo+6ZB15SY4+4hkWggW4qtUGx5hRu+jCU532pFICUkbsYTVWy5GRXn3G5Nx68OUO98N8mVr48JehzJLsFwr0m9mcLpz1HXm9robM9ZZnwv5w0w53KzFXO7f9L/7e8Awrl1vBJB3ScVz26WS/hW9o8jVKlB6APgeHBc/uJ5O5+9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726228565; c=relaxed/simple;
	bh=cZzeQUnX8FnKlmryTp+iS8jlJRXpql0gcFuL65pc9BY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=o/nIVUM1A43WPvd+FojPYc7fbpaJZqHIouaRW7CX0FWbwobzE9AoI1m4FroaGMu091xjXJXJ8DvP5WsDYAq3EAzvwpAxRfVW+vb1LkzoA6R/4u7hXUJ1HQatOpaYdoAVfL23O9WxI0CjGDxY2RBHL0HQpT0st+yW3srmlU8s9dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e1gN8txB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DAFR0Y004969;
	Fri, 13 Sep 2024 11:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tui8qsOhaXlnggPNJtpBKx
	8W2/kB6Pnr8qzE3/3Di90=; b=e1gN8txBD7SamXbLIIExDi9KPzKeY6gQjMwtR1
	LZKw6uSqMabREuTsTZ11BAEuboy/BRdgRd83cCKaNK085gIR5eG3u32MkcD4M6IJ
	w8PRqCuxPqe7v+jknmy+lglQOyvMXSIjtHRGQpk+Pj78FZT8jkpFwXY/l2NVx3pq
	J8z2o5B7uMavV09/x/WSFwzCyfzeMz1PzQ595R9c3KuNljQia0zLVNsQjKcinZuc
	NKxzXIpZnk6jeXssYveG81cS5cYWA/geW7vD3mN5sEbjpPWEorcNVw9vbPvqeSQW
	6zn/ORJXNRHHPGFaMY6rlrlT2ydqdwE1A39UBCRZAEGOzzNA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy738rm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:55:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DBtfqx007368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:55:41 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 04:55:36 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [PATCH v2 0/6] Add initial support for QCS615 SoC and QCS615 RIDE
 board
Date: Fri, 13 Sep 2024 19:55:22 +0800
Message-ID: <20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACoo5GYC/5XRwU7DMAwG4FeZcl5R7DRpshPvgVDVOimzBG2Xd
 BVo6ruTbggECG0cfx8+/4lPIoXIIYnd5iRimDnx0OeA242gfdM/hYJ9zgIlltKBLBrva+554ua
 5TsdxHOJUd0OsD5QM6AIaZ0iVxlVoRUbGGDp+PS94eMx5z2ka4tt53wzr9EJbtNfoGQpZaO2cN
 S40ILv7w5GJe7qj4UWs+IxfoAO4CuIKylK1lUTrWv8N3H4+Gm+CbOmJTBkILfxupv7XTGUQKiK
 qfKd1J/9opm6CUKFvKw2KzI8/Wy4XiiFPE08fZ1qWdwxuUbQXAgAA
To: <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Thomas
 Gleixner" <tglx@linutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726228536; l=3252;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=cZzeQUnX8FnKlmryTp+iS8jlJRXpql0gcFuL65pc9BY=;
 b=I8Dr7N5gqujB3ZCZxjq+h0pl4rdZH/d22vW0KHKewBPZN8tp2WL+jLLovFlBKt08nL1FBwNdN
 Pxuimsa+eIIDjI7NENUuRjqSpJxVmV38DagsGxDkqagQfl+UL98E0dk
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UVEytqznr1hcpBbMotSY3LcpB8mLOTVe
X-Proofpoint-GUID: UVEytqznr1hcpBbMotSY3LcpB8mLOTVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409130083

This introduces the Device Tree for the QCS615 platform.

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

This series are splited into three parts:
- 1-3: Binding files for QCS615 SoC and PDC (Reviewed)
- 4  : Soc table entry (Reviewed)
- 5-6: Initial DTSI and RIDE board device tree

Bindings Dependencies:
watchdog: https://lore.kernel.org/all/20240912-add_watchdog_compatible_for_qcs615-v1-1-ec22b5ad9891@quicinc.com/
qfprom: https://lore.kernel.org/all/20240912-add_qfprom_compatible_for_qcs615-v1-1-9ef2e26c14ee@quicinc.com/
tcsr: https://lore.kernel.org/all/20240912-add_tcsr_compatible_for_qcs615-v1-1-5b85dd4d42ad@quicinc.com/

Build Dependencies:
tlmm: https://lore.kernel.org/all/20240910-add_qcs615_pinctrl_driver-v1-0-36f4c0d527d8@quicinc.com/

Patch made the following verifications:
- Successfully pass dt_binding_check with DT_CHECKER_FLAGS=-m for earch binding file
- Successfully pass dtbs_check with W=1 for dts
- Verified CPU Hotplug and online CPUs on QCS615 ride board
- Checked pinctrl-maps path
- Verified Watchdog functional with "echo 1 > /dev/watchdog", can trigger
  a watchdog bark and later bite
- Verified functional with DCC console function on QCS615 ride board
- RPMH controller driver probed successfully
- Sleep stats driver probed successfully and checked qcom_stats
  node on QCS615 ride board

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
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
Lijuan Gao (6):
      dt-bindings: arm: qcom: document QCS615 and the reference board
      dt-bindings: arm: qcom,ids: add SoC ID for QCS615
      dt-bindings: qcom,pdc: document QCS615 Power Domain Controller
      soc: qcom: socinfo: Add QCS615 SoC ID table entry
      arm64: dts: qcom: add initial support for QCS615 DTSI
      arm64: dts: qcom: add base QCS615 RIDE dts

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  34 ++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 511 +++++++++++++++++++++
 drivers/soc/qcom/socinfo.c                         |   1 +
 include/dt-bindings/arm/qcom,ids.h                 |   1 +
 7 files changed, 555 insertions(+)
---
base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
change-id: 20240910-add_initial_support_for_qcs615-1a96c3469728

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


