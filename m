Return-Path: <linux-arm-msm+bounces-67932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC387B1C931
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59C6A188C72A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 15:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C228B29B8C7;
	Wed,  6 Aug 2025 15:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Eg1LCu56"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1225E28A1E7;
	Wed,  6 Aug 2025 15:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754495049; cv=none; b=hCXWhvXpCnb5+eCJ0zpFTKoyLfCZftAfDgIt7bNSIqBZOKtrpFffIFU5EEZQlUFgottEq4TZ1nHqv5DRGEUUsQzs5GWrutsf4294CC00k0chx2vKe4JTcNRml172ryb+yVZeBfGHMyOOwqYVCLSJf/+1ecOLxYET2MoKDGp4nN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754495049; c=relaxed/simple;
	bh=pDy/1qOeOChmM2CV8ZaLiCDdTP7HScPcVGzC73YD5e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uzi1jzVxDLWOA8DxEzZPUpTo/rp+1WJM+MqWG8rRGbiIaPmceTWZxBRqglU7huuc6lic1eYIcNynlLIvjw7KS7O54uPMyhMIRxNKme3AZ9uk68SiYr8dr9k3zdkuNZYD2Ihywl2dcU26vziLAORXgmStgyvCHGpnXBh+bw2fwLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Eg1LCu56; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576AMsZp017483;
	Wed, 6 Aug 2025 15:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IsWfsVTApBM
	Ug9Jimj6VrDClaqRQJrZuUah8ATnJRMQ=; b=Eg1LCu56k+CIqS8VJfboyc5am0l
	smV6jLWzAo30LsMHdkqnRVjjhEh1okYGYSl68Q5sft9TnyeUvVIH1TTGmsp1uYDS
	orkPIeT2pIhFuzNA07FidWKiUMqReUqFtj/uqXD3pe7QMQoxv614hYTaWP83gf6f
	mWGIH1qw8C0xW3x+s4o3rtFV6Azd8gd+jhrUuNJqA0SxgCrXuQ9JuPwuqQLLzAuz
	CVTRNF+gv09hpWV5AmnrWVKOM3ilRoOm8sa8ljAX7OcCE2UTqbBsOnTyKa5EgYPi
	4ZSUhNPzu+/qI1W/ZgPdBEKxlPYUHeIy2tXtNxLprQ6P1+NQmfcCIy3ULXw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c5868uqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 15:43:49 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 576Fhki5022969;
	Wed, 6 Aug 2025 15:43:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 489brkx9ut-1;
	Wed, 06 Aug 2025 15:43:46 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 576FhkZb022964;
	Wed, 6 Aug 2025 15:43:46 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 576FhkOB022963;
	Wed, 06 Aug 2025 15:43:46 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id AE62D571922; Wed,  6 Aug 2025 21:13:45 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, conor+dt@kernel.org,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V1 3/4] arm64: dts: qcom: sm8650: add max-microamp for UFS PHY and PLL supplies
Date: Wed,  6 Aug 2025 21:13:39 +0530
Message-ID: <20250806154340.20122-4-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r3Ml9cxUFq3SHXZfhmPHG0j8Pvb6SCmn
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=68937835 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=b944Eujiixzs7VeoIpIA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: r3Ml9cxUFq3SHXZfhmPHG0j8Pvb6SCmn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX6hREKWPeXzKS
 i26sicA17rer7Lly2/RFWCo9NOeVrYEDV0+nG6nXEQoyRhuP047/d/9yuNtR9yd2UlOTRt3kDxO
 dY75RReyXRgT9dDuhV8PeS1lh+GaDtGzyPiohqVue4I8XVT+IHohG2yQmn8J7PtmeMPsT/k7xMY
 TSeiUCsXgnY3fs6uT4dFbc3j6Hny/zbBYEncsig/k31dODj6dJPUfh0jA714HOXxE72ysX2G+iH
 48ungKB0zvi4hDOD0lKMXKhhlgAYCiWchKoXf799lXBkZFbthDtI7JJ7WorPfqcKPfApHZqeMKS
 ChH3Be+P+U0QdaB07rzO/9+3qHXtubOoGtj8fR8C63eCam01J4hvKX1yQeXK1oFGU/Ad4q5dwTf
 s45hAKv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064

Add `vdda-phy-max-microamp` and `vdda-pll-max-microamp` properties to
the UFS PHY node in the device tree.

These properties define the maximum current (in microamps) expected
from the PHY and PLL regulators. This allows the PHY driver to
configure regulator load accurately and ensure proper regulator mode
based on load requirements.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 2 ++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 3 ++-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 2 ++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index d0912735b54e..356254b11906 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1294,7 +1294,9 @@ &ufs_mem_hc {
 
 &ufs_mem_phy {
 	vdda-phy-supply = <&vreg_l1d_0p88>;
+	vdda-phy-max-microamp = <211000>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
+	vdda-pll-max-microamp = <18300>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 76ef43c10f77..f47f62e0b0d9 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -841,8 +841,9 @@ &ufs_mem_hc {
 
 &ufs_mem_phy {
 	vdda-phy-supply = <&vreg_l1d_0p88>;
+	vdda-phy-max-microamp = <211000>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
-
+	vdda-pll-max-microamp = <18300>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 71033fba21b5..c4359f8033e3 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -1277,7 +1277,9 @@ &ufs_mem_hc {
 
 &ufs_mem_phy {
 	vdda-phy-supply = <&vreg_l1d_0p88>;
+	vdda-phy-max-microamp = <211000>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
+	vdda-pll-max-microamp = <18300>;
 
 	status = "okay";
 };
-- 
2.48.1


