Return-Path: <linux-arm-msm+bounces-20918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DE68D3441
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 12:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A9D41C21282
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 10:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDD5161911;
	Wed, 29 May 2024 10:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="et6riO6T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BAC61FF6;
	Wed, 29 May 2024 10:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716977761; cv=none; b=aeXtSMzXRhMu9IFE6qmB3tXcAzLBd9IhOXDxrlMin9IxY73+wUr0hzJc7fFfCNOY5AF0py9lSGEmJt8WGQ+3MbbwFNrcAEA80jUam2ZTw/ZxIhpdV0iYQ8Z5f2EUT/BmQR+Z7z/+zxmxPJuUWh184h/zbFKAXRNmGuZvQlBFixU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716977761; c=relaxed/simple;
	bh=DBCO5miiLG0Sw+h939rgaQnB/V1gCYuR4RykIuJGxx0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bhZtYfTHBcGcC7mMhGf1YhCWOoQJqTBnFE+v2cNtCzM2ZHvME3kTyUYRBir28ebkx1HyCRpIQ1sPGw45dAymBdicVSt8y3wzIlx4u4IVHH4NFwNmlFqGNZrK/aqkxQs+BpCTzZyl/K/hHh5qT3ghCbI3M/hHoD7fUwstjYHzvB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=et6riO6T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T0RAgv007985;
	Wed, 29 May 2024 10:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eDQtEmdG4Kh9+moM7EV6a+
	KTKjwpx5S6+2BXdufUMJY=; b=et6riO6TMaMGHOwVaiW9hK6beAaRk9YMIT8P4y
	Gju7n2f9pV6rA0gfc0RvSFBQiZrZuIvPu3dktt5WurdSfaB+TKeLur8kY2CKQMIo
	xZBabt9tiJJv3dUVXF4z/AJlj26c2nK0vmNbJkPoSUnA38z1LWK/o67WpOL7Gk3w
	ZydzMRTgxqbZNnxGk9A12C9319+QBDK5+HS01Cu1oIHwp0Ur9MEh/PdnClnhqXxW
	xrVaiS83MTT5tAjO7ymDEHyyX5txRFfOwfyA5ZHEyIH4idUyxKr/YMZBdLBk1FLA
	ramDskKwqm95ZZjQQMootdrSrwn3iuOoEYNDOQw7FNKzRX0g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0prhyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:15:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TAFt5F021484
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:15:55 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 03:15:50 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH 0/3] arm64: qcom: SA8775p: Add llcc support
Date: Wed, 29 May 2024 18:15:31 +0800
Message-ID: <20240529101534.3166507-1-quic_tengfan@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N7ea4IZdXn3U243fRVqAXEjHda_NAdm-
X-Proofpoint-GUID: N7ea4IZdXn3U243fRVqAXEjHda_NAdm-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=807 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290068

The SA8775p platform has LLCC as the system cache controller. It
includes 6 LLCC instances and 1 broadcast interface.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---

Tengfei Fan (3):
  dt-bindings: cache: qcom,llcc: Add SA8775p description
  soc: qcom: llcc: Add llcc configuration support for the SA8775p
    platform
  arm64: dts: qcom: sa8775p: Add llcc support for the SA8775p platform

 .../devicetree/bindings/cache/qcom,llcc.yaml  | 28 +++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 19 ++++++++++
 drivers/soc/qcom/llcc-qcom.c                  | 35 +++++++++++++++++++
 3 files changed, 82 insertions(+)


base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
-- 
2.25.1


