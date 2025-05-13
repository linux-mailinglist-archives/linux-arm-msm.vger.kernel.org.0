Return-Path: <linux-arm-msm+bounces-57674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D716AB5094
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 11:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 826C01B44AFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 09:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851F323C4FA;
	Tue, 13 May 2025 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c8/5xFHk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB6E1E9B20;
	Tue, 13 May 2025 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130340; cv=none; b=EccyNc5qski6Cq2p/M/MfIILhqvuUJQJQN/1VRFxyOF1kULDxGx/XlQGm+FrybzZb4fXBKJ0xKEHpSzUuSVtjVFBGfqtp2Ek85Qa2MkHTph2BFh72yOMrmzwkoQZwOpYWXKRAmdP4CBkMOTmgVTexxGHEsj+aO3QwK30ya9MXBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130340; c=relaxed/simple;
	bh=B87pcQRpmzpPHEK8vQPYMKEGMIo4ra0V4VjOfanRf8E=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=pZi6qgoiBSsC+ACsHUbgUQJuBKycfxRQgRj9wfRf8KRPxrzjNXdNqQRA6LMh8Xh8/l9FLRFHAHTXkMpvgvzd6tv6gHdGY2sYeTsR3MLH9yGol9zIFHYeoM8ZuXd9XV9FuORJ0hFIjrl7i/0hfJtj2+SmJSpq0QTy1gim4gGHOWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c8/5xFHk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D7eF06015668;
	Tue, 13 May 2025 09:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Uf6X3Fae8blTULA89wcePA
	CyyDYZ7nNMjb2MDuKpaEc=; b=c8/5xFHkKxzXJkqYf8bOkRw+qYVIcjbtX8jWzE
	smjto94vVthAljC3bJAN58MFsNzWmtB+cUmXuDzctDn4v5daHDZk4J2qcsWcFmlq
	E02D8TBfbVgud0FC+8/DS3AIMUC12vJ1QWdCvrJjtU3psC3Jdh2pyIFqAOk4q9hj
	TRkXAC26tB+NmrpcfTCehrp8N24VmiqT7v4hrrSDE7US3greU9vaKxoKzAGJlQw8
	kAiqWDdYl9S9Gr6MSIe/7XXt7oMelZo5XdQn5hZXMnIK6KiQ5p4ciNB74seIhJ+5
	FXyYyoCgKLUbB2qlecsqziE6suBDvCOQtebceSXuYLGMNPmg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwt97a9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:58:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D9wait002828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:58:36 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 02:58:31 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH net-next v4 00/14] Add PPE driver for Qualcomm IPQ9574 SoC
Date: Tue, 13 May 2025 17:58:20 +0800
Message-ID: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL0XI2gC/22Q2YrDMAxFfyX4eVy8Bcd5mv8YSnBiZaqhtbM1t
 JT8e1XPxiygB8mXc6/kG5thQphZXdzYBCvOmCIN5qlg3cHHV+AYaGZKqFJIUfGxS6cGh7EZBuD
 em870XvjWakbIMEGPl2z3wiIsPMJlYXtSDjgvabrmnFVmnSyNkJLKCK13WpW25JKPZ+ya4zm9P
 T86jN2OErPHqj65f1ZZFRfcamdCG7yVzv3F9TeuhPuFa8JNqcHLKmhl5U98ez9uAnqdcfm48Ou
 H6iK7Gil5j3AMzSkF7K+80m1ZhdY5UmvK32/bHe4TErlyAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747130310; l=7274;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=B87pcQRpmzpPHEK8vQPYMKEGMIo4ra0V4VjOfanRf8E=;
 b=gEIrpjvbJL8BUtsPuOON1IIFGtWu9a5rGvqI5Q1cxXXD5aAlE5QHY9JkGEah5WY7W3JchJRLY
 QXg/NEleOMlD7k84YBn2eSJVKs2g+fozB+26Bea78SzMhmyUM+DpEQS
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA5NCBTYWx0ZWRfX65CsIaDmY5/N
 /6Eqt8YqBMLe5UNtpLFLaAXEaHMtkzqEMMxRhX6i65XLz0PGvLqwupR8k3gLWW2E9bpgaRkVUF2
 TcaksYli1DJ61w717L7DLNDP3EjdIPM2pnjNJOH1PAgqR3jOykKkdgxWrdVb+p3dlM6kevFdbzB
 I3Xe5j+ob/xun7uNBT7sAk//FFxXpEvGGVJAywVJbr+zKlJ02pqb14gGLi3N7J+YAcB900gj05k
 ktDz3LDsjKScy2AQl2m59jpXaw2Hhfg0AqKn9yUKi/mlAsoPj7wTmP/qBBWOo7GvJQikiGkoa2h
 Zthg8gJ7cYtlUD+h/jczLmBup9XByOrDrhQSFXtzsHd2VUzlzh/X1Eg55rvd3zTYYIo4m1Zw/Bu
 a59ROl8pJK8imyjtQo9VuQtHANF700siNnmrwvuOMiZIhPG4c4kA7GKTw1J8nCxnWTPOQmBx
X-Proofpoint-ORIG-GUID: 2NKNZh303p1t8pE4uePgDS0cLoNsBp4v
X-Proofpoint-GUID: 2NKNZh303p1t8pE4uePgDS0cLoNsBp4v
X-Authority-Analysis: v=2.4 cv=a58w9VSF c=1 sm=1 tr=0 ts=682317ce cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=HAxyLaFxb4ZfO1oSC6kA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1011 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130094

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
 .../device_drivers/ethernet/qualcomm/ppe/ppe.rst   |  194 ++
 MAINTAINERS                                        |    8 +
 drivers/net/ethernet/qualcomm/Kconfig              |   15 +
 drivers/net/ethernet/qualcomm/Makefile             |    1 +
 drivers/net/ethernet/qualcomm/ppe/Makefile         |    7 +
 drivers/net/ethernet/qualcomm/ppe/ppe.c            |  234 +++
 drivers/net/ethernet/qualcomm/ppe/ppe.h            |   39 +
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c     | 2029 ++++++++++++++++++++
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h     |  317 +++
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c    |  814 ++++++++
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.h    |   16 +
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h       |  556 ++++++
 14 files changed, 4637 insertions(+)
---
base-commit: acdefab0dcbc3833b5a734ab80d792bb778517a0
change-id: 20250108-qcom_ipq_ppe-aa4c4fa0ab73
prerequisite-change-id: 20250411-field_modify-83b58db99025:v3
prerequisite-patch-id: d67ff5b44b11f3736651f9de10b8c2759111b932
prerequisite-patch-id: e68fa1f578d6ca2fa1f144339711149408774213
prerequisite-patch-id: 3975c5efbaba1ce03d97e701acb438575ff8386c
prerequisite-patch-id: 760d6c0ec2b0e5158bff859ba1ed0d49185c702e
prerequisite-patch-id: 871c668a11bf3a5959a018b56c474d44dc0e4d7d
prerequisite-patch-id: c9ad97859dd5a586afa32ad1daac531dfc11d53d

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


