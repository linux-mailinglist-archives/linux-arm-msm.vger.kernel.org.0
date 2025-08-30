Return-Path: <linux-arm-msm+bounces-71275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E7DB3C897
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 09:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B36C586744
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 07:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997EE258CD9;
	Sat, 30 Aug 2025 07:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jkVAHpuR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629F21E5710;
	Sat, 30 Aug 2025 07:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756537449; cv=none; b=CzpIkblv8QZoLZAls1zDTujz4arrwww/zAXkho253YfmAd178qdaCFZwFwTldBeFHs4a5fOE4ITiuSTsttCgPvqLNlwwAXViHKxSkw1cPJI1RL1afPgSsoUZ2KG8+jrJCe8nS28xYmO7HntHZGByvKwfUZ94zofAUWStZgfaK7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756537449; c=relaxed/simple;
	bh=wm+0AKoqan0Vb5l96ZXLYb3qcneLLDa/ojuPYb4twQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SqQlKbQrclHtDpAS4jr1uusgy9k9gZixuqcG2W5up51odcN9QannAzcasMsTf81oCNOcOkHM2rw9b2DUJRujwvySEH+W1g0AQ8zKqhO1QFLlJfT934HtvPzNukCOOJQcGKa2payJ+6ZXVCbJD668ODOLIBF8c/l9pMFQ5PPXyAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jkVAHpuR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57U2Xl2x024950;
	Sat, 30 Aug 2025 07:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	phxCywWoGJdDhqmCyk6g26vMofsUa7gi5p5koR15iBA=; b=jkVAHpuRGfwYUPKK
	RJvEBZXW5Eudc+JVn6on4Zn/vaiclZn4iDHDy7FD7oHZ4yyxKzoBb7hR1PW5HoJV
	z9AjEDb4BqnQBujqYPXRh3ELH99IQlvu2JLoWqieiD6lINy11zxPc+Zk5+LYrUEo
	VqZ/at7kTkWe4GTHurRU9dsXMDZk/N3MCxn90ce6JIalAKpftN1vjOXyOM9g4Kmy
	e+wHiy91uNlM2DRlhBGj7Sxwclwq5rLaf+1eNUUps19/tBBHKtK7wMWh/mzP63CQ
	aS078qtFt++7VOPJlJqvPx+JrqTGSFuCqFekMN8O/9/A3gfqPMBayI8p20tupGZu
	om3UoQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmj89yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Aug 2025 07:04:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57U73v5B001761;
	Sat, 30 Aug 2025 07:03:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 48utckgbyk-1;
	Sat, 30 Aug 2025 07:03:57 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57U73veG001756;
	Sat, 30 Aug 2025 07:03:57 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 57U73uQS001755;
	Sat, 30 Aug 2025 07:03:57 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 4D3D56009E0; Sat, 30 Aug 2025 12:33:56 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org,
        neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V4 1/2] phy: qcom-qmp-ufs: Add regulator load voting for UFS QMP PHY
Date: Sat, 30 Aug 2025 12:33:52 +0530
Message-ID: <20250830070353.2694-2-nitin.rawat@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250830070353.2694-1-nitin.rawat@oss.qualcomm.com>
References: <20250830070353.2694-1-nitin.rawat@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b2a260 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tKL6smffEGmnvWNMxd4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: J8R3lVCeyPIbGmLYjXg55GoFf-VzKTR1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX7t6zoMdjqTca
 Pq16zmi/O7NZbUP5lAABckDvv/NbTNtHfdTC7MoEX0GkxCTWEIu1qZlZe/hlGckOlkCzGFbo1FL
 p6luWKPgJWnsUfw38CZ9ZogDKsyUYJaA31DKS0uOj6IR+3RIEJGblC8boNvZoftY/KHN/K3S7F9
 V+IT2H0FGquuEEmYcC6N/hFxMF9KK+2HdEw11EQP5+AxGii4rPD4ma7wm3nO+ArjZSPz0QsJx9I
 +hwxv/50mj9pblWGdQmVHnM78/Eir0Rckd6Z5AuTWMLgxUn4C+0mZ0aeC3fs4hluaPoT8e8jQC1
 2k6VF6FSBLoW5K5Iu3TYw18bStMrwzNVsQeb6quV5K16TMfFGon1pHdO1O0U9TC6yoIFl+ZzaKR
 5JnYnXx8
X-Proofpoint-ORIG-GUID: J8R3lVCeyPIbGmLYjXg55GoFf-VzKTR1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

From: Nitin Rawat <quic_nitirawa@quicinc.com>

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

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
2.50.1


