Return-Path: <linux-arm-msm+bounces-42342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A01789F31C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 14:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF17A165164
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 13:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACFB205AA2;
	Mon, 16 Dec 2024 13:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SYHNeGjQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C913FD4;
	Mon, 16 Dec 2024 13:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734356553; cv=none; b=I9J5WvmilvwQLWaPE4BZGVCUu9Ydcs4iRNMD6fRxibOWGqNogJhb3nxsC9IhUFy0d5PiU2JJLgtI1mltXgxgdWxykKtcwfIyh8DtvhUiG+2qeKd1hvlvWln2FTk84CPh3N8NA6hMpLEEhO51b1HrbS1M4kudBwq5P2s4l5EWLGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734356553; c=relaxed/simple;
	bh=ZmAVH/AQmUOO7YTSM4ZqrwxapcKH0Q5bnJz8FnBijac=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=VUdyIGURGEx0JPvMKf56rXjQ8ZodT5vrH7Xysm40w1csCsDskAVTqm30+opjyoQZXuYXDkqN7Kk8ePK0ymWL0GyJoa8wiUG6zYS9HjGF9c6nZLS7+hw18EOVAvYPoaWj3K2CTI72Quv7b9Z0guBGKqk+H9EBZ1b6GCi+h4lifTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SYHNeGjQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG6PsFZ006045;
	Mon, 16 Dec 2024 13:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MRrFKf4oONbBWiwXeeEZkV
	FVpaBYlLqkqk/gl6ve1BU=; b=SYHNeGjQPF3ISHiKBaCvCsDNEoE80AlaQM1IHP
	Df8KDcw+UO9dXhuoK0kOSktvHjliVheXJKqa1q0lSKjdthmu9aLMFJzdBHrNGxrW
	YfOtnKP5ywGaUEaLMS6defwG9ax6ApkJbLyqQpWzkCstgrc5ovPg90KhsMNQrydG
	VTEW2OgxolV8LPN4YWosOo0+OZPDzY0rB/a6ZcGPG38NTpQyU2K2ou3jHsc6zNw6
	9X7dYyvJsmiWcf0BHrXKm+4qYXx+VSQus4UN980b5MbPiYjqnZYB1/Wnh9DV/jBR
	Dj/u3OldiGPQnVL60Yh/mW6axrjsph+hh6VeQ0CKe1z9AmsA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jexbh99d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 13:42:12 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGDgBtn012714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 13:42:11 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 05:42:05 -0800
From: Lei Wei <quic_leiwei@quicinc.com>
Subject: [PATCH net-next v3 0/5] Add PCS support for Qualcomm IPQ9574 SoC
Date: Mon, 16 Dec 2024 21:40:22 +0800
Message-ID: <20241216-ipq_pcs_6-13_rc1-v3-0-3abefda0fc48@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMctYGcC/x3MQQqEMAxA0atI1gZMIwpzFZEyxFSzqZ1WRBDvP
 sXlW/x/Q9FsWuDT3JD1tGJ7rOC2Adm+cVW0pRpc53pyxGjp55MUPyCxz0LIFFjYCYd+hJqlrMG
 udzlB1AOjXgfMz/MH3/9cxmwAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734356525; l=3091;
 i=quic_leiwei@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=ZmAVH/AQmUOO7YTSM4ZqrwxapcKH0Q5bnJz8FnBijac=;
 b=dQE4oOt3/UptL+eTiXU/fTGP9mHkhKuoGHJ5cBnhhCyK8ODBnU9Dh8h1oh1vvrnT1ydqsBEnA
 2Lbu9vdMEPGDpFd//4E7VcwYKhewGxHyvASlZHkCpBP7yz2IHnaXDXF
X-Developer-Key: i=quic_leiwei@quicinc.com; a=ed25519;
 pk=uFXBHtxtDjtIrTKpDEZlMLSn1i/sonZepYO8yioKACM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YhpETqjI3GyTnw8dSg2E5-HOFjbDQ7lq
X-Proofpoint-GUID: YhpETqjI3GyTnw8dSg2E5-HOFjbDQ7lq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160116

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
 drivers/net/pcs/pcs-qcom-ipq9574.c                 | 883 +++++++++++++++++++++
 include/dt-bindings/net/qcom,ipq9574-pcs.h         |  15 +
 include/linux/pcs/pcs-qcom-ipq9574.h               |  16 +
 7 files changed, 1123 insertions(+)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241213-ipq_pcs_6-13_rc1-31f3c32c3f47

Best regards,
-- 
Lei Wei <quic_leiwei@quicinc.com>


