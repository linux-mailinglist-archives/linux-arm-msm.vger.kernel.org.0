Return-Path: <linux-arm-msm+bounces-20723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0362F8D1982
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89B651F23B48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB1216D9C8;
	Tue, 28 May 2024 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E1P2H9BL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBD416D9A4;
	Tue, 28 May 2024 11:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716895836; cv=none; b=ZXEg2z2RTmIKj3heuDqzEUXr+dpYwgK2HyKijKTTiS6lparwl18LuyjxH0ojqQmGCJ5i1xfIHdJNLqMqPyG1vrl75/8HQyZSNfWuoDuTruzlXV3IDpA6hpPc5Q+J54r35Imjzoenc0789KtnLAHC5eWTabpc/+CIJvGOJkVW9qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716895836; c=relaxed/simple;
	bh=+L7kuUmr9FyAZbCUcKYYeYkJAEw/ysT9W6xjTStfBkE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTTc6Pz3G1fQ7V8x0HtAGVh+X5MZ+Yvv4CHFl9onpQIrFLFFOcXY27FOauSdZoIVTNPx1xoUWkGqdT2lCi0Qh+ATMq6FP2FCYAOF6zQlWV+yBg8wVuIyBU4rnrL0HbFATwrz9LjpughPYcX9iqD4jyb1DAzBP27aHeo8ya+lsFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E1P2H9BL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SB8JAv001099;
	Tue, 28 May 2024 11:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCKxu3wI0UPd81xSXuFLpW1mBarClzhlEbq/D2G8tBA=; b=E1P2H9BLZmmmMJFX
	uP39wTlWwWFbH2OR8X4BKORwZhRsxXhXafNRMY6poKmMreFNhxvHozCHwoi86cQr
	EaaugXUFs4eFvj988I+lDVu+mctht9dJgvZQWJRcUJvuYOnTwIjx0RT0mm9MNDzT
	H2ckK94USSDrb4pZPMTNhIntYZBeeRr2zz/Nk6GgBiLr3JizwgFzyC4PN1MZF0GZ
	45POH+dxyJ1kDzfmoJ+LCHgiPmsIhCoV+8cJ+LAQwwiHmqnqMC3dEJnnK6eRAlKY
	1Mv2xSlGHGyzxUdWkKiFVptz37Z9uvIS3ub4VBZuXz8UfKIPlw1ZwKMIUy0NsV2F
	s1hinw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yj5wy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SBUFOv001609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:30:15 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 04:30:13 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>
Subject: [PATCH v2 3/8] misc: fastrpc: Add support to save and restore
Date: Tue, 28 May 2024 16:59:49 +0530
Message-ID: <20240528112956.5979-4-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
References: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wY9vmNjWoEu53iSKUTl04-BczrhQSD6J
X-Proofpoint-ORIG-GUID: wY9vmNjWoEu53iSKUTl04-BczrhQSD6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280087

For any remote call, driver sends a message to DSP using RPMSG
framework. After message is sent, there is a wait on a completion
object at driver which is completed when DSP response is received.

There is a possibility that a signal is received while waiting
causing the wait function to return -ERESTARTSYS. In this case
the context should be saved and it should get restored for the
next invocation for the thread.

Adding changes to support saving and restoring of interrupted
fastrpc contexts.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 105 +++++++++++++++++++++++++++--------------
 1 file changed, 69 insertions(+), 36 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 3e1ab58038ed..6556c63c4ad7 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -241,7 +241,6 @@ struct fastrpc_invoke_ctx {
 	struct kref refcount;
 	struct list_head node; /* list of ctxs */
 	struct completion work;
-	struct work_struct put_work;
 	struct fastrpc_msg msg;
 	struct fastrpc_user *fl;
 	union fastrpc_remote_arg *rpra;
@@ -276,7 +275,6 @@ struct fastrpc_channel_ctx {
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
 	struct fastrpc_buf *remote_heap;
-	struct list_head invoke_interrupted_mmaps;
 	bool secure;
 	bool unsigned_support;
 	u64 dma_mask;
@@ -292,6 +290,7 @@ struct fastrpc_user {
 	struct list_head user;
 	struct list_head maps;
 	struct list_head pending;
+	struct list_head interrupted;
 	struct list_head mmaps;
 
 	struct fastrpc_channel_ctx *cctx;
@@ -513,14 +512,6 @@ static void fastrpc_context_put(struct fastrpc_invoke_ctx *ctx)
 	kref_put(&ctx->refcount, fastrpc_context_free);
 }
 
-static void fastrpc_context_put_wq(struct work_struct *work)
-{
-	struct fastrpc_invoke_ctx *ctx =
-			container_of(work, struct fastrpc_invoke_ctx, put_work);
-
-	fastrpc_context_put(ctx);
-}
-
 #define CMP(aa, bb) ((aa) == (bb) ? 0 : (aa) < (bb) ? -1 : 1)
 static int olaps_cmp(const void *a, const void *b)
 {
@@ -616,7 +607,6 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	ctx->tgid = user->tgid;
 	ctx->cctx = cctx;
 	init_completion(&ctx->work);
-	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
 
 	spin_lock(&user->lock);
 	list_add_tail(&ctx->node, &user->pending);
@@ -647,6 +637,40 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	return ERR_PTR(ret);
 }
 
+static struct fastrpc_invoke_ctx *fastrpc_context_restore_interrupted(
+			struct fastrpc_user *fl, u32 sc)
+{
+	struct fastrpc_invoke_ctx *ctx = NULL, *ictx = NULL, *n;
+
+	spin_lock(&fl->lock);
+	list_for_each_entry_safe(ictx, n, &fl->interrupted, node) {
+		if (ictx->pid == current->pid) {
+			if (sc != ictx->sc || ictx->fl != fl) {
+				dev_err(ictx->fl->sctx->dev,
+					"interrupted sc (0x%x) or fl (%pK) does not match with invoke sc (0x%x) or fl (%pK)\n",
+					ictx->sc, ictx->fl, sc, fl);
+				spin_unlock(&fl->lock);
+				return ERR_PTR(-EINVAL);
+			}
+			ctx = ictx;
+			list_del(&ctx->node);
+			list_add_tail(&ctx->node, &fl->pending);
+			break;
+		}
+	}
+	spin_unlock(&fl->lock);
+	return ctx;
+}
+
+static void fastrpc_context_save_interrupted(
+			struct fastrpc_invoke_ctx *ctx)
+{
+	spin_lock(&ctx->fl->lock);
+	list_del(&ctx->node);
+	list_add_tail(&ctx->node, &ctx->fl->interrupted);
+	spin_unlock(&ctx->fl->lock);
+}
+
 static struct sg_table *
 fastrpc_map_dma_buf(struct dma_buf_attachment *attachment,
 		    enum dma_data_direction dir)
@@ -1138,7 +1162,6 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 				   struct fastrpc_invoke_args *args)
 {
 	struct fastrpc_invoke_ctx *ctx = NULL;
-	struct fastrpc_buf *buf, *b;
 
 	int err = 0;
 
@@ -1153,6 +1176,14 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 		return -EPERM;
 	}
 
+	if (!kernel) {
+		ctx = fastrpc_context_restore_interrupted(fl, sc);
+		if (IS_ERR(ctx))
+			return PTR_ERR(ctx);
+		if (ctx)
+			goto wait;
+	}
+
 	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
@@ -1168,6 +1199,7 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (err)
 		goto bail;
 
+wait:
 	if (kernel) {
 		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
 			err = -ETIMEDOUT;
@@ -1191,7 +1223,9 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 		goto bail;
 
 bail:
-	if (err != -ERESTARTSYS && err != -ETIMEDOUT) {
+	if (ctx && err == -ERESTARTSYS) {
+		fastrpc_context_save_interrupted(ctx);
+	} else if (ctx) {
 		/* We are done with this compute context */
 		spin_lock(&fl->lock);
 		list_del(&ctx->node);
@@ -1199,13 +1233,6 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 		fastrpc_context_put(ctx);
 	}
 
-	if (err == -ERESTARTSYS) {
-		list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
-			list_del(&buf->node);
-			list_add_tail(&buf->node, &fl->cctx->invoke_interrupted_mmaps);
-		}
-	}
-
 	if (err)
 		dev_dbg(fl->sctx->dev, "Error: Invoke Failed %d\n", err);
 
@@ -1496,6 +1523,25 @@ static void fastrpc_session_free(struct fastrpc_channel_ctx *cctx,
 	spin_unlock_irqrestore(&cctx->lock, flags);
 }
 
+static void fastrpc_context_list_free(struct fastrpc_user *fl)
+{
+	struct fastrpc_invoke_ctx *ctx, *n;
+
+	list_for_each_entry_safe(ctx, n, &fl->interrupted, node) {
+		spin_lock(&fl->lock);
+		list_del(&ctx->node);
+		spin_unlock(&fl->lock);
+		fastrpc_context_put(ctx);
+	}
+
+	list_for_each_entry_safe(ctx, n, &fl->pending, node) {
+		spin_lock(&fl->lock);
+		list_del(&ctx->node);
+		spin_unlock(&fl->lock);
+		fastrpc_context_put(ctx);
+	}
+}
+
 static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
 {
 	struct fastrpc_invoke_args args[1];
@@ -1516,7 +1562,6 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 {
 	struct fastrpc_user *fl = (struct fastrpc_user *)file->private_data;
 	struct fastrpc_channel_ctx *cctx = fl->cctx;
-	struct fastrpc_invoke_ctx *ctx, *n;
 	struct fastrpc_map *map, *m;
 	struct fastrpc_buf *buf, *b;
 	unsigned long flags;
@@ -1530,10 +1575,7 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	if (fl->init_mem)
 		fastrpc_buf_free(fl->init_mem);
 
-	list_for_each_entry_safe(ctx, n, &fl->pending, node) {
-		list_del(&ctx->node);
-		fastrpc_context_put(ctx);
-	}
+	fastrpc_context_list_free(fl);
 
 	list_for_each_entry_safe(map, m, &fl->maps, node)
 		fastrpc_map_put(map);
@@ -1574,6 +1616,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	spin_lock_init(&fl->lock);
 	mutex_init(&fl->mutex);
 	INIT_LIST_HEAD(&fl->pending);
+	INIT_LIST_HEAD(&fl->interrupted);
 	INIT_LIST_HEAD(&fl->maps);
 	INIT_LIST_HEAD(&fl->mmaps);
 	INIT_LIST_HEAD(&fl->user);
@@ -2332,7 +2375,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	rdev->dma_mask = &data->dma_mask;
 	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
 	INIT_LIST_HEAD(&data->users);
-	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
 	spin_lock_init(&data->lock);
 	idr_init(&data->ctx_idr);
 	data->domain_id = domain_id;
@@ -2370,7 +2412,6 @@ static void fastrpc_notify_users(struct fastrpc_user *user)
 static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 {
 	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
-	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
 
@@ -2387,9 +2428,6 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	if (cctx->secure_fdevice)
 		misc_deregister(&cctx->secure_fdevice->miscdev);
 
-	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
-		list_del(&buf->node);
-
 	if (cctx->remote_heap)
 		fastrpc_buf_free(cctx->remote_heap);
 
@@ -2424,12 +2462,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	ctx->retval = rsp->retval;
 	complete(&ctx->work);
 
-	/*
-	 * The DMA buffer associated with the context cannot be freed in
-	 * interrupt context so schedule it through a worker thread to
-	 * avoid a kernel BUG.
-	 */
-	schedule_work(&ctx->put_work);
+	fastrpc_context_put(ctx);
 
 	return 0;
 }
-- 
2.43.0


