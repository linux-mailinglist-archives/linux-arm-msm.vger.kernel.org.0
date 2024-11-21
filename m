Return-Path: <linux-arm-msm+bounces-38584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D6A9D4557
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 02:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D2D5B222E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 01:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDE3132122;
	Thu, 21 Nov 2024 01:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hna3gNne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789E71BDC3;
	Thu, 21 Nov 2024 01:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732153068; cv=none; b=Nx6Uqn42YWCJC02wkDIky8lyl8Wj+CBMx513GskMpfV5A92OM8JwzPpbgSfzOifuYO0zWUzShJ4b24Js7JUJSIy+KOorL42rJBhGb74ckOE7hqjcYYPBjqF+hEqrXtmdBf4jtAxy10lIrwjDdTfLKGeBPJixZt9DIJOLRmjn3uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732153068; c=relaxed/simple;
	bh=PLtHuHr3WdcAgCigSrfmyNiOZEa8uRo7JAlDz1ZyyJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HwUMVh3m2P8neMSImPfR/04d6GoSyIPSRISqp7Otzjqreh9ZdjOCqNI9vYu/YtDOiK1S0LLdVPZPQyBoWlI+b21LBl3RRm5374MQyn7D/4IE/p94D+0dr8bnHuQ1b/UvCTX9mg3NwfdXH/xoPUjUxULvLJ69Ur/QrWJiNcw+igs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hna3gNne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKJrl9t005924;
	Thu, 21 Nov 2024 01:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zzcM0yArF/HAtdS62p1t2J/aiDgkmVRZ7s83TI5oetk=; b=hna3gNneH1Y6hSul
	YdwAAMxqDIT5wYn6KvM+I3nJM/6F7pgc90gPJBKnvbkFmhKWIfChBKja3e2cVVOA
	N5vHwXeIGSNyfAHYtMOP8S8qgxBs9eTjm5LJbrsV5LKGy1LKEDG9YTQX9iq3s/DW
	+sf+ZUWM0aDB1EpLlA195xMfnwC+3swcPotpmBwK8nYHfwZPJcFRJSpy/8s6Z8bJ
	GNVoP5bJD85QNvujnFCRFZWkPzdJXWL6oVLDY857/VXkriCNjeCkUel4vrnt7AH+
	O64uk8LOuSDtErqvGxrlMroTdAsZU3epSXhidVknWISp3si3MqPlaC+5oLEdfvW2
	xeLp2w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4317t23286-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 01:37:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL1bfNJ012761
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 01:37:42 GMT
Received: from hu-azarrabi-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 17:37:41 -0800
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Date: Wed, 20 Nov 2024 17:37:15 -0800
Subject: [PATCH RFC 1/3] tee: revert removal of redundant teedev in struct
 tee_shm
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241120-fix-tee_shm-refcount-upstream-v1-1-5da97f584fcd@quicinc.com>
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
X-Proofpoint-GUID: 8nF7neiTlldAWODwkkOKzC-T8813VFus
X-Proofpoint-ORIG-GUID: 8nF7neiTlldAWODwkkOKzC-T8813VFus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=967 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210011

In commit 5271b2011e44 ("tee: remove redundant teedev in struct tee_shm"),
the reference to teedev was removed following the change in
commit 217e0250cccb ("tee: use reference counting for tee_context").
This change ensured that the ctx in tee_shm remains valid as long as the
shared buffer is valid, and teedev is accessible from ctx. It made teedev
in tee_shm redundant.

Reintroduce teedev to tee_shm to facilitate the introduction of orphan
shared memory, which may not be linked to the context it was originally
associated with.

Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
---
 drivers/tee/tee_shm.c   | 10 +++++++---
 include/linux/tee_drv.h |  2 ++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index daf6e5cfd59a..31e032446cf5 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -43,8 +43,10 @@ static void release_registered_pages(struct tee_shm *shm)
 	}
 }
 
-static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
+static void tee_shm_release(struct tee_shm *shm)
 {
+	struct tee_device *teedev = shm->teedev;
+
 	if (shm->flags & TEE_SHM_POOL) {
 		teedev->pool->ops->free(teedev->pool, shm);
 	} else if (shm->flags & TEE_SHM_DYNAMIC) {
@@ -89,6 +91,7 @@ static struct tee_shm *shm_alloc_helper(struct tee_context *ctx, size_t size,
 
 	refcount_set(&shm->refcount, 1);
 	shm->flags = flags;
+	shm->teedev = teedev;
 	shm->id = id;
 
 	/*
@@ -298,6 +301,7 @@ register_shm_helper(struct tee_context *ctx, struct iov_iter *iter, u32 flags,
 
 	refcount_set(&shm->refcount, 1);
 	shm->flags = flags;
+	shm->teedev = teedev;
 	shm->ctx = ctx;
 	shm->id = id;
 	addr = untagged_addr((unsigned long)iter_iov_addr(iter));
@@ -560,7 +564,7 @@ EXPORT_SYMBOL_GPL(tee_shm_get_from_id);
  */
 void tee_shm_put(struct tee_shm *shm)
 {
-	struct tee_device *teedev = shm->ctx->teedev;
+	struct tee_device *teedev = shm->teedev;
 	bool do_release = false;
 
 	mutex_lock(&teedev->mutex);
@@ -578,6 +582,6 @@ void tee_shm_put(struct tee_shm *shm)
 	mutex_unlock(&teedev->mutex);
 
 	if (do_release)
-		tee_shm_release(teedev, shm);
+		tee_shm_release(shm);
 }
 EXPORT_SYMBOL_GPL(tee_shm_put);
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index a54c203000ed..56560441b2cb 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -47,6 +47,7 @@ struct tee_context {
 
 /**
  * struct tee_shm - shared memory object
+ * @teedev:	device used to allocate the object
  * @ctx:	context using the object
  * @paddr:	physical address of the shared memory
  * @kaddr:	virtual address of the shared memory
@@ -63,6 +64,7 @@ struct tee_context {
  *		used by all drivers
  */
 struct tee_shm {
+	struct tee_device *teedev;
 	struct tee_context *ctx;
 	phys_addr_t paddr;
 	void *kaddr;

-- 
2.34.1


