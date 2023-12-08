Return-Path: <linux-arm-msm+bounces-4018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A478980A923
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 17:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CE58281875
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C1338F91;
	Fri,  8 Dec 2023 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RCELDFaI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088B11BEE
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 08:35:26 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8DGhTW003033;
	Fri, 8 Dec 2023 16:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=p7L1QkYqhHatT/SGO96PA8+Xwm9rXvTxZVWNxNl+o3E=;
 b=RCELDFaIhIht47avIy4jKGKEQLk5AnAGBBssWNe7t6H5Z2v35ayUjn/l40bXvIdiqAnb
 LMZ5xFjqMqd+71auPg3O0fdFf4xx7bkLBhWrhkMTuDgzc9yhuyscZ5rtw4oc1HCG7bsO
 aHuj3f16ECZCEaINRRS4/bbpbRq/p/dC5+fy76naEBeAWgR/oanx7jScU9oSfhZVWEdl
 wuwLjLHWCDQjYpgTfahZki0Wzc10KFfwsGMWtGZ00TRJK4O/XO6tU5RImGtMCzx+Z6n1
 SnV9awc2OOVH8ycxQXDlTAuvmVWQULewpu+YaXeuTwFOgPh1jhV4iuWI31bPUkhtALtG fA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uu928mag8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 16:35:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8GZKQA002126
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 16:35:20 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Dec 2023 08:35:19 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 5/7] accel/qaic: Call drm_gem_create_mmap_offset() once for each BO
Date: Fri, 8 Dec 2023 09:34:55 -0700
Message-ID: <20231208163457.1295993-6-quic_jhugo@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 34cJZ70drzbf_xMVrJdUZzMnaK6Odv8I
X-Proofpoint-GUID: 34cJZ70drzbf_xMVrJdUZzMnaK6Odv8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080136

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Every time QAIC_MMAP_BO ioctl is called for a BO,
drm_gem_create_mmap_offset() is called. Calling
drm_gem_create_mmap_offset() more then once for a BO seems redundant.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_data.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 7faa00705c1d..f88d925c8001 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -718,6 +718,10 @@ int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 	if (ret)
 		goto free_bo;
 
+	ret = drm_gem_create_mmap_offset(obj);
+	if (ret)
+		goto free_bo;
+
 	ret = drm_gem_handle_create(file_priv, obj, &args->handle);
 	if (ret)
 		goto free_bo;
@@ -745,7 +749,7 @@ int qaic_mmap_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 	struct drm_gem_object *obj;
 	struct qaic_device *qdev;
 	struct qaic_user *usr;
-	int ret;
+	int ret = 0;
 
 	usr = file_priv->driver_priv;
 	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
@@ -767,9 +771,7 @@ int qaic_mmap_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 		goto unlock_dev_srcu;
 	}
 
-	ret = drm_gem_create_mmap_offset(obj);
-	if (ret == 0)
-		args->offset = drm_vma_node_offset_addr(&obj->vma_node);
+	args->offset = drm_vma_node_offset_addr(&obj->vma_node);
 
 	drm_gem_object_put(obj);
 
-- 
2.34.1


