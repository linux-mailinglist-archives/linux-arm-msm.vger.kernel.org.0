Return-Path: <linux-arm-msm+bounces-69835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB5AB2CF53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 00:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21457564A36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 22:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117863054DA;
	Tue, 19 Aug 2025 22:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EKDWa+gn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C7D1FC0E2;
	Tue, 19 Aug 2025 22:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755642530; cv=none; b=U/tI6WldtndvQgjHw552ZtU99Jft/vY7/RP2sgmMT1xMz19ehNhYf76CEzwkN5Jn7h/AOrhzSxuED67o1OtaHmGpbjdLqrgIypWnIYZL23aUb02Qd5xj0Kgak4NnY0hIUixmacTtSBm2aHNyxn5TJBIezM/10T1LfKfwwB7BAc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755642530; c=relaxed/simple;
	bh=qYymE66dI4N1eVKFc070wvFuueYW4HmLpshSQcxcyjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TXWlGB9UmaXf7WqMAUOSpAnIKr/Kz24ZSu5rhE3h6DyuiVEPVajYWKubdOmVWAos/02zI6OFeaDDUh6sHQ1dgDdAWJZUoxuGTlIaSZ+tpNNZ5smIrDdJUTgKyFRtBAlxF44q61FB/uhlQgWXhkB6MHiIN5zThrokJqnoXQ58D4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EKDWa+gn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL0uEe030303;
	Tue, 19 Aug 2025 22:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+NWe03C1skFW2diqkMED/B2sh4aY4DN5Sx/RZ9pwOfM=; b=EKDWa+gny5dDfEvm
	wXFTIUtFLqhAlbGDXPUrDd95NPEvzfkOO/0zJ7/vVwQACWeTjsfbvHCnrHbG52gt
	p8iH3IFlBOKb30aIGmrso0Xqpr3NExMJOIbHJqpShF/YW16kHG7M0KzMck1efk+B
	xTw63pVjr7ATV1EQs+W5OnPm0gWbsczp+SktYPT6SCWnPhxP3ptcj/eJ5Ps4AGkr
	VkiHDliEV9t6gh5MVRhkpCaQfC5rXd2suYFgUxRI2b5+olUORtrm3HtbyCQsgdYb
	B5HU4005NG55QspBRXSkHEySDDGIbu2GQdbrPp30bMe+/kr3sBcmPb0VfqrYzoFK
	+oVSRw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tdr51p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 22:28:41 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57JMScDW008406;
	Tue, 19 Aug 2025 22:28:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 48jk2krc2p-1;
	Tue, 19 Aug 2025 22:28:38 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57JMScsa008398;
	Tue, 19 Aug 2025 22:28:38 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 57JMScse008397;
	Tue, 19 Aug 2025 22:28:38 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 68CDF57363A; Wed, 20 Aug 2025 03:58:37 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V3 1/2] phy: qcom-qmp-ufs: Add regulator load voting for UFS QMP PHY
Date: Wed, 20 Aug 2025 03:58:25 +0530
Message-ID: <20250819222832.8471-2-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
References: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=a4RpNUSF c=1 sm=1 tr=0 ts=68a4fa99 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=tKL6smffEGmnvWNMxd4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: gzTP3cwMlR_9qgy6VEpk6PJEn4r5FBuO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX1pEEIJ5tJWlw
 ql51eXwWy53sq1i6xDxYQuV0ArEvQNdE08Kfs27uPyLuk/ByJy4P/DIIMtjFjH2UQqu8jEx7eiJ
 dF+Ky1xNDXwf7v6VksyWBxtb0iM671OOPS/F822rj3l3rFRY+yPSVEoTElJ6E4rLHHw74BrWKfD
 YP5KpjLhoMB6qZ2ZGyF7DKEczsRrs8G9eK61TzoYT433sCQLYt/zmlK1oFM85YS9lw0XTfo6dQD
 QkK1MuahdlqWUepKKWsi4qLNA9i8qB9M7DYUfhV3zmE1yeJV3eQ7qDkBgt9s8KyVuO9AuJOzva1
 si7J+kwgL9KYmIatncHSkVaMC6eOKH6vXTemFOhGrG3vwY0j08R0vHw0BgHAvBIbf7GDFlDxqT0
 eJzO1W9mQJb4mPMINYutfC3BIcK5/Q==
X-Proofpoint-GUID: gzTP3cwMlR_9qgy6VEpk6PJEn4r5FBuO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508190196

On certain SoCs, power regulators are shared between the QMP UFS PHY
and other IP blocks. To ensure proper operation, the regulator
framework must be informed of the UFS PHY's load requirements.
This is essential because the regulator's operating mode—whether Low
Power or High Power—depends on the maximum expected load at any given
time, which the regulator driver needs to manage accordingly.

To support this, replace devm_regulator_bulk_get() with
devm_regulator_bulk_get_const() and inline the qmp_ufs_vreg_init()
function. additionally replace the array of regulator names with a
bulk regulator data structure, and utilize the init_load_uA field
provided by the regulator framework. This ensures that
regulator_set_load() is automatically invoked before the
first enable operation.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 29 +++++++------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 9c69c77d10c8..aaa88ca0ef07 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1107,7 +1107,7 @@ struct qmp_phy_cfg {
 	const struct qmp_phy_cfg_tbls tbls_hs_overlay[NUM_OVERLAY];

 	/* regulators to be requested */
-	const char * const *vreg_list;
+	const struct regulator_bulk_data *vreg_list;
 	int num_vregs;

 	/* array of registers with different offsets */
@@ -1164,9 +1164,10 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 	readl(base + offset);
 }

-/* list of regulators */
-static const char * const qmp_phy_vreg_l[] = {
-	"vdda-phy", "vdda-pll",
+/* Default regulator bulk data (no load used) */
+static const struct regulator_bulk_data qmp_phy_vreg_l[] = {
+	{ .supply = "vdda-phy" },
+	{ .supply = "vdda-pll" },
 };

 static const struct qmp_ufs_offsets qmp_ufs_offsets = {
@@ -1890,22 +1891,6 @@ static const struct phy_ops qcom_qmp_ufs_phy_ops = {
 	.owner		= THIS_MODULE,
 };

-static int qmp_ufs_vreg_init(struct qmp_ufs *qmp)
-{
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	struct device *dev = qmp->dev;
-	int num = cfg->num_vregs;
-	int i;
-
-	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
-	if (!qmp->vregs)
-		return -ENOMEM;
-
-	for (i = 0; i < num; i++)
-		qmp->vregs[i].supply = cfg->vreg_list[i];
-
-	return devm_regulator_bulk_get(dev, num, qmp->vregs);
-}

 static int qmp_ufs_clk_init(struct qmp_ufs *qmp)
 {
@@ -2068,7 +2053,9 @@ static int qmp_ufs_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;

-	ret = qmp_ufs_vreg_init(qmp);
+	ret = devm_regulator_bulk_get_const(dev, qmp->cfg->num_vregs,
+					    qmp->cfg->vreg_list,
+					    &qmp->vregs);
 	if (ret)
 		return ret;

--
2.48.1


