Return-Path: <linux-arm-msm+bounces-58626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0E5ABD0E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B48EB1BA15E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D48925EF96;
	Tue, 20 May 2025 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="igmKoFxg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412F425EFB7;
	Tue, 20 May 2025 07:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727297; cv=none; b=vGvhFi5aBXMXLVJF8tJQIte1/gf5E8EMBCBBigDwN51rWtmiR2Ko7wmzp9Je7EE61JpkzjW2nYtIw62J9CvjJm3bPveSXS7sA9kYoaW414L+H2hy5OqG91QZJqHahvgU5pZMTwM283vG0lec9y2XI/R3a8nuWN+ImrrKP2Ti6lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727297; c=relaxed/simple;
	bh=OUTs4UADqQog7yriv18lJK/gwiu58uHL6MEtwAQVepU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YJN1MOyDGHksVA/zRvDd8CqP9vO7j+BBrLkwcBRBvmDPopol9tltdy2cNqzlAJq3rBEvzMsGnZUMS84Wm9ZLEPAnstNUadiMGn1irDKEQINKm8LaCNMexw2YSmWyXkNNFStzxM+YuFo5DdFJmLagedafu4EHMBeMwdU8WNwnStI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=igmKoFxg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JKI2b7007364;
	Tue, 20 May 2025 07:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHuF/bRr4hQqT+ZDEWtnp+Y8cwXryNjBPziNOvSElaQ=; b=igmKoFxgtFYS+kjs
	EcF/MU11I0q5SHYf9kJc8qGHuI6N1AHd7g/WrhX2CP5Szr0uleVyXTOmxDqagsa+
	V22Y2GdzkXwslvbmVoqlgAOJT2rnPok/aHDJpX0W7xJsAKQjI47xATfihJZlo7XH
	p7VINUKW0+lDLRpvl60mkx6wo4GNTFc2cNSS4ZI24zJnehS4P88Enhj61WNCy8Ph
	B3V1zOBeAzbC+SGPHBrGQ8fqlNvCQkryk13bcY3s84mPx/6bUXE6AaeU4nCrhXZQ
	jdxTBKPsPLgUta4mv7HHWQnxR/9qBFtabxsA0Xh/bXgdUeeFDv6mEjxsIzPMoqxq
	49DngQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4pued-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 07:48:10 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54K7m9Un028035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 07:48:09 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 May 2025 00:48:06 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_lxu5@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: sc7280: Add dma-coherent property for fastrpc nodes
Date: Tue, 20 May 2025 13:17:37 +0530
Message-ID: <20250520074737.1883495-4-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250520074737.1883495-1-quic_lxu5@quicinc.com>
References: <20250520074737.1883495-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iCF1vlrzkN4lm6_dUR3NgdZQmkSmbIGD
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682c33ba cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=YsOEayTiMQgu7miS1LcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iCF1vlrzkN4lm6_dUR3NgdZQmkSmbIGD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA2MiBTYWx0ZWRfXz0gjeMWK0BKb
 MSLoRjuWZ9MfK7RG8ycl2KwkFHP+k/2mEA3SlNgYJFU7fXXs+njroPFnZNgeNbP40viuIujjook
 BEE8cowQPy4O3rpVWV8EVvegzhV8JugyKHDvYe+VGLS1UIFCAweywzgnPjdWiYcf8Y6npG5/p3o
 VAhqb2Rcat7fvN4St7QrKKfeNdiV/RClhDcOOQ3Qj4EWFbGoJt6XoRllQ6F6Qc+rftIE9ZuAC21
 /jsa+j+G5Svpnf2shwJxU94BZLwtXG6IMMVLectEo3L9t7lXFJP4JnmHdiIFnUZ4e1QIx1RzBG5
 UgLLODeg7HNdHfb8qWJ2goE/Ng/64bR3HS3yKvS/uwAMsP/lda5wCosA3FlYQvmnKVTf46+EfG6
 kXv1NsBIZ+uIrrsgfJveXQjEfEMAKyRCoOUqHylGUkHHKzhSN6W4jYFBryrtvKN7aMW/btqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=734 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200062

Add dma-cherent property to fastrpc context bank nodes to ensure that
the DMA operations for these nodes are coherent.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 17f244929714..333e4aa64d10 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3881,12 +3881,14 @@ compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <3>;
 						iommus = <&apps_smmu 0x1803 0x0>;
+						dma-coherent;
 					};
 
 					compute-cb@4 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <4>;
 						iommus = <&apps_smmu 0x1804 0x0>;
+						dma-coherent;
 					};
 
 					compute-cb@5 {
@@ -3894,6 +3896,7 @@ compute-cb@5 {
 						reg = <5>;
 						iommus = <&apps_smmu 0x1805 0x0>;
 						qcom,nsessions = <5>;
+						dma-coherent;
 					};
 				};
 			};
@@ -4121,6 +4124,7 @@ compute-cb@1 {
 						reg = <1>;
 						iommus = <&apps_smmu 0x11a1 0x0420>,
 							 <&apps_smmu 0x1181 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@2 {
@@ -4128,6 +4132,7 @@ compute-cb@2 {
 						reg = <2>;
 						iommus = <&apps_smmu 0x11a2 0x0420>,
 							 <&apps_smmu 0x1182 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@3 {
@@ -4135,6 +4140,7 @@ compute-cb@3 {
 						reg = <3>;
 						iommus = <&apps_smmu 0x11a3 0x0420>,
 							 <&apps_smmu 0x1183 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@4 {
@@ -4142,6 +4148,7 @@ compute-cb@4 {
 						reg = <4>;
 						iommus = <&apps_smmu 0x11a4 0x0420>,
 							 <&apps_smmu 0x1184 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@5 {
@@ -4149,6 +4156,7 @@ compute-cb@5 {
 						reg = <5>;
 						iommus = <&apps_smmu 0x11a5 0x0420>,
 							 <&apps_smmu 0x1185 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@6 {
@@ -4156,6 +4164,7 @@ compute-cb@6 {
 						reg = <6>;
 						iommus = <&apps_smmu 0x11a6 0x0420>,
 							 <&apps_smmu 0x1186 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@7 {
@@ -4163,6 +4172,7 @@ compute-cb@7 {
 						reg = <7>;
 						iommus = <&apps_smmu 0x11a7 0x0420>,
 							 <&apps_smmu 0x1187 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@8 {
@@ -4170,6 +4180,7 @@ compute-cb@8 {
 						reg = <8>;
 						iommus = <&apps_smmu 0x11a8 0x0420>,
 							 <&apps_smmu 0x1188 0x0420>;
+						dma-coherent;
 					};
 
 					/* note: secure cb9 in downstream */
@@ -4179,6 +4190,7 @@ compute-cb@11 {
 						reg = <11>;
 						iommus = <&apps_smmu 0x11ab 0x0420>,
 							 <&apps_smmu 0x118b 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@12 {
@@ -4186,6 +4198,7 @@ compute-cb@12 {
 						reg = <12>;
 						iommus = <&apps_smmu 0x11ac 0x0420>,
 							 <&apps_smmu 0x118c 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@13 {
@@ -4193,6 +4206,7 @@ compute-cb@13 {
 						reg = <13>;
 						iommus = <&apps_smmu 0x11ad 0x0420>,
 							 <&apps_smmu 0x118d 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@14 {
@@ -4200,6 +4214,7 @@ compute-cb@14 {
 						reg = <14>;
 						iommus = <&apps_smmu 0x11ae 0x0420>,
 							 <&apps_smmu 0x118e 0x0420>;
+						dma-coherent;
 					};
 				};
 			};
-- 
2.34.1


