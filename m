Return-Path: <linux-arm-msm+bounces-33734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AF099760E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 21:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F29231C20E12
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 19:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D151E1A30;
	Wed,  9 Oct 2024 19:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZYY3V3hP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2DD1E0E15;
	Wed,  9 Oct 2024 19:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728503814; cv=none; b=ptkqg6erdCMcC32cGQhf7DN8s20LH/uqcBjncus/daiz4sefllwGoL1qi4G96p+DFF632Gxe/dnRPZt/UsFQNCW2YQ55L9vSj3rNTATfl12I+HD1SdGEBNgjm8mnNdK4/ao3JIHJ9h3t5GVzsHqtwuTx//Uw4uely38i7dwZGak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728503814; c=relaxed/simple;
	bh=Qg1CYe41YeyX+Jp6CwidmqezJgkFx+NxHzysd5QTVHM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fqOtn05VhP27AMSgYFw82mklVk7mDhSLZgbJbled4SyQjf4ngvMGcXxtBogulv8E6YOFp99GDaYKn2Zh8dynTPmB0crW51uAPJujTTYpUkL7o/jW6inlZce4fJuDhmNvaCjGaJq7390RnVHpCXerRNLPPAj4HigPs5m5DSnlGGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZYY3V3hP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499DLbmD020541;
	Wed, 9 Oct 2024 19:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Eg9HDrJtkmA5t3AxGwFNsl
	O0uAi1kLlcIJIR+Gw4L34=; b=ZYY3V3hPYKEgMB6PVO2Om0C+vajmbeXSu2eogg
	3HTxXwE7oddjScDnf9KvEiMChVsKZtDqrMMY4nIU0hEUgK+9ljNCBvnxXmz2k+PC
	oX6cTO94CG9AYI7ZhL5nWacMyUilVFg2La/2nZv1mQ5bsZXEKELUvA5dRNyZlHrX
	libCMRhbpzE9cC3DdHsYbWlSiuNyMfxQ3ojtEq3v/n9Xg6wuZpeoM+5ZDxQzlwPM
	g6C7FJNgnIjRy+BSy6nzTx3KM/+DLXaHMfIHtma2f2QzFeXuACC8/urpb07oUXpr
	6UN+vyZMAqphVEdCv8ErQ+O7BvdmW8iOXIqv+Q983apaSLVg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425tn118g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 19:56:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 499JuoeF032228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 19:56:50 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 12:56:46 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH 0/2] Add Devicetree support for USB controllers on QCS8300
Date: Thu, 10 Oct 2024 01:26:34 +0530
Message-ID: <20241009195636.2649952-1-quic_kriskura@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ukQ1s6lixFgtkQ05X5S1Bpc1L2zTHsoe
X-Proofpoint-GUID: ukQ1s6lixFgtkQ05X5S1Bpc1L2zTHsoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=943 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090124

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

DTBS Check has been done on the patches.

Krishna Kurapati (2):
  arm64: dts: qcom: Add support for usb nodes on QCS8300
  arm64: dts: qcom: Enable USB controllers for QCS8300

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  23 +++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 165 ++++++++++++++++++++++
 2 files changed, 188 insertions(+)

-- 
2.34.1


