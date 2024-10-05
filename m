Return-Path: <linux-arm-msm+bounces-33190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3D699196E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 20:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB0201C20EA5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 18:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F74158DC2;
	Sat,  5 Oct 2024 18:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U8i8vOwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AC8481B1;
	Sat,  5 Oct 2024 18:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728152614; cv=none; b=ZPqeQccNBZyynkEyYMYPxxI/Ku3PPnSiZqyA0nas71S1pJl9dlZbrJsnXuTTfCV7IbXCs589efVn0PqlVfwHkMCB9Q62yHb2xZEnc1s+Wq5b1vLlSzv61OwOhHnwYIC6lTbLW3/3ZmCpYiImMaZiEutGxyOoEexdcaAiQrGT5x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728152614; c=relaxed/simple;
	bh=zzYFTmccwOLWalc8eyjCjhP6oHz59Ch+abEQn3yiFiI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JhdUfmTLixpaSbozdkttHNluNYqQsK5vPsHIN+iRPdsFQ7YQ8OS+TRh3zniiLPB4krGJ5i4j0jdlKcGiAW+mJLsULZJRiVmc/XZh5lTWQodZX5eplig3x332AnKV2awMliKRBUa6eUUEXS0+4RUcGSKMIBzkxnoZotGFKsrtyJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U8i8vOwx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 495HRWiq018553;
	Sat, 5 Oct 2024 18:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pOxlFrbcMprITz+AULgT6i
	i9Qd8mc0m+1Zji+JrRV4k=; b=U8i8vOwx5IJ2oAqH+xvwyptrXXLv6iVtgQDFdg
	Dw0v4/zBBofeH0UPaJq3nyev2gYHlyhgsdRJbf+VSo0P0slMgWJsVNi2j07QDSdc
	tE4Pvs4D4mwdJMeqWX29aZusJvwVqCxH3zzuPGHmJOi+dQA8t2k5DlY0N70ciYCT
	WAsThqppMPv70N4mtb+8vPFGcB1/M+4FeEoxPKBaSmFP6wGURft74HIK5NKMXBeE
	atI+UFa4uNBhrzr1rrGh9ep3wL0RlEyO9b3aMnylmcR/2pMFvb61S27dWLRRMeNm
	cRmlU9P8kXzhfLWQOXe48TUpkX2g4t+C0xn40nvNOTT6Bemw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv88wsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Oct 2024 18:23:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 495INHW2031862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 5 Oct 2024 18:23:17 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 5 Oct 2024 11:23:13 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <robh+dt@kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <abel.vesa@linaro.org>,
        <srinivas.kandagatla@linaro.org>, <quic_jjohnson@quicinc.com>
Subject: [PATCH V2 0/2] X1E001DE Snapdragon Devkit for Windows
Date: Sat, 5 Oct 2024 23:52:48 +0530
Message-ID: <20241005182250.788272-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: pr0GoMLr7tn0-gjhuysxT0RqNlUgQK2a
X-Proofpoint-GUID: pr0GoMLr7tn0-gjhuysxT0RqNlUgQK2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410050135

Add initial support for X1E001DE Snapdragon Devkit for Windows. X1E001DE
is the speed binned variant of X1E80100 that supports turbo boost up to
4.3 Ghz. The initial support includes the following:

-DSPs
-Ethernet (RTL8125BG) over the pcie 5 instance.
-NVme
-Wifi
-USB-C ports

V2:
* Fix Ghz -> GHz  [Jeff]
* Pick up Ab tag from Rob.
* Use Vendor in ADSP/CDSP firmware path [Dmitry]
* Fix reserved gpios [Dmitry]
* Only port0 supports DRD update the dt accordingly [Dmitry]

Link: https://www.qualcomm.com/news/releases/2024/05/qualcomm-accelerates-development-for-copilot--pcs-with-snapdrago

Sibi Sankar (2):
  dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
  arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  | 811 ++++++++++++++++++
 3 files changed, 818 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts

-- 
2.34.1


