Return-Path: <linux-arm-msm+bounces-39426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAB79DB724
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD35D281C74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 12:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D2519AD87;
	Thu, 28 Nov 2024 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WJN9xPir"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE572CCC0;
	Thu, 28 Nov 2024 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732795787; cv=none; b=cELQNk8RMHzzj2u4WtWK3ccufUS8f+LzNL1E7A2z/BUKfywG9S/BmXllRcfycruSsL9GP4EIKELsE997SEZbX2eMrhCSqmvB5MejiBITkiEfrG0QEo3cZWiX6HtAnWo/mj7kclNOpMjpx6K6Htjtr0bazD+LvW6HqsVmeEGaLCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732795787; c=relaxed/simple;
	bh=b0luTLPoBpSqxN+PLwjWV65p0DpwB7Ys4oyWz5aWmDY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A3l1a6IiIuO4QCZihhibBH5j39dBfbwLDjEot+CkyiksG5IqKjtxk1of4LVm5ce0YFUlCydK4PkveeTQZ/Bh6uCZao7bItGYpm66ZFNcocl/8bp2lbxMe0+bjelTLp2gxdKFKSPIkxh5EdhrMcUXpgsmMjDUklvCrvLhVdISIec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WJN9xPir; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASASCwD031859;
	Thu, 28 Nov 2024 12:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zmG4//k6hkxlAJasF/1eLa
	iBc4tZmIIRfm+NDXod/tA=; b=WJN9xPirY0qKiawLoAXoUIVGmtj0pjLElCqJ+A
	yGUKPKIyil8X4Z6cHKGrMYPlsQBKcZNSXsLOjhLQlP75HJ1JhrpnlqUC9QJB0R51
	N2n8T1HQUW2IUwOz2KgmGFlzkQozP9E/6L5GzEQ1/GmsezMEyUwdRC0tDu7PgA4u
	1oSYYmFjcjAxwzIDyk+13ksxA1kTgzzXHA+y9gNCoud8fCyHb+kIDDZV+e9hIWYp
	WLwQPBwKfu32udzuIexPFlf10JYlOLyt1dsGJgvyWQ0rrO0bia0aCdylW2NOJyms
	7TSxYp3/CQTARpehIcnPrAsGcgqB5RVNj6c3nFJBoBICd+Fw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xy2hf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 12:09:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ASC9dIg000843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 12:09:39 GMT
Received: from bt-iot-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 04:09:36 -0800
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
        <quic_bt@quicinc.com>
Subject: [PATCH v1 0/3] bluetooth: qca: Add QCA6698 Bluetooth chip
Date: Thu, 28 Nov 2024 20:09:19 +0800
Message-ID: <20241128120922.3518582-1-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QJX53wlCxWuAjYLKSYv9gPZIwaDoc66s
X-Proofpoint-ORIG-GUID: QJX53wlCxWuAjYLKSYv9gPZIwaDoc66s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=995
 mlxscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411280095

QCA6698 chipset shares the same IP core as the WCN6855. However,
it has different RF components and RAM sizes, so new firmware
is needed.

This change allows driver to distinguish it from the WCN6855
and load the specific firmware. As the RF performance of
QCA6698 chip from different foundries may vary. Therefore use
different NVM to configure them based on board ID.

Cheng Jiang (3):
  arm64: dts: qcom: sa8775p-ride: Change the BT node
  dt-bindings: net: Add QCA6698 Bluetooth
  Bluetooth: btqca: Add QCA6698 support

 .../net/bluetooth/qualcomm-bluetooth.yaml     |  2 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    |  2 +-
 drivers/bluetooth/btqca.c                     | 47 ++++++++++++++++++-
 drivers/bluetooth/btqca.h                     |  1 +
 drivers/bluetooth/hci_qca.c                   | 36 +++++++++++++-
 5 files changed, 84 insertions(+), 4 deletions(-)


base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
--
2.25.1


