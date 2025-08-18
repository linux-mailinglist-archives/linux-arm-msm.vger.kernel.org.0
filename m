Return-Path: <linux-arm-msm+bounces-69562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5B9B2A1EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B0C57B3D94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF4031B13C;
	Mon, 18 Aug 2025 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QJX+ozMl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E014127B342;
	Mon, 18 Aug 2025 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755520883; cv=none; b=TcvxzqJhjAYO9y7Q+Hw3zJYK+Z4Ogp9D1kCGhghqUXtg/MUCvTpcnYKIy6BXvayKy6RcueniaoJSXXP2wc4jqrgLtkpL0+8QfXeHVnywaMOiePgEc5vGeE0xvmU1zar1M86MrXyNs0vsOB5Vc+cFcxMSqhD619ZexQeAa4HQ0AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755520883; c=relaxed/simple;
	bh=08W1jYI8zyGNE3lopIh/RU2X9nBDRVh9zEHED9tCNMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovyzTNAjOnJo+8splEObF1aEYy65Qo0HRNLFfk3r3Snvz4iw1q/Fxze9c0W2jWpYHwLJBzTsBj6E+7/pg55r69ei7XSmKhOUw7xvwfFUDxyKC4zHjiYNqOoGClVMvko9k+9axqUVTm061NDia0WrYO5aLf4tb9a+t3knsdHOlo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QJX+ozMl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7V3u3004103;
	Mon, 18 Aug 2025 12:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5WuhBaY26A2
	2ywHZgEPCbKm0v4jlN/JvdqhSe84JpbI=; b=QJX+ozMlP9n3guDtwSUOzLs6JZm
	xZ1LHsBoFVMpjz+1y5I52HHPtbxqm/kHM72VbtWQhXsn8QTnXrqj5oDKxUPdtfEz
	ikhzdSGJd/OohxrzcE+hkSDLptXxU+b9B3bOwhAeAvqkAFDCaC9ArYHD3tKD9H0D
	k4u6vSM9QEnUVjU9M2jY4jmnM8HE1cbUZmPdBdpANFBUs+cgX+pZwaJnyi2CPczX
	rgqX9u1ZqVCFBbvttjyOpLBcQIfVXvtnPvooiuWASuboM/8iBKVlTKb7CRd2Xh12
	uI8xO6TtTVRK0Mbc0ISBAgQ1WRNWc/rmTuvKvk2ouLbr8NurKTOBH9aKf9Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyur8wwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 12:41:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57ICfCO4009290;
	Mon, 18 Aug 2025 12:41:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 48jk2khku5-1;
	Mon, 18 Aug 2025 12:41:13 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57ICfDsV009294;
	Mon, 18 Aug 2025 12:41:13 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 57ICfCkg009293;
	Mon, 18 Aug 2025 12:41:13 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 55C4B57363A; Mon, 18 Aug 2025 18:11:12 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 2/2] phy: qcom-qmp-ufs: Add regulator loads for SM8550 and SM8750
Date: Mon, 18 Aug 2025 18:11:10 +0530
Message-ID: <20250818124110.8136-3-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250818124110.8136-1-quic_nitirawa@quicinc.com>
References: <20250818124110.8136-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA2OSBTYWx0ZWRfX370wC/iPAMBx
 GbmCEB6mLvswmg0uCRfFHMndDplH98AlYJBKGocBiFSkkcz2gKtWH8GYiKN4cVZgkVmx8NnxHsR
 kZMfEfjQo8V2+kF4HSAlfYITZgVPgxReQNz65aqHsDSk0p4rEShqce+uvXSdenvTogYdeRTCZaV
 /Ry0UO4dQ2vUKOTu5AmA+RQONglApI4FwERfLmmfTdWClmLJCuhCfUFmPY6IUeAhSfATQ29NcLt
 f0U/k6w2njltv0CNcLx1O0S31omipfSZmhpKo/34MmjaD1+yvjnMp0GeVUYg7rt/4jjB7SiKly+
 TpExLs6YGul9m+28NyfoMGPx6Su4PsQp8rGPpxz33mQQiOIkqWcfNDIF8t3KO0n157n4w5Dc2Wt
 SWV59jg9
X-Proofpoint-ORIG-GUID: AawgkywRK8_cGJ0-pVW-k_02gAtPjPA9
X-Proofpoint-GUID: AawgkywRK8_cGJ0-pVW-k_02gAtPjPA9
X-Authority-Analysis: v=2.4 cv=YtIPR5YX c=1 sm=1 tr=0 ts=68a31f6c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=pWRrd-rm6bt4-Ij3yoUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180069

Add regulator load configuration for SM8550 and SM8750 UFS PHY.
This ensure proper regulator load management and mode selection for
optimal power efficiency on these SoC platforms where regulators may
be shared with other IP blocks.

The load requirements are:

- SM8550: vdda-phy=205000uA, vdda-pll=17500uA
- SM8750: vdda-phy=213000uA, vdda-pll=18300uA

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index f7a4a8334026..50875d9609f6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1172,6 +1172,17 @@ static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
 };

+/* Regulator load arrays for specific configurations */
+static const int sm8650_vreg_load_ua[] = {
+	205000, /* vdda-phy */
+	17500,  /* vdda-pll */
+};
+
+static const int sm8750_vreg_load_ua[] = {
+	213000, /* vdda-phy */
+	18300,  /* vdda-pll */
+};
+
 static const struct qmp_ufs_offsets qmp_ufs_offsets = {
 	.serdes		= 0,
 	.pcs		= 0xc00,
@@ -1642,6 +1653,7 @@ static const struct qmp_phy_cfg sm8650_ufsphy_cfg = {

 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_load_ua		= sm8650_vreg_load_ua,
 	.regs			= ufsphy_v6_regs_layout,
 };

@@ -1680,6 +1692,7 @@ static const struct qmp_phy_cfg sm8750_ufsphy_cfg = {

 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_load_ua		= sm8750_vreg_load_ua,
 	.regs			= ufsphy_v6_regs_layout,

 };
--
2.48.1


