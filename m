Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1031E7CA0A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 09:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbjJPHfF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 03:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbjJPHfE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 03:35:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C446E1;
        Mon, 16 Oct 2023 00:35:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF79C433C7;
        Mon, 16 Oct 2023 07:34:58 +0000 (UTC)
Message-ID: <cc3dfda8-aacd-4bab-95f4-291221979552@xs4all.nl>
Date:   Mon, 16 Oct 2023 09:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/56] media: videobuf2: Use vb2_buffer instead of
 index
Content-Language: en-US, nl
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
 <20231012114642.19040-5-benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231012114642.19040-5-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/10/2023 13:45, Benjamin Gaignard wrote:
> Directly use vb2_buffer pointer instead of index inside queue array.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 40 ++++++-------------
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 30 ++++++++++++--
>  drivers/media/dvb-core/dvb_vb2.c              |  6 +--
>  include/media/videobuf2-core.h                | 16 ++++----
>  4 files changed, 49 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 47dba2a20d73..968b7c0e7934 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -654,9 +654,9 @@ static bool __buffers_in_use(struct vb2_queue *q)
>  	return false;
>  }
>  
> -void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb)
> +void vb2_core_querybuf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb)
>  {
> -	call_void_bufop(q, fill_user_buffer, q->bufs[index], pb);
> +	call_void_bufop(q, fill_user_buffer, vb, pb);
>  }
>  EXPORT_SYMBOL_GPL(vb2_core_querybuf);
>  
> @@ -1490,9 +1490,6 @@ static void vb2_req_unprepare(struct media_request_object *obj)
>  	WARN_ON(!vb->req_obj.req);
>  }
>  
> -int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
> -		  struct media_request *req);
> -
>  static void vb2_req_queue(struct media_request_object *obj)
>  {
>  	struct vb2_buffer *vb = container_of(obj, struct vb2_buffer, req_obj);
> @@ -1507,7 +1504,7 @@ static void vb2_req_queue(struct media_request_object *obj)
>  	 * set. We just ignore that, and expect this will be caught the
>  	 * next time vb2_req_prepare() is called.
>  	 */
> -	err = vb2_core_qbuf(vb->vb2_queue, vb->index, NULL, NULL);
> +	err = vb2_core_qbuf(vb->vb2_queue, vb, NULL, NULL);
>  	WARN_ON_ONCE(err && err != -EIO);
>  	mutex_unlock(vb->vb2_queue->lock);
>  }
> @@ -1562,12 +1559,10 @@ unsigned int vb2_request_buffer_cnt(struct media_request *req)
>  }
>  EXPORT_SYMBOL_GPL(vb2_request_buffer_cnt);
>  
> -int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
> +int vb2_core_prepare_buf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb)
>  {
> -	struct vb2_buffer *vb;
>  	int ret;
>  
> -	vb = q->bufs[index];
>  	if (vb->state != VB2_BUF_STATE_DEQUEUED) {
>  		dprintk(q, 1, "invalid buffer state %s\n",
>  			vb2_state_name(vb->state));
> @@ -1654,10 +1649,9 @@ static int vb2_start_streaming(struct vb2_queue *q)
>  	return ret;
>  }
>  
> -int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
> +int vb2_core_qbuf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb,
>  		  struct media_request *req)
>  {
> -	struct vb2_buffer *vb;
>  	enum vb2_buffer_state orig_state;
>  	int ret;
>  
> @@ -1666,8 +1660,6 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
>  		return -EIO;
>  	}
>  
> -	vb = q->bufs[index];
> -
>  	if (!req && vb->state != VB2_BUF_STATE_IN_REQUEST &&
>  	    q->requires_requests) {
>  		dprintk(q, 1, "qbuf requires a request\n");
> @@ -2240,9 +2232,8 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
>  }
>  
>  int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> -		unsigned int index, unsigned int plane, unsigned int flags)
> +		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags)
>  {
> -	struct vb2_buffer *vb = NULL;
>  	struct vb2_plane *vb_plane;
>  	int ret;
>  	struct dma_buf *dbuf;
> @@ -2267,13 +2258,6 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
>  		return -EINVAL;
>  	}
>  
> -	if (index >= q->num_buffers) {
> -		dprintk(q, 1, "buffer index out of range\n");
> -		return -EINVAL;
> -	}
> -
> -	vb = q->bufs[index];
> -
>  	if (plane >= vb->num_planes) {
>  		dprintk(q, 1, "buffer plane out of range\n");
>  		return -EINVAL;
> @@ -2292,20 +2276,20 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
>  			      flags & O_ACCMODE);
>  	if (IS_ERR_OR_NULL(dbuf)) {
>  		dprintk(q, 1, "failed to export buffer %d, plane %d\n",
> -			index, plane);
> +			vb->index, plane);
>  		return -EINVAL;
>  	}
>  
>  	ret = dma_buf_fd(dbuf, flags & ~O_ACCMODE);
>  	if (ret < 0) {
>  		dprintk(q, 3, "buffer %d, plane %d failed to export (%d)\n",
> -			index, plane, ret);
> +			vb->index, plane, ret);
>  		dma_buf_put(dbuf);
>  		return ret;
>  	}
>  
>  	dprintk(q, 3, "buffer %d, plane %d exported as %d descriptor\n",
> -		index, plane, ret);
> +		vb->index, plane, ret);
>  	*fd = ret;
>  
>  	return 0;
> @@ -2710,7 +2694,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>  		 * Queue all buffers.
>  		 */
>  		for (i = 0; i < q->num_buffers; i++) {
> -			ret = vb2_core_qbuf(q, i, NULL, NULL);
> +			ret = vb2_core_qbuf(q, q->bufs[i], NULL, NULL);
>  			if (ret)
>  				goto err_reqbufs;
>  			fileio->bufs[i].queued = 1;
> @@ -2895,7 +2879,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
>  
>  		if (copy_timestamp)
>  			b->timestamp = ktime_get_ns();
> -		ret = vb2_core_qbuf(q, index, NULL, NULL);
> +		ret = vb2_core_qbuf(q, b, NULL, NULL);
>  		dprintk(q, 5, "vb2_qbuf result: %d\n", ret);
>  		if (ret)
>  			return ret;
> @@ -2998,7 +2982,7 @@ static int vb2_thread(void *data)
>  		if (copy_timestamp)
>  			vb->timestamp = ktime_get_ns();
>  		if (!threadio->stop)
> -			ret = vb2_core_qbuf(q, vb->index, NULL, NULL);
> +			ret = vb2_core_qbuf(q, vb, NULL, NULL);
>  		call_void_qop(q, wait_prepare, q);
>  		if (ret || threadio->stop)
>  			break;
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index c7a54d82a55e..697c8a9f98cd 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -667,7 +667,7 @@ int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b)
>  	vb = q->bufs[b->index];
>  	ret = __verify_planes_array(vb, b);
>  	if (!ret)
> -		vb2_core_querybuf(q, b->index, b);
> +		vb2_core_querybuf(q, vb, b);
>  	return ret;
>  }
>  EXPORT_SYMBOL(vb2_querybuf);
> @@ -723,6 +723,7 @@ EXPORT_SYMBOL_GPL(vb2_reqbufs);
>  int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
>  		    struct v4l2_buffer *b)
>  {
> +	struct vb2_buffer *vb;
>  	int ret;
>  
>  	if (vb2_fileio_is_active(q)) {
> @@ -733,9 +734,15 @@ int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
>  	if (b->flags & V4L2_BUF_FLAG_REQUEST_FD)
>  		return -EINVAL;
>  
> +	if (b->index >= q->num_buffers) {
> +		dprintk(q, 1, "buffer index out of range\n");
> +		return -EINVAL;
> +	}
> +	vb = q->bufs[b->index];
> +
>  	ret = vb2_queue_or_prepare_buf(q, mdev, b, true, NULL);

I see that there is a similar 'if (b->index >= q->num_buffers)' check in
vb2_queue_or_prepare_buf(). I think it would be better if this function
gets a struct vb2_buffer * argument as well.

So: vb2_queue_or_prepare_buf(q, mdev, vb, b, ...).

Regards,

	Hans

>  
> -	return ret ? ret : vb2_core_prepare_buf(q, b->index, b);
> +	return ret ? ret : vb2_core_prepare_buf(q, vb, b);
>  }
>  EXPORT_SYMBOL_GPL(vb2_prepare_buf);
>  
> @@ -803,6 +810,7 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
>  	     struct v4l2_buffer *b)
>  {
>  	struct media_request *req = NULL;
> +	struct vb2_buffer *vb;
>  	int ret;
>  
>  	if (vb2_fileio_is_active(q)) {
> @@ -810,10 +818,16 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
>  		return -EBUSY;
>  	}
>  
> +	if (b->index >= q->num_buffers) {
> +		dprintk(q, 1, "buffer index out of range\n");
> +		return -EINVAL;
> +	}
> +	vb = q->bufs[b->index];
> +
>  	ret = vb2_queue_or_prepare_buf(q, mdev, b, false, &req);
>  	if (ret)
>  		return ret;
> -	ret = vb2_core_qbuf(q, b->index, b, req);
> +	ret = vb2_core_qbuf(q, vb, b, req);
>  	if (req)
>  		media_request_put(req);
>  	return ret;
> @@ -873,7 +887,15 @@ EXPORT_SYMBOL_GPL(vb2_streamoff);
>  
>  int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb)
>  {
> -	return vb2_core_expbuf(q, &eb->fd, eb->type, eb->index,
> +	struct vb2_buffer *vb;
> +
> +	if (eb->index >= q->num_buffers) {
> +		dprintk(q, 1, "buffer index out of range\n");
> +		return -EINVAL;
> +	}
> +	vb = q->bufs[eb->index];
> +
> +	return vb2_core_expbuf(q, &eb->fd, eb->type, vb,
>  				eb->plane, eb->flags);
>  }
>  EXPORT_SYMBOL_GPL(vb2_expbuf);
> diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
> index 909df82fed33..b322ef179f05 100644
> --- a/drivers/media/dvb-core/dvb_vb2.c
> +++ b/drivers/media/dvb-core/dvb_vb2.c
> @@ -360,7 +360,7 @@ int dvb_vb2_querybuf(struct dvb_vb2_ctx *ctx, struct dmx_buffer *b)
>  		dprintk(1, "[%s] buffer index out of range\n", ctx->name);
>  		return -EINVAL;
>  	}
> -	vb2_core_querybuf(&ctx->vb_q, b->index, b);
> +	vb2_core_querybuf(&ctx->vb_q, q->bufs[b->index], b);
>  	dprintk(3, "[%s] index=%d\n", ctx->name, b->index);
>  	return 0;
>  }
> @@ -370,7 +370,7 @@ int dvb_vb2_expbuf(struct dvb_vb2_ctx *ctx, struct dmx_exportbuffer *exp)
>  	struct vb2_queue *q = &ctx->vb_q;
>  	int ret;
>  
> -	ret = vb2_core_expbuf(&ctx->vb_q, &exp->fd, q->type, exp->index,
> +	ret = vb2_core_expbuf(&ctx->vb_q, &exp->fd, q->type, q->bufs[exp->index],
>  			      0, exp->flags);
>  	if (ret) {
>  		dprintk(1, "[%s] index=%d errno=%d\n", ctx->name,
> @@ -391,7 +391,7 @@ int dvb_vb2_qbuf(struct dvb_vb2_ctx *ctx, struct dmx_buffer *b)
>  		dprintk(1, "[%s] buffer index out of range\n", ctx->name);
>  		return -EINVAL;
>  	}
> -	ret = vb2_core_qbuf(&ctx->vb_q, b->index, b, NULL);
> +	ret = vb2_core_qbuf(&ctx->vb_q, q->bufs[b->index], b, NULL);
>  	if (ret) {
>  		dprintk(1, "[%s] index=%d errno=%d\n", ctx->name,
>  			b->index, ret);
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 4b6a9d2ea372..cd3ff1cd759d 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -747,7 +747,7 @@ int vb2_wait_for_all_buffers(struct vb2_queue *q);
>  /**
>   * vb2_core_querybuf() - query video buffer information.
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.
> - * @index:	id number of the buffer.
> + * @vb:		pointer to struct &vb2_buffer.
>   * @pb:		buffer struct passed from userspace.
>   *
>   * Videobuf2 core helper to implement VIDIOC_QUERYBUF() operation. It is called
> @@ -759,7 +759,7 @@ int vb2_wait_for_all_buffers(struct vb2_queue *q);
>   *
>   * Return: returns zero on success; an error code otherwise.
>   */
> -void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
> +void vb2_core_querybuf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb);
>  
>  /**
>   * vb2_core_reqbufs() - Initiate streaming.
> @@ -823,7 +823,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>   * vb2_core_prepare_buf() - Pass ownership of a buffer from userspace
>   *			to the kernel.
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.
> - * @index:	id number of the buffer.
> + * @vb:		pointer to struct &vb2_buffer.
>   * @pb:		buffer structure passed from userspace to
>   *		&v4l2_ioctl_ops->vidioc_prepare_buf handler in driver.
>   *
> @@ -839,13 +839,13 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>   *
>   * Return: returns zero on success; an error code otherwise.
>   */
> -int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb);
> +int vb2_core_prepare_buf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb);
>  
>  /**
>   * vb2_core_qbuf() - Queue a buffer from userspace
>   *
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.
> - * @index:	id number of the buffer
> + * @vb:		pointer to struct &vb2_buffer.
>   * @pb:		buffer structure passed from userspace to
>   *		v4l2_ioctl_ops->vidioc_qbuf handler in driver
>   * @req:	pointer to &struct media_request, may be NULL.
> @@ -867,7 +867,7 @@ int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb);
>   *
>   * Return: returns zero on success; an error code otherwise.
>   */
> -int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
> +int vb2_core_qbuf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb,
>  		  struct media_request *req);
>  
>  /**
> @@ -931,7 +931,7 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
>   * @fd:		pointer to the file descriptor associated with DMABUF
>   *		(set by driver).
>   * @type:	buffer type.
> - * @index:	id number of the buffer.
> + * @vb:		pointer to struct &vb2_buffer.
>   * @plane:	index of the plane to be exported, 0 for single plane queues
>   * @flags:	file flags for newly created file, as defined at
>   *		include/uapi/asm-generic/fcntl.h.
> @@ -945,7 +945,7 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
>   * Return: returns zero on success; an error code otherwise.
>   */
>  int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> -		unsigned int index, unsigned int plane, unsigned int flags);
> +		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags);
>  
>  /**
>   * vb2_core_queue_init() - initialize a videobuf2 queue

