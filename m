Return-Path: <linux-arm-msm+bounces-47157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6A3A2C81C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 16:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E1BC162896
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 15:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BAC169AE6;
	Fri,  7 Feb 2025 15:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NZex1JnO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1EE23C8B9;
	Fri,  7 Feb 2025 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943938; cv=none; b=e4/uXM/5Zn/+7EebUi3oaVVqEK/tc70sGRsHMRH0peDFiaeWScr3z7WVWRo/tRRnzwE1rXBt2TFlPXOEMTVxObS8ani1xBVAO0B+vs9VrqmYiyNIa+2ICQHIhKBCrRuJGTB3zHcNwqb2E8vkuAIgdgQqo10JmQ5BhAsrK0vAQlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943938; c=relaxed/simple;
	bh=o7NPCUuz+LB8O51ZyJvr5ddsy22WVJ+Ql5GYrv/R/Bw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=QClyQCTi6szfWGbNRl3hacT5EC2SfHpRn/SjOPkRKb677nIGGYkPN2w3eyFEIAIZd0AoqCPnZW4hPuhwmUDa0+eQ9jBBVDcYVS0d7hZAu+MAPrBkkApOIUICVL1XNdCc+dH4MP/8i+gAhseqdh/Eg6zzBHEZB2BFQqzE6+DKFsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NZex1JnO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517EpRbn012365;
	Fri, 7 Feb 2025 15:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aUb3f4LlVHMAyJJYmmtuM3
	IJcOvHPWLZjaImJ+vXer4=; b=NZex1JnOVVZM+hQZs5CKwBBzRn8/cxwSSuV7iD
	cAVXXMmJDkSYZqKLy1ARKx+XN4FK2fOUxqyalA7Hma81FovjZUOCoHkPN4t+4iQV
	zypvxCEF1YZFYvtHVhbbJdl9IeOVEsoxj6pQD3iMZFYQokAKoJZOtmpPZpTocYbS
	wKZaNgZNLrCZqWHDYBJG9niVchD12qu1gEuftgQ3+wBiSi/OfW5H7l8K9RF+smK7
	oueYVlk5EuQywEZHKLwD0CGtBwFfEtnmHGDozYZ5hyA5b4wL2wHIkuTU816CaKx7
	CnuxYsV1z3aJHZJQtAloHZPwXSWgVTmQtaE26F3vcTuX7tlg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nmaag5nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 15:58:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517FwYY7014327
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 15:58:34 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 7 Feb 2025 07:58:28 -0800
From: Lei Wei <quic_leiwei@quicinc.com>
Subject: [PATCH net-next v5 0/5] Add PCS support for Qualcomm IPQ9574 SoC
Date: Fri, 7 Feb 2025 23:53:11 +0800
Message-ID: <20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGcspmcC/x3MSwqAMAwA0atI1gba+EOvIlK0Rs2m1lZEEO9uc
 fkWMw9EDsIRuuyBwJdE2V1ClWdgt9GtjDInAymqFKkGxR/G22hq1KUJVqNqSdcF0dRYhpT5wIv
 c/7IHxyc6vk8Y3vcDHuRhSGwAAAA=
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit
	<hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_luoj@quicinc.com>, <quic_leiwei@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <vsmuthu@qti.qualcomm.com>, <john@phrozen.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943908; l=3713;
 i=quic_leiwei@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=o7NPCUuz+LB8O51ZyJvr5ddsy22WVJ+Ql5GYrv/R/Bw=;
 b=kewZVGiKxxaOpV2cZx65JUC76212JgpN+pr5L+LNHx4ed5qnewAYMb9UkOV+pcr5l7z1RDc9D
 5364Qj6LNwpAIMy+r9IkRGYfehNTJ+LuBaGnLl3cQpde/Sz5PGTzVY6
X-Developer-Key: i=quic_leiwei@quicinc.com; a=ed25519;
 pk=uFXBHtxtDjtIrTKpDEZlMLSn1i/sonZepYO8yioKACM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WF6NNe7mu58UzutKiC56N1jr8LTRbndK
X-Proofpoint-GUID: WF6NNe7mu58UzutKiC56N1jr8LTRbndK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_07,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070120

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
Changes in v5:
- Add a comment in "ipq_pcs_enable" to note that the RX clock is not
  disabled as PHYLINK does not unwind the state back.
- Add PCS device compatible string check for the device node in
  "ipq_pcs_get".
- Link to v4: https://lore.kernel.org/r/20250108-ipq_pcs_net-next-v4-0-0de14cd2902b@quicinc.com

Changes in v4:
- Add "COMMON_CLK" to the Kconfig dependency option.
- Optimize to avoid indentation in "ipq_pcs_config_usxgmii".
- Remove the PCS config lock.
- Add the "pcs_inband_caps" method.
- Link to v3: https://lore.kernel.org/r/20241216-ipq_pcs_6-13_rc1-v3-0-3abefda0fc48@quicinc.com

Changes in v3:
- Remove the clk enabled check in "pcs_disable" method.
- Add "pcs_validate" method to validate supported interface mode and
  duplex mode.
- Use regmap_set_bits()/regmap_clear_bits() API where appropriate.
- Collect Reviewed-by tag for dtbindings.
- Link to v2: https://lore.kernel.org/r/20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com

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
 include/linux/pcs/pcs-qcom-ipq9574.h               |  15 +
 7 files changed, 1123 insertions(+)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250207-ipq_pcs_6-14_rc1-09216322b7ce

Best regards,
-- 
Lei Wei <quic_leiwei@quicinc.com>


