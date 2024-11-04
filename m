Return-Path: <linux-arm-msm+bounces-36882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 634209BAD49
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 08:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3032C1C21009
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 07:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F1319993F;
	Mon,  4 Nov 2024 07:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SE/cgJV3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D801F18C91D;
	Mon,  4 Nov 2024 07:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730705964; cv=none; b=ixDXmTE3ZFopDHhq/6dsaJsBSMQoxybklADo6IAxGCbJmaQTaqXzPSsyPSOLKnFy5r2PeRpOVgm/QRJkFOBvDbydcMZNIrgexFWA2024V5Rn7UOvHIuuTFygPYHhBbbEk/XHDx2/PsXXbZfPsGT3nyF6OAkEAx8h4zGlWJYkvBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730705964; c=relaxed/simple;
	bh=EuciNS5DwxcaQ6if4KZA905IlGyJKinycC+GWe0epZo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qvqScSvjbR7+lg7aZeE6hgVMN48dCEdQZ1+m3IXCyVpFXzmuHfPLHjp17QnxNJ/ALxYnnOH+Ry1sdpssk2bQ0quCb/w0yexSJ8baW4jdYjBIC0OMOiDq+CdAfqkfSmAHzezUE7uZD7QYV6GbSkJfYTGUrXl+x+I2jvpvjjuZojg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SE/cgJV3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A40N8p0014974;
	Mon, 4 Nov 2024 07:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mNUdxXCv7YCalvaIKQLHai
	Pt6a9l564KxuANsNfjvpg=; b=SE/cgJV33ca2KcBkKKWk6wZh0t0gjIZJ9aPuDd
	BDPJLTybSr5JlHCxRezpMg7AgU9taMZy2UpCU/8rauwUCCWxnvpseKU1CkeOAtp+
	orrTteUVeSdBl9oaJemfBhQlyhLQrCpzZLiG3HEZFEbmvPQWPJkRGJeJ3/vmxbHY
	Nlnh/XIJVxc8q6g3yzYA54yaJ2EtmRxfeiAo6I6kx7qw7KfF2lFVSZO02WNUi+Ob
	IVIzt3LqCojmsonFtRyQ9iRv7J3gAfyhB7xBXyt5WT17hZaXedgivXH4K7fupD4N
	8f3iDTWZpl//Kyp+t664Ed2ztXNCeCIfv6Ty7GtKt9FqnA9g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd11udxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 07:39:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A47dIEH027695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 07:39:18 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 3 Nov 2024 23:39:15 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v1 0/3] qcom: ipq5424: Add LLCC/system-cache-controller
Date: Mon, 4 Nov 2024 13:08:37 +0530
Message-ID: <20241104073840.3686674-1-quic_varada@quicinc.com>
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
X-Proofpoint-GUID: etaIk9VRmSiyGaLo5WMzwlSbVgMCvPK3
X-Proofpoint-ORIG-GUID: etaIk9VRmSiyGaLo5WMzwlSbVgMCvPK3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=817
 mlxscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040067

Unlike other Qcom SoCs, IPQ5424 doesn't have multiple instances
of LLCC IP and hence doesn't have a LLCC_BROADCAST register
space, and the LLCC & LLCC_BROADCAST point to the same register
space.

Alter the driver accordingly and add the relevant entries for
enabling LLCC/system-cache-controller on the Qcom IPQ5424 SoC.

Depends On:
https://lore.kernel.org/linux-arm-msm/20241028060506.246606-1-quic_srichara@quicinc.com/

Varadarajan Narayanan (3):
  dt-bindings: cache: qcom,llcc: Add IPQ5424 compatible
  soc: qcom: llcc: Update configuration data for IPQ5424
  arm64: dts: qcom: ipq5424: Add LLCC/system-cache-controller

 .../devicetree/bindings/cache/qcom,llcc.yaml  | 20 ++++++-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         |  7 +++
 drivers/soc/qcom/llcc-qcom.c                  | 60 +++++++++++++++++--
 3 files changed, 81 insertions(+), 6 deletions(-)


base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
prerequisite-patch-id: 1090fe9cee19a52dc8595e2fecef659199828246
prerequisite-patch-id: 491c9f6c32738c4eb4398962c1ae7c625cd43238
prerequisite-patch-id: 1651c75547b539eb46eb4d02630e364f262860bf
prerequisite-patch-id: 7ce54f0af6083e897067a7e5cd9561198f3d4d41
prerequisite-patch-id: 0a04fdee4b5b76cd5b734c666f7c8f5561e3e9d8
prerequisite-patch-id: 084f6dced27c39b600711dde2f797b43393cde73
-- 
2.34.1


