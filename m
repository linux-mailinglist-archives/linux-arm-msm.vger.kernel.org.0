Return-Path: <linux-arm-msm+bounces-40275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 307379E3D5A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E48C128116E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C360A20B800;
	Wed,  4 Dec 2024 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gA03IGoy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C78A20A5E7;
	Wed,  4 Dec 2024 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733323986; cv=none; b=khI3/sVB6fm9VSnztHedaZp0bCS2k6ucC/0DI/etpil9Z4BpVjkWE+dTBsFFZmaqU6Ie8FXNAZxAAmcj+EyFexSFvuX4m2CNsBUEkIvpBGmjWwYm8J2A4lxbXV0gkwl4KEUfwYqPFvAko9H/e/gYuUlLPDB/eqb8Ie4W4uUPhQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733323986; c=relaxed/simple;
	bh=9S0hchzxez9pNCIR/AUpcl6f3DdTEiAyq8NPSfzzvbk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=aG96ZQbG7ZdJsFYQ69m3zCeRR3o3Xk6nP2yKCDFvJ+P19rUXcQ8pQT1+8prixRtJsX2Z+E7B3QLFsrbYR8kU7qQaf1pl0IjKZj54ea4aPMecvPS1q8k9CkzFIfR2/mK6Od50NO3i3/DKP/zFpts4ClSR1OMEoP5rWiYhiR7+N9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gA03IGoy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B45xt8Z010494;
	Wed, 4 Dec 2024 14:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v0Q3KIInuD+e/4A2nf8kVW
	+ZNT1dMVERaJJR2vF10wk=; b=gA03IGoy4GSBCSLOot9ZJvb5H4Rr74w+yi9Klt
	IaqduRyXNiiHZq/5d44QX8Rtu4hHwO4Kg9jf5PUAF0nH5ov0jgX8cOyyGnqA059C
	903l48Z5lcxcYXNWDuJq1cA1QtEh3YrlcwS9O3rFU82fz5Ssc5AOpCfPgfYPuYYV
	YMwGosb2jS7tjB1KMs61MGCW/+tutuVaBIHt0NT6unZG1jxNpEcjKoctYrQUhbz8
	Jbo+IxqKCdnZdRhA9OtjuPIEhHH0NzEHgBuVJJdYJAikAJUQVFngTIxCvM5LvBZV
	3yGfq+uOpZgFDJKgv8NEokHiVk46ZcdHR+H/aF0FB5pGSiCw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439v7yvq7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 14:52:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4EqiSR030728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 14:52:44 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 06:52:38 -0800
From: Lei Wei <quic_leiwei@quicinc.com>
Subject: [PATCH net-next v2 0/5] Add PCS support for Qualcomm IPQ9574 SoC
Date: Wed, 4 Dec 2024 22:43:52 +0800
Message-ID: <20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKlqUGcC/22NQQ6CMBBFr0JmbU2nCCor72EIIcNUZmGBFhsM4
 e42Xbt8efnv7xDYCwdoih08RwkyuQTmVACNvXuxkiExGG0uiBqVzEs3U+g8oTJ1z3gr6U51CWk
 xe7ay5doTHK/K8bZCm8woYZ38N99EzP5vMaLSyg5sq2tVG032sXyExNGZpje0x3H8AHm9lFOyA
 AAA
To: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Lunn
	<andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
	<linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_luoj@quicinc.com>,
        <quic_leiwei@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <bartosz.golaszewski@linaro.org>, <vsmuthu@qti.qualcomm.com>,
        <john@phrozen.org>, <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733323958; l=2722;
 i=quic_leiwei@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=9S0hchzxez9pNCIR/AUpcl6f3DdTEiAyq8NPSfzzvbk=;
 b=TwiQqbN21gN2NUDoQT9bnnN0+W5SjHXUHaBqyo04LIwEqTEbB815Y6gocFsjmF/bt78JFlf46
 G3r9RuRLxa0BFd0fNxpp8o/YlTLyoJH9xh/doLpq72YB9qGtZLF5PaF
X-Developer-Key: i=quic_leiwei@quicinc.com; a=ed25519;
 pk=uFXBHtxtDjtIrTKpDEZlMLSn1i/sonZepYO8yioKACM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jTDta9_5_Do2iZCtEpTmO0sx1vys-34K
X-Proofpoint-GUID: jTDta9_5_Do2iZCtEpTmO0sx1vys-34K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040114

The 'UNIPHY' PCS block in the Qualcomm IPQ9574 SoC provides Ethernet
PCS and SerDes functions. It supports 1Gbps mode PCS and 10-Gigabit
mode PCS (XPCS) functions, and supports various interface modes for
the connectivity between the Ethernet MAC and the external PHYs/Switch.
There are three UNIPHY (PCS) instances in IPQ9574, supporting the six
Ethernet ports.

This patch series adds base driver support for initializing the PCS,
and PCS phylink ops for managing the PCS modes/states. Support for
SGMII/QSGMII (PCS) and USXGMII (XPCS) modes is being added initially.

The Ethernet driver which handles the MAC operations will create the
PCS instances and phylink for the MAC, by utilizing the API exported
by this driver.

While support is being added initially for IPQ9574, the driver is
expected to be easily extendable later for other SoCs in the IPQ
family such as IPQ5332.

Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
---
Changes in v2:
- dtbindings updates
  a.) Rename dt-binding header file to match binding file name.
  b.) Drop unused labels and the redundant examples.
  c.) Rename "mii_rx"/"mii_tx" clock names to "rx"/"tx".
- Rename "PCS_QCOM_IPQ" with specific name "PCS_QCOM_IPQ9574" in
  Kconfig.
- Remove interface mode check for the PCS lock.
- Use Cisco SGMII AN mode as default SGMII/QSGMII AN mode.
- Instantiate MII PCS instances in probe and export "ipq_pcs_get" and
  "ipq_pcs_put" APIs.
- Move MII RX and TX clock enable and disable to "pcs_enable" and
  "pcs_disable" methods.
- Change "dev_dbg" to "dev_dbg_ratelimited" in "pcs_get_state" method.
- Link to v1: https://lore.kernel.org/r/20241101-ipq_pcs_rc1-v1-0-fdef575620cf@quicinc.com

---
Lei Wei (5):
      dt-bindings: net: pcs: Add Ethernet PCS for Qualcomm IPQ9574 SoC
      net: pcs: Add PCS driver for Qualcomm IPQ9574 SoC
      net: pcs: qcom-ipq9574: Add PCS instantiation and phylink operations
      net: pcs: qcom-ipq9574: Add USXGMII interface mode support
      MAINTAINERS: Add maintainer for Qualcomm IPQ9574 PCS driver

 .../bindings/net/pcs/qcom,ipq9574-pcs.yaml         | 190 +++++
 MAINTAINERS                                        |   9 +
 drivers/net/pcs/Kconfig                            |   9 +
 drivers/net/pcs/Makefile                           |   1 +
 drivers/net/pcs/pcs-qcom-ipq9574.c                 | 884 +++++++++++++++++++++
 include/dt-bindings/net/qcom,ipq9574-pcs.h         |  15 +
 include/linux/pcs/pcs-qcom-ipq9574.h               |  16 +
 7 files changed, 1124 insertions(+)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241101-ipq_pcs_rc1-26ae183c9c63

Best regards,
-- 
Lei Wei <quic_leiwei@quicinc.com>


