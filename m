Return-Path: <linux-arm-msm+bounces-32967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1372398E443
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 22:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAB2D284000
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 20:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953F0217304;
	Wed,  2 Oct 2024 20:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bCDDbeso"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A9B2141D1;
	Wed,  2 Oct 2024 20:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727901480; cv=none; b=tLL8s3wVvlvMrSPVcJWimB/jvTacQ8Fvoa+6wxtjW6UQgyHXC3u1EezaJjqJCHfvhXWTHxB8OiUfbRm8xuqyE+xvqTIhPywXiwqzGdiX5egd2isRG8/HYYnx9S3OC482olm6ULPXb4lF9rLMnQQm89SWQhWbvqnA5+G3ZJWxXqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727901480; c=relaxed/simple;
	bh=l6GCiJ76PZlivqDa/6UHAfgb1TQ5EDiXtdDDoA13RTc=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:From:
	 In-Reply-To:Content-Type; b=Gog7hfP3K/hboufZAbHEmFYsnaBHrKjRTcLO+dcuLf47/tNSEmovKvu9uY26sr8PTJupV6eyl5fYmh6aL9rRGpFGWW64iNwEiSLvsGgI47RHOzTIsy0NPDO6U5t8L+QnXnqs75TIs4DiZvy15nJoiQryxLmWfwMeWj0gX/iPUB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bCDDbeso; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 492H6gkH000544;
	Wed, 2 Oct 2024 20:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CdELcpj9P99DQyyVnBGSYMPn9FMUFnzuRDnn1Qhd3JM=; b=bCDDbesoLy0g5zxW
	7emQakPc50+v4oYACw6KkqTiBSLTSFFFdenNxSXJWWCtScWcVeCU/Vs7/p8XphL9
	Ev9gQpULk6gm0LlqPGYPHI7bPi8Bonklrp/V4wlt4mg9iE09PgUFT9THfPw6iTBX
	Y6V+DRqlRXR6kVEPBFreciv21e58Zgqj7lJ8mQCr80gGpWe6JglF2+dtShg7PQ2S
	qGaxSpVrB+y2u7SGrL4L3fHAARA3kYsdFaVHKgd9qIE3pasqa7GqiYkDqjQfzyzs
	ZKILyknoLjBljKWN2XNW5jcPxHyDegPXcE5sJPbpXHeNWkVLMIcg29VWI+V8Sy6/
	lKgcUg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xajfmewy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Oct 2024 20:37:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 492KbPAA030581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Oct 2024 20:37:25 GMT
Received: from [10.216.30.2] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Oct 2024
 13:37:16 -0700
Message-ID: <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
Date: Thu, 3 Oct 2024 02:07:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
Content-Language: en-US
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
To: <netdev@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vsmuthu@qti.qualcomm.com>,
        <arastogi@qti.qualcomm.com>, <linchen@qti.qualcomm.com>,
        <john@phrozen.org>, Luo Jie
	<quic_luoj@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Suruchi
 Agarwal (QUIC)" <quic_suruchia@quicinc.com>,
        "Lei Wei (QUIC)"
	<quic_leiwei@quicinc.com>
From: Kiran Kumar C.S.K <quic_kkumarcs@quicinc.com>
In-Reply-To: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
X-Forwarded-Message-Id: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tmJgb-6oHBV9VqLOOCPj9-AReoKYAkXk
X-Proofpoint-ORIG-GUID: tmJgb-6oHBV9VqLOOCPj9-AReoKYAkXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410020148

Hello netdev,

We are planning to publish driver patches for adding Ethernet support
for Qualcomm's IPQ9574 SoC, and looking for some advice on the approach
to follow. There are two new drivers (described below) split across four
patch series, totaling to 40 patches. These two drivers depend on a
couple of clock controller drivers which are currently in review with
the community.

Support is currently being added only for IPQ9574 SoC. However the
drivers are written for the Qualcomm PPE (packet process engine)
architecture, and are easily extendable for additional IPQ SoC (Ex:
IPQ5332) that belong to the same network architecture family.

Given the number of patches for IPQ9574, we were wondering whether it is
preferred to publish the four series together, since having all the code
available could help clarify the inter-workings of the code. Or whether
it is preferred to publish the patches sequentially, depending on the
review progress?

As part of this email, we also wanted to give a brief overview of the
various hardware blocks involved, the various driver patch series, and
list the dependencies between them. Hopefully this will help the review
process (this info will be also added to driver doc). The rest of the
email addresses this.

Thank you for your time!

With Regards
Kiran

=========================================================================
Section Layout
==============
1. IPQ Ethernet hardware overview
   1.1 PPE: Internal blocks overview
   1.2 Clock controllers for network function
2. List of Patch series and dependencies


1. IPQ Ethernet hardware overview
=================================
The PPE (packet process engine) is a hardware block in IPQ SoC which
provides Ethernet and L2/L3 networking offload functions. These L2/L3
functions help offload network processing functions from the CPU.
Specifically w.r.to Ethernet functionality, it broadly comprises of
three components: Ethernet DMA, Switch core and GMACs/xGMACs.

On IPQ9574 SoC, the PPE includes 6 ethernet ports (1G/10G MACs) which
can connect to external PHY. For packet transfer between host CPU and
these ethernet ports, the PPE interfaces with the host CPU using
Ethernet-DMA (EDMA) on a special CPU connected port.

It also includes a switch core which can transfer packets between the
switch GMAC ports and CPU, or transfer packets between the switch ports.

The below diagram for IPQ9574 depicts the hardware blocks within and
outside PPE, which work together to support Ethernet functionality.

Fig.1.1 PPE and hardware block connectivity diagram for IPQ9574
---------------------------------------------------------------
         +---------+
         |  48MHZ  |
         +----+----+
              |(clock)
              v
         +----+----+
  +------| CMN PLL |
  |      +----+----+
  |           |(clock)
  |           v
  |      +----+----+           +----+----+  clock   +----+----+
  |  +---|  NSSCC  |           |   GCC   |--------->|   MDIO  |
  |  |   +----+----+           +----+----+          +----+----+
  |  |        |(clock & reset)      |(clock & reset)
  |  |        v                     v
  |  |   +-----------------------------+----------+----------+---------+
  |  |   |       +-----+               |EDMA FIFO |          | EIP FIFO|
  |  |   |       | SCH |               +----------+          +---------+
  |  |   |       +-----+                      |               |        |
  |  |   |  +------+   +------+            +-------------------+       |
  |  |   |  |  BM  |   |  QM  |            | L2/L3 Switch Core |       |
  |  |   |  +------+   +------+            +-------------------+       |
  |  |   |                                   |                         |
  |  |   | +-------+ +-------+ +-------+ +-------+ +-------+ +-------+ |
  |  |   | |  MAC0 | |  MAC1 | |  MAC2 | |  MAC3 | | XGMAC4| |XGMAC5 | |
  |  |   | +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ |
  |  |   |     |         |         |         |         |         |     |
  |  |   +-----+---------+---------+---------+---------+---------+-----+
  |  |         |         |         |         |         |         |
  |  |     +---+---------+---------+---------+---+ +---+---+ +---+---+
  +--+---->|             PCS0                    | |  PCS1 | | PCS2  |
  | clock  +---+---------+---------+---------+---+ +---+---+ +---+---+
  |            |         |         |         |         |         |
  |        +---+---------+---------+---------+---+ +---+---+ +---+---+
  | clock  +----------------+                    | |       | |       |
  +------->|Clock Controller|   4-port Eth PHY   | | PHY4  | | PHY5  |
           +----------------+--------------------+ +-------+ +-------+


1.1 PPE: Internal blocks overview
=================================

The Switch core
---------------
It has maximum 8 ports, comprising 6 GMAC ports and two DMA interfaces
(for Ethernet DMA and EIP security processor) on the IPQ9574.

GMAC/xGMAC
----------
There are 6 GMAC and 6 XGMAC in IPQ9574. Depending on the board ethernet
configuration, either GMAC or XGMAC is selected by the PPE driver to
interface with the PCS. The PPE driver initializes and manages these
GMACs, and registers one netdevice per GMAC.

EDMA (Ethernet DMA)
-------------------
This is a common ethernet DMA block inside PPE, which is used to
transmit and receive packets between Ethernet ports in the PPE switch,
and the ARM CPU cores. The PPE driver includes the ethernet DMA driver,
and registers one netdevice per PPE port.

PCS
---
The PCS blocks are outside the PPE, and provides the connection between
PPE's GMAC/XGMAC and the external ethernet PHY. There are 3 PCS
instances supported by IPQ9574. The PCS provides the PCS/xPCS function
to support modes such as SGMII/2500BASE-X/QSGMII/USXGMII/10G-BASE-R modes.

SCH (Scheduler)
---------------
The PPE driver initializes this block to enable traffic scheduling for
switch ports at egress.

QM (Queue Manager)
------------------
This block manages the various egress queues of the PPE switch.

The queues inside the switch core in PPE are mapped to the switch
ports. The PPE driver initializes this block to enable the switch
port to queue mappings as per the SoC's port configuration for
IPQ9574.

BM (Buffer Manager)
-------------------
This block manages the buffer thresholds for PPE port flow control.
The buffer availability for a port at run time will influence the
behavior of flow control on that port.

1.2 Clock controllers for network function
==========================================
Common PLL block
----------------
This block takes in a fixed reference clock as input and provide
clocks to other hardware blocks and peripherals such as NSS clock
controller, and to external PHYs as output.

NSS clock controller
--------------------
The NSS clock controller supplies clock to ethernet hardware blocks in
the IPQ such as PPE and PCS blocks, as shown in the diagram. It takes
clock input from Common PLL.

2. List of patch series and dependencies
========================================

Clock drivers (currently in review)
===================================
1) CMN PLL driver patch series:
	Currently in review with community.
	https://lore.kernel.org/linux-arm-msm/20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com/


2) NSS clock controller (NSSCC) driver patch series
	Currently in review with community.
	https://lore.kernel.org/linux-arm-msm/20240626143302.810632-1-quic_devipriy@quicinc.com/


Networking drivers (to be posted for review next week)
======================================================

The following patch series are planned to be pushed for the PPE and PCS
drivers, to support ethernet function. These patch series are listed
below in dependency order.

3) PCS driver patch series:
        Driver for the PCS block in IPQ9574. New IPQ PCS driver will
        be enabled in drivers/net/pcs/
	Dependent on NSS CC patch series (2).

4) PPE base driver patch series
        Base PPE driver support for IPQ9574.
	Configures scheduler, BM, QM, MAC during initialization for
		IPQ9574.
	Dependent on NSS CC patch series (2).

	We plan to update the below patch series which was paused
        earlier, with the new code which addresses the earlier
        shortcomings.

	https://lore.kernel.org/netdev/20240110114033.32575-1-quic_luoj@quicinc.com/

5) PPE MAC support patch series
        PPE driver patches to configure the various functions of
        ethernet MAC in PPE hardware and to enable phylink support for
        each ethernet port.

        Dependent on NSS CC (2) and PPE base (4) patch series

6) Ethernet DMA driver patch series (part of PPE driver)
        Enables DMA driver support for PPE EDMA, netdevice
        registration and operation for each of the PPE ports.

        Dependendent on NSS CC (2), PPE base (4), PPE MAC (5) patch
        series.

Other notable dependencies
===============================
MDIO driver:
        Already merged in net-next via the below patch from Christian.

https://lore.kernel.org/linux-arm-msm/170686862773.17682.10435156329986246682.git-patchwork-notify@kernel.org/

