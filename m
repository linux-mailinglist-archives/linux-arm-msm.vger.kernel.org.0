Return-Path: <linux-arm-msm+bounces-57787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CB9AB6248
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 07:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 196547A9767
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 05:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76A61FBEBD;
	Wed, 14 May 2025 05:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fymf30Y+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104B01FAC37;
	Wed, 14 May 2025 05:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200233; cv=none; b=TtKPtT9E3YeKeMgyTy9jVWoR6M/i3oq6pn/fbIKKRdhEoWsCchjQUGG8mCnouk8yvPJ5fwbOaFp0PHcehDxBbR8QWofas3X+j9WerZSW4105iV7asyqvGdMHc9bdrfzrLNQntSryslGwjqSeL+v5YYgeqQ6LQF2vJ8rd6NXXldI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200233; c=relaxed/simple;
	bh=cQFHF5F7P56XN/iCZLl6Pf7jip2JKshjr/SiqU/xVB4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nf0FTA6Or6tyKlhSJbVvwuaooz7osJEs9dacQxR29rMlzvgqXG+cUC6pLjypbQ4Dnbqf7GWcN2FwVYehBdUT8toVD5yBaus50Ve4YN+lAeiNtS+JausvIn50ZXfXk78hhdL8iPmLu39DAlhwO8vbgpsmoDgCLEI2ZnkGPDzNEvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fymf30Y+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E1Rx4Y014839;
	Wed, 14 May 2025 05:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M2PrUTUf7NVyuNkFMxsrUUFds+eG0GDC0ScEBPnMEiU=; b=Fymf30Y+c/6O0Ygh
	ox9MCdOP9WEI/dydV5wsElQ+stM/sFEq+57NzkFFBMOCRy2j53vHkzujMKTt1iJr
	rAMUshktLLdLg8WdG5w05B92rEw7D/yshLUoJzDgn4RCGrsB4+V+jfE1MOjHavPY
	uHNy08Yzaecq1L5a9CMNeGtHDwoSQrz6Qqvb6FeDrL8abV+CuwIWvWeERbAXEPuo
	kiujFtcBTBSJ9HH4oy2OP/52NkEi5h64PdurBor0orT8yK3A1JL/cA0piE06OUxw
	7EGz4wIJioyRuQdUW0BXjdkp/OJ//VEJt00PeNEubpnQfaVkOI0gTr7SyjXdaceU
	jdrTcA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmhew9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 05:23:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54E5NmKV004847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 05:23:48 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 22:23:45 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_lxu5@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sc7280: Add dma-coherent property for fastrpc nodes
Date: Wed, 14 May 2025 10:53:23 +0530
Message-ID: <20250514052323.3881600-4-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514052323.3881600-1-quic_lxu5@quicinc.com>
References: <20250514052323.3881600-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA0NSBTYWx0ZWRfXyrEGWJC746KJ
 wbElJtGClg5UwxaP2sV2fhkDKYP/7KAigm/6A2XSfy7PXFCN/u9nmGYyFinWCiz5fklOX7EI/Yu
 pR9IEW4eiTp+I2Y+M+Wim1e2zH9VHO5FMfEfCA2r0PIqsb+G8t9ix/y/wnKkngn/SQSLuJnvzBl
 pbIHOvN2DRux/gB96u1lVtRIBR/T9iGOvsTyaeDXI23itcI28/HMpQNX+Qa31SLc/hlNL0zaWFk
 pjX3TINc4rSiD8Y+EmJpp/6vvVgZuSp24x0kMmCcwIOO27eZW3oMZ2igIjOtwhgnzKY2ACOBmk8
 1DNK9koPQLbIMY8hFTm8KHSNhfmJBhM0YOoBvG53hnx5/h4MYg215R3dkAdnJcthGjJgHdmt46W
 /ePbqElPQxs8cEH6BXFs2X2xajo/WX1otarrZ9AF+A+negVvoeq4nZanKjqf+jueuzby3sI+
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=682428e4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=YsOEayTiMQgu7miS1LcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JkXYPA0pP8maoZLXMzpdpnKkmuJSWwY6
X-Proofpoint-ORIG-GUID: JkXYPA0pP8maoZLXMzpdpnKkmuJSWwY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=733 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140045

Add dma-cherent property to fastrpc context bank nodes to ensure that
the DMA operations for these nodes are coherent.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8c04f3471554..70ca57f94624 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3880,12 +3880,14 @@ compute-cb@3 {
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
@@ -3893,6 +3895,7 @@ compute-cb@5 {
 						reg = <5>;
 						iommus = <&apps_smmu 0x1805 0x0>;
 						qcom,nsessions = <5>;
+						dma-coherent;
 					};
 				};
 			};
@@ -4120,6 +4123,7 @@ compute-cb@1 {
 						reg = <1>;
 						iommus = <&apps_smmu 0x11a1 0x0420>,
 							 <&apps_smmu 0x1181 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@2 {
@@ -4127,6 +4131,7 @@ compute-cb@2 {
 						reg = <2>;
 						iommus = <&apps_smmu 0x11a2 0x0420>,
 							 <&apps_smmu 0x1182 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@3 {
@@ -4134,6 +4139,7 @@ compute-cb@3 {
 						reg = <3>;
 						iommus = <&apps_smmu 0x11a3 0x0420>,
 							 <&apps_smmu 0x1183 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@4 {
@@ -4141,6 +4147,7 @@ compute-cb@4 {
 						reg = <4>;
 						iommus = <&apps_smmu 0x11a4 0x0420>,
 							 <&apps_smmu 0x1184 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@5 {
@@ -4148,6 +4155,7 @@ compute-cb@5 {
 						reg = <5>;
 						iommus = <&apps_smmu 0x11a5 0x0420>,
 							 <&apps_smmu 0x1185 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@6 {
@@ -4155,6 +4163,7 @@ compute-cb@6 {
 						reg = <6>;
 						iommus = <&apps_smmu 0x11a6 0x0420>,
 							 <&apps_smmu 0x1186 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@7 {
@@ -4162,6 +4171,7 @@ compute-cb@7 {
 						reg = <7>;
 						iommus = <&apps_smmu 0x11a7 0x0420>,
 							 <&apps_smmu 0x1187 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@8 {
@@ -4169,6 +4179,7 @@ compute-cb@8 {
 						reg = <8>;
 						iommus = <&apps_smmu 0x11a8 0x0420>,
 							 <&apps_smmu 0x1188 0x0420>;
+						dma-coherent;
 					};
 
 					/* note: secure cb9 in downstream */
@@ -4178,6 +4189,7 @@ compute-cb@11 {
 						reg = <11>;
 						iommus = <&apps_smmu 0x11ab 0x0420>,
 							 <&apps_smmu 0x118b 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@12 {
@@ -4185,6 +4197,7 @@ compute-cb@12 {
 						reg = <12>;
 						iommus = <&apps_smmu 0x11ac 0x0420>,
 							 <&apps_smmu 0x118c 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@13 {
@@ -4192,6 +4205,7 @@ compute-cb@13 {
 						reg = <13>;
 						iommus = <&apps_smmu 0x11ad 0x0420>,
 							 <&apps_smmu 0x118d 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@14 {
@@ -4199,6 +4213,7 @@ compute-cb@14 {
 						reg = <14>;
 						iommus = <&apps_smmu 0x11ae 0x0420>,
 							 <&apps_smmu 0x118e 0x0420>;
+						dma-coherent;
 					};
 				};
 			};
-- 
2.34.1


