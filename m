Return-Path: <linux-arm-msm+bounces-47521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D73DA30573
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33A6F1887241
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 08:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948E01EF084;
	Tue, 11 Feb 2025 08:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f5hdzqRa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F15E1EEA47;
	Tue, 11 Feb 2025 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261686; cv=none; b=Bgr+qJd140p31BMQsfuP/CnrPaOElIcaHnxtFTlsOZjawxWd4A5tRyWPEIULycV0q25FWFnljTDG/0JrX60R81HAZeb/Ud4elK4PV0BeAlfWO6ilUrOLuNTU51xLc0AhH9B3IXv48F/0uYW04h6TYz6V8ojjaSHWlbowi0fpdsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261686; c=relaxed/simple;
	bh=gVs5A2cMsJmHzgU5kt6unGNJnVm5mvYVcVwOD5tJpos=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KigGajnf5iRi8MJt/DDBpTYKNt5kbceCaGHdGfSbVBC0LgmbLuToZmGnB4gFm07IMEcHld639CZ2bY+wIzVzvQqBt+4UiDMHOOkml1yNMUSv/ur6UDFYAov7U0DcudVMUI6QalJxtDgP4OxlcxxWdmekzQ7epJxd2ti6cN1xQIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f5hdzqRa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AJQkKn005019;
	Tue, 11 Feb 2025 08:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPDoceVZfiyyx9CPjD5dV4gmSrSJgt6cZeCyIwdK9Bc=; b=f5hdzqRaPHEflaZU
	zCFugJyt1LgLMCBYknhDjrBhsS8GwxAuTF4yy1ht7zVbB3yFRyArvYTUJgeGD6AU
	bEDj5Cmm0RJN0AyILBeIhVBNhTosnM2haHU1U1fHDtDaVEI90x1CDsjcAvaIpBOy
	ppVYVKAwxIZQTdYU4E6wWJ+QNS32Rn9lbNseUli8WAdKYCR4wpt2Duk49RwKUA6o
	MS0yWvNff4lQSqBbHeRxgdS+A4+EGmJtl/ns5AxRvj0rb255Fg1uP8rt4r0SINIm
	fA0BwJ86LC6WO+SKI+GT7lvyIA7JliWi/Hi9TbNTb2rEsnGa2oG4doWqjJzJv/XU
	PoZd9g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyq062-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 08:14:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B8EeYG014805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 08:14:40 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Feb 2025 00:14:33 -0800
From: Ling Xu <quic_lxu5@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
        <quic_kartsana@quicinc.com>, <kernel@quicinc.com>,
        <quic_lxu5@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@kernel.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 1/2] arm64: dts: qcom: sa8775p: Remove extra entries from the iommus property
Date: Tue, 11 Feb 2025 13:44:14 +0530
Message-ID: <49f463415c8fa2b08fbc2317e31493362056f403.1739260973.git.quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1739260973.git.quic_lxu5@quicinc.com>
References: <cover.1739260973.git.quic_lxu5@quicinc.com>
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
X-Proofpoint-ORIG-GUID: V4U9hCrtQ7UeX-E079VNdQ5z9fX0VbMv
X-Proofpoint-GUID: V4U9hCrtQ7UeX-E079VNdQ5z9fX0VbMv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_03,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 mlxlogscore=767
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110049

There are some items come out to be same value if we do SID & ~MASK.
Remove extra entries from the iommus property for sa8775p to simplify.

Fixes: f7b01bfb4b47 ("arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes")
Cc: stable@kernel.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 240 +++-----------------------
 1 file changed, 24 insertions(+), 216 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9da62d7c4d27..0aa27db21f3d 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4517,15 +4517,7 @@ compute-cb@1 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <1>;
 						iommus = <&apps_smmu 0x2141 0x04a0>,
-							 <&apps_smmu 0x2161 0x04a0>,
-							 <&apps_smmu 0x2181 0x0400>,
-							 <&apps_smmu 0x21c1 0x04a0>,
-							 <&apps_smmu 0x21e1 0x04a0>,
-							 <&apps_smmu 0x2541 0x04a0>,
-							 <&apps_smmu 0x2561 0x04a0>,
-							 <&apps_smmu 0x2581 0x0400>,
-							 <&apps_smmu 0x25c1 0x04a0>,
-							 <&apps_smmu 0x25e1 0x04a0>;
+							 <&apps_smmu 0x2181 0x0400>;
 						dma-coherent;
 					};
 
@@ -4533,15 +4525,7 @@ compute-cb@2 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <2>;
 						iommus = <&apps_smmu 0x2142 0x04a0>,
-							 <&apps_smmu 0x2162 0x04a0>,
-							 <&apps_smmu 0x2182 0x0400>,
-							 <&apps_smmu 0x21c2 0x04a0>,
-							 <&apps_smmu 0x21e2 0x04a0>,
-							 <&apps_smmu 0x2542 0x04a0>,
-							 <&apps_smmu 0x2562 0x04a0>,
-							 <&apps_smmu 0x2582 0x0400>,
-							 <&apps_smmu 0x25c2 0x04a0>,
-							 <&apps_smmu 0x25e2 0x04a0>;
+							 <&apps_smmu 0x2182 0x0400>;
 						dma-coherent;
 					};
 
@@ -4549,15 +4533,7 @@ compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <3>;
 						iommus = <&apps_smmu 0x2143 0x04a0>,
-							 <&apps_smmu 0x2163 0x04a0>,
-							 <&apps_smmu 0x2183 0x0400>,
-							 <&apps_smmu 0x21c3 0x04a0>,
-							 <&apps_smmu 0x21e3 0x04a0>,
-							 <&apps_smmu 0x2543 0x04a0>,
-							 <&apps_smmu 0x2563 0x04a0>,
-							 <&apps_smmu 0x2583 0x0400>,
-							 <&apps_smmu 0x25c3 0x04a0>,
-							 <&apps_smmu 0x25e3 0x04a0>;
+							 <&apps_smmu 0x2183 0x0400>;
 						dma-coherent;
 					};
 
@@ -4565,15 +4541,7 @@ compute-cb@4 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <4>;
 						iommus = <&apps_smmu 0x2144 0x04a0>,
-							 <&apps_smmu 0x2164 0x04a0>,
-							 <&apps_smmu 0x2184 0x0400>,
-							 <&apps_smmu 0x21c4 0x04a0>,
-							 <&apps_smmu 0x21e4 0x04a0>,
-							 <&apps_smmu 0x2544 0x04a0>,
-							 <&apps_smmu 0x2564 0x04a0>,
-							 <&apps_smmu 0x2584 0x0400>,
-							 <&apps_smmu 0x25c4 0x04a0>,
-							 <&apps_smmu 0x25e4 0x04a0>;
+							 <&apps_smmu 0x2184 0x0400>;
 						dma-coherent;
 					};
 
@@ -4581,15 +4549,7 @@ compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <5>;
 						iommus = <&apps_smmu 0x2145 0x04a0>,
-							 <&apps_smmu 0x2165 0x04a0>,
-							 <&apps_smmu 0x2185 0x0400>,
-							 <&apps_smmu 0x21c5 0x04a0>,
-							 <&apps_smmu 0x21e5 0x04a0>,
-							 <&apps_smmu 0x2545 0x04a0>,
-							 <&apps_smmu 0x2565 0x04a0>,
-							 <&apps_smmu 0x2585 0x0400>,
-							 <&apps_smmu 0x25c5 0x04a0>,
-							 <&apps_smmu 0x25e5 0x04a0>;
+							 <&apps_smmu 0x2185 0x0400>;
 						dma-coherent;
 					};
 
@@ -4597,15 +4557,7 @@ compute-cb@6 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <6>;
 						iommus = <&apps_smmu 0x2146 0x04a0>,
-							 <&apps_smmu 0x2166 0x04a0>,
-							 <&apps_smmu 0x2186 0x0400>,
-							 <&apps_smmu 0x21c6 0x04a0>,
-							 <&apps_smmu 0x21e6 0x04a0>,
-							 <&apps_smmu 0x2546 0x04a0>,
-							 <&apps_smmu 0x2566 0x04a0>,
-							 <&apps_smmu 0x2586 0x0400>,
-							 <&apps_smmu 0x25c6 0x04a0>,
-							 <&apps_smmu 0x25e6 0x04a0>;
+							 <&apps_smmu 0x2186 0x0400>;
 						dma-coherent;
 					};
 
@@ -4613,15 +4565,7 @@ compute-cb@7 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <7>;
 						iommus = <&apps_smmu 0x2147 0x04a0>,
-							 <&apps_smmu 0x2167 0x04a0>,
-							 <&apps_smmu 0x2187 0x0400>,
-							 <&apps_smmu 0x21c7 0x04a0>,
-							 <&apps_smmu 0x21e7 0x04a0>,
-							 <&apps_smmu 0x2547 0x04a0>,
-							 <&apps_smmu 0x2567 0x04a0>,
-							 <&apps_smmu 0x2587 0x0400>,
-							 <&apps_smmu 0x25c7 0x04a0>,
-							 <&apps_smmu 0x25e7 0x04a0>;
+							 <&apps_smmu 0x2187 0x0400>;
 						dma-coherent;
 					};
 
@@ -4629,15 +4573,7 @@ compute-cb@8 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <8>;
 						iommus = <&apps_smmu 0x2148 0x04a0>,
-							 <&apps_smmu 0x2168 0x04a0>,
-							 <&apps_smmu 0x2188 0x0400>,
-							 <&apps_smmu 0x21c8 0x04a0>,
-							 <&apps_smmu 0x21e8 0x04a0>,
-							 <&apps_smmu 0x2548 0x04a0>,
-							 <&apps_smmu 0x2568 0x04a0>,
-							 <&apps_smmu 0x2588 0x0400>,
-							 <&apps_smmu 0x25c8 0x04a0>,
-							 <&apps_smmu 0x25e8 0x04a0>;
+							 <&apps_smmu 0x2188 0x0400>;
 						dma-coherent;
 					};
 
@@ -4645,15 +4581,7 @@ compute-cb@9 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <9>;
 						iommus = <&apps_smmu 0x2149 0x04a0>,
-							 <&apps_smmu 0x2169 0x04a0>,
-							 <&apps_smmu 0x2189 0x0400>,
-							 <&apps_smmu 0x21c9 0x04a0>,
-							 <&apps_smmu 0x21e9 0x04a0>,
-							 <&apps_smmu 0x2549 0x04a0>,
-							 <&apps_smmu 0x2569 0x04a0>,
-							 <&apps_smmu 0x2589 0x0400>,
-							 <&apps_smmu 0x25c9 0x04a0>,
-							 <&apps_smmu 0x25e9 0x04a0>;
+							 <&apps_smmu 0x2189 0x0400>;
 						dma-coherent;
 					};
 
@@ -4661,15 +4589,7 @@ compute-cb@10 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <10>;
 						iommus = <&apps_smmu 0x214a 0x04a0>,
-							 <&apps_smmu 0x216a 0x04a0>,
-							 <&apps_smmu 0x218a 0x0400>,
-							 <&apps_smmu 0x21ca 0x04a0>,
-							 <&apps_smmu 0x21ea 0x04a0>,
-							 <&apps_smmu 0x254a 0x04a0>,
-							 <&apps_smmu 0x256a 0x04a0>,
-							 <&apps_smmu 0x258a 0x0400>,
-							 <&apps_smmu 0x25ca 0x04a0>,
-							 <&apps_smmu 0x25ea 0x04a0>;
+							 <&apps_smmu 0x218a 0x0400>;
 						dma-coherent;
 					};
 
@@ -4677,15 +4597,7 @@ compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <11>;
 						iommus = <&apps_smmu 0x214b 0x04a0>,
-							 <&apps_smmu 0x216b 0x04a0>,
-							 <&apps_smmu 0x218b 0x0400>,
-							 <&apps_smmu 0x21cb 0x04a0>,
-							 <&apps_smmu 0x21eb 0x04a0>,
-							 <&apps_smmu 0x254b 0x04a0>,
-							 <&apps_smmu 0x256b 0x04a0>,
-							 <&apps_smmu 0x258b 0x0400>,
-							 <&apps_smmu 0x25cb 0x04a0>,
-							 <&apps_smmu 0x25eb 0x04a0>;
+							 <&apps_smmu 0x218b 0x0400>;
 						dma-coherent;
 					};
 				};
@@ -4745,15 +4657,7 @@ compute-cb@1 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <1>;
 						iommus = <&apps_smmu 0x2941 0x04a0>,
-							 <&apps_smmu 0x2961 0x04a0>,
-							 <&apps_smmu 0x2981 0x0400>,
-							 <&apps_smmu 0x29c1 0x04a0>,
-							 <&apps_smmu 0x29e1 0x04a0>,
-							 <&apps_smmu 0x2d41 0x04a0>,
-							 <&apps_smmu 0x2d61 0x04a0>,
-							 <&apps_smmu 0x2d81 0x0400>,
-							 <&apps_smmu 0x2dc1 0x04a0>,
-							 <&apps_smmu 0x2de1 0x04a0>;
+							 <&apps_smmu 0x2981 0x0400>;
 						dma-coherent;
 					};
 
@@ -4761,15 +4665,7 @@ compute-cb@2 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <2>;
 						iommus = <&apps_smmu 0x2942 0x04a0>,
-							 <&apps_smmu 0x2962 0x04a0>,
-							 <&apps_smmu 0x2982 0x0400>,
-							 <&apps_smmu 0x29c2 0x04a0>,
-							 <&apps_smmu 0x29e2 0x04a0>,
-							 <&apps_smmu 0x2d42 0x04a0>,
-							 <&apps_smmu 0x2d62 0x04a0>,
-							 <&apps_smmu 0x2d82 0x0400>,
-							 <&apps_smmu 0x2dc2 0x04a0>,
-							 <&apps_smmu 0x2de2 0x04a0>;
+							 <&apps_smmu 0x2982 0x0400>;
 						dma-coherent;
 					};
 
@@ -4777,15 +4673,7 @@ compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <3>;
 						iommus = <&apps_smmu 0x2943 0x04a0>,
-							 <&apps_smmu 0x2963 0x04a0>,
-							 <&apps_smmu 0x2983 0x0400>,
-							 <&apps_smmu 0x29c3 0x04a0>,
-							 <&apps_smmu 0x29e3 0x04a0>,
-							 <&apps_smmu 0x2d43 0x04a0>,
-							 <&apps_smmu 0x2d63 0x04a0>,
-							 <&apps_smmu 0x2d83 0x0400>,
-							 <&apps_smmu 0x2dc3 0x04a0>,
-							 <&apps_smmu 0x2de3 0x04a0>;
+							 <&apps_smmu 0x2983 0x0400>;
 						dma-coherent;
 					};
 
@@ -4793,15 +4681,7 @@ compute-cb@4 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <4>;
 						iommus = <&apps_smmu 0x2944 0x04a0>,
-							 <&apps_smmu 0x2964 0x04a0>,
-							 <&apps_smmu 0x2984 0x0400>,
-							 <&apps_smmu 0x29c4 0x04a0>,
-							 <&apps_smmu 0x29e4 0x04a0>,
-							 <&apps_smmu 0x2d44 0x04a0>,
-							 <&apps_smmu 0x2d64 0x04a0>,
-							 <&apps_smmu 0x2d84 0x0400>,
-							 <&apps_smmu 0x2dc4 0x04a0>,
-							 <&apps_smmu 0x2de4 0x04a0>;
+							 <&apps_smmu 0x2984 0x0400>;
 						dma-coherent;
 					};
 
@@ -4809,15 +4689,7 @@ compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <5>;
 						iommus = <&apps_smmu 0x2945 0x04a0>,
-							 <&apps_smmu 0x2965 0x04a0>,
-							 <&apps_smmu 0x2985 0x0400>,
-							 <&apps_smmu 0x29c5 0x04a0>,
-							 <&apps_smmu 0x29e5 0x04a0>,
-							 <&apps_smmu 0x2d45 0x04a0>,
-							 <&apps_smmu 0x2d65 0x04a0>,
-							 <&apps_smmu 0x2d85 0x0400>,
-							 <&apps_smmu 0x2dc5 0x04a0>,
-							 <&apps_smmu 0x2de5 0x04a0>;
+							 <&apps_smmu 0x2985 0x0400>;
 						dma-coherent;
 					};
 
@@ -4825,15 +4697,7 @@ compute-cb@6 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <6>;
 						iommus = <&apps_smmu 0x2946 0x04a0>,
-							 <&apps_smmu 0x2966 0x04a0>,
-							 <&apps_smmu 0x2986 0x0400>,
-							 <&apps_smmu 0x29c6 0x04a0>,
-							 <&apps_smmu 0x29e6 0x04a0>,
-							 <&apps_smmu 0x2d46 0x04a0>,
-							 <&apps_smmu 0x2d66 0x04a0>,
-							 <&apps_smmu 0x2d86 0x0400>,
-							 <&apps_smmu 0x2dc6 0x04a0>,
-							 <&apps_smmu 0x2de6 0x04a0>;
+							 <&apps_smmu 0x2986 0x0400>;
 						dma-coherent;
 					};
 
@@ -4841,15 +4705,7 @@ compute-cb@7 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <7>;
 						iommus = <&apps_smmu 0x2947 0x04a0>,
-							 <&apps_smmu 0x2967 0x04a0>,
-							 <&apps_smmu 0x2987 0x0400>,
-							 <&apps_smmu 0x29c7 0x04a0>,
-							 <&apps_smmu 0x29e7 0x04a0>,
-							 <&apps_smmu 0x2d47 0x04a0>,
-							 <&apps_smmu 0x2d67 0x04a0>,
-							 <&apps_smmu 0x2d87 0x0400>,
-							 <&apps_smmu 0x2dc7 0x04a0>,
-							 <&apps_smmu 0x2de7 0x04a0>;
+							 <&apps_smmu 0x2987 0x0400>;
 						dma-coherent;
 					};
 
@@ -4857,15 +4713,7 @@ compute-cb@8 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <8>;
 						iommus = <&apps_smmu 0x2948 0x04a0>,
-							 <&apps_smmu 0x2968 0x04a0>,
-							 <&apps_smmu 0x2988 0x0400>,
-							 <&apps_smmu 0x29c8 0x04a0>,
-							 <&apps_smmu 0x29e8 0x04a0>,
-							 <&apps_smmu 0x2d48 0x04a0>,
-							 <&apps_smmu 0x2d68 0x04a0>,
-							 <&apps_smmu 0x2d88 0x0400>,
-							 <&apps_smmu 0x2dc8 0x04a0>,
-							 <&apps_smmu 0x2de8 0x04a0>;
+							 <&apps_smmu 0x2988 0x0400>;
 						dma-coherent;
 					};
 
@@ -4873,15 +4721,7 @@ compute-cb@9 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <9>;
 						iommus = <&apps_smmu 0x2949 0x04a0>,
-							 <&apps_smmu 0x2969 0x04a0>,
-							 <&apps_smmu 0x2989 0x0400>,
-							 <&apps_smmu 0x29c9 0x04a0>,
-							 <&apps_smmu 0x29e9 0x04a0>,
-							 <&apps_smmu 0x2d49 0x04a0>,
-							 <&apps_smmu 0x2d69 0x04a0>,
-							 <&apps_smmu 0x2d89 0x0400>,
-							 <&apps_smmu 0x2dc9 0x04a0>,
-							 <&apps_smmu 0x2de9 0x04a0>;
+							 <&apps_smmu 0x2989 0x0400>;
 						dma-coherent;
 					};
 
@@ -4889,15 +4729,7 @@ compute-cb@10 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <10>;
 						iommus = <&apps_smmu 0x294a 0x04a0>,
-							 <&apps_smmu 0x296a 0x04a0>,
-							 <&apps_smmu 0x298a 0x0400>,
-							 <&apps_smmu 0x29ca 0x04a0>,
-							 <&apps_smmu 0x29ea 0x04a0>,
-							 <&apps_smmu 0x2d4a 0x04a0>,
-							 <&apps_smmu 0x2d6a 0x04a0>,
-							 <&apps_smmu 0x2d8a 0x0400>,
-							 <&apps_smmu 0x2dca 0x04a0>,
-							 <&apps_smmu 0x2dea 0x04a0>;
+							 <&apps_smmu 0x298a 0x0400>;
 						dma-coherent;
 					};
 
@@ -4905,15 +4737,7 @@ compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <11>;
 						iommus = <&apps_smmu 0x294b 0x04a0>,
-							 <&apps_smmu 0x296b 0x04a0>,
-							 <&apps_smmu 0x298b 0x0400>,
-							 <&apps_smmu 0x29cb 0x04a0>,
-							 <&apps_smmu 0x29eb 0x04a0>,
-							 <&apps_smmu 0x2d4b 0x04a0>,
-							 <&apps_smmu 0x2d6b 0x04a0>,
-							 <&apps_smmu 0x2d8b 0x0400>,
-							 <&apps_smmu 0x2dcb 0x04a0>,
-							 <&apps_smmu 0x2deb 0x04a0>;
+							 <&apps_smmu 0x298b 0x0400>;
 						dma-coherent;
 					};
 
@@ -4921,15 +4745,7 @@ compute-cb@12 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <12>;
 						iommus = <&apps_smmu 0x294c 0x04a0>,
-							 <&apps_smmu 0x296c 0x04a0>,
-							 <&apps_smmu 0x298c 0x0400>,
-							 <&apps_smmu 0x29cc 0x04a0>,
-							 <&apps_smmu 0x29ec 0x04a0>,
-							 <&apps_smmu 0x2d4c 0x04a0>,
-							 <&apps_smmu 0x2d6c 0x04a0>,
-							 <&apps_smmu 0x2d8c 0x0400>,
-							 <&apps_smmu 0x2dcc 0x04a0>,
-							 <&apps_smmu 0x2dec 0x04a0>;
+							 <&apps_smmu 0x298c 0x0400>;
 						dma-coherent;
 					};
 
@@ -4937,15 +4753,7 @@ compute-cb@13 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <13>;
 						iommus = <&apps_smmu 0x294d 0x04a0>,
-							 <&apps_smmu 0x296d 0x04a0>,
-							 <&apps_smmu 0x298d 0x0400>,
-							 <&apps_smmu 0x29Cd 0x04a0>,
-							 <&apps_smmu 0x29ed 0x04a0>,
-							 <&apps_smmu 0x2d4d 0x04a0>,
-							 <&apps_smmu 0x2d6d 0x04a0>,
-							 <&apps_smmu 0x2d8d 0x0400>,
-							 <&apps_smmu 0x2dcd 0x04a0>,
-							 <&apps_smmu 0x2ded 0x04a0>;
+							 <&apps_smmu 0x298d 0x0400>;
 						dma-coherent;
 					};
 				};
-- 
2.34.1


