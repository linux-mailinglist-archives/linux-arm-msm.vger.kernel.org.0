Return-Path: <linux-arm-msm+bounces-26874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E17DF939E7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 12:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E3101C21FF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 10:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FE114D2B2;
	Tue, 23 Jul 2024 10:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LMqGMQ4v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235F428373;
	Tue, 23 Jul 2024 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721728983; cv=none; b=hlYV9/pHKGO7YJNa6oqV7S2pUXFKPhbydHTSVgSQBS5JAGj0yYaiRdGdEIuqRKk9QYooy+U3oFZA9Faoq4HFCXe2dNBj4Om0xIdZCrj8AeOAB1OAIYsAobmcrW+Gz8QWN0o8SwCdgHL12G9On0TiykbAw+21R0s8j4FfOQRcZCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721728983; c=relaxed/simple;
	bh=lRcMWKwWda4mx79c6ayBLiHecsZ24DRqnx6hfzPE00Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qXp6ALqv8rG6yYCVL7J+fGLyuXogXMopx0ruXNZPCOev+BtfO0yqwJxNO35g7wHHhOfky4Up8XK0p6+aSf/BkutxKcQ5QECSq6Ig1E1xMcZIoUl8wPYSltIAehM42NNDM1JcHk4HVRzsVJD+xGvUlLks92W5v3oZDHzV+xR0iGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LMqGMQ4v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46N0sjZp002791;
	Tue, 23 Jul 2024 10:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l49SgsCisVWHhtF/rEd/lG
	B1G+L3rRPzmZwIM/LaxNc=; b=LMqGMQ4vgBHczyTISRWo53uHv/N/3eQ+Ara+vr
	iRnOLWapdEg60Y4LsbMezwSmi5wAGFbgFEF/FZyKql9kBAGpvP4CWCS8R6p1aGTt
	Gwb6fWwc7hfLN61JISTTHIg2obY1zVGtV9BBOL6Xm4UXlIQIlhXwOm7vYxQOEczb
	hqnKlZoV665Hul6EcMrENP5y2VkJzAmBlvA3JAVBBzO0621N45JKT/X04mAqxQAw
	0c+g8cPQp5266ffKgOExM11He8S0IFKAUqvYkomSwyvnrO/NSxH3Pj8MFuwOIfea
	bhb8L6XRM81JBpPqJZz5FT4Io7ZWPXgyK5n187k3jq6y9MXg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g4jgxc5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 10:02:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46NA2uJs022834
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 10:02:56 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 23 Jul 2024 03:02:52 -0700
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <quic_wcheng@quicinc.com>,
        <quic_kriskura@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v3 0/2] Fix ipq5332 usb interrupt trigger type
Date: Tue, 23 Jul 2024 15:31:49 +0530
Message-ID: <20240723100151.402300-1-quic_varada@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qzOEjsTbGRRs_OK6-zq22_yUZTeDXm5M
X-Proofpoint-GUID: qzOEjsTbGRRs_OK6-zq22_yUZTeDXm5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 mlxscore=1 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=1 bulkscore=0 mlxlogscore=200
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407230074

Trigger type is incorrectly specified as IRQ_TYPE_EDGE_BOTH
instead of IRQ_TYPE_LEVEL_HIGH. This trigger type is not
supported for SPIs and results in probe failure with -EINVAL.

Fix dt_binding_check/dtbs_check errors associated with usb's
interrupts.

v3:
In the previous version, the hunk got mixed up while rebasing.
Update dependency version.

Depends:
[1] https://lore.kernel.org/linux-arm-msm/20240722055539.2594434-1-quic_varada@quicinc.com/

v2:
Depends:
[1] https://lore.kernel.org/linux-arm-msm/20240722055539.2594434-1-quic_varada@quicinc.com/

Varadarajan Narayanan (2):
  dt-bindings: usb: qcom,dwc3: Update ipq5332 interrupt info
  arm64: dts: qcom: ipq5332: Fix interrupt trigger type for usb

 .../devicetree/bindings/usb/qcom,dwc3.yaml        | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi             |  4 ++--
 2 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.34.1


