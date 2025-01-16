Return-Path: <linux-arm-msm+bounces-45237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9F7A1365D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 10:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 205943A7D21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 09:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA611DBB03;
	Thu, 16 Jan 2025 09:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VANNYrxX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3341DACA7;
	Thu, 16 Jan 2025 09:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737018818; cv=none; b=fFGXZy9+45+qw1Oknj+gVk+p6jwJn+lknVFi4mt0iZtcQn66zDTRQiAtDPuOJFGYMIIHm1LzHyD80nPBGVZimfa9Q2PFzKj6CDtunpy4P4oR4RE8ButP4f2HDqGkW4ZvQmeN38/YdFYT7qCMiYP+ehs00Z41IcEePdj2qZqM9M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737018818; c=relaxed/simple;
	bh=kzC/b/O1QqgM1SiUyZc+MEhHQcQ9G5e1OKc/GknHAcg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z0AYjIRuOXjqfLzSQ1Ccs5LNVd0ZODTVgHkpRCaKELDJeMmxTWKuRXMABxGp6tDYmKOOKsI3siyWVlkK8xk+F+xTZ58txovyJUXcq7hSr2KMizkcCbpQYy84f2AAQVcMnwXRdwfY+siEFLNHb1lmbuH6XqOaakHG7PgoQ2ZMrnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VANNYrxX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G92c2Z027195;
	Thu, 16 Jan 2025 09:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g9kDW/UNkqq
	s/cQQ+ZBmFRtX6kFtjzj3xDryfLRJYdI=; b=VANNYrxXbL0kGtxg2DhV5Rm30MU
	wIbT+5sUyVSP9bgP/+XhNjYkEluVu7GlagSLUN62Wm5gbHmgdiW7zHU+D/UxTycS
	RpPaFsT2rB6b+9phhFphJRv7XFxnFVmSUOQkl+wlCplASLTFkk9Vd/PVGZTOFG3A
	DbPS9tK4mywiQG7a2275udYU5JlZRlGQ/2u0LGkwRdfbNLWlWHFVdzu9yatxszaq
	/ivo8AyZRxTBAB0q/6JYRyJUmW6QOO7sOH7RXzP5jFxH6jGmxmyMPkfp+wBNQRVV
	T6ldsOOUvvyqDtzRAOSgSDoAEy54zcQMkdo0ChalI5XctaHhrj6jjI9Ur7A==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446y4t814p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 09:13:15 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50G9DDdU022876;
	Thu, 16 Jan 2025 09:13:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 44426qw52j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 09:13:13 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50G9DCWc022870;
	Thu, 16 Jan 2025 09:13:12 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 50G9DCJ9022869
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 09:13:12 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 9201E40BF9; Thu, 16 Jan 2025 17:13:11 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-scsi@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 8/8] ARM: dts: msm: Use Operation Points V2 for UFS on SM8650
Date: Thu, 16 Jan 2025 17:11:49 +0800
Message-Id: <20250116091150.1167739-9-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-GUID: oPrL8zVPxjni7RsM2nHafNjXn7RUWybz
X-Proofpoint-ORIG-GUID: oPrL8zVPxjni7RsM2nHafNjXn7RUWybz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_03,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160067

Use Operation Points V2 for UFS on SM8650 so that multi-level
clock/gear scaling can be possible.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 51 +++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 01ac3769ffa6..5466f1217f64 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2557,18 +2557,11 @@ ufs_mem_hc: ufs@1d84000 {
 				      "tx_lane0_sync_clk",
 				      "rx_lane0_sync_clk",
 				      "rx_lane1_sync_clk";
-			freq-table-hz = <100000000 403000000>,
-					<0 0>,
-					<0 0>,
-					<100000000 403000000>,
-					<100000000 403000000>,
-					<0 0>,
-					<0 0>,
-					<0 0>;
 
 			resets = <&gcc GCC_UFS_PHY_BCR>;
 			reset-names = "rst";
 
+			operating-points-v2 = <&ufs_opp_table>;
 			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
@@ -2590,6 +2583,48 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			#reset-cells = <1>;
 
 			status = "disabled";
+
+			ufs_opp_table: opp-table {
+					   compatible = "operating-points-v2";
+					   // LOW_SVS
+					   opp-100000000 {
+							   opp-hz = /bits/ 64 <100000000>,
+									   /bits/ 64 <0>,
+									   /bits/ 64 <0>,
+									   /bits/ 64 <100000000>,
+									   /bits/ 64 <0>,
+									   /bits/ 64 <0>,
+									   /bits/ 64 <0>,
+									   /bits/ 64 <0>;
+							   required-opps = <&rpmhpd_opp_low_svs>;
+					   };
+
+					   // SVS
+					   opp-201500000 {
+							   opp-hz = /bits/ 64 <201500000>,
+									   /bits/ 64 <0>,
+									   /bits/ 64 <0>,
+									   /bits/ 64 <201500000>,
+									   /bits/ 64 <0>,
+									   /bits/ 64 <0>,
+									   /bits/ 64 <0>,
+									   /bits/ 64 <0>;
+							   required-opps = <&rpmhpd_opp_svs>;
+					   };
+
+					   // NOM/TURBO
+					   opp-403000000 {
+							   opp-hz = /bits/ 64 <403000000>,
+									   /bits/ 64 <0>,
+									   /bits/ 64 <0>,
+									   /bits/ 64 <403000000>,
+									   /bits/ 64 <0>,
+									   /bits/ 64 <0>,
+									   /bits/ 64 <0>,
+									   /bits/ 64 <0>;
+							   required-opps = <&rpmhpd_opp_nom>;
+					   };
+			   };
 		};
 
 		ice: crypto@1d88000 {
-- 
2.34.1


