Return-Path: <linux-arm-msm+bounces-69571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FBEB2A46F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 15:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B78467BA85A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 13:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D8B221F15;
	Mon, 18 Aug 2025 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a3Lc75A/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24862221DAE;
	Mon, 18 Aug 2025 13:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522924; cv=none; b=fMbZeTVb1MAhFhN31kkubco79F2pOyndleYdzwdpZbKyRhNzrLhsxq+JBoFOHzNCXhhLvh1l+mrng07NrrAdw/vDXfqmsb1h4JeD3lsoHcjI2DYpp1rtUwFs+wKv62iA3mJiKrNT5bNnd+ZR4lepz9JnNolXPB37cg8y0cH4PP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522924; c=relaxed/simple;
	bh=GmE6vmhFxKiDew42RvDx5yQMkgRLqkZ/wRjDmOKZpCU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=V+a+v7ohbdGJ8cNv2QIKotqp2Kwp+P5L2KM4CmmGgk9NJOo70iBi3vJ61VCsBj4FlHFOQ2Jfht3Wqm2FqkzawIY0jW1UftYOEBq2ebCI9zhYOnn80nRCUeRpcNqfaGVQjgH/ugOmcV6DGPkfPd2aNj5QbvBPNmaEIT2XM1YBtDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a3Lc75A/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8hKc4021396;
	Mon, 18 Aug 2025 13:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FbaG45yJJRiI6KhYVq7g3x
	0CtTcAriZv/tdQ/Z4eD+U=; b=a3Lc75A/JxWzM7HCFqoievfguxVAj5gNxbi2d/
	//c2vnuXkw6u6DktrQuwOP/hdeYxcmRpcs0698LRh8+MiVKoa/xYfDG6qRvP3mnR
	Df8jgNZai3JvurNYpMTsfh7M2P6aMa2JeeJDo782waMj2Z+bVr6znAs4bRa1K3c1
	P6HH0hYXqZG9iVrUwfMdW/nbeJ/L3HEXgEYp2HbseymMD+9WYFk/l0nAlDmdUAK5
	dc+hQH3jbcAF5QAV5RvDKj3E7fDjOeov+vlirW8AjR9wY7oDOyrdvN9BwVSpBq+g
	uE/Z4KM0PjeaS21IgMwPPk6sZIr65jgCH7TiXrfD1DmkV3oQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh074tyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 13:14:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57IDEtV3012809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 13:14:55 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 18 Aug 2025 06:14:49 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH net-next v8 00/14] Add PPE driver for Qualcomm IPQ9574 SoC
Date: Mon, 18 Aug 2025 21:14:24 +0800
Message-ID: <20250818-qcom_ipq_ppe-v8-0-1d4ff641fce9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADEno2gC/23Pyw6CMBAF0F8xXVtTSl+48j+MIaVMdRaWpwRD+
 HebbgjE5eTOuZNZyAA9wkCup4X0MOGATYiDOZ+Ie9nwBIp1nAlnXDKdadq55l1i25VtC1QrI+r
 K5cZbQSJpe/A4p7o7CTDSAPNIHjF54TA2/TfdmWTKU6Xial85ScpoIavaqcp45f2t+6DD4C5xK
 1VNauOaswNXkQsLReY4y638w/XGTcYPXEeuTSGYqOJjhd3zdV1/81cdITIBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755522889; l=8711;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=GmE6vmhFxKiDew42RvDx5yQMkgRLqkZ/wRjDmOKZpCU=;
 b=ncJil9G8a0xEt/EGazUR8ze/f1kdphflz7FnKsDWDM+ZYVSGXd+reJ4Piz9+hlctv0oQHAD/1
 KaxXdtSwnpcCykxhNG/AkSiQu5zFZVrYSCIgLD/UhC5X1c9zvN6vb2O
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -2dGvyg0X4osr7tuYylAXFuHq3n3DDaf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX2GfuOUXarDug
 +9m3LFMSyhWgVf0fd+fVO6ybSOx58NRwv0CrAQdc/1AQ20kZWMIxW0V13AnfCHGW+wxqdoCwjfh
 hiu0ANM/iflI9tQqc3QQBfs4EQarzv3XBLhjTKLEqTsdaZKZ180XZuyKR28UohwfDmxnkxCyMZ1
 dsSiJ7d4yHQ6PSO5SkCet6Es8nBdNBPBkg3UFvDX4F3KFb4tPpOnncX+dOn679fzNRSlzWQXtDf
 1PcaaTcj/hYv05XVEl+LGJ0y9lJ2NP05Xb8G34mNzLT65b5WU/1lm0T3M3LOdmUKef0DNn4Xu8x
 87w7dAd3ZNRKIjyRiZcozWsg8wIBChZj/lM+Ly/LR287GOuLS087pNqMmaZPGh8/zF29WyykJWo
 90Wc2nbc
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a32750 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=z2GUvUhWd2_2b9YoxfUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -2dGvyg0X4osr7tuYylAXFuHq3n3DDaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

The PPE (packet process engine) hardware block is available in Qualcomm
IPQ chipsets that support PPE architecture, such as IPQ9574 and IPQ5332.
The PPE in the IPQ9574 SoC includes six Ethernet ports (6 GMAC and 6
XGMAC), which are used to connect with external PHY devices by PCS. The
PPE also includes packet processing offload capabilities for various
networking functions such as route and bridge flows, VLANs, different
tunnel protocols and VPN. It also includes an L2 switch function for
bridging packets among the 6 Ethernet ports and the CPU port. The CPU
port enables packet transfer between the Ethernet ports and the ARM
cores in the SoC, using the Ethernet DMA.

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
for the PPE Ethernet ports.

Part 3: The PPE EDMA patch series, which enables the Rx/Tx Ethernet DMA
and netdevice driver for the 6 PPE Ethernet ports.

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
about enabling Ethernet driver support for Qualcomm IPQ9574 SoC. This
writeup can help provide a higher level architectural view of various
other drivers that support the PPE such as clock and PCS drivers.
Topic: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet.
https://lore.kernel.org/linux-arm-msm/d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com/

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
Changes in v8:
- Ensure the term "Ethernet" is used consistently.
- Add a Reviewed-by tag to the Device Tree (DT) binding patch.
- Link to v7: https://lore.kernel.org/r/20250812-qcom_ipq_ppe-v7-0-789404bdbc9a@quicinc.com

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
base-commit: bab3ce404553de56242d7b09ad7ea5b70441ea41
change-id: 20250717-qcom_ipq_ppe-7684dbc38fa4

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


