Return-Path: <linux-arm-msm+bounces-322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F29A7E6ECC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 17:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D641B28104D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 16:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BE236AFB;
	Thu,  9 Nov 2023 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mUolJAW8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988A232C9D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 16:32:35 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104DB35BD;
	Thu,  9 Nov 2023 08:32:34 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DE258660741B;
	Thu,  9 Nov 2023 16:32:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699547553;
	bh=OdJpM4zZSCGfQOIYwAjSfQGZ3gxU794bdhQXiyK5ccU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mUolJAW8Lmk3aPmszoqK5yp/mylL4JYMYmLj3GFBQMzMvnw0fYmBUyoR2G1MSFDch
	 YCzx9PQJMVigIE5ch0oBsvLZGjGM9TFpV/r9ASa6HxCN25ub9B5X33jDf1diTfGXqc
	 /8VF8XaSP33W0yDapf1CipnFxMOokT6MTY1p01XYTNu2d0UlMcrV5CKXoC8CzW7UAU
	 r296mfRGUR1JBOhR2dUUzE1Z4ze4u16HdnIfhsqPKOB+i+FLLsfTWaWjrw9k5XMNa0
	 pz7JFE5j2tddJ6OR5Y3ZR85tnDygj6mtATcYxqtG84XUmiMKNlrK2omM6ZHu4qyEFF
	 3lqpMMKDrsrCg==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v15 05/56] media: videobuf2: Access vb2_queue bufs array through helper functions
Date: Thu,  9 Nov 2023 17:29:17 +0100
Message-Id: <20231109163008.179152-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109163008.179152-1-benjamin.gaignard@collabora.com>
References: <20231109163008.179152-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds 2 helpers functions to add and remove vb2 buffers
from a queue. With these 2 and vb2_get_buffer(), bufs field of
struct vb2_queue becomes like a private member of the structure.

After each call to vb2_get_buffer() we need to be sure that we get
a valid pointer in preparation for when buffers can be deleted.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 158 +++++++++++++-----
 .../media/common/videobuf2/videobuf2-v4l2.c   |  44 +++--
 2 files changed, 149 insertions(+), 53 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index df515134bb0c..0024b82663d4 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -413,6 +413,31 @@ static void init_buffer_cache_hints(struct vb2_queue *q, struct vb2_buffer *vb)
 		vb->skip_cache_sync_on_finish = 1;
 }
 
+/**
+ * vb2_queue_add_buffer() - add a buffer to a queue
+ * @q:	pointer to &struct vb2_queue with videobuf2 queue.
+ * @vb:	pointer to &struct vb2_buffer to be added to the queue.
+ * @index: index where add vb2_buffer in the queue
+ */
+static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, unsigned int index)
+{
+	WARN_ON(index >= VB2_MAX_FRAME || q->bufs[index] || vb->vb2_queue);
+
+	q->bufs[index] = vb;
+	vb->index = index;
+	vb->vb2_queue = q;
+}
+
+/**
+ * vb2_queue_remove_buffer() - remove a buffer from a queue
+ * @vb:	pointer to &struct vb2_buffer to be removed from the queue.
+ */
+static void vb2_queue_remove_buffer(struct vb2_buffer *vb)
+{
+	vb->vb2_queue->bufs[vb->index] = NULL;
+	vb->vb2_queue = NULL;
+}
+
 /*
  * __vb2_queue_alloc() - allocate vb2 buffer structures and (for MMAP type)
  * video buffer memory for all buffers/planes on the queue and initializes the
@@ -441,9 +466,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 		}
 
 		vb->state = VB2_BUF_STATE_DEQUEUED;
-		vb->vb2_queue = q;
 		vb->num_planes = num_planes;
-		vb->index = q->num_buffers + buffer;
 		vb->type = q->type;
 		vb->memory = memory;
 		init_buffer_cache_hints(q, vb);
@@ -451,9 +474,9 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 			vb->planes[plane].length = plane_sizes[plane];
 			vb->planes[plane].min_length = plane_sizes[plane];
 		}
-		call_void_bufop(q, init_buffer, vb);
 
-		q->bufs[vb->index] = vb;
+		vb2_queue_add_buffer(q, vb, q->num_buffers + buffer);
+		call_void_bufop(q, init_buffer, vb);
 
 		/* Allocate video buffer memory for the MMAP type */
 		if (memory == VB2_MEMORY_MMAP) {
@@ -461,7 +484,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 			if (ret) {
 				dprintk(q, 1, "failed allocating memory for buffer %d\n",
 					buffer);
-				q->bufs[vb->index] = NULL;
+				vb2_queue_remove_buffer(vb);
 				kfree(vb);
 				break;
 			}
@@ -476,7 +499,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 				dprintk(q, 1, "buffer %d %p initialization failed\n",
 					buffer, vb);
 				__vb2_buf_mem_free(vb);
-				q->bufs[vb->index] = NULL;
+				vb2_queue_remove_buffer(vb);
 				kfree(vb);
 				break;
 			}
@@ -499,7 +522,7 @@ static void __vb2_free_mem(struct vb2_queue *q, unsigned int buffers)
 
 	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
 	     ++buffer) {
-		vb = q->bufs[buffer];
+		vb = vb2_get_buffer(q, buffer);
 		if (!vb)
 			continue;
 
@@ -527,7 +550,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 	/* Call driver-provided cleanup function for each buffer, if provided */
 	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
 	     ++buffer) {
-		struct vb2_buffer *vb = q->bufs[buffer];
+		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
 
 		if (vb && vb->planes[0].mem_priv)
 			call_void_vb_qop(vb, buf_cleanup, vb);
@@ -568,15 +591,20 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 		q->cnt_unprepare_streaming = 0;
 	}
 	for (buffer = 0; buffer < q->num_buffers; ++buffer) {
-		struct vb2_buffer *vb = q->bufs[buffer];
-		bool unbalanced = vb->cnt_mem_alloc != vb->cnt_mem_put ||
-				  vb->cnt_mem_prepare != vb->cnt_mem_finish ||
-				  vb->cnt_mem_get_userptr != vb->cnt_mem_put_userptr ||
-				  vb->cnt_mem_attach_dmabuf != vb->cnt_mem_detach_dmabuf ||
-				  vb->cnt_mem_map_dmabuf != vb->cnt_mem_unmap_dmabuf ||
-				  vb->cnt_buf_queue != vb->cnt_buf_done ||
-				  vb->cnt_buf_prepare != vb->cnt_buf_finish ||
-				  vb->cnt_buf_init != vb->cnt_buf_cleanup;
+		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
+		bool unbalanced;
+
+		if (!vb)
+			continue;
+
+		unbalanced = vb->cnt_mem_alloc != vb->cnt_mem_put ||
+			     vb->cnt_mem_prepare != vb->cnt_mem_finish ||
+			     vb->cnt_mem_get_userptr != vb->cnt_mem_put_userptr ||
+			     vb->cnt_mem_attach_dmabuf != vb->cnt_mem_detach_dmabuf ||
+			     vb->cnt_mem_map_dmabuf != vb->cnt_mem_unmap_dmabuf ||
+			     vb->cnt_buf_queue != vb->cnt_buf_done ||
+			     vb->cnt_buf_prepare != vb->cnt_buf_finish ||
+			     vb->cnt_buf_init != vb->cnt_buf_cleanup;
 
 		if (unbalanced) {
 			pr_info("unbalanced counters for queue %p, buffer %d:\n",
@@ -616,8 +644,13 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 	/* Free vb2 buffers */
 	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
 	     ++buffer) {
-		kfree(q->bufs[buffer]);
-		q->bufs[buffer] = NULL;
+		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
+
+		if (!vb)
+			continue;
+
+		vb2_queue_remove_buffer(vb);
+		kfree(vb);
 	}
 
 	q->num_buffers -= buffers;
@@ -653,7 +686,12 @@ static bool __buffers_in_use(struct vb2_queue *q)
 {
 	unsigned int buffer;
 	for (buffer = 0; buffer < q->num_buffers; ++buffer) {
-		if (vb2_buffer_in_use(q, q->bufs[buffer]))
+		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
+
+		if (!vb)
+			continue;
+
+		if (vb2_buffer_in_use(q, vb))
 			return true;
 	}
 	return false;
@@ -1638,7 +1676,11 @@ static int vb2_start_streaming(struct vb2_queue *q)
 		 * correctly return them to vb2.
 		 */
 		for (i = 0; i < q->num_buffers; ++i) {
-			vb = q->bufs[i];
+			vb = vb2_get_buffer(q, i);
+
+			if (!vb)
+				continue;
+
 			if (vb->state == VB2_BUF_STATE_ACTIVE)
 				vb2_buffer_done(vb, VB2_BUF_STATE_QUEUED);
 		}
@@ -2039,12 +2081,18 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 	 * to vb2 in stop_streaming().
 	 */
 	if (WARN_ON(atomic_read(&q->owned_by_drv_count))) {
-		for (i = 0; i < q->num_buffers; ++i)
-			if (q->bufs[i]->state == VB2_BUF_STATE_ACTIVE) {
-				pr_warn("driver bug: stop_streaming operation is leaving buf %p in active state\n",
-					q->bufs[i]);
-				vb2_buffer_done(q->bufs[i], VB2_BUF_STATE_ERROR);
+		for (i = 0; i < q->num_buffers; ++i) {
+			struct vb2_buffer *vb = vb2_get_buffer(q, i);
+
+			if (!vb)
+				continue;
+
+			if (vb->state == VB2_BUF_STATE_ACTIVE) {
+				pr_warn("driver bug: stop_streaming operation is leaving buffer %u in active state\n",
+					vb->index);
+				vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
 			}
+		}
 		/* Must be zero now */
 		WARN_ON(atomic_read(&q->owned_by_drv_count));
 	}
@@ -2078,9 +2126,14 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 	 * be changed, so we can't move the buf_finish() to __vb2_dqbuf().
 	 */
 	for (i = 0; i < q->num_buffers; ++i) {
-		struct vb2_buffer *vb = q->bufs[i];
-		struct media_request *req = vb->req_obj.req;
+		struct vb2_buffer *vb;
+		struct media_request *req;
 
+		vb = vb2_get_buffer(q, i);
+		if (!vb)
+			continue;
+
+		req = vb->req_obj.req;
 		/*
 		 * If a request is associated with this buffer, then
 		 * call buf_request_cancel() to give the driver to complete()
@@ -2229,10 +2282,12 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
 	buffer = (offset >> PLANE_INDEX_SHIFT) & BUFFER_INDEX_MASK;
 	*plane = (offset >> PAGE_SHIFT) & PLANE_INDEX_MASK;
 
-	if (buffer >= q->num_buffers || *plane >= q->bufs[buffer]->num_planes)
+	*vb = vb2_get_buffer(q, buffer);
+	if (!*vb)
+		return -EINVAL;
+	if (*plane >= (*vb)->num_planes)
 		return -EINVAL;
 
-	*vb = q->bufs[buffer];
 	return 0;
 }
 
@@ -2620,6 +2675,7 @@ struct vb2_fileio_data {
 static int __vb2_init_fileio(struct vb2_queue *q, int read)
 {
 	struct vb2_fileio_data *fileio;
+	struct vb2_buffer *vb;
 	int i, ret;
 	unsigned int count = 0;
 
@@ -2670,11 +2726,18 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 	if (ret)
 		goto err_kfree;
 
+	/*
+	 * Userspace can never add or delete buffers later, so there
+	 * will never be holes. It is safe to assume that vb2_get_buffer(q, 0)
+	 * will always return a valid vb pointer
+	 */
+	vb = vb2_get_buffer(q, 0);
+
 	/*
 	 * Check if plane_count is correct
 	 * (multiplane buffers are not supported).
 	 */
-	if (q->bufs[0]->num_planes != 1) {
+	if (vb->num_planes != 1) {
 		ret = -EBUSY;
 		goto err_reqbufs;
 	}
@@ -2683,12 +2746,15 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 	 * Get kernel address of each buffer.
 	 */
 	for (i = 0; i < q->num_buffers; i++) {
-		fileio->bufs[i].vaddr = vb2_plane_vaddr(q->bufs[i], 0);
+		/* vb can never be NULL when using fileio. */
+		vb = vb2_get_buffer(q, i);
+
+		fileio->bufs[i].vaddr = vb2_plane_vaddr(vb, 0);
 		if (fileio->bufs[i].vaddr == NULL) {
 			ret = -EINVAL;
 			goto err_reqbufs;
 		}
-		fileio->bufs[i].size = vb2_plane_size(q->bufs[i], 0);
+		fileio->bufs[i].size = vb2_plane_size(vb, 0);
 	}
 
 	/*
@@ -2699,7 +2765,12 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 		 * Queue all buffers.
 		 */
 		for (i = 0; i < q->num_buffers; i++) {
-			ret = vb2_core_qbuf(q, q->bufs[i], NULL, NULL);
+			struct vb2_buffer *vb2 = vb2_get_buffer(q, i);
+
+			if (!vb2)
+				continue;
+
+			ret = vb2_core_qbuf(q, vb2, NULL, NULL);
 			if (ret)
 				goto err_reqbufs;
 			fileio->bufs[i].queued = 1;
@@ -2816,15 +2887,17 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
 
 		fileio->cur_index = index;
 		buf = &fileio->bufs[index];
-		b = q->bufs[index];
+
+		/* b can never be NULL when using fileio. */
+		b = vb2_get_buffer(q, index);
 
 		/*
 		 * Get number of bytes filled by the driver
 		 */
 		buf->pos = 0;
 		buf->queued = 0;
-		buf->size = read ? vb2_get_plane_payload(q->bufs[index], 0)
-				 : vb2_plane_size(q->bufs[index], 0);
+		buf->size = read ? vb2_get_plane_payload(b, 0)
+				 : vb2_plane_size(b, 0);
 		/* Compensate for data_offset on read in the multiplanar case. */
 		if (is_multiplanar && read &&
 				b->planes[0].data_offset < buf->size) {
@@ -2867,7 +2940,8 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
 	 * Queue next buffer if required.
 	 */
 	if (buf->pos == buf->size || (!read && fileio->write_immediately)) {
-		struct vb2_buffer *b = q->bufs[index];
+		/* b can never be NULL when using fileio. */
+		struct vb2_buffer *b = vb2_get_buffer(q, index);
 
 		/*
 		 * Check if this is the last buffer to read.
@@ -2894,7 +2968,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
 		 */
 		buf->pos = 0;
 		buf->queued = 1;
-		buf->size = vb2_plane_size(q->bufs[index], 0);
+		buf->size = vb2_plane_size(b, 0);
 		fileio->q_count += 1;
 		/*
 		 * If we are queuing up buffers for the first time, then
@@ -2965,7 +3039,9 @@ static int vb2_thread(void *data)
 		 * Call vb2_dqbuf to get buffer back.
 		 */
 		if (prequeue) {
-			vb = q->bufs[index++];
+			vb = vb2_get_buffer(q, index++);
+			if (!vb)
+				continue;
 			prequeue--;
 		} else {
 			call_void_qop(q, wait_finish, q);
@@ -2974,7 +3050,7 @@ static int vb2_thread(void *data)
 			call_void_qop(q, wait_prepare, q);
 			dprintk(q, 5, "file io: vb2_dqbuf result: %d\n", ret);
 			if (!ret)
-				vb = q->bufs[index];
+				vb = vb2_get_buffer(q, index);
 		}
 		if (ret || threadio->stop)
 			break;
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index d19d82a75ac6..37f814a89ace 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -615,11 +615,22 @@ static const struct vb2_buf_ops v4l2_buf_ops = {
 struct vb2_buffer *vb2_find_buffer(struct vb2_queue *q, u64 timestamp)
 {
 	unsigned int i;
+	struct vb2_buffer *vb2;
 
-	for (i = 0; i < q->num_buffers; i++)
-		if (q->bufs[i]->copied_timestamp &&
-		    q->bufs[i]->timestamp == timestamp)
-			return vb2_get_buffer(q, i);
+	/*
+	 * This loop doesn't scale if there is a really large number of buffers.
+	 * Maybe something more efficient will be needed in this case.
+	 */
+	for (i = 0; i < q->num_buffers; i++) {
+		vb2 = vb2_get_buffer(q, i);
+
+		if (!vb2)
+			continue;
+
+		if (vb2->copied_timestamp &&
+		    vb2->timestamp == timestamp)
+			return vb2;
+	}
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(vb2_find_buffer);
@@ -647,11 +658,12 @@ int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b)
 		return -EINVAL;
 	}
 
-	if (b->index >= q->num_buffers) {
-		dprintk(q, 1, "buffer index out of range\n");
+	vb = vb2_get_buffer(q, b->index);
+	if (!vb) {
+		dprintk(q, 1, "can't find the requested buffer %u\n", b->index);
 		return -EINVAL;
 	}
-	vb = q->bufs[b->index];
+
 	ret = __verify_planes_array(vb, b);
 	if (!ret)
 		vb2_core_querybuf(q, vb, b);
@@ -721,11 +733,11 @@ int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
 	if (b->flags & V4L2_BUF_FLAG_REQUEST_FD)
 		return -EINVAL;
 
-	if (b->index >= q->num_buffers) {
-		dprintk(q, 1, "buffer index out of range\n");
+	vb = vb2_get_buffer(q, b->index);
+	if (!vb) {
+		dprintk(q, 1, "can't find the requested buffer %u\n", b->index);
 		return -EINVAL;
 	}
-	vb = q->bufs[b->index];
 
 	ret = vb2_queue_or_prepare_buf(q, mdev, vb, b, true, NULL);
 
@@ -809,7 +821,11 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
 		dprintk(q, 1, "buffer index out of range\n");
 		return -EINVAL;
 	}
-	vb = q->bufs[b->index];
+	vb = vb2_get_buffer(q, b->index);
+	if (!vb) {
+		dprintk(q, 1, "can't find the requested buffer %u\n", b->index);
+		return -EINVAL;
+	}
 
 	ret = vb2_queue_or_prepare_buf(q, mdev, vb, b, false, &req);
 	if (ret)
@@ -880,7 +896,11 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb)
 		dprintk(q, 1, "buffer index out of range\n");
 		return -EINVAL;
 	}
-	vb = q->bufs[eb->index];
+	vb = vb2_get_buffer(q, eb->index);
+	if (!vb) {
+		dprintk(q, 1, "can't find the requested buffer %u\n", eb->index);
+		return -EINVAL;
+	}
 
 	return vb2_core_expbuf(q, &eb->fd, eb->type, vb,
 				eb->plane, eb->flags);
-- 
2.39.2


