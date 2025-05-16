Return-Path: <linux-arm-msm+bounces-58201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3556DAB9AC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6404750599C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508FE239E9A;
	Fri, 16 May 2025 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D1yC1bHr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EF823717C;
	Fri, 16 May 2025 11:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747393265; cv=none; b=oQAwB27lXf4Z9X4GsK0LHqjPUJ1UkT8gVdyeAQLX4PNnSB7yfpHA7zuwluWYaAKJJUDuxOgnD36M1npm3tzL5JNSf9pPYsS/X6HUaYVkvOy/LS1hcoxohX7NtMebBBW2QmBuSP8Dp3c1e0nrEkCIlFRBlRSrX4EoLCxSwHaQ9SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747393265; c=relaxed/simple;
	bh=bn19nsHnE86Wi3BZ00fLB8/kXkS5WF+Wj6k4/XH/yG4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ccm+IosC/FcJgg0J09zbahtHQkAZxgUD2R0B+YXKTRY2RBzX/1jT0VEZ89r2ZRenxT7LARmxR9JegEv16b6co2nZibvevk61V0eCIZ/Ex303WPoLGNLuSKXEpp+0pQEFYgQEFCQOYAEfVY3OzJXH+xN+3dXPhJTzJDO3G4ys1+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D1yC1bHr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G447U2007850;
	Fri, 16 May 2025 11:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vM3UHL2nM97msMlAg5oz2QSBYVGbUeNNPFOljXZ65bk=; b=D1yC1bHrGt6F66gx
	qSgiWOY/aP8ZAr3zemyd8jSHaDaXqqNA45VJfFcqb5bTVpSGoX35Qta1G6A4u8vz
	8JxRGI1WBCUayonJJM0g4W8AYfY85wFMbsRYj3WlglrP4u6VR7ahWBkLvH8T56pE
	qYnDFHwMy2vCYsDxpImqS7gWe5LfZlEFrwIiIYiuveLFca1JVq3zZMk3Ws93GxpX
	4ZeV7Mv3wqoZ0z/93jQAzx4QR5U/3oq/Vwr5XaGZpdWLKAeUnYgDjtu0Scjo2XQa
	xJI6OOC995EBjjtCVcrsQA/AADOeqb5aUOuT1U28btSGPEvdW+EJl4aP6mz2w1Ki
	xbntvA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcq1ndy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:00:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54GB0weJ012538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:00:58 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 May 2025 04:00:55 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_lxu5@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sc7280: Add dma-coherent property for fastrpc nodes
Date: Fri, 16 May 2025 16:30:29 +0530
Message-ID: <20250516110029.1637270-4-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
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
X-Proofpoint-GUID: V33IqkdhUlDHmQrw1hxSwG1OcfX_smgm
X-Proofpoint-ORIG-GUID: V33IqkdhUlDHmQrw1hxSwG1OcfX_smgm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwNCBTYWx0ZWRfX/PFuGe5Ylo02
 PNx1tKk7vlv2schXSUDreE6eyVeWWWyWN0DyeRJ1rpRSEUJkFANsiLCxGOqEqHaWhlH4bt2yjrr
 db8yiu97ydWSXfo5H+d+O7QM5s0Feo56BuwEw0Okcko2sTAJfUk+xhFuv8COt+JtADpiOmnAOH5
 D6/R8NuM3A00cBYYFhfJIDmgF32IZ1dznSmyCpHSNBySW33J7pOH/rR53gPXK8lqqn3DZzR8GUq
 UjLL1AkgJ9+L0VU/44Fk63pf7qcPtB5DoQ6NkwYfOw55QxeVVOzMEws7sp9hmlwQD+5oq8/o8ru
 4PllxDfwDn4MZa9HDvX4Wyd6+Aq0aukvNzGdmwCTnz54vBhY0+DCs99fGY3prjm2edfKxQmPUXs
 2hjnuhzgfNmQOIsYyy+bqRA1X0mXlWOJH4kiQW+Arz+Q/aqkP10TCiXNkPwzYXxlNyEljyGa
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=68271aeb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=YsOEayTiMQgu7miS1LcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=733 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160104

Add dma-cherent property to fastrpc context bank nodes to ensure that
the DMA operations for these nodes are coherent.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 86b51cffcd54..b40e114d2ca8 100644
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


