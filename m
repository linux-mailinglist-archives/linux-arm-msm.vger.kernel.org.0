Return-Path: <linux-arm-msm+bounces-21222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7508D5DB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1B3C1F26457
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BF5156869;
	Fri, 31 May 2024 09:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RTpMfSNW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31955156668;
	Fri, 31 May 2024 09:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717146293; cv=none; b=u32QbgE0cfhpJjdSavdreEZjPrM7meOcbyUYYBibr5+vKgsuWZDjQCkxq1NYczkg9UdjHVc+VNM+oZzfGuL/3b5JlCZWkiB1Hm6pXr/iuR+mWXD0+wplwuHP1AkmxnADrRfzvu7+T79DdY7eLOIpRH00sbyFFxCz6sRKH+1bgZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717146293; c=relaxed/simple;
	bh=0dSibXkU6f8Q//sCbH2eQglOEU1J6upIDpbuwvdMICM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U1Dl8Qz/A1Cb2TgVFJ06PWxa7kL24VfcAnLoNbYnsxg7LkBXXMkRRGr4LeFZgoUYLk+JOPDlKIbdq/qyK/ykMU4rxvpThPwtnqSgw3Hnl/b7ARRCk1SZ8nbecud4d5XtjlxLkGEn3NbZhcsXJYndhyW0ohVkLAUikpLBQ1BcBk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RTpMfSNW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V23uh1003481;
	Fri, 31 May 2024 09:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iAyTRXChGwQJX0VqI/cabOvsSm4oDhHvF+DV6/sKhs=; b=RTpMfSNW88tQ8KtE
	ml5zEL0YXoDkUojCxPCuWkPlHSAgrHma6Y3D4i/Pg7wVvrp+agflMZgCoHIq71EI
	+r8QDUeWAr26Jpbz/0VhSuB5egclTuvbH3R1OL1R3M3IB/ZCnwYsGGee+qxR4Nyf
	96eBzKtBsw83BlPosmju2gDa9QBpsQGJgyMCUfeIvbjE4q2hy+Z7RrPkUapT3gpe
	ZEZaqgNaVyRZnicpC0nj9Kn8OgazY+lrvmz5m5qo85l3CrIUFD1vTjuuLgOxQsiJ
	ZHjlmieMa6j9XQ82k0u5kedOgo4FEtNys0TpzA0I1DYsh/uU0CztZChX3GcqHjBc
	lmowIg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yesw5jd5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:04:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V94lTt004400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:04:47 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:04:41 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: sm8550: Remove usb default dr_mode
Date: Fri, 31 May 2024 17:04:22 +0800
Message-ID: <20240531090422.158813-3-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531090422.158813-1-quic_tengfan@quicinc.com>
References: <20240531090422.158813-1-quic_tengfan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 4rIsaSUFc8F-7HVfYi_mp-Gz4k72WyQE
X-Proofpoint-GUID: 4rIsaSUFc8F-7HVfYi_mp-Gz4k72WyQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=547 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310066

OTG is default usb dr_mode, so this property can be removed.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 4 ----
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 4 ----
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 4 ----
 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 4 ----
 4 files changed, 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 411de3451db8..e0dc03a97771 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1253,10 +1253,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3 {
-	dr_mode = "otg";
-};
-
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 84d16227ef80..26dfca0c3e05 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -946,10 +946,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3 {
-	dr_mode = "otg";
-};
-
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index e20c6240f76d..d27820fb5fc0 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -1115,10 +1115,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3 {
-	dr_mode = "otg";
-};
-
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index 6dd5232da9f9..85d487ef80a0 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -737,10 +737,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3 {
-	dr_mode = "otg";
-};
-
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
-- 
2.25.1


