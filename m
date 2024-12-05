Return-Path: <linux-arm-msm+bounces-40474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 313FA9E520D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F55E161682
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3381D461B;
	Thu,  5 Dec 2024 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RbOi1SVT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805C55FEE4;
	Thu,  5 Dec 2024 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733394187; cv=none; b=gxki+FHoeRouRSSBJvdeXruSON7q9begwZDZ6pRMwBsWVVGW9EuXNWcvfkKTz53IPyBRK3rBq4QPev76zZTc+6/CRV92I6LVDMtGXpXH4QQvWVNh89Znca+gLyG3yjMU/ssxQ+KGNwLUazUd3r3bk1YScTFt273AXxM7gr1nPOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733394187; c=relaxed/simple;
	bh=WccIYwDYM9SWBN69RLZEtv6E73AY7u/PTpfwUMY99Fk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FNZkvyCmaLR6l+YgRnWNqsgpx3lRRecxaWVOQNuhZWJ1HZi6voWmNx/5FV+iW0mGlW9jmXnzo6jpsFFhrB5VWgvoOCAMrpoxDmimY40yAgb4fML/zv1DMLkoKDlHY0TNhUAGm6hHuUQIyX/+AdWXhl2F4E1CUSknazJiL+0VJnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RbOi1SVT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B59wlf1031112;
	Thu, 5 Dec 2024 10:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iaxWwGQE6c2BaUOvsTxoIb
	fSwyfIpmZaTYOZ/cpg+mE=; b=RbOi1SVTR/9E4lVXiMI4P/9mkI3erkmAcoboUD
	AbrMahRzC9T5qJKt7VaVcWSSGPlRJL07ypwfEdv3mXWBewa6hmpp3m60qgFlAnvA
	jkK7YBx6UxJ3mZdWnj2EL0tQ5ISiiK7OQDOFPHDehnOEX9uev6+e910fruJ5ozqB
	Z1DkN3IcbOJCKZgOKdfOHjGsexhq4Z4ZZEuQdKvXxlc4sHVTRTTMC400iQ54ieig
	2xvzjfsqJ1wAMr2C2Ru4bbG0oqySzA1W9QvRUUnCReYaxAgi1P5qj2GUgOG+2aZv
	2N2eYbdMP5Yyhz/HC5C6I1NNifdxubPykHg5LfsuV6ybeTyA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba14028a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 10:22:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5AMwp3006133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 10:22:58 GMT
Received: from bt-iot-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 02:22:53 -0800
From: Cheng Jiang <quic_chejiang@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_chejiang@quicinc.com>, <quic_jiaymao@quicinc.com>,
        <quic_shuaz@quicinc.com>, <quic_zijuhu@quicinc.com>,
        <quic_mohamull@quicinc.com>
Subject: [PATCH v3 0/3] Expand firmware-name property to load specific
Date: Thu, 5 Dec 2024 18:22:10 +0800
Message-ID: <20241205102213.1281865-1-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X7oMcMIkN_w0gcz8S5pPo1pOHlpjEeg1
X-Proofpoint-ORIG-GUID: X7oMcMIkN_w0gcz8S5pPo1pOHlpjEeg1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050073

Expand the firmware-name property to specify the names of NVM and
rampatch firmware to load.

This update will support loading specific firmware (nvm and rampatch)
for certain chips, like the QCA6698 Bluetooth chip, which shares the
same IP core as the WCN6855 but has different RF components and RAM
sizes, requiring new firmware files.

Different connectivity boards may be attached to the same platform. For
example, QCA6698-based boards can support either a two-antenna or
three-antenna solution, both of which work on the sa8775p-ride platform.
Due to differences in connectivity boards and variations in RF
performance from different foundries, different NVM configurations are
used based on the board ID.

So In firmware-name, if the NVM file has an extension, the NVM file will
be used. Otherwise, the system will first try the .bNN (board ID) file,
and if that fails, it will fall back to the .bin file.

Possible configurations:
firmware-name = "QCA6698/hpnv21.bin", "QCA6698/hpbtfw21.tlv";
firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
firmware-name = "QCA6698/hpnv21.bin";

---
v3:
  1.Expand firmware-name property to specify the nvm and rampatch to
  load.
  2.Change the driver to support two items in firmware-name and choose
  the NVM file according to board id if there is no extension in NVM
  file.
  3.Update the dts file to idendify the firmware for QCA6698.
---

Cheng Jiang (3):
  dt-bindings: net: bluetooth: qca: Expand firmware-name property
  Bluetooth: qca: Expand firmware-name to load specific nvm and rampatch
  arm64: dts: qcom: sa8775p-ride: Add firmware-name in BT node

 .../net/bluetooth/qualcomm-bluetooth.yaml     |   2 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    |   1 +
 drivers/bluetooth/btqca.c                     | 154 +++++++++++++-----
 drivers/bluetooth/btqca.h                     |   5 +-
 drivers/bluetooth/hci_qca.c                   |  21 ++-
 5 files changed, 137 insertions(+), 46 deletions(-)


base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
-- 
2.25.1


