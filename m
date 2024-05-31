Return-Path: <linux-arm-msm+bounces-21221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A088D5DAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A5241C229CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF41D156225;
	Fri, 31 May 2024 09:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ObU6/gZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFA51420D0;
	Fri, 31 May 2024 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717146291; cv=none; b=C0gHFW7qftLbWw16efuZWCOgoN2Kl3K0N3R3mOnggmfYMg/TXCEKex5fw0FDNLun12ip7z1PArUwrnMGRxntVQRDLeIRp9r2PicRH8wsln5xDMvg5xvwsnF9qWGfijk1pOXn49PUyzJJdgpSQdqk691wIvMJ338k3oog07YjgdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717146291; c=relaxed/simple;
	bh=SG1Ge8lwpPmyDY/rGw7Oa0jGxqkeOumofgU7eCMHg48=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dBSPwBuKplEFHRSQN9bsBdWhTkYn0J7bJB8lmxThbDuaeLx7UXFCubRA+tOlW/NkVlYmtabPeInTejz7LFPfbaaxw++LPF6z/IJ59RV++3Tu/QxxJ31XT/775PJjjKTfgu3xZatS47+BrANmH02A9kMFeiAHl/tWttzyfOtZDfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ObU6/gZv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V8TWD5023460;
	Fri, 31 May 2024 09:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hVCdwUXqXc2wcIi5oayEU7+yYRJGvhvSSqUH3wJufM=; b=ObU6/gZv9H9Nqe3o
	xDManqf2KYvGetw26KptFEMF7+rQvn1zRpz+ySvIYLnln1uUABILf56Zf5j/rnXz
	fJ1/zLVwH1Ls6gb+O29S2DRYAFq02qw5QMysbZ00gMiQIGSlMaBlrQqYx9k5VvDv
	pzcVYtd7UbS9WBx62kKJNSsHpYxMut3oOby3Ha6I28l8bl5c0WalQqeAgpd4AX6C
	cBwu8GyUoOCzi+NrXt1yc137xoXkIh3d3b6gfpHWGsMX/QlpZnW6GkfFNMcl4/hZ
	ExMBgH2Amwbi/i0TMhRaHddhbb2b8asVcJjjTqQU8BCkpDeIQrAR1O2ZyYPaL4Gh
	cj1QjQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0gekkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:04:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V94i0C007944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:04:44 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:04:38 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH v3 1/2] arm64: dts: qcom: sm8550: Move usb-role-switch to SoC dtsi
Date: Fri, 31 May 2024 17:04:21 +0800
Message-ID: <20240531090422.158813-2-quic_tengfan@quicinc.com>
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
X-Proofpoint-GUID: OYcURXNWOZSdNCBJbZ2d2LQLh1D4Uwz4
X-Proofpoint-ORIG-GUID: OYcURXNWOZSdNCBJbZ2d2LQLh1D4Uwz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=586 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310066

The usb-role-switch is SM8550 SoC property, so move it from board dts
to SM8550 SoC dtsi.

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
index 9564963fbabf..db67e722e9cd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3279,6 +3279,7 @@ usb_1_dwc3: usb@a600000 {
 				snps,has-lpm-erratum;
 				tx-fifo-resize;
 				dma-coherent;
+				usb-role-switch;
 
 				ports {
 					#address-cells = <1>;
-- 
2.25.1


