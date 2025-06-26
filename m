Return-Path: <linux-arm-msm+bounces-62659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A11FAEA09E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 16:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FBFB3A8FB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 14:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B4B2EAB73;
	Thu, 26 Jun 2025 14:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RtLMEUWs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514352EA48F;
	Thu, 26 Jun 2025 14:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948300; cv=none; b=lThIqgAtYYIKrmOV/fd0lZLvI9s0/TUNLm1dHwajoIy8MQOmj3Xp/UxCo7RAmm+1/tshKIeLcAS02TAU5NQ3uUGjFI/9wS/E6dDkZcNzy7cNE84SB7JjWMOUgqTHj/hRv4wA7QDEVpnyloQ/AUDut5f5SZA/Q3ep0rBDsG3+Bhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948300; c=relaxed/simple;
	bh=2z3ml98/WD3T2c0c1eCD86DSm9GdXgBq1jKqH7CPXcw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=BRcaVfs4ZX7Klz6s72d7BdFSuMMtwkWQ6elNXn4Ze2yu9UAiMRVUVFL7kPh1rS0Tjw2MDAOgr4sNyYhHA0EoxR5suckvCutlWGuJGjcnB0lR4Ea4dTiNhqR8ZVZF+/ztVZaMz8DjpCoGyw1fC17Wdt/r3UxjZxI7uUfOe2RIe1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RtLMEUWs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9wk3F022841;
	Thu, 26 Jun 2025 14:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+ZARPR/xGGVGlafuoaJZNG
	mg4LAtYlKNNNKp1YmQ4zI=; b=RtLMEUWsiTM9pON/ukpcHGwRn0kC/WD32aQecd
	hj2nLX6ULe1/o2C/tk6EGv+SlzzpVFLVQO5irfeDhLTeqDS+4I2rLVOi3t06oK3U
	danG91BM8uW18wB1ZfjW3th4eyNNlZ5Npk2bP6Lnh619HmwRBZ8gYoyfHvimWStN
	a5fhYpul3fcZIzJqf7kAwDHkMpBrY6lP4xkQwJlLSX3J1O86ze7Avo8t0GZLYRb6
	1B+aBTgPz5pFh60dBAluEqKm11MFV4c85g8Kb0pGxm3ZdN4jVGdzJ9gJqlr546z+
	OtzzzRrEi1qDMP97gA/Ld6wJzEWMN37sb7mLs2EvwqMwOm+g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx1x03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:31:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55QEVMS4010697
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:31:22 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Jun 2025 07:31:17 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH net-next v5 00/14] Add PPE driver for Qualcomm IPQ9574 SoC
Date: Thu, 26 Jun 2025 22:30:59 +0800
Message-ID: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKNZXWgC/52Nyw7CIBREf6W5azGU0oeu/A9jmkJv7V1IKVRS0
 /DvEnZuXU5mzpkDPDpCD9fiAIeBPC0mhfpUgJ4H80RGY8oguKh5Ixq26uXVk117a5ENnejEZex
 aVU2QEOtwoj3r7mBwYwb3DR6pmclvi/vkn1DmPivrsvpVBsk4k5NCybVSqi1v65s0GX1Oq6wK8
 n88xvgFjEYJJvMAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750948277; l=7372;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=2z3ml98/WD3T2c0c1eCD86DSm9GdXgBq1jKqH7CPXcw=;
 b=+vgxp4eT5meX/175YWtnS7d8aj+lELVj6Uhv9/PRRhSiH5+GdB2xU2uUJWPUi0LhtTNqKy0X4
 oIGjB+qDAFVD2p2ohUyXgYXS1dEBAAM8ZEZDcbftSm/Ux4Gzzuu6RAn
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Fc1QselOXFYQGatuteBmwzGq-BPCXVr2
X-Proofpoint-ORIG-GUID: Fc1QselOXFYQGatuteBmwzGq-BPCXVr2
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685d59bc cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=HAxyLaFxb4ZfO1oSC6kA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyMyBTYWx0ZWRfXyKybQenUuz1W
 HRmHNf6KETFSHbsJzoOWjipiwnVFbU9tIfVA/5LuqkhtdoqaqrAxgKNpe1Jyci3EnXf5mud+vv9
 /Sp7+RRnTJ3dwUNtDMKFSbPcwR2IPzRJTh6/VnmMxOrtu8d7kfjoalaOpCSXHSAirxxIMQXNxSb
 kx3oOEC5P2Cnl4tdzm8oP4LDaR5WsI2NFI0f3sWYbp2bHkGDM71j3Pv4l+7QSWvqmJS30HAzapb
 8KM/CYKDZVkWCTngx0SCp4AnflnwXuXKndd/omFfvCWkrwMSI2iBcccRnUHpPrGTmh/6zTf8GWi
 qqDBFv5/opqZO+XVXrC9WCUdSxITs8NNjTYlxb+U89SofOzVhdEw6Vy59cme+NSSJP5XpARn7MI
 t9eJw51/vG8sqUQ3WPskMOJCsfIkX1k6g/2wT7hXtc2LnUzQVH2IN/m4jPlhnBfvuJLC+MlZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260123

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

 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  |  521 +++++
 .../networking/device_drivers/ethernet/index.rst   |    1 +
 .../device_drivers/ethernet/qualcomm/ppe/ppe.rst   |  194 ++
 MAINTAINERS                                        |    8 +
 drivers/net/ethernet/qualcomm/Kconfig              |   15 +
 drivers/net/ethernet/qualcomm/Makefile             |    1 +
 drivers/net/ethernet/qualcomm/ppe/Makefile         |    7 +
 drivers/net/ethernet/qualcomm/ppe/ppe.c            |  234 +++
 drivers/net/ethernet/qualcomm/ppe/ppe.h            |   39 +
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c     | 2029 ++++++++++++++++++++
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h     |  317 +++
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c    |  847 ++++++++
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.h    |   16 +
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h       |  591 ++++++
 14 files changed, 4820 insertions(+)
---
base-commit: a9b24b3583ae1da7dbda031f141264f2da260219
change-id: 20250626-qcom_ipq_ppe-a82829d87b3f

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


