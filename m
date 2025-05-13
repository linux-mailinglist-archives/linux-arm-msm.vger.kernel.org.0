Return-Path: <linux-arm-msm+bounces-57676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9EBAB50A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 12:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E553463AF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 09:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B90024168A;
	Tue, 13 May 2025 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hACaIeth"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150FB23F424;
	Tue, 13 May 2025 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130345; cv=none; b=LY0ABQP8g5Ltc51W4y7DghJKWX0KmjI1eeNdAWLLyXvn/sgGXuibs4TSGcO8wWCQGVZEO78VJQLBRO/AX4tq/59nxzz+oAdBthhtJ6oKC2yW84n2najy+KHMCY2t/XH3LIieye7FByV40y9c1nCY8bPYInmyIlebbQTli3Gx5ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130345; c=relaxed/simple;
	bh=jJB/w04QTTnN9Omz9Q98r8nY0loudoWZiqe9QXNVp7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pYWWCaiat0AX8mIAQXeYCOK37/Zet17hTmUJXIrS12JObExx6/EWhJOwcegybSyPxT9UFJrgmAE5/yb9YMKhezbR53NuTxRAhcj5dvn9DSeoQgdeuTJYGQs1idlIP+vY49Zj27TDVgmM6owT7jO8OUsH95v6IfJbGMlJuCiF3LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hACaIeth; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D6bU76006357;
	Tue, 13 May 2025 09:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUjaoDk0maSsXT0zUE0JLIKgh0IVD6PfKJZXg/0VB4E=; b=hACaIethMosNn7hn
	VvIQ0dtqx7xiOAzhQIOrKjKHTxzDXr/yQs8rZhogO9HBvEctnLsYltu3U2EhCYTt
	eDF5mPD0L5IczT7j6bDfcq6KFLjup0SF9oyKVBWw5Te1g1UWeTJtD7kehljiN30H
	rt1vmCBbZwk9iDHqCDsxqUi41rg4UoBWIDnT1aTytnIA+gVRh4BdMswANCGPvooQ
	eeCeADUNB7LpI/gDOMy2aHf5sDhqG4t1WVOL9CLcoC06IIawRjdxY5qlgAeW4ozP
	F9qTDKS87hQxNXCC3k9yVOBpiQ2wCXtauGb6pvwv+7LmgOjtYgrAEHF7DHBmGz64
	VmXxYw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hvghfjnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:58:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D9wlYu008096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:58:47 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 02:58:42 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 13 May 2025 17:58:22 +0800
Subject: [PATCH net-next v4 02/14] docs: networking: Add PPE driver
 documentation for Qualcomm IPQ9574 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250513-qcom_ipq_ppe-v4-2-4fbe40cbbb71@quicinc.com>
References: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
In-Reply-To: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747130310; l=10849;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=a75txbCIArwLAHhjLgG4jVkjkQdmxeWv7U+4bGVqA2g=;
 b=CFto20Q6B/TQSgG7EO18KeQLWPIptWG/0mJBdvikGJuKiTHuPSXWgPCog6XOVZFmClz9CysS3
 yLBuwnTDjAqDhdUqwc5/+Z+ZB7pIR6v8Xc8LX2rRqu/sL2Uhiouz24e
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 51S1moZZ2J6Gsacv-ZevFsldUq2OxrRr
X-Proofpoint-ORIG-GUID: 51S1moZZ2J6Gsacv-ZevFsldUq2OxrRr
X-Authority-Analysis: v=2.4 cv=AMDybF65 c=1 sm=1 tr=0 ts=682317d8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=imonNLKGdx_ZcR_XrnUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA5NCBTYWx0ZWRfX9OyzAabH0MbD
 ZyCnCTB2EsoOKfyuGvykrU06kIN1G4xKzmKN2NEnkZKLo9NMYnJe4pjuXYUvPvBToREHrwRdB9F
 kHI/D84YDTCOSUE8v5/5yNr9qZ8NNQmtB7KNYqYSDpHTMHIoaM6J7YYmM5Ijif/UwbAShkKgEqg
 lyTOhdPH4+HS1PUJYEJQB4G5SlgAJEMQk35/H+MIltSHfdjzSJWdHac1tatZJ9bVW9VjCBPgvh2
 XY2oQ+XrUCcJ/7Oqo5JmVNKEfTt4wj7wytwi40cYo7xhxoTfwvippUVrY1kCv0aj5ydQbcXHcZc
 HDx6Lf/ClXK/3lQ90lMLCy1RgWQD0cYioR+nyApQ0zMbxma8cSOtomuCrt8AVAXrdQbE6yrZUca
 F/YvsyQPoId6hYpLlQF4FaJSvSs/YRM82N2Jq8dIbTZtpiCDQZPD9tJkiwJnRfeiUKA180go
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130094

From: Lei Wei <quic_leiwei@quicinc.com>

Add description and high-level diagram for PPE, driver overview and
module enable/debug information.

Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 .../networking/device_drivers/ethernet/index.rst   |   1 +
 .../device_drivers/ethernet/qualcomm/ppe/ppe.rst   | 194 +++++++++++++++++++++
 2 files changed, 195 insertions(+)

diff --git a/Documentation/networking/device_drivers/ethernet/index.rst b/Documentation/networking/device_drivers/ethernet/index.rst
index 6fc1961492b7..978d87edaeb5 100644
--- a/Documentation/networking/device_drivers/ethernet/index.rst
+++ b/Documentation/networking/device_drivers/ethernet/index.rst
@@ -49,6 +49,7 @@ Contents:
    neterion/s2io
    netronome/nfp
    pensando/ionic
+   qualcomm/ppe/ppe
    smsc/smc9
    stmicro/stmmac
    ti/cpsw
diff --git a/Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst b/Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
new file mode 100644
index 000000000000..8d61ce022164
--- /dev/null
+++ b/Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
@@ -0,0 +1,194 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============================================
+PPE Ethernet Driver for Qualcomm IPQ SoC Family
+===============================================
+
+Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+
+Author: Lei Wei <quic_leiwei@quicinc.com>
+
+
+Contents
+========
+
+- `PPE Overview`_
+- `PPE Driver Overview`_
+- `PPE Driver Supported SoCs`_
+- `Enabling the Driver`_
+- `Debugging`_
+
+
+PPE Overview
+============
+
+IPQ (Qualcomm Internet Processor) SoC (System-on-Chip) series is Qualcomm's series of
+networking SoC for Wi-Fi access points. The PPE (Packet Process Engine) is the Ethernet
+packet process engine in the IPQ SoC.
+
+Below is a simplified hardware diagram of IPQ9574 SoC which includes the PPE engine and
+other blocks which are in the SoC but outside the PPE engine. These blocks work together
+to enable the Ethernet for the IPQ SoC::
+
+             +------+ +------+ +------+ +------+ +------+  +------+ start +-------+
+             |netdev| |netdev| |netdev| |netdev| |netdev|  |netdev|<------|PHYLINK|
+             +------+ +------+ +------+ +------+ +------+  +------+ stop  +-+-+-+-+
+                                           |                                | | ^
+ +-------+   +-------------------------+--------+----------------------+    | | |
+ | GCC   |   |                         |  EDMA  |                      |    | | |
+ +---+---+   |  PPE                    +---+----+                      |    | | |
+     | clk   |                             |                           |    | | |
+     +------>| +-----------------------+------+-----+---------------+  |    | | |
+             | |   Switch Core         |Port0 |     |Port7(EIP FIFO)|  |    | | |
+             | |                       +---+--+     +------+--------+  |    | | |
+             | |                           |               |        |  |    | | |
+ +-------+   | |                    +------+---------------+----+   |  |    | | |
+ |CMN PLL|   | | +---+ +---+ +----+ | +--------+                |   |  |    | | |
+ +---+---+   | | |BM | |QM | |SCH | | | L2/L3  |  .......       |   |  |    | | |
+ |   |       | | +---+ +---+ +----+ | +--------+                |   |  |    | | |
+ |   |       | |                    +------+--------------------+   |  |    | | |
+ |   |       | |                           |                        |  |    | | |
+ |   v       | | +-----+-+-----+-+-----+-+-+---+--+-----+-+-----+   |  |    | | |
+ | +------+  | | |Port1| |Port2| |Port3| |Port4|  |Port5| |Port6|   |  |    | | |
+ | |NSSCC |  | | +-----+ +-----+ +-----+ +-----+  +-----+ +-----+   |  | mac| | |
+ | +-+-+--+  | | |MAC0 | |MAC1 | |MAC2 | |MAC3 |  |MAC4 | |MAC5 |   |  |<---+ | |
+ | ^ | |clk  | | +-----+-+-----+-+-----+-+-----+--+-----+-+-----+   |  | ops  | |
+ | | | +---->| +----|------|-------|-------|---------|--------|-----+  |      | |
+ | | |       +---------------------------------------------------------+      | |
+ | | |              |      |       |       |         |        |               | |
+ | | |   MII clk    |      QSGMII               USXGMII   USXGMII             | |
+ | | +------------->|      |       |       |         |        |               | |
+ | |              +-------------------------+ +---------+ +---------+         | |
+ | |125/312.5M clk|       (PCS0)            | | (PCS1)  | | (PCS2)  | pcs ops | |
+ | +--------------+       UNIPHY0           | | UNIPHY1 | | UNIPHY2 |<--------+ |
+ +--------------->|                         | |         | |         |           |
+ | 31.25M ref clk +-------------------------+ +---------+ +---------+           |
+ |                   |     |      |      |          |          |                |
+ |              +-----------------------------------------------------+         |
+ |25/50M ref clk| +-------------------------+    +------+   +------+  | link    |
+ +------------->| |      QUAD PHY           |    | PHY4 |   | PHY5 |  |---------+
+                | +-------------------------+    +------+   +------+  | change
+                |                                                     |
+                |                       MDIO bus                      |
+                +-----------------------------------------------------+
+
+The CMN (Common) PLL, NSSCC (Networking Sub System Clock Controller) and GCC (Global
+Clock Controller) blocks are in the SoC and act as clock providers.
+
+The UNIPHY block is in the SoC and provides the PCS (Physical Coding Sublayer) and
+XPCS (10-Gigabit Physical Coding Sublayer) functions to support different interface
+modes between the PPE MAC and the external PHY.
+
+This documentation focuses on the descriptions of PPE engine and the PPE driver.
+
+The Ethernet functionality in the PPE (Packet Process Engine) is comprised of three
+components: the switch core, port wrapper and Ethernet DMA.
+
+The Switch core in the IPQ9574 PPE has maximum of 6 front panel ports and two FIFO
+interfaces. One of the two FIFO interfaces is used for Ethernet port to host CPU
+communication using Ethernet DMA. The other one is used to communicate to the EIP
+engine which is used for IPsec offload. On the IPQ9574, the PPE includes 6 GMAC/XGMACs
+that can be connected with external Ethernet PHY. Switch core also includes BM (Buffer
+Management), QM (Queue Management) and SCH (Scheduler) modules for supporting the
+packet processing.
+
+The port wrapper provides connections from the 6 GMAC/XGMACS to UNIPHY (PCS) supporting
+various modes such as SGMII/QSGMII/PSGMII/USXGMII/10G-BASER. There are 3 UNIPHY (PCS)
+instances supported on the IPQ9574.
+
+Ethernet DMA is used to transmit and receive packets between the Ethernet subsystem
+and ARM host CPU.
+
+The following lists the main blocks in the PPE engine which will be driven by this
+PPE driver:
+
+- BM
+    BM is the hardware buffer manager for the PPE switch ports.
+- QM
+    Queue Manager for managing the egress hardware queues of the PPE switch ports.
+- SCH
+    The scheduler which manages the hardware traffic scheduling for the PPE switch ports.
+- L2
+    The L2 block performs the packet bridging in the switch core. The bridge domain is
+    represented by the VSI (Virtual Switch Instance) domain in PPE. FDB learning can be
+    enabled based on the VSI domain and bridge forwarding occurs within the VSI domain.
+- MAC
+    The PPE in the IPQ9574 supports up to six MACs (MAC0 to MAC5) which are corresponding
+    to six switch ports (port1 to port6). The MAC block is connected with external PHY
+    through the UNIPHY PCS block. Each MAC block includes the GMAC and XGMAC blocks and
+    the switch port can select to use GMAC or XMAC through a MUX selection according to
+    the external PHY's capability.
+- EDMA (Ethernet DMA)
+    The Ethernet DMA is used to transmit and receive Ethernet packets between the PPE
+    ports and the ARM cores.
+
+The received packet on a PPE MAC port can be forwarded to another PPE MAC port. It can
+be also forwarded to internal switch port0 so that the packet can be delivered to the
+ARM cores using the Ethernet DMA (EDMA) engine. The Ethernet DMA driver will deliver the
+packet to the corresponding 'netdevice' interface.
+
+The software instantiations of the PPE MAC (netdevice), PCS and external PHYs interact
+with the Linux PHYLINK framework to manage the connectivity between the PPE ports and
+the connected PHYs, and the port link states. This is also illustrated in above diagram.
+
+
+PPE Driver Overview
+===================
+PPE driver is Ethernet driver for the Qualcomm IPQ SoC. It is a single platform driver
+which includes the PPE part and Ethernet DMA part. The PPE part initializes and drives the
+various blocks in PPE switch core such as BM/QM/L2 blocks and the PPE MACs. The EDMA part
+drives the Ethernet DMA for packet transfer between PPE ports and ARM cores, and enables
+the netdevice driver for the PPE ports.
+
+The PPE driver files in drivers/net/ethernet/qualcomm/ppe/ are listed as below:
+
+- Makefile
+- ppe.c
+- ppe.h
+- ppe_config.c
+- ppe_config.h
+- ppe_debugfs.c
+- ppe_debugfs.h
+- ppe_regs.h
+
+The ppe.c file contains the main PPE platform driver and undertakes the initialization of
+PPE switch core blocks such as QM, BM and L2. The configuration APIs for these hardware
+blocks are provided in the ppe_config.c file.
+
+The ppe.h defines the PPE device data structure which will be used by PPE driver functions.
+
+The ppe_debugfs.c enables the PPE statistics counters such as PPE port Rx and Tx counters,
+CPU code counters and queue counters.
+
+
+PPE Driver Supported SoCs
+=========================
+
+The PPE driver supports the following IPQ SoC:
+
+- IPQ9574
+
+
+Enabling the Driver
+===================
+
+The driver is located in the menu structure at::
+
+  -> Device Drivers
+    -> Network device support (NETDEVICES [=y])
+      -> Ethernet driver support
+        -> Qualcomm devices
+          -> Qualcomm Technologies, Inc. PPE Ethernet support
+
+If the driver is built as a module, the module will be called qcom-ppe.
+
+The PPE driver functionally depends on the CMN PLL and NSSCC clock controller drivers.
+Please make sure the dependent modules are installed before installing the PPE driver
+module.
+
+
+Debugging
+=========
+
+The PPE hardware counters are available in the debugfs and can be checked by the command
+``cat /sys/kernel/debug/ppe/packet_counters``.

-- 
2.34.1


