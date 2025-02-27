Return-Path: <linux-arm-msm+bounces-49633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DA5A4761B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 07:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 554A73AF5A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 06:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644F3217F48;
	Thu, 27 Feb 2025 06:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LfA3cnA1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1C61E833E;
	Thu, 27 Feb 2025 06:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740639313; cv=none; b=p5V4553tY2+sljKzer8jqZCGqjMVSaSJo1w7t5RrHvFn4NjPWEN11M/IF2iIwGvDE59MdT7ZmbXlQLL9EjLlvuKIlUFbRQHCD/yHLyJVBssObP5zmkSM5ER3ptkncbJJ4pSTl550hYW1CRg+6S+K2AF5XatqRMmroegwKRRGaWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740639313; c=relaxed/simple;
	bh=Rah8554CJPSuI7hwR5a69ntf02EFSwA2o+FpvqCaGvE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CuyB9HDud0MNmZHLys2toF827HVjzqh0iKxgEjY7e4MNSPKN6bOmcdsVXBq3EJ3cFG3T0T593MzIDouBkA4+bBAJy1UtHnvWUVs1lzwYkZFgFRW8OYtvuxsTopgt7Psr5vhYppGVyWsw89aDGKzvKqjeJrUyna41yVEVwUFKfj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LfA3cnA1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QJmFXv000916;
	Thu, 27 Feb 2025 06:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ma23cpCB+sH7jcQve34WZ3
	A6EACzxMqLV01mpm0XXVA=; b=LfA3cnA1gZTAAzprf+0lcQatixN96a5VKLAWfW
	q7UorttdCkjUrbj0tThxrHN6xCewY0gYiLJPc1AiCoBN5ay0v2UNxEyfpLki0cDi
	VxSl5tFTyMW9XCtbQxwspzwDUTOTmTqFut1ahdpsJR4iLk+1Nh64u8wSUPa7oR3i
	kA6IGB8ssxsZRcnIGXJSrZ9yq5adup2xVDQ71TOAI80T2d3OCI5gTzXdOCh+34/W
	aHxHxkzm1c0tYRE5BDhu/JyTl5BzdIHDaNtsAixw5krcDQURrG38BDVsvMugTVDI
	0zjMXKZPIHbTEyLba/2+7XwanZgWYwbm8tNPFsDWaA7HCz3g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451pu9cnwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 06:54:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R6suYG011018
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 06:54:56 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 22:54:52 -0800
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
Subject: [PATCH v2 0/2] Enable WLAN for qcs8300-ride
Date: Thu, 27 Feb 2025 14:54:37 +0800
Message-ID: <20250227065439.1407230-1-quic_stonez@quicinc.com>
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
X-Proofpoint-GUID: 3cO1lSlamPALVcWCCqUuizKA8OKf9azX
X-Proofpoint-ORIG-GUID: 3cO1lSlamPALVcWCCqUuizKA8OKf9azX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_03,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=753 malwarescore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270051

Enable the WLAN subsystem of the qcs8300 ride board. The WCN6855 wireless
chip is attached to PCIe interface 0.

This patch series depends on:
- pmic
https://lore.kernel.org/all/20250108-adds-spmi-pmic-peripherals-for-qcs8300-v3-0-ee94642279ff@quicinc.com/
- pcie
https://lore.kernel.org/all/20241220055239.2744024-1-quic_ziyuzhan@quicinc.com/

Changes in v2:
- Rename the nodes name according to DTS coding style (Konrad & Krzysztof)
- Provide regulator-min/max-microvolt to the regulators (Konrad)

Stone Zhang (2):
  arm64: dts: qcom: qcs8300: add a PCIe port for WLAN
  arm64: dts: qcom: qcs8300-ride: enable WLAN on qcs8300-ride

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 100 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     |   9 ++
 2 files changed, 109 insertions(+)


base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
prerequisite-patch-id: 7777ec69b5f2389a2efdb0bda561b067da72abfb
prerequisite-patch-id: e6140f9abf38172e77875f126da90bde6e1829cb
prerequisite-patch-id: c4e0283b4bce4c4e0566d7783f8ccd7fcaaebd3f
prerequisite-patch-id: 7678941813d86157f57b11c3596089ba86080fd6
prerequisite-patch-id: c87e5f1cb29568c24566e8a960d6c8dd0be5969d
prerequisite-patch-id: f80a486c6e34dfb62f09faf0eb3fae586cda85ec
prerequisite-patch-id: 0e2cb7a4d8779539a58261111deea6bd6b750f6f
prerequisite-patch-id: abc8aa5792945decdcba9d5c1e43072402f5a65f
prerequisite-patch-id: edd904882daa9ed31340710e36905c82c4552c8e
prerequisite-patch-id: e68c6ea627fb6d61af3518720dfb765f6285bb22
prerequisite-patch-id: 564513b0c808e8166d57f0537a9a057fe9cafa77
prerequisite-patch-id: e68c6ea627fb6d61af3518720dfb765f6285bb22
-- 
2.45.2


