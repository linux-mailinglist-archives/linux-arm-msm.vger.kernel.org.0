Return-Path: <linux-arm-msm+bounces-31451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9B8974B76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 09:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A482F1C21A7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 07:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1273B1386B4;
	Wed, 11 Sep 2024 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CFwbdvsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781FA6A33B;
	Wed, 11 Sep 2024 07:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726040073; cv=none; b=MCsAmLD3DSWTr6jMiofKZzo1H6DG/cVz25/ZZZLF/qWQ/07P/qNMETEN2YfcVpDKL+m+CKtyoQY7TGu+S1HBpGRxmGLmQuZhBAOr2uuyk6gGouVwOprC9F9GsXXx2i26b/j/1nPUrNbeBmTUyubqpHJ3HdMFaJkjwH4yOwtUZlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726040073; c=relaxed/simple;
	bh=qi5cuZVx2tkvOG+vFrH0awaGc7fhTABxOZK98kQzM6A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K8ipnxtG1Pzsh19e1o3z6HexxroJ9xcMDUsiriUUR9zieuBIxbxpqgG7qTeKL0nhdafD9JZkvLSH5vJui0lz2iJNV8Elo7axFEzJmyWGYpeaATuldgtzQBa2c79EdZAZyY1TKeN/9aB50d0Q1TWNBAfcmYw9HBVaLaG3PMnVAK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CFwbdvsj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B3PdeD024591;
	Wed, 11 Sep 2024 07:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ClCpj+5KEtAPWfY9xwjfwi
	GYKsvFINd3VZrDvSDePfU=; b=CFwbdvsjugfgA5Pm+11sACQG3TwCsErgRdmYr1
	EkXHYQoB9vbq52ZBV4v58Cos9xkcYl1ozaEwgCAGGWvChl5n/9imAcnbybboHakj
	ciyt/tdq4tHXudpKBs7dYChOU3by6v7hz2ul3xrt1ccuur3mH2h/y5wCEUTFs1N9
	PNv/sWIefLwswyFJn3A3T6YaCE1JgGy+1QGVQX0s9/rHzlj3CLRhNM9RZuIBr4S4
	Beogv4gZponun/8xm5EVYPTjU46jXSYoOLgHLKTlcBp6IV0tM/beYt1vs8/w5usM
	C6niVvMG9jeV/aHM+ZeRzfi9znoRZ/jtjcCxj2gVjx/MyHqw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5rgp4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 07:34:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48B7YQCr025555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 07:34:26 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 00:34:22 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <robh+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <abel.vesa@linaro.org>,
        <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] X1E001DE Snapdragon Devkit for Windows
Date: Wed, 11 Sep 2024 13:03:35 +0530
Message-ID: <20240911073337.90577-1-quic_sibis@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AqwbW2KMd9n-_UI3kp10TuorJ3Zq25tj
X-Proofpoint-ORIG-GUID: AqwbW2KMd9n-_UI3kp10TuorJ3Zq25tj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=809 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409110056

Add initial support for X1E001DE Snapdragon Devkit for Windows. X1E001DE
is the speed binned variant of X1E80100 that supports turbo boost up to
4.3 Ghz. The initial support includes the following:

-DSPs
-Ethernet (RTL8125BG) over the pcie 5 instance.
-NVme
-Wifi
-USB-C ports

Link: https://www.qualcomm.com/news/releases/2024/05/qualcomm-accelerates-development-for-copilot--pcs-with-snapdrago

Sibi Sankar (2):
  dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
  arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  | 813 ++++++++++++++++++
 3 files changed, 820 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts

-- 
2.34.1


