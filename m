Return-Path: <linux-arm-msm+bounces-37871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DE89C82CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 06:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79B7DB23D62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 05:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599021E8850;
	Thu, 14 Nov 2024 05:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dxOkWMlI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38B81E7C2D;
	Thu, 14 Nov 2024 05:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731563536; cv=none; b=Vcmt0JIA6NqwF0om0MwgArcEBOEUYVk8yXQzfThN4NMF0KIgPDkg9hDDjthtGq/TPIYDRyeUMTBmiNS/JmxO2cVa7K6IkQOM+/Qia6WuXRkguRoDVePW7Zkxm/CrSYLNa3y3syAn40h6xewO9Fh4z43H3NQgaD0ntNJV6piInEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731563536; c=relaxed/simple;
	bh=alhdeT/8fuc5uzGecDzd+s2OmjbtK3ucHRZlbuBr4NA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bnKRGtNB20ROn6ZrdgNyP/NYPFwIe0mbdz3pVWMzuMR8HywXJKfNomXT/CsrVGRmsvHmfc5nrMKKZJymzoheJycxDTwT6vaY63Kp6dZFw87GWuaarol0caQDP1Paer2PRDddb/kj39ixyWcWGnmZPKPtzKtdZDrGUJ6sm9FbLV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dxOkWMlI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE1KVpn008937;
	Thu, 14 Nov 2024 05:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rOaGqY13CAzmgqX1IsGF+Q
	mih0WUpEFnQPjzrr545+g=; b=dxOkWMlIAmlMJ7O+Wz/HHhO0SFPuviJ1/dDuVT
	jULZz+hGbFc0zL05cpsNMFHxYNH+JLDQRJ7s+dy1CRHlvIuMZvzIIep158bFeTMb
	xoC0EOF06ilrgmGM/H183vFHnDiwbPJvbIiYZaoImTkUl5Pp2Lrdi8lQxUUtRXsK
	e5hLwy2fAF7GpjYN62pyBRbtGAWXeiDwRqo7fnv8GrZaeaxX0TmiJwFHi6SVsMTR
	mY3a8kp1UCYzCj1mWtYULJs1QuvOGoBkcVwbgdRUw0LoXLmwrj85rYzYMLwKwEaT
	qfew4Ii1+33byGKloOxSwyzMVV567KcCK2yRJdXV4rdLi6TA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w7ekghdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 05:52:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE5qAnR028793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 05:52:10 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 13 Nov 2024 21:52:06 -0800
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH v4 0/2] Add Devicetree support for USB controllers on QCS8300
Date: Thu, 14 Nov 2024 11:21:50 +0530
Message-ID: <20241114055152.1562116-1-quic_kriskura@quicinc.com>
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
X-Proofpoint-ORIG-GUID: KcV6r-dYJolL1zCpTZvxSwitBqU8hmTD
X-Proofpoint-GUID: KcV6r-dYJolL1zCpTZvxSwitBqU8hmTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140043

This series aims at enabling USB on QCS8300 which has 2 USB controllers.
The primary controller is SuperSpeed capable and secondary one is
High Speed only capable. Both the High Speed Phys are Femto phys and the
SuperSpeed Phy is a QMP Uni Phy.

Base DT Support has been added for both controllers while only one has
been enabled on Ride Platform. The primary controller has been configured
in device mode. The secondary controller will be enabled in host mode post
addition of SPMI Node which allows control over PMIC Gpios for providing
vbus to connected peripherals.

This series depends on the following series ACKed by upstream maintainers:
Base DT: https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/

Bindings patches posted at:
https://lore.kernel.org/all/20241009195348.2649368-1-quic_kriskura@quicinc.com/

Link to v1:
https://lore.kernel.org/all/20241009195636.2649952-1-quic_kriskura@quicinc.com/

Link to v2:
https://lore.kernel.org/all/20241011074619.796580-1-quic_kriskura@quicinc.com/

Link to v3:
https://lore.kernel.org/all/20241105164946.2357821-1-quic_kriskura@quicinc.com/

Changes in v4:
Moved properties to match dwc3 node on x1e80100.
Added maximum-speed property.

v4 has only been compile tested since only cosmetic changes have been done.

Krishna Kurapati (2):
  arm64: dts: qcom: Add support for usb nodes on QCS8300
  arm64: dts: qcom: Enable USB controllers for QCS8300

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  23 +++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 187 ++++++++++++++++++++++
 2 files changed, 210 insertions(+)

-- 
2.34.1


