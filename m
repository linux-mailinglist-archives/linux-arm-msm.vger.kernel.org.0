Return-Path: <linux-arm-msm+bounces-4022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9430D80A929
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 17:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B1B41F2125F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A577538F82;
	Fri,  8 Dec 2023 16:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FYj5AyrU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0099A1FC3
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 08:35:29 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8FIxwL008595;
	Fri, 8 Dec 2023 16:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=0IfjoUWiFbIplwms1JNGd6+1uzXj0YZbk2yn6tm1R6g=;
 b=FYj5AyrUwMVDgFwFHaaP+TR+IxHzClJ+cFkwC5orJq+IFYWskwm+sbC5Gxrfmf9sL6Xt
 /BbA1RUzoIV7fkGRcK3Ay3iJVL2djWrItLnTF794DiAFXSzi4Izsv5GVIo2MZEvGPRA6
 lVbUM4/t8CsaeVIFJXzC9FknedjvNBFnygRcNAMN5X3VzFj13XX8im8xyzcqcbkfDrJa
 Zrwj0xrBXZ3QEwNkagaiT9yDnW4BOmIb8M3GMuwRbIkamdGBNDSr/qidFCLbm2wZyCAK
 S8THH1vbYKZYKMZas0mTFOT56SnTh1frbr+fRC9eCRXtlTJ7sSAsOCMWwBtRAJroTSGS pQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uu928mag6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 16:35:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8GZJG6012499
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 16:35:19 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Dec 2023 08:35:18 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 4/7] accel/qaic: Drop the reference to BO in error path of create BO IOCTL
Date: Fri, 8 Dec 2023 09:34:54 -0700
Message-ID: <20231208163457.1295993-5-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6nOufPbRkB7CHF0IQdvToH3I9eXSAzWb
X-Proofpoint-GUID: 6nOufPbRkB7CHF0IQdvToH3I9eXSAzWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080136

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Do not free BO explicitly in error path, just drop its reference, cleanup
will be taken care by DRM as we have registered for ->free() callback.
This patch makes sure that there is only one code path for BO to be freed.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_data.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 89ab8fa19315..7faa00705c1d 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -574,6 +574,9 @@ static void qaic_free_sgt(struct sg_table *sgt)
 {
 	struct scatterlist *sg;
 
+	if (!sgt)
+		return;
+
 	for (sg = sgt->sgl; sg; sg = sg_next(sg))
 		if (sg_page(sg))
 			__free_pages(sg_page(sg), get_order(sg->length));
@@ -717,7 +720,7 @@ int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 
 	ret = drm_gem_handle_create(file_priv, obj, &args->handle);
 	if (ret)
-		goto free_sgt;
+		goto free_bo;
 
 	bo->handle = args->handle;
 	drm_gem_object_put(obj);
@@ -726,10 +729,8 @@ int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 
 	return 0;
 
-free_sgt:
-	qaic_free_sgt(bo->sgt);
 free_bo:
-	kfree(bo);
+	drm_gem_object_put(obj);
 unlock_dev_srcu:
 	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
 unlock_usr_srcu:
-- 
2.34.1


