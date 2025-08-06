Return-Path: <linux-arm-msm+bounces-67931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F681B1C916
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BA367A194F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 15:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8194C29B233;
	Wed,  6 Aug 2025 15:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UstRywn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAB826E16C;
	Wed,  6 Aug 2025 15:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754495049; cv=none; b=jfS8KC9BLlvcMgUUCVAV9VSpKxGz5tfMk8DAAeJSzgLDu3SOjLEE6ATgGxCg/FqG3gi9lEqjHebYwku9Y8um5igut+dcqLfML8GWNZLfu8hlqJ8xwNoeo7JFyXk1fv17KgrY2gMwePPrC5LpdrOt65rttAiu7KO1AJkTv3Eso60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754495049; c=relaxed/simple;
	bh=Fx/AzB1VdT4A0BYESZ8aS2oZiMkubyjmoWcCxJ+vwBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pByR+Mda0vJf8+YxlzqmUXKLwtby2DMb1HTB/mAPK3HJ828xiEFDzYBJsPJMA7VuMznqTbsHM48mksrYJjMMrB/ZRTznP5p8h61yIGt8u/5m5DMYLk/jB9pLeGEmEHVmUWdbfKuhMCD5Lcz263u5o9KFwOqtvGRtGZyoJaQceEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UstRywn2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576DRJlh010872;
	Wed, 6 Aug 2025 15:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y9V7wO4CcM3
	kmBxThhFmI681e3jv6WhpYKEn1D50iRQ=; b=UstRywn2TWkOtV3N+PX7XBBGf8N
	ovGcU/8Rms4egDZtKrCIpKLKNCT8aCPrJ255OTlsgN4TptULTLSVNKkoclk3pwz6
	eIxQ/Z8JB0wwK9nXa+tQ6buinuvI1QggEcyT2ya9uswiWrqeK3f25g4zyMa6Ktjr
	/glwCF5FZlF4NMns69Nh8//DuNHG0YOlOEyTmkzX1GWpMjLyzt5FKhNwLI59ZDmC
	5ogkdLulQE4dtVTD7a0N6bly3lz3FlOO+eZMRO0Wyx0tF3Eomo/uy/w0TiU3y1qF
	lYqkfBtQnYFQxaUKV43kJ40LbxrnBqnSPVB7FRgYl0MM1ohfYe5TqLI/9/A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy7u981-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 15:43:48 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 576FhiKx022941;
	Wed, 6 Aug 2025 15:43:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 489brkx9un-1;
	Wed, 06 Aug 2025 15:43:45 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 576Fhj0d022952;
	Wed, 6 Aug 2025 15:43:45 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 576Fhieh022948;
	Wed, 06 Aug 2025 15:43:45 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 5BCB4571922; Wed,  6 Aug 2025 21:13:44 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, conor+dt@kernel.org,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V1 2/4] arm64: dts: qcom: sm8750: add max-microamp for UFS PHY and PLL supplies
Date: Wed,  6 Aug 2025 21:13:38 +0530
Message-ID: <20250806154340.20122-3-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Mftsu4/f c=1 sm=1 tr=0 ts=68937834 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=qHNMRFmMqv0oFAATxPMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -PmlNWDDSx1qn18EtVWacmOUKMyWfI8k
X-Proofpoint-GUID: -PmlNWDDSx1qn18EtVWacmOUKMyWfI8k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX15C21FLVXoCq
 B0MhSQc7xLn++zMOwcnmEqWTOSqEqElOZa//ar+BV19i49c7jLjR1dWc1XWz0OydmGibBjYXEpJ
 anR86Udz3cQPUdecMkPCR+0yT6d51s6vjTb0QRR90A5V0P2BpmFZdHnRaIdMajSjKtHGZ1jnLZA
 3n9G1n8Bn80dVHOAdVupbQrTIHSLohA+H5QjQ47ml0CJBayHPZFybGsxiijTKJhcfimH1Kw8rEs
 JrmEfgYSO4NF4sH2b8Kvzl5/ywxQt4aHbkXHO/Mo2j2Pq/J7QQHya+9fJN5lLx9mlClhZf7dei9
 r0qzE3zfGB/Lke2mmvGyXFsQQmu5AG7+Ag8uH2ya00/vduyWLZ1/uzcoBtx32XGmLdYfnZmwdQr
 saUOLbpf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Add `vdda-phy-max-microamp` and `vdda-pll-max-microamp` properties to
the UFS PHY node in the device tree.

These properties define the maximum current (in microamps) expected
from the PHY and PLL regulators. This allows the PHY driver to
configure regulator load accurately and ensure proper regulator
mode based on load requirements.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 75cfbb510be5..2ae5915fe38d 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1032,7 +1032,9 @@ wcd_default: wcd-reset-n-active-state {
 
 &ufs_mem_phy {
 	vdda-phy-supply = <&vreg_l1j_0p91>;
+	vdda-phy-max-microamp = <213000>;
 	vdda-pll-supply = <&vreg_l3g_1p2>;
+	vdda-pll-max-microamp = <18300>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 13c7b9664c89..e9a41d34e2d6 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -1039,7 +1039,9 @@ &uart7 {
 
 &ufs_mem_phy {
 	vdda-phy-supply = <&vreg_l1j_0p91>;
+	vdda-phy-max-microamp = <213000>;
 	vdda-pll-supply = <&vreg_l3g_1p2>;
+	vdda-pll-max-microamp = <18300>;
 
 	status = "okay";
 };
-- 
2.48.1


