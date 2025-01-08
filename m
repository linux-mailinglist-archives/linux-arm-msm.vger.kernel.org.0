Return-Path: <linux-arm-msm+bounces-44277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 863FCA05106
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71D6A1616F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D94E16D4E6;
	Wed,  8 Jan 2025 02:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mbQQRR6U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7299134AB;
	Wed,  8 Jan 2025 02:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736304666; cv=none; b=GtjVTf0pe2ttgVFXeqkY0X8j4GrOSad1WptFlDVUEGVHszg/OPfkQLWZc3436TNG8hxoYOW2V4qHGG/Dbo2qldRV2dOkvltGknnuLtKDKq9O/tsv9JuLJv1wTi7c0tK85phS5XilazQbCKJdd0Rk0bipzkjYlQzIPjaPFjPDTv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736304666; c=relaxed/simple;
	bh=/GAox1t5XWzfkNhbbnb6O1GJ+Eo/vPuQ3zFtOe29PM0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=inhya9j5FXjE+nzb1WRnTwSC6Yq3eWasNyBmVGLtuew2HWoV04qMifxTwUMxThKYidx206FmLEXQ9aBc874rtcY1BgFNq5PntRmDeel/Srh5gnj83zoRTbvPvAse+sxC8XZsh8rNI4JW2bmISbPjfgLeIJT+rX/Bu3K5J/p5fts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mbQQRR6U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507Gs2eh032265;
	Wed, 8 Jan 2025 02:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=27KVUIrjrERUC74lE4/kb5
	He/Ym2uOcuY+jfp3BovDU=; b=mbQQRR6UpJsKRiU+lem0l8BP8pCJKarqgpapIg
	Bcma0or1R3ushx4xtsXEiYMz6Pxqdvu3eRiFNTCS3DqRClXF/m3Yk1ctvH92rFN6
	CZS9BMiJQXm/1CxdYoeius7MMoHh6oIYIe4giJNZW8fYqjIFQW7+imZITXp4eHfE
	f6WaX9cifdpFiP4hHLeRVC6m5OdF4X1cQkDQt9Vt2Ys/i+oDg0amRBHD+D/v2p+j
	iqJh9fZxxq6y5rY9p1By4Xx9YHfmq8RetSscNo+jzJJiQyfU0y92veVo6QT+WKiu
	p1ACoS9ALePL6mlJdZ4maad+8gfl3ZrU4TIgD43ArJ0wHHjw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44186nh5u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 02:50:44 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5082oht8008324
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 02:50:43 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 18:50:37 -0800
From: Lei Wei <quic_leiwei@quicinc.com>
Subject: [PATCH net-next v4 0/5] Add PCS support for Qualcomm IPQ9574 SoC
Date: Wed, 8 Jan 2025 10:50:23 +0800
Message-ID: <20250108-ipq_pcs_net-next-v4-0-0de14cd2902b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO/nfWcC/zWMQQqAIBAAvyJ7TtBKor4SIbFutRczjRCivydBx
 4GZuSFRZEowiBsiXZx49wXaSgBus19JsisMtaqN0qqTHA4bMFlPp/SUT4mLMzj3utEaoWQh0sL
 5W47wWzA9zwuUkDxfbAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736304637; l=3390;
 i=quic_leiwei@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=/GAox1t5XWzfkNhbbnb6O1GJ+Eo/vPuQ3zFtOe29PM0=;
 b=3pBTStJEjbzQRfgJv0ZH2fOkPVRR/SUmfid2PJaAk/igpHEVfiSctwidvuXVoV+CIx8UTn3Jp
 HnySR7eUP6BBRNtQqUDSy9fOnx/kRl3jaOPQ1SSNTAk4POY27rFzB2P
X-Developer-Key: i=quic_leiwei@quicinc.com; a=ed25519;
 pk=uFXBHtxtDjtIrTKpDEZlMLSn1i/sonZepYO8yioKACM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cjakPdWi-ZVCMMXiCo7oxiw6opbmhB1E
X-Proofpoint-GUID: cjakPdWi-ZVCMMXiCo7oxiw6opbmhB1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080019

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
 drivers/net/pcs/pcs-qcom-ipq9574.c                 | 877 +++++++++++++++++++++
 include/dt-bindings/net/qcom,ipq9574-pcs.h         |  15 +
 include/linux/pcs/pcs-qcom-ipq9574.h               |  15 +
 7 files changed, 1116 insertions(+)
---
base-commit: 3e5908172c05ab1511f2a6719b806d6eda6e1715
change-id: 20250107-ipq_pcs_net-next-cfd5ca91311c

Best regards,
-- 
Lei Wei <quic_leiwei@quicinc.com>


