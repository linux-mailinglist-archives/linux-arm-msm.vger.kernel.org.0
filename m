Return-Path: <linux-arm-msm+bounces-68795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B88FB22A11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29FCF425470
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C40A2E5435;
	Tue, 12 Aug 2025 14:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OK/K6Fit"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784D828C036;
	Tue, 12 Aug 2025 14:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755007866; cv=none; b=e/Erwqb0HHqujHJ/36V/r23owaL++h7CKhOQeFLN/CbtIzLF5EQ1uFSa6JgkfIVwv6MNnG7QBn+ozC13YN0hiaeiN7g9qiVJx+K2Byb+UginMHhby4bBfeZ0RyWVNxc0IXJDvlbKAnYADStH9i41uU0UTsHgcrmtuz6WKPW0/5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755007866; c=relaxed/simple;
	bh=qMH3cTKgJh6SBVXlTLjeA7u07E/rJtuf9VbpMh50f8k=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=q8Q0YQ68nmV+3R8dC3eiIY3ugV6TuimUROGIZWNXG+RymAtVylDQC+OvcfOxiS+WllwHiJexO5RPgZYDSffRckV5Y6R2tBfXMOt/fgTu1znkd1seCxozGh2IpTierw3sJiEDCZgeIuIXj8XA2bcr387ZMKaWzFEZv3Shb59/X7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OK/K6Fit; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvgCP032241;
	Tue, 12 Aug 2025 14:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6B+5/Kq0FGdDqjbr13nFxd
	qyYfTIQYymlpG3JdXEwmQ=; b=OK/K6Fitl/1L1ACRH5446vmg4NOMFyYUBdYvEC
	360i/fnklG1DTBPezxSXEdp2+KzM8Ef5E7pus8ulv8WNqc7EE6dDD2ATdW4AtU9P
	cTxR4UKEaULXcbWIJaN+3gyVus7DOhc9jxQa5aGeYyoVGO64QhnRm4dZhj/G+RcD
	XhZQGCpp6N8GOs2ceGvghSg8ZDKd89WQ3SvlVzVh1nfsKvaRonSXYnkKgmQuFGFs
	WZimPee+9x7xD3QoKfr2WDDCOWforHH3FxKCHWZbYNQqdrSu60G0fl8cEw2AQp3j
	6NnOiz8dfGku/hlhgAAXVkJWe1IHY4HjDDTb28FG76ywAo1w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vk9ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 14:10:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57CEAkl2020552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 14:10:46 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 07:10:41 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH net-next v7 00/14] Add PPE driver for Qualcomm IPQ9574 SoC
Date: Tue, 12 Aug 2025 22:10:24 +0800
Message-ID: <20250812-qcom_ipq_ppe-v7-0-789404bdbc9a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFBLm2gC/12NQQ6DIBREr9KwLg2igHbVezSNUfzUvygiWGJjv
 HsJm6YuJzPvzUYCeIRArqeNeIgYcLIpqPOJ6LGzT6A4pEw444KpQtFZT68W3dw6B1TJuhp6Xda
 mq0hCnAeDa9bdiYWFWlgX8kjNiGGZ/Cf/RJH7rJRc/iujoIw2oh+07GsjjbnNb9Ro9SWtsirKH
 644O+Ay4VUHTaE5KztxwPd9/wIJl3hW8wAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755007841; l=8484;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=qMH3cTKgJh6SBVXlTLjeA7u07E/rJtuf9VbpMh50f8k=;
 b=9GDcw4nZb91ZozoRO8bhod6tyNaQq+9ikeaOOoTcjC8cTgYru6TNXUNzSkPmU3OUdpWMHfx/4
 9VTMQkZIxckCew2/4GlBVjN92HIJZefpiL1qK2/yx82vQ2a7Abd2eCh
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfXy8I3NZS1Zx2C
 Gpf/aLMFaODZBwa9j0OnKnChGXmy8ehxNXhB4u+3riPuRxZClDfMtITWCF4qZ3Agec7s4bnSxOF
 Rs24Z6+qj8G7TIMDLAscjOl70UAhYaHGtdo8r1zpFVf5kA2PLUOcWnft8vgvC50oRcGtuSbARwr
 xBLwxHXx4DF5bJcMtNrUyzaeLKc+Vm3yETrtPOjzSYupG7rUw6AbQZ9/NZjxEXkqPVVwx1qpEBa
 McjurL8DZKEcJSSruNwTf7G6eGLwvjuIp9VEZtJaVsIls7yq21x6mi9/YNGI1Kr+aXwHL0lFG3r
 0a/3FPUIliBJ5yRBIVVdip0nLTJgJ/NbpdfXUvdp4XFLkk7Ke0k5Bi0AUDgzMJFR0LbWCvY+5Ib
 VaE4b+T3
X-Proofpoint-GUID: pRXJGHoM1k6CgH791KIzhFN-qS2iTJug
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689b4b67 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=z2GUvUhWd2_2b9YoxfUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pRXJGHoM1k6CgH791KIzhFN-qS2iTJug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107

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
Changes in v7:
- DT binding improvements:
    * Remove the description "from NSS clock controller" for clocks and
      resets properties.
    * Update interconnect property descriptions to specify the use of
      "bus interconnect path".
    * Add item constraints for interrupt-names.
    * Mark 'ethernet-ports' as the mandatory node name for switch ports
      section.
- Link to v6: https://lore.kernel.org/r/20250720-qcom_ipq_ppe-v6-0-4ae91c203a5f@quicinc.com

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

 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  |  533 +++++
 .../networking/device_drivers/ethernet/index.rst   |    1 +
 .../device_drivers/ethernet/qualcomm/ppe/ppe.rst   |  194 ++
 MAINTAINERS                                        |    8 +
 drivers/net/ethernet/qualcomm/Kconfig              |   15 +
 drivers/net/ethernet/qualcomm/Makefile             |    1 +
 drivers/net/ethernet/qualcomm/ppe/Makefile         |    7 +
 drivers/net/ethernet/qualcomm/ppe/ppe.c            |  239 +++
 drivers/net/ethernet/qualcomm/ppe/ppe.h            |   39 +
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c     | 2034 ++++++++++++++++++++
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h     |  317 +++
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c    |  847 ++++++++
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.h    |   16 +
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h       |  591 ++++++
 14 files changed, 4842 insertions(+)
---
base-commit: bc4c0a48bdad7f225740b8e750fdc1da6d85e1eb
change-id: 20250717-qcom_ipq_ppe-7684dbc38fa4

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


