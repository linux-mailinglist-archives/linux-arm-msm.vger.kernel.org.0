Return-Path: <linux-arm-msm+bounces-58101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F63AB8C67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 18:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 203EF7B2D8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A663B228CBE;
	Thu, 15 May 2025 16:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LSkPisv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01FE224AEB;
	Thu, 15 May 2025 16:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326477; cv=none; b=sgzN/Q97TSubRP1on/I/h35lt8vTxqHvwvPyOJbFgB4cMwmSW6kLQMlxrP0B57rTZopPK249TeeTgN1FBSTq+wQglX36L2+eAIP8la7XR/91w+9GVm2E2hIRXYGC7qIQ5Wx0YC7iV0xt6nuOUkCH9lCIFZvU4DmHr9rUGfSPXXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326477; c=relaxed/simple;
	bh=4wnPw3OdjBKerGRdeFS7gbpchkzjR494G5EaT4MuhV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H4uSxB5Pt0DBtz5+z87cVdvKvFnNhISdHlrzSCJiK/ph20oVL9eA6b6ZH1skrPt8t6ze2enfH4jHMAXIgW+MF9eRhnKwLiBOzRNKeRJSl1XmxkbGsz4oZfcDHqkRUnQKLWp3VfQtVjw+ob7PrKslLWL2Psi6rI7JXBc6KsQoRss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LSkPisv+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFWNl014961;
	Thu, 15 May 2025 16:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wY3fZSqUxXu
	gPYvfIAQAaL0eqLN2QJWsw8wLvBsEXpg=; b=LSkPisv+QtRknVkbbz3+7t7m/l7
	UQi5RMVJMyrxb5l1UntSZ6BBjWAdLrOFmzsJoZwD5+p9/QILEAj4vNjXZD4WyNUa
	H3pFxM4nn3ar8eGriFZ6IMolq3w28+vfyndl0qxpT9z4BxJ6SV2X8rUE48TznSwK
	0WTzCYlKUZjTkKrzGhjkh7K3fIOAzSRwA4+D2pc04HcCnAeO+FlnO/nBwk3yLb0q
	FuRb7ksgLCfLUAoY4yfVRzlxK0Ube6rS4O2+YNPgmDY2ZkpChMo+4oVxDBV+E2Tz
	EyUl2MllbvxUR31x58fxbCjUDXC7bFl3Ge9u3oy5G+WaSuPbu6HaX+aO3Sg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpeyxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 16:27:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54FGRSJ3023582;
	Thu, 15 May 2025 16:27:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46hyvmvnpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 15 May 2025 16:27:32 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54FGRWpm023630;
	Thu, 15 May 2025 16:27:32 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54FGRV25023627;
	Thu, 15 May 2025 16:27:32 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 5F84C5015B0; Thu, 15 May 2025 21:57:31 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V5 07/11] phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and Inline qmp_ufs_com_exit()
Date: Thu, 15 May 2025 21:57:18 +0530
Message-ID: <20250515162722.6933-8-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: YV3526Iemkh1JHtrM4WA05ZgN9jyQ6Xu
X-Proofpoint-ORIG-GUID: YV3526Iemkh1JHtrM4WA05ZgN9jyQ6Xu
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=682615f8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ckjLh8WlKRlJn9_E0bwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MyBTYWx0ZWRfX3xbxmuWBhgE5
 Vkx1dcurBND8VQfIKLYMU/MjMMtfZqK5wWwAQQlv+kexlfJw3h0I0mU23XuDXoFDmuJ2TN07lGo
 eac2reRWR0yee5OS/wzLI3OOL28Kl1n3xolZf9AOvWh1unZ68esJm+lQIL5iIj+FLcTeoYK1AMn
 U3e0Biqjgff4oThl0RMbtd++cRwsXbJw0HfbRcLQS8nmFkNRJ9l9zvbzO95cI6XT7jl1KuYb4s3
 aFBoMPQYMtl8vbY6emJc1gGkbpuCOH1z4JSm/DjTUKX6erHT71KVKTtAyjn/QhVlir7/5ipLGuh
 /JCw9sOuuT+FVvygLFnrJWB01SOg0hzOZ3KBw+yBaMlw22QI/lLPccfFNq6EmxUgHRpvvJx8XMy
 itE125aN4BVPulJ4RrzkWFFiu3hgx947anFZTxENTqLFIdO0wkgt1sCfzjBRArqY4aXqniQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150163

qmp_ufs_exit() is a wrapper function. It only calls qmp_ufs_com_exit().
Remove it to simplify the ufs phy driver.

Additonally partial Inline(dropping the reset assert) qmp_ufs_com_exit
into qmp_ufs_power_off function to avoid unnecessary function call.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index a5974a1fb5bb..fca47e5e8bf0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1758,19 +1758,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
 		qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
 }
 
-static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
-{
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-
-	reset_control_assert(qmp->ufs_reset);
-
-	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
-
-	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
-
-	return 0;
-}
-
 static int qmp_ufs_power_on(struct phy *phy)
 {
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
@@ -1851,7 +1838,11 @@ static int qmp_ufs_power_off(struct phy *phy)
 	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			SW_PWRDN);
 
-	qmp_ufs_com_exit(qmp);
+	/* Turn off all the phy clocks */
+	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
+
+	/* Turn off all the phy rails */
+	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
 	return 0;
 }
-- 
2.48.1


