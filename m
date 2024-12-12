Return-Path: <linux-arm-msm+bounces-41756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE96D9EE9AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 857D918845EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 15:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA5C213E97;
	Thu, 12 Dec 2024 15:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SM8siF3H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCE82EAE5;
	Thu, 12 Dec 2024 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734015779; cv=none; b=pvEWDmqRjC0qL5fRKKjzwopjsKolVGIkVLvNowpIIcuJXvmE3K48B8K+PYhlTvaCNFhIC6IycAPxbfD3T+jUDEpk+LCaUfsNuLxmRd7/sfUf8m/mBuaWVN1ziYXaDGbgF7m6pYNjrJFfpCORRK3Aun5WohofuSe2frRk7hO7xkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734015779; c=relaxed/simple;
	bh=smM9Z4O/pszreH0kXyUQwKsKOM4BacgJVa5e4lI1Mhk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FblYLhmI3aqqaYM50kLLbAMpKVQoTeUwLFmZ89tGbDj8TYyAm1sId70loxdbBDXF4MwJ36ZKViGcM1SR7jGCjbAv5cRzJm6a8pEwHXfji9+JEaGxl1Q31NmHRBIAt8gfvCOOPNHpu3y1cGIBeV0EFFWKD29Q9xMVZylD9bn3P6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SM8siF3H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC8Em2c032199;
	Thu, 12 Dec 2024 15:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ORQ9hRmxE0fBYT0YRbamiP
	9hAJ/2JrLYjIJ2bySPPqE=; b=SM8siF3HpQxFxhUPhGcoaNJH75Z7dyxL/xzqsW
	gSQX4XFtVhP2k5QvOxdEi8qYxp5NsNMfNkZ2x6g05I1RZKemXMIHBKhF3lP2dUrw
	LKhu7/ozL92L3KCAXDOloBZs8qcQeFzgdacfIJvER4w/yTqnydjLZ4UEiiktF36t
	MFh4mSb4whqhqXNFegeXDo9PpwLjZUJY8yajckcgpxhzxQUYE/3wSHSnFzanjBk9
	73ysOcwFiX02uBBca/QQ+J2dmPybvPY9rKZnJnYe4y2FmO+CdDYAXQ4RWsLyvDpN
	B7zrGpjLDGZPRWJQVhn5BY1Rjq6n0ay91K+u1zrK7twJ7/Lw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfck7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 15:02:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCF2oEL030718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 15:02:50 GMT
Received: from bt-iot-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 07:02:46 -0800
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
Subject: [PATCH v5 0/4] Expand firmware-name property to load specific
Date: Thu, 12 Dec 2024 23:02:28 +0800
Message-ID: <20241212150232.3823088-1-quic_chejiang@quicinc.com>
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
X-Proofpoint-GUID: XCrRC_KZGJLJKR2kDiK8J0vYE-qn-uTp
X-Proofpoint-ORIG-GUID: XCrRC_KZGJLJKR2kDiK8J0vYE-qn-uTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120108

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
v5:
  1. Update the dt-bindings decription.
  2. Extract the have-suffix check code to a helper function.
  3. Merge three generate nvm name functions to a signle function.

v4:
  1. Split nvm and rampatch changes to 2 commits.
  2. Fix the dt_binding_check error.
  3. Change the qca_get_alt_nvm_path return type from int to bool.
  4. Fix the nvm name suffix check error when path has '.'.
  5. Optimize the nvm file name generation function.

v3:
  1. Expand firmware-name property to specify the nvm and rampatch to
  load.
  2. Change the driver to support two items in firmware-name and choose
  the NVM file according to board id if there is no extension in NVM
  file.
  3. Update the dts file to idendify the firmware for QCA6698.
---

Cheng Jiang (4):
  dt-bindings: net: bluetooth: qca: Expand firmware-name property
  Bluetooth: qca: Update firmware-name to support board specific nvm
  Bluetooth: qca: Expand firmware-name to load specific rampatch
  arm64: dts: qcom: sa8775p-ride: Add firmware-name in BT node

 .../net/bluetooth/qualcomm-bluetooth.yaml     |   5 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    |   1 +
 drivers/bluetooth/btqca.c                     | 194 ++++++++++++------
 drivers/bluetooth/btqca.h                     |   5 +-
 drivers/bluetooth/hci_qca.c                   |  22 +-
 5 files changed, 152 insertions(+), 75 deletions(-)


base-commit: 3e42dc9229c5950e84b1ed705f94ed75ed208228
-- 
2.25.1


