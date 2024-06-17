Return-Path: <linux-arm-msm+bounces-22823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F2590A9B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 11:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17E161C23167
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 09:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EDA194089;
	Mon, 17 Jun 2024 09:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bt9cPtLR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45229193094;
	Mon, 17 Jun 2024 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616937; cv=none; b=j/hJ4gLeRYmnQCW3doQh4xIeUZ0KfSaM2pt1Y2loIAbStBVZwvmmWy+f3Lm2z1pYjaYLkIUdMP+2oJFRYpNSpLXMy2NZtf5I1fLotoIl4jaRotpgZ06erMve7/+++Ud8XGjR2Un739TJDe9fJ42NduRMDDIWT4czd+o3ue0vZ70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616937; c=relaxed/simple;
	bh=KPtRsY5JATCPI85WE80r9lc0seUyTRM7rViLe7q49Qc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ghRYinvXyq59lM0o2512f64YyVsH4hD4F5GPgwLGf4wTsctxd3lIHVW0hw0jAFEv2712K2nTvAAWd/BZ9SZ61QqaQ4nYj51DdshbwnaMl6Rp7XCZMaRjMcV/BJNMc8C04filmfZKjtsCxvAvGY9hvXfNJH4olefd1dshgE/HcR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bt9cPtLR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45GNxC9X020406;
	Mon, 17 Jun 2024 09:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U/r+pAuGg8tFEwmoHF2axW
	mzM4MXvul5yjS9Uzk3niw=; b=bt9cPtLRL/2b16OV4dj6a51AFT3PTCLZeYXANT
	BehVLUKK+IIJxsTRRTUSDfcBcy7r9N58ayNNqhKurn6r9N3idZcZWl3TpIcYsnRU
	elVT4ks1c8ZaFYL3WrWi9IAuZGz0i/xG+KkNJQhvXBtr1SEJQSu+twpi06m+VBUG
	sXLiSIZI6RcR8Pza5/WzMu8hbNqiS1fq3pTN7DI4iuwl04qmh4E3hL1WCaWCW7n3
	EqJGK6K7womW2GDSgex56OF+cJ1Md1IqjB1i96kluZoF+2Bv7M0UoTSTAmV/kS3a
	LQ4UhsvGjca7jAHpFhRpNzhTQLncvoJM2g45m0sgBA3n6dHQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys44ju2gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:35:33 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45H9ZWAB013966
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:35:32 GMT
Received: from hu-nainmeht-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Jun 2024 02:35:28 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH v2 0/5] Add MPSS remoteproc support for SDX75
Date: Mon, 17 Jun 2024 15:04:23 +0530
Message-ID: <20240617093428.3616194-1-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qkprO6T9KUvPTbx7w6gMUOVixKYBYWde
X-Proofpoint-ORIG-GUID: qkprO6T9KUvPTbx7w6gMUOVixKYBYWde
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_08,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=742 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406170072

Add modem support to SDX75 using the PAS remoteproc driver.
Also, add qlink_logging memory region and split MPSS DSM
region into 2 separate regions.

These patches were co-authored by Rohit Agarwal while at
Qualcomm.

Changes in v2:
 - Added missing binding for SDX75 to allOf constraints.
 - Updated reserved memory node names to remove underscores.
 - Link to v1: https://lore.kernel.org/all/20240606143858.4026-1-quic_nainmeht@quicinc.com/

Naina Mehta (5):
  dt-bindings: remoteproc: qcom,sm8550-pas: document the SDX75 PAS
  remoteproc: qcom: pas: Add SDX75 remoteproc support
  arm64: dts: qcom: sdx75: add missing qlink_logging reserved memory for
    mpss
  arm64: dts: qcom: sdx75: Add remoteproc node
  arm64: dts: qcom: sdx75-idp: enable MPSS remoteproc node

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |  3 +
 arch/arm64/boot/dts/qcom/sdx75-idp.dts        |  6 ++
 arch/arm64/boot/dts/qcom/sdx75.dtsi           | 64 +++++++++++++++++--
 drivers/remoteproc/qcom_q6v5_pas.c            |  1 +
 4 files changed, 70 insertions(+), 4 deletions(-)

-- 
2.34.1


