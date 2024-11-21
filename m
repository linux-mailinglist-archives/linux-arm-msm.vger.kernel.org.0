Return-Path: <linux-arm-msm+bounces-38581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F12A9D4552
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 02:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2046428273E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 01:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335B41F956;
	Thu, 21 Nov 2024 01:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mH/VpuER"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789A32F3B;
	Thu, 21 Nov 2024 01:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732153067; cv=none; b=a+KKiGMb54dl+hK7rL73qyExnJJbTQ2n471x1m4+CZXEfUdHIrppmQMsNZ/YOzVlQhYvgJoGH69Y2yy593EDKdIldy1uGiNWSmOophgcDsspEv95Orno+a2NsbXuKvKsX30yPJfkgAVF+prnK0J9ffaREq2o0nCWBMvhF/nfupo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732153067; c=relaxed/simple;
	bh=9K6suTcQu49lfLr9ezcWRyBB8GMOiU3qoALqMYzIMOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Ih2D4vig1YkwnJe79x7gRQXM5IMwy/5kE6snkSvr52Nkd3hCfT/1TXTo9U/k1jJ4UXVUJE+zrFxBa9Rt1XnuRq5N5OMxMZcSh9kIb+q8Bytlk+UEAk0J5JzOxXmrHn3hiTN8pNtxcPZggfo6sVamhzdxCs7fLsLejXlOPrgUjTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mH/VpuER; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKK262Y005916;
	Thu, 21 Nov 2024 01:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	An+w7vVEdUluZfITPbwC2YBMoE9AzBksAtduAIhoa4U=; b=mH/VpuERtntdswhU
	8SQZUr6riJDaPmO4FHAv8Mp8qBsiNKz/r5j48adTkoFpFdJZyqrTzk8wtGUxE7uI
	Zj4XmoTOj5H7Dxk969h6UkPcoY4bJMsO2SbFLSUcUascYJ6IQZGXsUyC7iWYbIPL
	2FtUUjDyQ66Q3Tqb/EMjlP6umwkXA4YVMFxi8OWSxtXyKnnBFWkeQ28N5Ftf5w8C
	N4uWXov2G6FYRwJfZfNG7FLE1eesfxddjgi4p/R1TEzeQg6xjpBKd3b2jsx0hgNv
	oHCG5CHxsakkKJuhgq5dyx2AGmK7YkX1oQxkz7wGqu49QMRrphQXjFfpaA/8j3up
	o+KjWw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4317t23287-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 01:37:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL1bgKM012769
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 01:37:42 GMT
Received: from hu-azarrabi-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 17:37:41 -0800
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Date: Wed, 20 Nov 2024 17:37:16 -0800
Subject: [PATCH RFC 2/3] tee: revert removal of linked list of struct
 tee_shm
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241120-fix-tee_shm-refcount-upstream-v1-2-5da97f584fcd@quicinc.com>
References: <20241120-fix-tee_shm-refcount-upstream-v1-0-5da97f584fcd@quicinc.com>
In-Reply-To: <20241120-fix-tee_shm-refcount-upstream-v1-0-5da97f584fcd@quicinc.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg
	<sumit.garg@linaro.org>
CC: <op-tee@lists.trustedfirmware.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Amirreza Zarrabi <quic_azarrabi@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: blkLjxCVKKalmrwM0VA4XFJZSHF0HHr9
X-Proofpoint-ORIG-GUID: blkLjxCVKKalmrwM0VA4XFJZSHF0HHr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210011

Partially revert commit 59a135f6fb66 ("tee: remove linked list of
struct tee_shm"). Reintroduce the linked list to track all tee_shm
instances associated with a context.

Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
---
 drivers/tee/tee_core.c  |  1 +
 drivers/tee/tee_shm.c   | 13 +++++++++++++
 include/linux/tee_drv.h |  4 ++++
 3 files changed, 18 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..93f3b330aec8 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -59,6 +59,7 @@ struct tee_context *teedev_open(struct tee_device *teedev)
 
 	kref_init(&ctx->refcount);
 	ctx->teedev = teedev;
+	INIT_LIST_HEAD(&ctx->list_shm);
 	rc = teedev->desc->ops->open(ctx);
 	if (rc)
 		goto err;
diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 31e032446cf5..c0164c0f4a01 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -108,6 +108,10 @@ static struct tee_shm *shm_alloc_helper(struct tee_context *ctx, size_t size,
 		goto err_kfree;
 	}
 
+	mutex_lock(&teedev->mutex);
+	list_add_tail(&shm->link, &ctx->list_shm);
+	mutex_unlock(&teedev->mutex);
+
 	teedev_ctx_get(ctx);
 	return shm;
 err_kfree:
@@ -343,6 +347,10 @@ register_shm_helper(struct tee_context *ctx, struct iov_iter *iter, u32 flags,
 		goto err_put_shm_pages;
 	}
 
+	mutex_lock(&teedev->mutex);
+	list_add_tail(&shm->link, &ctx->list_shm);
+	mutex_unlock(&teedev->mutex);
+
 	return shm;
 err_put_shm_pages:
 	if (!iov_iter_is_kvec(iter))
@@ -577,6 +585,11 @@ void tee_shm_put(struct tee_shm *shm)
 		 */
 		if (shm->id >= 0)
 			idr_remove(&teedev->idr, shm->id);
+
+		/* The context owns shm may be gone already. */
+		if (shm->ctx)
+			list_del(&shm->link);
+
 		do_release = true;
 	}
 	mutex_unlock(&teedev->mutex);
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index 56560441b2cb..1b57cddfecc8 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -23,6 +23,7 @@ struct tee_device;
 /**
  * struct tee_context - driver specific context on file pointer data
  * @teedev:	pointer to this drivers struct tee_device
+ * @list_shm:	List of shared memory object owned by this context
  * @data:	driver specific context data, managed by the driver
  * @refcount:	reference counter for this structure
  * @releasing:  flag that indicates if context is being released right now.
@@ -38,6 +39,7 @@ struct tee_device;
  */
 struct tee_context {
 	struct tee_device *teedev;
+	struct list_head list_shm;
 	void *data;
 	struct kref refcount;
 	bool releasing;
@@ -49,6 +51,7 @@ struct tee_context {
  * struct tee_shm - shared memory object
  * @teedev:	device used to allocate the object
  * @ctx:	context using the object
+ * @link	link element
  * @paddr:	physical address of the shared memory
  * @kaddr:	virtual address of the shared memory
  * @size:	size of shared memory
@@ -66,6 +69,7 @@ struct tee_context {
 struct tee_shm {
 	struct tee_device *teedev;
 	struct tee_context *ctx;
+	struct list_head link;
 	phys_addr_t paddr;
 	void *kaddr;
 	size_t size;

-- 
2.34.1


