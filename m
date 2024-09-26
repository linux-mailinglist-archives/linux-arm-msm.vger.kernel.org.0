Return-Path: <linux-arm-msm+bounces-32536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BC2986CF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 08:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E3371F22780
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 06:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B197218952E;
	Thu, 26 Sep 2024 06:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dPXo98ZU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BBD188CB0;
	Thu, 26 Sep 2024 06:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727333735; cv=none; b=jN5FqmLVvBwk5+e8N8tRCzPG6J3dLK+O14xpUsSRmiXbfpmcs1tsUFP/Awty2b7cho222e1DMJZNgkLoCxHI9muLM+0F49ewGt9HUKqDzOJD/q+na4jeJl4ango5k/ucFBR5FnD+V+kiW7/Ck7EOlAKrjVawfDEOffgH149oRg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727333735; c=relaxed/simple;
	bh=woOZI30KQs/P0twvd8OSvYrqtjFpNzrieDu+dYUpKaA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=UcdErZH9Vpig6nXPn3/wqWWSHZ3Wdh0tV4PymmiZwAaGWGUvSPCAhsVgZ3dRzqYlG+erzeP/PWJLmIYFkyzfqlfErBEKK3vUKMJP7n7cTbLdZ6qkImfNiFxDDRLLHVD2JqKkjMAlL5uBZKnDM8zkMQpbZ2YJPzcT6puxHlqjdH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dPXo98ZU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48Q6OCaH012470;
	Thu, 26 Sep 2024 06:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9FBLuRWJ1v6MCn6fvPzDwh
	w1l6YX3trToflfAnYK7gs=; b=dPXo98ZUe2Wi3q/+UDF1P6QHw76ZzQo9AEfDrP
	QTtF1mF3vhLEkLb5uJiLHMy2dAmSJTWg/l3Cf5bAkg9hOD6a1dUGQH9Uu07c+snI
	Sd+elPcHg86JZLZNWkmxljzkz8MNBFgJVmxleLogMfNsLgobF6QbvjkC2k6Vda3q
	cgiNnHZ+cvPnIFiU6YDgmMXxKeRaWoSDQm/ODBbK1VUcyaAXmCqmmc2Gp1erVxJu
	OG2VlDfjz9SrZ69C8TnF2Os7BRRl6XhG+dreppSpP25eswRxfPktyX6uMLaZDDwg
	AWD3J+TIKs1okznTZj8d9ORdA4BNBNpvCW0Ub6WWz02Dgm/A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgnf1k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 06:55:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48Q6t9ZR031685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 06:55:09 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 23:55:02 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [PATCH v3 0/7] Add initial support for QCS615 SoC and QCS615 RIDE
 board
Date: Thu, 26 Sep 2024 14:54:40 +0800
Message-ID: <20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADEF9WYC/43S327bIBQG8FexuB6V+WNiW9O0i73FNFkHOCRot
 nGBuq2qvvtI7EiZtCi7BJkf5/vwB0kYPSbSVx8k4uqTD3NZiC8VMSeYj0i9LWvCay7rjksK1g5
 +9tnDOKSXZQkxDy7E4dkkxRoKNdOaWytVU5OCLBGdf7tc8PNXWZ98yiG+X+5b2Xl3p5l4RK+c1
 rTjQnEu8GBBf39+8cbP5smEiZzxVdyAvHkIigIyUYNhSips2d/g5zZ+xLKbfN4ykAlTgnMtP/r
 q67UVJkXXtE/lSkbPxhBHOB7f0+lW/EZuS+2rPXdH93HMGMxvaqNfMVJ7kKDRqq5tZL/yfx7l9
 SXhdnxYwitGGybwcxo25Rqamk5IjY1plNN9qf0/tDJ0juMOUacAlGg4SMAH42ST4lDiLpC9HvG
 28JK2MAfHjHIPlFfI5mTD8Y6EaFpoDTel/HsSY1sgt8Qw3XOErrlTDg4M92I0JKTl68nnvprxL
 dPrK5df4vMPvTIMBTEDAAA=
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
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@quicinc.com>, Lijuan Gao <quic_lijuang@quicinc.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>,
        Tingguo Cheng
	<quic_tingguoc@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Swetha
 Chintavatla" <quic_chintava@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727333702; l=5732;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=woOZI30KQs/P0twvd8OSvYrqtjFpNzrieDu+dYUpKaA=;
 b=psUgup+hcA8ajzIMfPwikFf5LjkdXb0NQKjmIhXDE85wY5uZdlivvmpdj5laKnYXsQpqt9XmE
 kQUQUTavS/ZC7DFXRXUVezeN7E3GsPdxc0aPkcvkfCTwr5jhu1lm68x
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lJxMVleRd9xTL0fs_Dg6ymqAZN_GXc33
X-Proofpoint-GUID: lJxMVleRd9xTL0fs_Dg6ymqAZN_GXc33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260044

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
- tcsr: https://lore.kernel.org/all/20240920-add_tcsr_compatible_for_qcs615-v2-1-8ce2dbc7f72c@quicinc.com/ - Reviewed
- tlmm: https://lore.kernel.org/all/20240920-add_qcs615_pinctrl_driver-v2-1-e03c42a9d055@quicinc.com/ - Reviewed
- interconnect: https://lore.kernel.org/all/20240924143958.25-2-quic_rlaggysh@quicinc.com/ - Reviewed
- rpmhcc: https://lore.kernel.org/all/20240920-qcs615-clock-driver-v2-1-2f6de44eb2aa@quicinc.com/ - Reviewed
- gcc: https://lore.kernel.org/all/20240920-qcs615-clock-driver-v2-3-2f6de44eb2aa@quicinc.com/ - Reviewed
- rpmhpd: https://lore.kernel.org/all/20240920-add_qcs615_powerdomains_driver_support-v1-1-8846efaf9454@quicinc.com/ - Reviewed

Build Dependencies:
- tlmm: https://lore.kernel.org/all/20240920-add_qcs615_pinctrl_driver-v2-2-e03c42a9d055@quicinc.com/
- gcc: https://lore.kernel.org/all/20240920-qcs615-clock-driver-v2-4-2f6de44eb2aa@quicinc.com/

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
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 222 +++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 688 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   3 +
 drivers/soc/qcom/socinfo.c                         |   1 +
 include/dt-bindings/arm/qcom,ids.h                 |   1 +
 8 files changed, 923 insertions(+)
---
base-commit: c83f0b825741bcb9d8a7be67c63f6b9045d30f5a
change-id: 20240924-add_initial_support_for_qcs615-a01bb2dd4650
prerequisite-change-id: 20240919-qcs615-clock-driver-d74abed69854:v2
prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
prerequisite-patch-id: a57054b890d767b45cca87e71b4a0f6bf6914c2f
prerequisite-patch-id: 88c7ce656ce89a6505e27699c762311a7a7e5411
prerequisite-change-id: 20240920-add_qcs615_powerdomains_driver_support-c934be5c56fb:v1
prerequisite-patch-id: 834bcb01579ed7fa9489e705b2645853c6371767
prerequisite-patch-id: e838c8ea2b67839cf427833738c200fa149d5634
prerequisite-change-id: 20240920-add_qcs615_pinctrl_driver-f6aa6352a4ae:v2
prerequisite-patch-id: 8486c6329ab9b8d9cf78b4ef1ceaa8abfd62be3e
prerequisite-patch-id: a0f1c46b6aaa39ae5e579895bf6ba334c8d65840
prerequisite-change-id: 20240920-add_tcsr_compatible_for_qcs615-091aa67f1c6f:v2
prerequisite-patch-id: 131af7e3b2e66243b10e0de2193cfa3a2fe5971d
prerequisite-change-id: 20240920-add_watchdog_compatible_for_qcs615-eec8a8c2c924:v2
prerequisite-patch-id: 3a76212d3a3e930d771312ff9349f87aee5c55d5
prerequisite-change-id: 20240911-add_qfprom_compatible_for_qcs615-e3b02f6fa71e:v1
prerequisite-patch-id: 8a2454d5e07e56a6dd03f762f498051065635d85

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


