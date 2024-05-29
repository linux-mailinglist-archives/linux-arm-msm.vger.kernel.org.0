Return-Path: <linux-arm-msm+bounces-20911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 401B58D33F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 12:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7BC0286FC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 10:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1AF17B411;
	Wed, 29 May 2024 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ng4H3oLU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CF916ABEB;
	Wed, 29 May 2024 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716977034; cv=none; b=GUvhqdiDAG6cVNHlZwboq+Y7d84A5P93tMbU/vlyqd2zFP2JGChpP/phFD6MgnaraJU9fnqjR/kKzQB1zPPPtf92Ve43eHN9jGz/vVzn5bIbK+XQsQJt5xOMkOD6o0FRvWdxXh8dc5k0nz2ybUcjNDeHzuE5UXuJ5WG5QR51oAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716977034; c=relaxed/simple;
	bh=9Uu+IUu3+j1cf71hDL7oRkI+aBiqPehOEc5iyZSJ0fw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kzn5/vgimfVrun6aO54XSZ+aBQl1QV/HHnuj9g705DukcZcGlxLlv1jym00HlFW3piSMHDTaaAcOjP8R/gj4WvD3R28zbd1LyizcwM0kgU8C83KaE2BPTaF7mHh1fI/i3OqR1ZUi3V0u5xV6PTW6Nl84rM/yOMpUXSsZthcUAbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ng4H3oLU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T7MMTY015702;
	Wed, 29 May 2024 10:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zU1DazRx46nXQCB7+KK25Rk8zO0c62/vDYvVMjZTPOk=; b=ng4H3oLUGEzDxQ2g
	NbQII7vGJNyJVIEWo9rPVYq9NVS6ZuNPDAcyvjvnbNgS1iZsDMJSyvuR5RN2GhS2
	9tqwjVhLkYplduKl/Bz8UNQ20vFM2tbbM8fJckGpO+pg9/k3dT8qgszgDSzIz66/
	ZTe+Faggk1AHEILovkrEFxYbF15b+C6amjO/0IPYsQpsP20CcbSVPTscxiqvOjWx
	IgaBgRBCx5ISSBW0FgDqwnauschi4tDSoPUq6xynHX0UOJbhh29izcttjHIcByMA
	5wInX/9yAyU9bqFFDavaNcxxhuruCo6vgHz3RpK9lc2ilsnb167wiOQjIPA9dpp1
	Qce+Aw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ydyws0a8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:03:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TA3mjK003332
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:03:48 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 03:03:43 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm8550: Move usb-role-switch to SoC dtsi
Date: Wed, 29 May 2024 18:02:55 +0800
Message-ID: <20240529100256.3158447-2-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240529100256.3158447-1-quic_tengfan@quicinc.com>
References: <20240529100256.3158447-1-quic_tengfan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 7L2Bnd4AkxUQ1xTyiSaopmIyw1y4BjZP
X-Proofpoint-GUID: 7L2Bnd4AkxUQ1xTyiSaopmIyw1y4BjZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=586
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290067

The usb-role-switch is SA8775p SoC property, so move it from board dts
to SA8775p SoC dtsi.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 1 -
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 1 -
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 1 -
 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 1 -
 arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 1 +
 5 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 31f52df6b67e..411de3451db8 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1255,7 +1255,6 @@ &usb_1 {
 
 &usb_1_dwc3 {
 	dr_mode = "otg";
-	usb-role-switch;
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 42d4d558b7aa..84d16227ef80 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -948,7 +948,6 @@ &usb_1 {
 
 &usb_1_dwc3 {
 	dr_mode = "otg";
-	usb-role-switch;
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2ed1715000c9..e20c6240f76d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -1117,7 +1117,6 @@ &usb_1 {
 
 &usb_1_dwc3 {
 	dr_mode = "otg";
-	usb-role-switch;
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index 92a88fb05609..6dd5232da9f9 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -739,7 +739,6 @@ &usb_1 {
 
 &usb_1_dwc3 {
 	dr_mode = "otg";
-	usb-role-switch;
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 79311a6bd1ad..8e3ce1152211 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3264,6 +3264,7 @@ usb_1_dwc3: usb@a600000 {
 				snps,has-lpm-erratum;
 				tx-fifo-resize;
 				dma-coherent;
+				usb-role-switch;
 
 				ports {
 					#address-cells = <1>;
-- 
2.25.1


