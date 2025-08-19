Return-Path: <linux-arm-msm+bounces-69837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC03B2CF54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 00:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B87E1C28547
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 22:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC473054F2;
	Tue, 19 Aug 2025 22:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ifQcTk+q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08733054D6;
	Tue, 19 Aug 2025 22:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755642531; cv=none; b=kYRPi+RIPkJMGpOCRcwn+UNj5S69oTLZLWv2ljJdmZ0PSAqcmyMRhbg9vBZRhHupe4GFduKUMM3JXlLVdz6hMxCZEkXD+mdhHDGsYsvuwXZOkmgCSCNGWsGfK7wlBDiO2p/+/TbsP3Cmz3s88gG5LOKSMsW71x2y9GzwpE+gmFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755642531; c=relaxed/simple;
	bh=SzvTPmMh4aFidcTrXHGlz2zz3mH+73BpfwSnuz3eAx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g1wQ+qO4FGhO2/c16/NXyZCdXL1BaDopEhcxwErqtTuDQyKb660iCNmnnEVokvk8jyStBnnYs7baw8xX+L5Z1rXEvc2Lh+X0lcScJOPMBJsjHf/QcLwDR6eaxRQXdJRhtajL36JNoP0CF0vxeOv6rvFI7n5Y1N7NBoxch5byT3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ifQcTk+q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL0n4B019887;
	Tue, 19 Aug 2025 22:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F4g4hJVyCga
	T0NWqd+mzu8w6ltV8Ntq8oT4T34bvpWI=; b=ifQcTk+qmSHYXCYoEV2hQMfZmjX
	XThpSk4amvDUTK+lhn6dKpm/ISEqh04irZiwD/iN0hS7AHiiLDFQnQ4N+Q/lR4sR
	QCPx665ojV2jWVLhcl/Xr8OG1xOVz50+bxkXKuNGCSvigiUBeIVHF7JVW7ydeJqo
	6NhMxuWegeoee3Jy+DOG/et1UAvbG6p/glC8O6Y7i98k8iYanwU42qZnbhqneRgq
	0YKAG6cbKlGu2lF04P8uaCnl7B+SABMrPEj064SZOVVtAmEluL/PzOH7i93bSwMq
	thgoD83aZ6elwqy1/T/s3aRDmAtys6CvnZay++xHPNGHI5RKQTLDLVBYg8A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tfg53x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 22:28:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57JMSca5008405;
	Tue, 19 Aug 2025 22:28:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 48jk2krc32-1;
	Tue, 19 Aug 2025 22:28:41 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57JMPC4I005595;
	Tue, 19 Aug 2025 22:28:41 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 57JMSfdk008442;
	Tue, 19 Aug 2025 22:28:41 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 4894C57363A; Wed, 20 Aug 2025 03:58:40 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V3 2/2] phy: qcom-qmp-ufs: Add regulator loads for SM8650 and SM8750
Date: Wed, 20 Aug 2025 03:58:26 +0530
Message-ID: <20250819222832.8471-3-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
References: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=EuuLbScA c=1 sm=1 tr=0 ts=68a4fa9c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=fbOlTRz00Y4wHkv9588A:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: ofIR_URkZXY7s_ouTiPJ7jO8N0ZfUCY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfXwYA3z8uybEZ9
 QRKm2lYmujWSiG1R4zGyKXMCYEawEx4eCJ0xpYRBO+5ygLfGWZP1shtAzG307OGUYZskr0uIBEZ
 dT0aSSXxbEwKlvCidvVPpSVpi7ty419TgR6zEND9VIl3no8qXFsHuLE4KjnniVAgOXrIIzYdJDR
 W2PDiHUEHVnEIO8zY3dISTZkma3htpdgnGvm3eAUc/IQvUOwokeLNZffhZsrUVsJLR0VEd8dJxu
 abiLY+UM6qWmgj9y4XKb/s7ZN5DSSQwm/u7lyuUXlyYqqXjMbQ090pQ2DInuZcLFCwsUJLTO01D
 E1vyPMAx62SaJWNvUKj+ZXzYF/1EzJFGrVaBDNEMlWlTU6iHZ99mQn6ORG2VLAFwx0fnyAkWn60
 9UK2yBr4Gj3xVeQcg7TQF21zBAdAPw==
X-Proofpoint-ORIG-GUID: ofIR_URkZXY7s_ouTiPJ7jO8N0ZfUCY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190196

Add regulator load voting support for SM8650 and SM8750 platforms by
introducing dedicated regulator bulk data arrays with their load
values.

The load requirements are:
- SM8650: vdda-phy (205mA), vdda-pll (17.5mA)
- SM8750: vdda-phy (213mA), vdda-pll (18.3mA)

This ensures stable operation and proper power management for these
platforms where regulators are shared between the QMP USB PHY and
other IP blocks by setting appropriate regulator load currents during PHY
operations.

Configurations without specific load requirements will continue to work
unchanged, as init_load_uA remains zero-initialized when .init_load_uA
is not provided.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index aaa88ca0ef07..1c3ce0fa6adf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1170,6 +1170,17 @@ static const struct regulator_bulk_data qmp_phy_vreg_l[] = {
 	{ .supply = "vdda-pll" },
 };

+/* Regulator bulk data with load values for specific configurations */
+static const struct regulator_bulk_data sm8650_ufsphy_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 205000 },
+	{ .supply = "vdda-pll", .init_load_uA = 17500 },
+};
+
+static const struct regulator_bulk_data sm8750_ufsphy_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 213000 },
+	{ .supply = "vdda-pll", .init_load_uA = 18300 },
+};
+
 static const struct qmp_ufs_offsets qmp_ufs_offsets = {
 	.serdes		= 0,
 	.pcs		= 0xc00,
@@ -1638,8 +1649,8 @@ static const struct qmp_phy_cfg sm8650_ufsphy_cfg = {
 		.max_gear	= UFS_HS_G5,
 	},

-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= sm8650_ufsphy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(sm8650_ufsphy_vreg_l),
 	.regs			= ufsphy_v6_regs_layout,
 };

@@ -1676,8 +1687,8 @@ static const struct qmp_phy_cfg sm8750_ufsphy_cfg = {
 		.max_gear	= UFS_HS_G5,
 	},

-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= sm8750_ufsphy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(sm8750_ufsphy_vreg_l),
 	.regs			= ufsphy_v6_regs_layout,

 };
--
2.48.1


