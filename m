Return-Path: <linux-arm-msm+bounces-59449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAD3AC426C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 17:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0412E7AA369
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 15:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B136621859A;
	Mon, 26 May 2025 15:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hMkXdKBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECC3215078;
	Mon, 26 May 2025 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748273936; cv=none; b=lvHGrapzIDWf5TpgBcJezgonB4mYLgoshELUImqw7u74bLWpFfjAEjdUXPb6dDM89VtV1u9d27EPwsXKCzENHQMk5HNIk4mj0Iccru+GsYqrGYmlrWGXPqamzyQH84L/WRz2Y93QdlSYsF31QKjHGWZynkH74xb25zDDxv+rIK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748273936; c=relaxed/simple;
	bh=nKrnG3LaEcojxSRbSclrjLmk02FAkf45HRq75BJIrYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CAn8ebMJcibvxc5nhSERmCUBDJvQqWUSmL4W18Nym3Lh3XwUGnUk5shzZOZifaJoLG/pTTmts52btlCR92SMEhtoM0oGXvT9HrjqtLTNz4vUkMw65Vqgruwoyy1UUCHMuhmXxweLUTkHEi7PApALnj/+WOjG6G451z+UX0f4A1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hMkXdKBT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QA4thk010268;
	Mon, 26 May 2025 15:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pbOvFQM3gVw
	+aznC2mP9WvbhhaH67mB19u98RlihE+o=; b=hMkXdKBTxAVbiGHgAGcQrNW0Epy
	sGOPbhBaFetY4OYebOlHXdx/48nymYpjzV7r7/HarZ9yTHXC3lbYXkgU2M6ERILy
	igY8uxaXPBxaXjdIgbok0APEbyra0IrRcsXJf/MARptPE2RyrrbU4oVRs4wIbj5C
	ISZuCCdxA2F7rSPvBdFx0P0iNP1beebdJJnAwsIbRyab+kViukzHp8AC5iAAeXdk
	bnAVvXtDeMj9jJt0GjdLhXZ4amjOftpXkGVa0jTOQs6LiomH/18pxnMZb11331Dm
	CMBFQKaZVKTnrBJGbBC9ZXYje4rBEBMNlPt8vli+C+MEGx76jhWdkLGg70A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p4h12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 15:38:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54QFcRbj032450;
	Mon, 26 May 2025 15:38:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46u76m73hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 26 May 2025 15:38:30 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54QFcRQN032457;
	Mon, 26 May 2025 15:38:29 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54QFcRBY032454;
	Mon, 26 May 2025 15:38:29 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id D1E2E602710; Mon, 26 May 2025 21:08:28 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V6 07/10] phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
Date: Mon, 26 May 2025 21:08:18 +0530
Message-ID: <20250526153821.7918-8-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
References: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: ATqyV2wovzSEzuC3HQpVpbVyenehizEC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEzMiBTYWx0ZWRfX6/2F+c/p7SPm
 dQF8Z9gMLgnrk8rT/wqeq6sxABHLFqamQF0pppYVqFkpg5gCRPmh2ycPy7GQdFitfLVu9dGvzWl
 KDUqL5YYG54pz64SNqRZZ0l9kFPje3ofLxmEyle0PhS7bMgnxpOti5Fcx8EHojpz/ifkHW6A0Jw
 OKU0hhXS4CaP9d+ygVfkrdk+0fUq3CRN1/5BDt3dHTmD5VRswFn3PDcuI2nlQpwrEZD4s4305Vs
 XUpmaP4VYHrTWrE/O3R5vnpSCYfxo0fPqwVQ4fp7VKgXnlm/GAvUYFPCP03hgHIBDFWxfrQdRO/
 GJvVYrqwvlpziVPzWSi1XJKHGA//8oFVH5WSfPGeFFUOnA4p1z2pwyDeOCcZ+1HeJz3hB4ndHac
 1VmWlkBQvDgdwZ/HPiUe5sEt3KErTZbGv2smm20s349hg3XGBMslmu+MOlxN+HILCaH7kVtn
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=68348af9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=OtgkZb4fJjdbvehu_hcA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ATqyV2wovzSEzuC3HQpVpbVyenehizEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_08,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260132

Rename qmp_ufs_disable to qmp_ufs_power_off to better represent its
functionality. Additionally, inline qmp_ufs_exit into qmp_ufs_power_off
function to preserve the functionality of .power_off.

There is no functional change.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index eda0a59918ea..e0dc5fa43dee 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1849,28 +1849,11 @@ static int qmp_ufs_power_off(struct phy *phy)
 	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			SW_PWRDN);

-	return 0;
-}
-
-static int qmp_ufs_exit(struct phy *phy)
-{
-	struct qmp_ufs *qmp = phy_get_drvdata(phy);
-
 	qmp_ufs_com_exit(qmp);

 	return 0;
 }

-static int qmp_ufs_disable(struct phy *phy)
-{
-	int ret;
-
-	ret = qmp_ufs_power_off(phy);
-	if (ret)
-		return ret;
-	return qmp_ufs_exit(phy);
-}
-
 static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
@@ -1919,7 +1902,7 @@ static int qmp_ufs_phy_init(struct phy *phy)
 static const struct phy_ops qcom_qmp_ufs_phy_ops = {
 	.init		= qmp_ufs_phy_init,
 	.power_on	= qmp_ufs_power_on,
-	.power_off	= qmp_ufs_disable,
+	.power_off	= qmp_ufs_power_off,
 	.calibrate	= qmp_ufs_phy_calibrate,
 	.set_mode	= qmp_ufs_set_mode,
 	.owner		= THIS_MODULE,
--
2.48.1


