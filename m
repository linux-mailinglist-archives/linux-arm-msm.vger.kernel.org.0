Return-Path: <linux-arm-msm+bounces-45780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965E2A18EA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C9B3160A5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 09:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D6D211272;
	Wed, 22 Jan 2025 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a5T1LzVK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56925210F56;
	Wed, 22 Jan 2025 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737539257; cv=none; b=Gcf8uE3+mosyLvRPU1RTjjBDqcfc+3EUP0rTVz5usnrtdgGouF5E8iuGUZzW/jSx73i332mywGZYGVxXEgSGGZ2ddt6Fh5MMmSHZ0NGzAhx3bI/SOJp8laf34xAjVzvl9C5w6nxzzGGmWx7UWYPqOwba1+GFEdt441CfRZz2k4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737539257; c=relaxed/simple;
	bh=3n1JXtsmaGp5RYxUqA0OFVNzh7aZIV12iPs/2AlflNU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kPixUAY2AzbZoyVIUMB3eTIz9ZVOZmY9cBmS8Fw/SaTjzwjlE5/9/5qgb5q1rloHOpQC8z6i1Jfs5WlInQqP3YsnlpHGENDFOpKDLe1rAlERK33PaC4ADWvQTYYO6lWfKJvM3muIvtk+61GiJwatLc98r0HS0Zly8Mph4pUJcPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a5T1LzVK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M5htlb005065;
	Wed, 22 Jan 2025 09:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=AdbB3qPcDoTWV0hXfMQiFgh+ZjdL96hxByNl4ip79UI=; b=a5
	T1LzVK5qGLuDWk2m0Q8DA8u5bBGG/xXPqXbFS8QIYReizx8jO7OJLUewtqDkeqoO
	Hhn0ByDmT5NYO2EKN5iGftBDjOv5iaM0tRmsbAVBLJ0Qi4Lbd7pbI669XDh8UY/U
	9cNcWHkSJwqLdoqgkTmXMaQ1OaIgGUUPxlFWFXMIjTgYE7lG1OYQyCcHE0y+WxcW
	x8m1ybDnReEaGahMBFr7omX92htvHmbVU9tPTJDs09EEFEaqbGaMut5wM7u89NcY
	uwJUcId+k5Fop/n2Gt6uN611v5eST1XQjpphVXMKVGAtrwjKIFJYWW3o1pPity0Y
	0CyN4J6QZV95AUMX8VGQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44atsgrjsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 09:47:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50M9lTKj012858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 09:47:29 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 Jan 2025 01:47:23 -0800
From: Sachin Gupta <quic_sachgupt@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_sachgupt@quicinc.com>,
        <quic_sartgarg@quicinc.com>
Subject: [PATCH V3 0/4] mmc: sdhci-msm: Rectify DLL programming sequence for SDCC
Date: Wed, 22 Jan 2025 15:17:03 +0530
Message-ID: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QZRiS5OD_vlCIB_U6_6P1_exncxjn6iV
X-Proofpoint-GUID: QZRiS5OD_vlCIB_U6_6P1_exncxjn6iV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1011 lowpriorityscore=0 impostorscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220071

From: sachgupt <quic_sachgupt@quicinc.com>

With the current DLL sequence stability issues are seen in
HS400 and HS200 mode for data transfers.

Rectify the DLL programming sequence as per latest hardware
programming guide and also incorporate support for HS200 and
HS400 DLL settings using the device tree.

Changes from v2:
1. Addressed Dmitry Baryshkov comments:
   a. Regarding TCXO frequency.
   b. Regarding clock rate.
   c. regarding checkpatch.

Changes from v1:
1. Addressed Tengfei Fan comment, added missing semicolocon
   in sdhci_msm_host structure.

Sachin Gupta (4):
  dt-bindings: mmc: Add dll-hsr-list for HS400 and HS200 modes
  mmc: sdhci-msm: Add core_major, minor to msm_host structure
  mmc: sdhci-msm: Add Device tree parsing logic for DLL settings
  mmc: sdhci-msm: Rectify DLL programming sequence for SDCC

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |   5 +
 drivers/mmc/host/sdhci-msm.c                  | 362 +++++++++++++++++-
 2 files changed, 349 insertions(+), 18 deletions(-)

-- 
2.17.1


