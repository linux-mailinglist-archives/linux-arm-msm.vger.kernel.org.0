Return-Path: <linux-arm-msm+bounces-51695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBEFA66FD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 10:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13AC116ED43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 09:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18AD1BCA0E;
	Tue, 18 Mar 2025 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DOGNZmEj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960161422AB;
	Tue, 18 Mar 2025 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742290453; cv=none; b=owiTUpGcmU64rveise+ZwCmM/1fFNG8x5aAC/x1H5LrXUtZk9uJrjw6nkfjPUJdkn4d3ZgcZbIad0JL493bZHZh6tDi7Sx0C5Us5uPEDY9/pRWNb1sDevol35C/pKFs8gzAd89supjypsFkdcLrHE60tyG4PBHaN5OzYEYrzsfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742290453; c=relaxed/simple;
	bh=1wD3J7esroRluKtnKjXWiItC3L58xph0zOjc+DwQ8Js=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nuGLrhPJjpTK/qF488Q8rx4E7xY+8PY4VfblTnZxhZ6cvywowKul1NIa/xbH73WEmEcSNJ3xLY9Np+qYkXCJKbSgBNXFw+aVv5nMYY7kIixjBF9+R99JbWBJjGD0CTnysLREtfZsbia8lXqUFCYPWaRDVVAnPioY/WXMyFwhLe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DOGNZmEj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I191xX027058;
	Tue, 18 Mar 2025 09:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eEcVtt7Xa6qPl/GlIsYd3T
	j0OVoRYqkyZbk7/1Z7gmk=; b=DOGNZmEjo6hSIONcBbb3nmH0asQG7zEpPsGUlU
	TsmL8ZddMu4c8Ad2hqRqCtXbGuK/t4+uWHZljKLYVrro3alWVIX0DDVPkzVlThc2
	og/EMLX88iB7jboYxF2K23H+inAfvXDcF7+4/r6wpNcAx/7In40Pjdne2reK5Yw+
	Y1tyRrdxDBiFI+OGub0p0lY6+4MaVYHn4l2cuwfPqE/ghxHyb58V0n4Rhto0Qqm/
	DePhfIlBALqaJrrl0TTd0vOtBWYyWJiUopjYzZBfHFpQZIpRZKLHElSiY6WbZuja
	8h4nnGN6MQ4gcQMheNY4Em0wy8IEnqwkUgNOCgVGsG14LbMw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwth8gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 09:34:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52I9Y8At011265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 09:34:08 GMT
Received: from localhost.localdomain (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Mar 2025 02:34:04 -0700
From: Stone Zhang <quic_stonez@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_miaoqing@quicinc.com>,
        <quic_zhichen@quicinc.com>, <quic_yuzha@quicinc.com>,
        Stone Zhang
	<quic_stonez@quicinc.com>
Subject: [PATCH v3 0/2] Enable WLAN for qcs8300-ride
Date: Tue, 18 Mar 2025 17:33:48 +0800
Message-ID: <20250318093350.2682132-1-quic_stonez@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pobyfLMT59GkGunOBwFx9yPEZTLBhogH
X-Proofpoint-ORIG-GUID: pobyfLMT59GkGunOBwFx9yPEZTLBhogH
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67d93e10 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=sDV3JdNYQ8fJcOoojrYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_04,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=783
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180069

Enable the WLAN subsystem of the qcs8300 ride board. The WCN6855 wireless
chip is attached to PCIe interface 0.

This patch series depends on:
- PCIe
https://lore.kernel.org/all/20250310063103.3924525-1-quic_ziyuzhan@quicinc.com/
- PCIe SMMU
https://lore.kernel.org/all/20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com/

Changes in v3:
- Complete the nodes property definitions according to DTS binding requirements (Bjorn)
- Link to v2: https://lore.kernel.org/all/20250227065439.1407230-1-quic_stonez@quicinc.com/

Changes in v2:
- Rename the nodes name according to DTS coding style (Konrad & Krzysztof)
- Provide regulator-min/max-microvolt to the regulators (Konrad)
- Link to v1: https://lore.kernel.org/all/20250210062910.3618336-1-quic_stonez@quicinc.com/

Stone Zhang (2):
  arm64: dts: qcom: qcs8300: add a PCIe port for WLAN
  arm64: dts: qcom: qcs8300-ride: enable WLAN on qcs8300-ride

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 108 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     |   9 ++
 2 files changed, 117 insertions(+)


base-commit: da920b7df701770e006928053672147075587fb2
prerequisite-patch-id: c87e5f1cb29568c24566e8a960d6c8dd0be5969d
prerequisite-patch-id: f80a486c6e34dfb62f09faf0eb3fae586cda85ec
prerequisite-patch-id: 0e2cb7a4d8779539a58261111deea6bd6b750f6f
prerequisite-patch-id: 8b9034fca96bd8edb5c4eca5b88811df7206120c
prerequisite-patch-id: bb6ec99692ade9d7c89f91b5507cc0ee248e43dd
prerequisite-patch-id: 32c051e9f77de6b53a4f4539ce49dde9859002ea
prerequisite-patch-id: ccfa56b7d00a1139fbbdccdc13496bfc98440d5e
-- 
2.34.1


