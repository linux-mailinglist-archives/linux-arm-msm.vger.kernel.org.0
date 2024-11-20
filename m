Return-Path: <linux-arm-msm+bounces-38439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F499D37A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 10:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8C7B1F226D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 09:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C06D1A01B8;
	Wed, 20 Nov 2024 09:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Oqh5b5iJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6164219F48D;
	Wed, 20 Nov 2024 09:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732096508; cv=none; b=Q4a2qmdzBmrn+8NvLj4IkvEG6z9eQkwNz8PLvPebwfbmJhfcM/8hcGpe9VdZGiKLpFutDoIm7gmVkD3q1jMWMFzqeaM8Hwpopb6Gz5SOv+1KGGCbueCkQRBb+XCrocqEuglE+0Q0vTrqdSvs9ZE/KvzJQGdd4ymVsrEAyBtn6J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732096508; c=relaxed/simple;
	bh=rMW8nx/VGQNImI5wWQKUTTyyBSXKCsWcOxQdXVSDAco=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dkeevEqF0oX5pW6T9A62N86ydWaQJEUtMVTEuwcm33KoaarLeutEI2he6vEiUvoUt3LV+EVU1oEaozNk0e9mVStP1LeFjeZSCJFGRzycQHrak+lwuVSTwL5RQiSYCJgIabtOFtSQ5pScXrV9O1BawEFjBizDBYUeYqFpsu68Go0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Oqh5b5iJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9FTDo007981;
	Wed, 20 Nov 2024 09:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GTYyLA5p9qWUSkYxsYPQeY
	6kil5ws7BD6ZDPscuSftY=; b=Oqh5b5iJRjtY3opsu2YUVHUfStNdSTwClBVC/X
	cdlDc+Ea59cGQ5J5se1soMInw2UnfLIPQPphcvDmvOs7+Uy8nyf45MQ2IJ/3czuX
	PaCJnvv2NcviFM/2bPakjzL3WISGrR850U5CSDnW93M7wg2BscU/1l3sESSVogSi
	ELkqnB54iVgjJ0qwt+/9aF3gp+aK3S0hw3Vls8V6bya6+HHPRtMwz9hLsmpv04Lq
	0g9+AnUjdIGgOwRefL9+ukxQUglPqO3jnzSaFw50pTyFUC6zsuYnbOQKvLsgJU2+
	p75qbuKiacRvPklENFwU6Iv7UTJ4L7s/FuROJilBFJCS0aVA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4318uvgqhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 09:55:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AK9t0rW012582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 09:55:00 GMT
Received: from chejiang-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 01:54:56 -0800
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
        Rocky Liao
	<quic_rjliao@quicinc.com>, <quic_zijuhu@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_mohamull@quicinc.com>, <quic_chejiang@quicinc.com>
Subject: [PATCH v1 0/4] Add qcom,product-variant properties in Qualcomm
Date: Wed, 20 Nov 2024 17:54:24 +0800
Message-ID: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ixUL55i9m1-7_eFAoKm1lKfF197ZotIY
X-Proofpoint-GUID: ixUL55i9m1-7_eFAoKm1lKfF197ZotIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200069

Add a new property in qualcom bluetooth dts to identify the product
information, so the driver can load the proper firmware.

Several Qualcomm projects will use the same Bluetooth chip, each
focusing on different features. For instance, consumer projects
prioritize the A2DP SRC feature, while IoT projects focus on the A2DP
SINK feature. Due to the patch size, it is not feasible to include all
features in a single firmware.

Therefore, the 'product-variant' devicetree property is used to provide
product information for the Bluetooth driver to load the appropriate
firmware.

The driver will parse 'product-variant' to load firmware from different
directories. If it's not defined in dts, the default firmware will be
loaded, which is compatible with the existing implementaion.


Cheng Jiang (4):
  dt-bindings: bluetooth: add 'qcom,product-variant'
  dt-bindings: bluetooth: Add qca6698 compatible string
  arm64: dts: qcom: sa8775p-ride: update BT nodes
  Bluetooth: hci_qca: add qcom,product-variant properties

 .../net/bluetooth/qualcomm-bluetooth.yaml     |   8 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    |   3 +-
 drivers/bluetooth/btqca.c                     | 142 ++++++++++++++----
 drivers/bluetooth/btqca.h                     |  11 +-
 drivers/bluetooth/hci_qca.c                   |  73 +++++----
 5 files changed, 174 insertions(+), 63 deletions(-)


base-commit: 6fb2fa9805c501d9ade047fc511961f3273cdcb5
-- 
2.25.1


