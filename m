Return-Path: <linux-arm-msm+bounces-14254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5D887CF75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 15:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE3D01C21ABA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 14:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E333613B;
	Fri, 15 Mar 2024 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="buT4itVc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46B4374FC
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 14:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710514284; cv=none; b=COOHBVmk/RLzPN3FWZZe8G1qbLUMHUGZIIAnVsGVq0l3vS6fHfxrsFPcR8sySUnfgP/4XRqga4a+Zh1vY+yV1xvMQz2tNG/KLgrR7kljpjYjz20gMza/Sz2sz2nGS/po9chBfQRvYzjx5fGzgBiYN0bq2CKcqToFgVV7XXmQiGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710514284; c=relaxed/simple;
	bh=NtK6sDgAgmCQgF9nyCz0+5gaXiqO3MI2NF4CjT/eonQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rqQCCCoaBc1P1H/L/1o5lr9w5e3zcWV6bBn9utIFFlYLAj6O6RCW7sgNi3zq5gx/d49TQTHGuMlpRJ7nPjH6RayD58vRhqINPQ52xEIvAf2urOBXPSiexNObMuovb695Hgzk2b2dx1hZlzVosspGuwZgKuKfOYXEALDvqAM7oXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=buT4itVc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42FE0CiG022627;
	Fri, 15 Mar 2024 14:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=c7JBbv0lhNoz7QFrjoa1u9Mih8m48RIaYcKKPv4NqKo=; b=bu
	T4itVcWhiFXUX9k4bhe5Ux2SHCsrhQpUI6d/pBwysMbfBlqKE3czHlvejpEB7i/a
	0rvXnVtf81Mu5+A6sQrzLWoXSZlkX6haUI4aZNuQvHlPNWJ2YXPSlOOyDtbsqJdG
	FPppXXzzJQLXmdxLb+JfAPYIZut2R8FdJX9xPVgTNKDIFZn3a8UKskjanfvEG2he
	NmVZicR5Zv9sqG9ofRaJkCQGfJKxBfqQXILVgc0SRQjrWt/roQqlQu4z+D99j6rB
	fuIxTYQ53UoJrIMgms+FfP6WWzmht7iyHaOfVWi8xwHQc3jI0VYLVTgSLyaReia0
	dE3m5VNZ+gYpQFjWoknQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wv9yq9cyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 14:50:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42FEosHL009742
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 14:50:54 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 07:50:53 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <daniel@ffwll.ch>, <jiasheng@iscas.ac.cn>, <quic_carlv@quicinc.com>,
        <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 2/2] accel/qaic: Use drmm_alloc_workqueue()
Date: Fri, 15 Mar 2024 08:50:34 -0600
Message-ID: <20240315145034.3972749-3-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315145034.3972749-1-quic_jhugo@quicinc.com>
References: <20240315145034.3972749-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T-vZmW_o0seczoc7mFNkIEEqWpWxpDCu
X-Proofpoint-GUID: T-vZmW_o0seczoc7mFNkIEEqWpWxpDCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-15_02,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403150120

Now that drmm_alloc_workqueue() exists, we can stop open coding our own
implementation.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
---
 drivers/accel/qaic/qaic_drv.c | 30 ++++--------------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index f072edb74f22..9bc09b87a7e1 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -45,28 +45,6 @@ MODULE_PARM_DESC(datapath_polling, "Operate the datapath in polling mode");
 static bool link_up;
 static DEFINE_IDA(qaic_usrs);
 
-static void qaicm_wq_release(struct drm_device *dev, void *res)
-{
-	struct workqueue_struct *wq = res;
-
-	destroy_workqueue(wq);
-}
-
-static struct workqueue_struct *qaicm_wq_init(struct drm_device *dev, const char *fmt)
-{
-	struct workqueue_struct *wq;
-	int ret;
-
-	wq = alloc_workqueue(fmt, WQ_UNBOUND, 0);
-	if (!wq)
-		return ERR_PTR(-ENOMEM);
-	ret = drmm_add_action_or_reset(dev, qaicm_wq_release, wq);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return wq;
-}
-
 static void qaicm_srcu_release(struct drm_device *dev, void *res)
 {
 	struct srcu_struct *lock = res;
@@ -391,11 +369,11 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
 	if (ret)
 		return NULL;
 
-	qdev->cntl_wq = qaicm_wq_init(drm, "qaic_cntl");
-	if (IS_ERR(qdev->cntl_wq))
+	qdev->cntl_wq = drmm_alloc_workqueue(drm, "qaic_cntl", WQ_UNBOUND, WQ_UNBOUND_MAX_ACTIVE);
+	if (!qdev->cntl_wq)
 		return NULL;
-	qdev->qts_wq = qaicm_wq_init(drm, "qaic_ts");
-	if (IS_ERR(qdev->qts_wq))
+	qdev->qts_wq = drmm_alloc_workqueue(drm, "qaic_ts", WQ_UNBOUND, WQ_UNBOUND_MAX_ACTIVE);
+	if (!qdev->qts_wq)
 		return NULL;
 
 	ret = qaicm_srcu_init(drm, &qdev->dev_lock);
-- 
2.34.1


