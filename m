Return-Path: <linux-arm-msm+bounces-39390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DCC9DB404
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 09:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 425FE1667BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 08:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C808E154445;
	Thu, 28 Nov 2024 08:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QYBjO9KO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE7D1534FB;
	Thu, 28 Nov 2024 08:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732783520; cv=none; b=nWncRewHD15Hh9BIxwLYE2qAWlC0tPvv3z30V8Nz4zqvDro9J2fuOOm2hbXhVZpnKGdoTUdqfxQEGH/y7ZkKZbOuMgvJLGCc3uoE2R2XZO+FCf+BRvDNfvWTDjiCysJs2bnM+/9ouXP+LlE1eapggPZmiNirE/ubXHSiUzXh6y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732783520; c=relaxed/simple;
	bh=AU1pfCmZcSh8LSNx9nqdnBDu8UpZ+BHgSHg4XMCTriY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FHaj5dqAAqvSIAZLNbtbVLvqoPRkxpz3eoha2QcV9QQcxX2sj/OtnACCxP94Rv8nGz+Gu96JHQff/N1HS/EdozWRrXFei+Jvar98Cc/OpnHPZ1nuzeOUkW+NCyYsd5571cnsfz1rCwOHAHA18jolefUiFfC1lH2oX7GxKaxmUZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QYBjO9KO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS8TDRq028646;
	Thu, 28 Nov 2024 08:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6G3JrciMGD6+Jpo8QgDSw4fW+gnIkEJYAZsUTOrIx8Q=; b=QYBjO9KO/TMH8j5d
	TruiYHn493/GSy99DgNic/ZkXvTouNwc1kv3AkzvR5f8Ywh+Ueuiuwfw5crDACGc
	6X7Q8cy3B9v4zqUg6G6euiPC2MAwEp8WeDZ2Qnloma/Y1SQqa/XQ+/Cvc+bkBzor
	a5Gx6dMgKcn5f2cxkGhkdhgDNTi7JTwz/aGcYgl/UTV7LuN9kNWOyn2rz9fO2Aks
	1JBCIVlRi9vBRKFth+xadGcfiYZ4g1fU580BskVDklTjnyS8eTVYVehqGPBxlZPt
	GYt6Auz1i7eIqD8Gcb9pxjmkKITOMI+KqLoVe1AgvyIcKgbNOosv4etfEETl00Ox
	SAIPoQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xwsw72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:45:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS8jCFU005018
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:45:12 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 00:45:08 -0800
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Thu, 28 Nov 2024 16:44:44 +0800
Subject: [PATCH v3 2/4] arm64: defconfig: enable clock controller,
 interconnect and pinctrl for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241128-qcs8300_initial_dtsi-v3-2-26aa8a164914@quicinc.com>
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
In-Reply-To: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732783501; l=1484;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=AU1pfCmZcSh8LSNx9nqdnBDu8UpZ+BHgSHg4XMCTriY=;
 b=nm6yA0GNwLoGpH6B55uR59wtjW8UFX+DiehPLZu8uU+1Kp4UooRG4JQl1aM6XNhLKZE5H6Kqf
 L0Q6R2D3brGDVljydhpeePQfb0zpIuyMe4g9CZYjW5ujTBiPY6CmgZ6
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qRRR-fJhoKznD8RZSC5VfWBSnVk00mR-
X-Proofpoint-ORIG-GUID: qRRR-fJhoKznD8RZSC5VfWBSnVk00mR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=666 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411280069

Enable clock controller, interconnect and pinctrl for Qualcomm
QCS8300 platform to boot to UART console.

The serial engine depends on gcc, interconnect and pinctrl. Since
the serial console driver is only available as built-in, so these
configs needs be built-in for the UART device to probe and register
the console.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d13218d0c30f..3d9e48940c96 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -608,6 +608,7 @@ CONFIG_PINCTRL_MSM8996=y
 CONFIG_PINCTRL_MSM8998=y
 CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
+CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
 CONFIG_PINCTRL_SA8775P=y
@@ -1327,6 +1328,7 @@ CONFIG_MSM_MMCC_8998=m
 CONFIG_QCM_GCC_2290=y
 CONFIG_QCM_DISPCC_2290=m
 CONFIG_QCS_GCC_404=y
+CONFIG_QCS_GCC_8300=y
 CONFIG_SC_CAMCC_7280=m
 CONFIG_QDU_GCC_1000=y
 CONFIG_SC_CAMCC_8280XP=m
@@ -1634,6 +1636,7 @@ CONFIG_INTERCONNECT_QCOM_MSM8996=y
 CONFIG_INTERCONNECT_QCOM_OSM_L3=m
 CONFIG_INTERCONNECT_QCOM_QCM2290=y
 CONFIG_INTERCONNECT_QCOM_QCS404=m
+CONFIG_INTERCONNECT_QCOM_QCS8300=y
 CONFIG_INTERCONNECT_QCOM_QDU1000=y
 CONFIG_INTERCONNECT_QCOM_SA8775P=y
 CONFIG_INTERCONNECT_QCOM_SC7180=y

-- 
2.25.1


