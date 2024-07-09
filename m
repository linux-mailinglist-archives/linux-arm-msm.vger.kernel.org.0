Return-Path: <linux-arm-msm+bounces-25673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FA492BD39
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 464271C23703
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D443E19CCE1;
	Tue,  9 Jul 2024 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W6mR1OKw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBB419B5B2;
	Tue,  9 Jul 2024 14:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720536110; cv=none; b=ZYLdSZba+f+kQu+xTOD3oeI27tpVzJ7U5DrY2QpdMBA9lcmCCaPuY4SPieCRNj0qvGLtG3Zv7AlcQhvtGhOjotKP/ANjk+pY7IyufwvusRrvTk59KuQF43iX/WTqpplvzSU4OPN4HM9krh6Fdh3U7hk0Qbo1VmzFosmoK0yq0BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720536110; c=relaxed/simple;
	bh=1LCFD5IciMzNhTli5yeirP7/jmy/AgNOgL9JODVQrjk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Vq51EZiEGksRqdB0q4Zt1t96bDxc9J3Y3s2k66uOMhZQNx6focBsTPzqkU1z7EOrBxZmaN3QJs9hd/Ejc6wcHR6+IOje29gjXEBAIJtzPSaP4anb7oKcBZBBmAuC+91ikvox3o8jF+czgepmtmTzak8ryUpaTCK3gZK7gHpOlUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W6mR1OKw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469AS6lZ013357;
	Tue, 9 Jul 2024 14:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=29MywFm2ZgrRj8GidMaoeN
	N6mO8gs8U03tvwzyYJS+Y=; b=W6mR1OKwI+MPXXOWl9CwQWjVG3dgA/hw8axUDa
	3ck47bLTCu5KkFtwhi/kjdxE8Ffvetq3LQG8oxu5LEXb8WNHWk84MuLvIq4Eb8Ze
	1oWCwQbrGLE2vWTVRsBQu6lR0B6QoXF3zoBY7qiHf3I7YtPu3AhG77p3gdTnk18j
	AM4yiMbS7QDqou/fXFZfoX6VYP/5yuWhpdpfZ+CbBz/coY7qD4KLmBVC1ty8iZLi
	Hjv2bSxbp45w2q3fN0XtTVjHwWszylEcfRiiMWkgwswxR1tMGScbZwsc2gHUrwn7
	hc8oA46nAl23tymBDlzwwV5f/HPXUpVBZNDnidwVTftiT6Nw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x0t6ybj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:41:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469EffRI005725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:41:41 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:41:35 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Subject: [PATCH v2 0/2] phy: qcpm-qmp-usb: Add QCS9100 USB3 PHY compatible
Date: Tue, 9 Jul 2024 22:41:25 +0800
Message-ID: <20240709-add_qcs9100_qmp_usb3_uni_phy_compatible-v2-0-e83b9fc7b280@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZMjWYC/zXNQQqDMBCF4atI1o1MYiXaVe9RJGgcdaCNMVGpi
 HdvFLr83+J9OwvoCQN7JDvzuFKg0caQt4SZobY9cmpjMwnyDgpKXretnkwoBYCePk4vocn0Ykm
 7YdNm/Lh6puaNHFWDUhW5KBWy+OY8dvS9pFcVe6Awj3674FWc69/IQOZFDqkUSgIUXPBpIaNnt
 H1X2+cZZE0aLVYdx/EDkQpA18MAAAA=
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720536095; l=1696;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=1LCFD5IciMzNhTli5yeirP7/jmy/AgNOgL9JODVQrjk=;
 b=JVUYxQ/z//O0ns5V1iQMg7dH0I1QMw8cgM05jZNM4hasfk3eP7m7EOX9ZFJGPa4u/reb0RqZ8
 /QXQng8+bzQBf7oqC6g59iE3JUd3tfnh7YF6DInuHfHGgvGSt9jqWST
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: px-BwdrQiwP_Kh7DPPgjHEGrLrRT_KRH
X-Proofpoint-ORIG-GUID: px-BwdrQiwP_Kh7DPPgjHEGrLrRT_KRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=616 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090095

Introduce support for the QCS9100 SoC device tree (DTSI) and the
QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
While the QCS9100 platform is still in the early design stage, the
QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
mounts the QCS9100 SoC instead of the SA8775p SoC.

The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
all the compatible strings will be updated from "SA8775p" to "QCS9100".
The QCS9100 device tree patches will be pushed after all the device tree
bindings and device driver patches are reviewed.

The final dtsi will like:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/

The detailed cover letter reference:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
Changes in v2:
  - Split huge patch series into different patch series according to
    subsytems
  - Update patch commit message

prevous disscussion here:
[1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

---
Tengfei Fan (2):
      dt-bindings: phy: qcom,qmp-usb: Add QCS9100 USB3 PHY
      phy: qcpm-qmp-usb: Add support for QCS9100

 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        | 3 +++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c                                | 3 +++
 2 files changed, 6 insertions(+)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-add_qcs9100_qmp_usb3_uni_phy_compatible-e7be2785197e

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


