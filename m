Return-Path: <linux-arm-msm+bounces-41325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 314C29EB474
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17F8C168B70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 15:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EABA1B6539;
	Tue, 10 Dec 2024 15:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J8iHWTWK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E71E1CD15;
	Tue, 10 Dec 2024 15:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733843862; cv=none; b=lkzPvQEenYQ1yUaCuFo2NE7WKY/vf7/Qpf/lvqeMyKTtUkjDylbhj7oZhQBfT6/WofCQu2lgOKyQQLKG5sOf/prk/Q2dQhUefYTeWY+Sz1WIoeqywFztqJaCGXeIGE+5alrozGZXJH7HHRES+Vo97ldNby9aScQcG2Fdk8ilYEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733843862; c=relaxed/simple;
	bh=Wi43FCd/dRAQg29x1UTQvXfGbBTo+bNPgW6UooecDZI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cQt2KSe19A0RCqb0gAWZqBQv4mdrA0fiTtkyutZTXzraX4qqR7WySw5vsWpFGX3Iz2Lhdrd5BV7PqPuHz4LDpheh6b2e6Yc/MtCCw5pUXMnTVDVJFVC7ElxvVIeLQza3PnjkjDsc95PQZXmrIwgQzWG/X14od8V8Z7HqRddg3w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J8iHWTWK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BADtdMF019489;
	Tue, 10 Dec 2024 15:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iW0ylusmUm4idK/1N8NKEi
	Jzigzfo5wNMkGkkJEwHv4=; b=J8iHWTWKUVe3o2nsaXvl4pCzNqGrqARXDlzWzM
	o3rSRPNeLTaaiZIMc1QE2Cam+gtD0kh+3fKYmuyT8paFR0efpbQlfRBks1VvX70H
	duEUkq9hp62sazoT06fi9lA3HWwqfxwNTBQEJarxZ2HBY9vIv6CABfZG6VVqH1dt
	5/K3AryxRV9hSE3ZEwYB1Ub0Fg+xdXeDbvr+CNb8jvgSkcmgKpyJk7S5iWNm+3tG
	PD+PO3AvJDXn+h6iKna7ENq68jwsZU6xZO04XkniEtpVMsx+SpJEqGvWcGdNnUlY
	//0cWPzLDRSdOiMy9dxd1hP1cL+Nf7YxBx+OC6PAFGw3FjVg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e341bjwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:17:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BAFHWo5026060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:17:32 GMT
Received: from bt-iot-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 07:17:27 -0800
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
Subject: [PATCH v4 0/3] Expand firmware-name property to load specific
Date: Tue, 10 Dec 2024 23:16:32 +0800
Message-ID: <20241210151636.2474809-1-quic_chejiang@quicinc.com>
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
X-Proofpoint-GUID: dohx0REGJxgIzHUW94Wd9g18vtbzLHiK
X-Proofpoint-ORIG-GUID: dohx0REGJxgIzHUW94Wd9g18vtbzLHiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100114

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
v4:
  1. Split nvm and rampatch changes to 2 commits
  2. Code fix according to review comments

v3:
  1.Expand firmware-name property to specify the nvm and rampatch to
  load.
  2.Change the driver to support two items in firmware-name and choose
  the NVM file according to board id if there is no extension in NVM
  file.
  3.Update the dts file to idendify the firmware for QCA6698.
---

Cheng Jiang (4):
  dt-bindings: net: bluetooth: qca: Expand firmware-name property
  Bluetooth: qca: Add support in firmware-name to load board specific
    nvm
  Bluetooth: qca: Expand firmware-name to load specific rampatch
  arm64: dts: qcom: sa8775p-ride: Add firmware-name in BT node

 .../net/bluetooth/qualcomm-bluetooth.yaml     |   5 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    |   1 +
 drivers/bluetooth/btqca.c                     | 149 +++++++++++++-----
 drivers/bluetooth/btqca.h                     |   5 +-
 drivers/bluetooth/hci_qca.c                   |  22 ++-
 5 files changed, 133 insertions(+), 49 deletions(-)


base-commit: ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
-- 
2.25.1


