Return-Path: <linux-arm-msm+bounces-47306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B961A2DE48
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 15:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 353B31885C12
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 14:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B121DE4C7;
	Sun,  9 Feb 2025 14:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h2cbzdfB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBA7199223;
	Sun,  9 Feb 2025 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739111415; cv=none; b=k6Q/Lrn3dCKfxclblea+E9VsIp0dp08nHTzAz9da3wKfM9/6b7L244edw/dFB+iR/3dHK6rX0CEmkkn7wr1R2PjT3HCHgmBV21NHBMeC5fCJV8pMguvs+prg/NyhNZQv5iCLRQqtVjRNUDgfyDT4hUSAtgEMam6YvYfwkQxBzeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739111415; c=relaxed/simple;
	bh=j50fJfl4i8tuyl+AhzpU6GRpNfTe62f6ydCAWDL/NuU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=GqnEOmwxMiRzI7ZyF7uEBe6RtvZwU4SSsVXOhI8wH2YlcQfV3idL3FNbKyK5TgxfrR8TjG9MRb32mLodmAt8KP3zc67Ly44cuGctyuP05nYZQtmAuMTeoeFyovfwKhpMuZsPUUbBtnV8VPTrKKXaLxIx1GpwcXbi/CkzCVXW5T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h2cbzdfB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519DLqrS024520;
	Sun, 9 Feb 2025 14:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AmxnT2q24+F4+M+cbfEP5I
	j4GX4lm/rRVMWdtQqPCxc=; b=h2cbzdfBkmvC1+XdjbAR+nkezvT1uHbucUpMrc
	ZLyCEPYaS8jygBeWZ5UeCSUsI020kFjFiuJVdpzYPQY5SQQLepuWpG/0X2/ugPQN
	tWYeClm02s5vEPPhfqgl0SkLdQIcSKksFiFL8MioGiRWks9WvpyB5MZ7aUrssvKT
	CAvWyanLjoZuw0eXRpQ3CuBzR7cc5MggV4cX2DRFfOQ4oPVkMlU4F2Z3IK7IZIfC
	WNyC7m2+BKXWK09waVFEuKjAXrQ3p9IdTf7AmSjsGhE63rTK0NWGvaus+EwiXF31
	sVf7fdjupLjtBNG+K2ZZdmFWmUQmngnO7/MaDvvBLX2EqMPQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0esa3jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Feb 2025 14:29:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 519ETsHN005044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Feb 2025 14:29:54 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 9 Feb 2025 06:29:49 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH net-next v3 00/14] Add PPE driver for Qualcomm IPQ9574 SoC
Date: Sun, 9 Feb 2025 22:29:34 +0800
Message-ID: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM67qGcC/22OzQrCMBCEX6XkbEr+Sq0n30OkpGlqVzRJkzZUS
 t/dGPAgCHvYYfhmZkNBe9ABnYoNeR0hgDVJ8EOB1CjNTWPok0aMsIpQcsSTss8W3NQ6p7GUQol
 BEtnVHCXEeT3AmuMuyOgZG73O6JqcEcJs/Sv3RJr9FCkIpekE4bzkrKorTPG0gGofi72fPx8YV
 abGnBHZl/szJTJMcM0b0Xe9rGnT/OL7vr8BIxIW+OwAAAA=
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
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>, Luo Jie <quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739111388; l=6208;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=j50fJfl4i8tuyl+AhzpU6GRpNfTe62f6ydCAWDL/NuU=;
 b=rEEn16dUH8hhbRo+FCtrm/htWo1UFy2E4fM8KF2deQmnUusLeLLMCYdgrb46R+rcYU8vykw6m
 eyEhAuNQrQHBhS9iNopRi9YNWp+VEClEm3CoC/2R7pSmL+V153dhork
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z9vkydXYA2ZJtw9V6nqFlQiICM4XxLXQ
X-Proofpoint-ORIG-GUID: Z9vkydXYA2ZJtw9V6nqFlQiICM4XxLXQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-09_06,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502090128

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
  https://lore.kernel.org/all/20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com
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

 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  |  406 ++++
 .../networking/device_drivers/ethernet/index.rst   |    1 +
 .../device_drivers/ethernet/qualcomm/ppe/ppe.rst   |  197 ++
 MAINTAINERS                                        |    8 +
 drivers/net/ethernet/qualcomm/Kconfig              |   15 +
 drivers/net/ethernet/qualcomm/Makefile             |    1 +
 drivers/net/ethernet/qualcomm/ppe/Makefile         |    7 +
 drivers/net/ethernet/qualcomm/ppe/ppe.c            |  234 +++
 drivers/net/ethernet/qualcomm/ppe/ppe.h            |   39 +
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c     | 2002 ++++++++++++++++++++
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h     |  317 ++++
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c    |  692 +++++++
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.h    |   16 +
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h       |  559 ++++++
 14 files changed, 4494 insertions(+)
---
base-commit: acdefab0dcbc3833b5a734ab80d792bb778517a0
change-id: 20250108-qcom_ipq_ppe-aa4c4fa0ab73

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


