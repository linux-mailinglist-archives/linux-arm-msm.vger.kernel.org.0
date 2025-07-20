Return-Path: <linux-arm-msm+bounces-65774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE90B0B510
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C38C3BBC8F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 10:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0310C1FE44D;
	Sun, 20 Jul 2025 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WSdQ+o9N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6A812E7F;
	Sun, 20 Jul 2025 10:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753009070; cv=none; b=aITbIPrKn+282SRp9XNkKlH0FqZGtZXxy5ngOwKlNpPAx8NpibRID5nIOsIo/l7ClFb9IXOiiZtuguXWbv+rQBNVd77EzateESwVUnl9OXCGahHfupueYM0tKbP3OdUzCGkelx8gaGYUjwKfqzm5QiA/3a2oEkFAN/nZrj3/eUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753009070; c=relaxed/simple;
	bh=ZO7Bm14nJzRFeD/rkbXq+nsQSL5zOh/GN3lnCm0R040=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=JSOJIUYauKGzJJAFESUHRXlsS2BWWQxz5j/JuAJt3uiEcxI5xvpjwf7FqM+HSDeladgLAop3GfMMNyXdI2zKuufg5779NkmoAjcu4LvVTdSkYhKAtSILgjKjkwLmRv3ySgB4MGh0QAgYs4VWKso11If0AmtIETSQ5/T4R181Cqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WSdQ+o9N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KAqddY022933;
	Sun, 20 Jul 2025 10:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2bUsoovyguYtDCEMZl+Xj1
	XFG0leiFJfi3T5YAiWMOU=; b=WSdQ+o9NQDyDrarGhv8IPOaIRKkzfqnR/IZhQI
	b9njMG2G/0frpWNdjGbcnfR7KguL/KcSADg3H9VPo6It+XosO0q66nw0gFWTTzlN
	SagzWGeCs0WhI2RjZnUnO0833GSKg24dtKKeKYgPsan7hs28HYEy0D7Fx8GTgfzg
	oheADbrGhJamYwdBI6K58XQii+8YXuPAlRDnW2rOUD3ttq8zxpboen6C6lwq/apS
	sZ2ISB0aJrrPROboG3Mx9F8opOGjjkaWuS6rGsoiEdYNiU6AmL2IMZmYxVQStmjE
	fJT7GBH9HKAOxXLq/EA7gPsfX+4ygEbyB5LCh97P0jq8OIGg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q23uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 10:57:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56KAvMXl032492
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 10:57:22 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 20 Jul 2025 03:57:17 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH net-next v6 00/14] Add PPE driver for Qualcomm IPQ9574 SoC
Date: Sun, 20 Jul 2025 18:57:07 +0800
Message-ID: <20250720-qcom_ipq_ppe-v6-0-4ae91c203a5f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIPLfGgC/1WNzQ6CMBCEX4Xs2RpEWtCT72EIgWUre7C/SDCEd
 7fpzePkm/lmh0iBKcK92CHQypGtSUGdCsB5MC8SPKUMVVnJsrk0wqN99+x87xyJRrX1NOK11UM
 NaeICad6y7gmGFmFoW6BLZOa42PDNP6vMPCtVpf6VqxSluMlxQjW2Wmn98B9GNnhOLeiO4/gBA
 NilmrQAAAA=
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal
	<quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Simon
 Horman" <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753009036; l=8005;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=ZO7Bm14nJzRFeD/rkbXq+nsQSL5zOh/GN3lnCm0R040=;
 b=FzL/jFDhUTeZOuWEW4zoZ6oWJ5E1wArQCt9tJsAGZW9N8iB82MCqWk6gwO2FqiL+Beu7he17D
 ortB6wc36jlC1OuA3t+qOUnxu+WSK0DmaFOHe9Vaz3VuT6nsmV3zmYB
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDEwNCBTYWx0ZWRfX0wB7XnMJjf8d
 SxnXvoYV+n0lsU1VYfwldPu2EwN9tMtn+hQCinUIInpLtKiHvhNA4SjybGQgazRakVoE62FEelN
 tAu5rpIMxTmAiUorQCVAlHdi3g4PDfhp3yqjWi377BA9QeH7gSqktXOHHEfLmUqNo+p1WUppA40
 /qmaJ5IQhjeAZEr6zREB06IE2My3lqC5hNNwb7bTcu+mhsujTRW0YM48XD70kKUzPQ8+tOViTqv
 EW3MjZ7Nk1MssueKSEzjQy/RLkyvOtP4RmlIagdGHPU55cuI5L6kwbxGJBLtlMMsiinu3RCw/Lx
 yWps0Oi2+5fgbYWAHik9ZiztWIszyHkrFHz4Upjm7kNkRQ1t1HtERo3xnLbEAh7VzKUu8LfHf1O
 5nZrbh+s7r33En8jUbtO5DqRLYjvlGMLmiHJKe++K9Kd1ZYgGpQbRWSou7vbisP3tanZIxc9
X-Proofpoint-ORIG-GUID: Qis5-hhVnicY3D3IdkfqJQWSfOmsLJjp
X-Proofpoint-GUID: Qis5-hhVnicY3D3IdkfqJQWSfOmsLJjp
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687ccb93 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=HAxyLaFxb4ZfO1oSC6kA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200104

The PPE (packet process engine) hardware block is available in Qualcomm
IPQ chipsets that support PPE architecture, such as IPQ9574 and IPQ5332.
The PPE in the IPQ9574 SoC includes six ethernet ports (6 GMAC and 6
XGMAC), which are used to connect with external PHY devices by PCS. The
PPE also includes packet processing offload capabilities for various
networking functions such as route and bridge flows, VLANs, different
tunnel protocols and VPN. It also includes an L2 switch function for
bridging packets among the 6 ethernet ports and the CPU port. The CPU
port enables packet transfer between the ethernet ports and the ARM
cores in the SoC, using the ethernet DMA.

This patch series is the first part of a three part series that will
together enable Ethernet function for IPQ9574 SoC. While support is
initially being added for IPQ9574 SoC, the driver will be easily
extendable to enable Ethernet support for other IPQ SoC such as IPQ5332.
The driver can also be extended later for adding support for L2/L3
network offload features that the PPE can support. The functionality
to be enabled by each of the three series (to be posted sequentially)
is as below:

Part 1: The PPE patch series (this series), which enables the platform
driver, probe and initialization/configuration of different PPE hardware
blocks.

Part 2: The PPE MAC patch series, which enables the phylink operations
for the PPE ethernet ports.

Part 3: The PPE EDMA patch series, which enables the Rx/Tx Ethernet DMA
and netdevice driver for the 6 PPE ethernet ports.

A more detailed description of the functions enabled by part 1 is below:
1. Initialize PPE device hardware functions such as buffer management,
   queue management, scheduler and clocks in order to bring up PPE
   device.
2. Enable platform driver and probe functions
3. Register debugfs file to provide access to various PPE packet
   counters. These statistics are recorded by the various hardware
   process counters, such as port RX/TX, CPU code and hardware queue
   counters.
4. A detailed introduction of PPE along with the PPE hardware diagram
   in the first two patches (dt-bindings and documentation).

Below is a reference to an earlier RFC discussion with the community
about enabling ethernet driver support for Qualcomm IPQ9574 SoC. This
writeup can help provide a higher level architectural view of various
other drivers that support the PPE such as clock and PCS drivers.
Topic: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet.
https://lore.kernel.org/linux-arm-msm/d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com/

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
Changes in v6:
- DT binding improvements:
    * Add the missing ethernet-ports node.
    * Update to use 'ethernet-port' as the port node name.
    * Ensure the port node numbering is constrained appropriately.
    * Enhance the commit message to add a brief overview of the switch schema
      hierarchy and properties.
- Refactor the RSS hash configuration code to eliminate redundant code.
- Update copyright to remove year as per guidelines in all driver files.
- Update 'M' to 'MHz' in the documentation patch for clarity.
- Link to v5: https://lore.kernel.org/r/20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com

Changes in v5:
- DT binding improvements:
    * Update example by using clock & reset ID instead of magic number.
    * Fix the duplicate '>' symbol.
    * Convert the interrupt number to a fixed value and add the missing but
      unused interrupts to complete the hardware description.
    * Constraint the port node with clock and reset.
- Add debugfs based queue drop counter.
- Cosmetic update to commit messages to wrap the text correctly.
- Link to v4: https://lore.kernel.org/r/20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com

Changes in v4:
- Simplify statements regarding module load in documentation as per comments.
- Improve data structure definitions for scheduler patch for clarity.
- Replace u32p_replace_bits() with FIELD_MODIFY().
- Enhance the comment of the PPE scheduler for BM and QM configurations.
- Debugfs improvements:
    *Remove print related macros and inline the code instead.
    *Return error codes from register read/write wherever applicable.
    *Split the hardware counter display file into separate files.
- Link to v3: https://lore.kernel.org/r/20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com

Changes in v3:
- Add the top-level ref ethernet-switch.yaml and remove node definition
  ethernet-ports in the DT binding file.
- Remove unnecessary error message for devm_kzalloc().
- Reverse the mapping of BM ceiling bits.
- Fix multicast queue start/end configurations.
- Declare the SoC-specific PPE configuration variables as const.
- Fix kernel documentation errors.
- Fix the compile errors reported by gcc-14.
- Improve the commit message of L2 bridge initialization and debugfs patches.
- Link to v2: https://lore.kernel.org/r/20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com

Changes in v2:
- Represent the PPE hardware hierarchy in dtbindings, add PPE hardware diagram.
- Remove all SoC specific hardware properties from dtbindings since driver
  maintains them.
- Move out the PCS (UNIPHY) handling into a separate PCS driver posted
  separately at below.
  https://lore.kernel.org/all/20250108-ipq_pcs_net-next-v4-0-0de14cd2902b@quicinc.com
- Move out the PPE MAC patches into a separate series to limit patch count to
  15 or less. (PPE MAC patches will be posted sequentially after this series).
- Rename the hardware initialization related files from ppe_ops.c[h] to
  ppe_config.c[h]
- Improve PPE driver documentation and diagram.
- Fix dtbinding check errors.
- Link to v1: https://lore.kernel.org/r/20240110114033.32575-1-quic_luoj@quicinc.com

---
Lei Wei (2):
      docs: networking: Add PPE driver documentation for Qualcomm IPQ9574 SoC
      net: ethernet: qualcomm: Initialize PPE L2 bridge settings

Luo Jie (12):
      dt-bindings: net: Add PPE for Qualcomm IPQ9574 SoC
      net: ethernet: qualcomm: Add PPE driver for IPQ9574 SoC
      net: ethernet: qualcomm: Initialize PPE buffer management for IPQ9574
      net: ethernet: qualcomm: Initialize PPE queue management for IPQ9574
      net: ethernet: qualcomm: Initialize the PPE scheduler settings
      net: ethernet: qualcomm: Initialize PPE queue settings
      net: ethernet: qualcomm: Initialize PPE service code settings
      net: ethernet: qualcomm: Initialize PPE port control settings
      net: ethernet: qualcomm: Initialize PPE RSS hash settings
      net: ethernet: qualcomm: Initialize PPE queue to Ethernet DMA ring mapping
      net: ethernet: qualcomm: Add PPE debugfs support for PPE counters
      MAINTAINERS: Add maintainer for Qualcomm PPE driver

 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  |  529 +++++
 .../networking/device_drivers/ethernet/index.rst   |    1 +
 .../device_drivers/ethernet/qualcomm/ppe/ppe.rst   |  194 ++
 MAINTAINERS                                        |    8 +
 drivers/net/ethernet/qualcomm/Kconfig              |   15 +
 drivers/net/ethernet/qualcomm/Makefile             |    1 +
 drivers/net/ethernet/qualcomm/ppe/Makefile         |    7 +
 drivers/net/ethernet/qualcomm/ppe/ppe.c            |  234 +++
 drivers/net/ethernet/qualcomm/ppe/ppe.h            |   39 +
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c     | 2033 ++++++++++++++++++++
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h     |  317 +++
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c    |  847 ++++++++
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.h    |   16 +
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h       |  591 ++++++
 14 files changed, 4832 insertions(+)
---
base-commit: 4701ee5044fb3992f1c910630a9673c2dc600ce5
change-id: 20250717-qcom_ipq_ppe-7684dbc38fa4

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


