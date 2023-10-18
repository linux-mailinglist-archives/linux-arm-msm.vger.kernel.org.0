Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512957CD925
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Oct 2023 12:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjJRK0X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Oct 2023 06:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjJRK0V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Oct 2023 06:26:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61D595;
        Wed, 18 Oct 2023 03:26:18 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE24C433C9;
        Wed, 18 Oct 2023 10:26:14 +0000 (UTC)
Message-ID: <b3b978a8-93b8-4964-8754-18ce3dab3d42@xs4all.nl>
Date:   Wed, 18 Oct 2023 12:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 30/56] media: test-drivers: Stop direct calls to queue
 num_buffers field
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
        kernel@collabora.com, Daniel Almeida <daniel.almeida@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
 <20231017144756.34719-31-benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231017144756.34719-31-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/10/2023 16:47, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> futur.
> If 'min_buffers_needed' is set remove useless checks in queue setup
> functions.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  drivers/media/test-drivers/visl/visl-dec.c         | 4 ++--
>  drivers/media/test-drivers/vivid/vivid-meta-cap.c  | 3 ---
>  drivers/media/test-drivers/vivid/vivid-meta-out.c  | 5 +++--
>  drivers/media/test-drivers/vivid/vivid-touch-cap.c | 5 +++--
>  drivers/media/test-drivers/vivid/vivid-vbi-cap.c   | 5 +++--
>  drivers/media/test-drivers/vivid/vivid-vbi-out.c   | 5 +++--
>  drivers/media/test-drivers/vivid/vivid-vid-cap.c   | 5 +++--
>  drivers/media/test-drivers/vivid/vivid-vid-out.c   | 5 +----
>  8 files changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/test-drivers/visl/visl-dec.c
> index ba20ea998d19..4672dc5e52bb 100644
> --- a/drivers/media/test-drivers/visl/visl-dec.c
> +++ b/drivers/media/test-drivers/visl/visl-dec.c
> @@ -287,7 +287,7 @@ static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
>  	frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
>  
>  	len = 0;
> -	for (i = 0; i < out_q->num_buffers; i++) {
> +	for (i = 0; i < vb2_get_num_buffers(out_q); i++) {
>  		char entry[] = "index: %u, state: %s, request_fd: %d, ";
>  		u32 old_len = len;
>  		struct vb2_buffer *vb2;
> @@ -347,7 +347,7 @@ static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
>  	frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
>  
>  	len = 0;
> -	for (i = 0; i < cap_q->num_buffers; i++) {
> +	for (i = 0; i < vb2_get_num_buffers(cap_q); i++) {
>  		u32 old_len = len;
>  		struct vb2_buffer *vb2;
>  		char *q_status;
> diff --git a/drivers/media/test-drivers/vivid/vivid-meta-cap.c b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
> index 780f96860a6d..0a718d037e59 100644
> --- a/drivers/media/test-drivers/vivid/vivid-meta-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
> @@ -30,9 +30,6 @@ static int meta_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  		sizes[0] = size;
>  	}
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> -
>  	*nplanes = 1;
>  	return 0;
>  }
> diff --git a/drivers/media/test-drivers/vivid/vivid-meta-out.c b/drivers/media/test-drivers/vivid/vivid-meta-out.c
> index 95835b52b58f..4a569a6e58be 100644
> --- a/drivers/media/test-drivers/vivid/vivid-meta-out.c
> +++ b/drivers/media/test-drivers/vivid/vivid-meta-out.c
> @@ -18,6 +18,7 @@ static int meta_out_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  				struct device *alloc_devs[])
>  {
>  	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	unsigned int size =  sizeof(struct vivid_meta_out_buf);
>  
>  	if (!vivid_is_webcam(dev))
> @@ -30,8 +31,8 @@ static int meta_out_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  		sizes[0] = size;
>  	}
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;
>  
>  	*nplanes = 1;
>  	return 0;
> diff --git a/drivers/media/test-drivers/vivid/vivid-touch-cap.c b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
> index c7f6e23df51e..4b3c6ea0afde 100644
> --- a/drivers/media/test-drivers/vivid/vivid-touch-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
> @@ -13,6 +13,7 @@ static int touch_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  				 struct device *alloc_devs[])
>  {
>  	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	struct v4l2_pix_format *f = &dev->tch_format;
>  	unsigned int size = f->sizeimage;
>  
> @@ -23,8 +24,8 @@ static int touch_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  		sizes[0] = size;
>  	}
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;
>  
>  	*nplanes = 1;
>  	return 0;
> diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
> index b65b02eeeb97..fcd7f40385e9 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
> @@ -124,6 +124,7 @@ static int vbi_cap_queue_setup(struct vb2_queue *vq,
>  		       unsigned sizes[], struct device *alloc_devs[])
>  {
>  	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	bool is_60hz = dev->std_cap[dev->input] & V4L2_STD_525_60;
>  	unsigned size = vq->type == V4L2_BUF_TYPE_SLICED_VBI_CAPTURE ?
>  		36 * sizeof(struct v4l2_sliced_vbi_data) :
> @@ -134,8 +135,8 @@ static int vbi_cap_queue_setup(struct vb2_queue *vq,
>  
>  	sizes[0] = size;
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;

min_buffers_needed is 2 for vbi_cap, so this can be dropped.

>  
>  	*nplanes = 1;
>  	return 0;
> diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-out.c b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
> index cd56476902a2..8f0da5d88bcc 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vbi-out.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
> @@ -20,6 +20,7 @@ static int vbi_out_queue_setup(struct vb2_queue *vq,
>  		       unsigned sizes[], struct device *alloc_devs[])
>  {
>  	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	bool is_60hz = dev->std_out & V4L2_STD_525_60;
>  	unsigned size = vq->type == V4L2_BUF_TYPE_SLICED_VBI_OUTPUT ?
>  		36 * sizeof(struct v4l2_sliced_vbi_data) :
> @@ -30,8 +31,8 @@ static int vbi_out_queue_setup(struct vb2_queue *vq,
>  
>  	sizes[0] = size;
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;

Ditto.

>  
>  	*nplanes = 1;
>  	return 0;
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> index 3a06df35a2d7..0cc7602b9fb2 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> @@ -77,6 +77,7 @@ static int vid_cap_queue_setup(struct vb2_queue *vq,
>  		       unsigned sizes[], struct device *alloc_devs[])
>  {
>  	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	unsigned buffers = tpg_g_buffers(&dev->tpg);
>  	unsigned h = dev->fmt_cap_rect.height;
>  	unsigned p;
> @@ -117,8 +118,8 @@ static int vid_cap_queue_setup(struct vb2_queue *vq,
>  					dev->fmt_cap->data_offset[p];
>  	}
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;

Ditto.

>  
>  	*nplanes = buffers;
>  
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
> index 184a6df2c29f..24c6dc896255 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
> @@ -73,12 +73,9 @@ static int vid_out_queue_setup(struct vb2_queue *vq,
>  				       vfmt->data_offset[p] : size;
>  	}
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> -
>  	*nplanes = planes;
>  
> -	dprintk(dev, 1, "%s: count=%d\n", __func__, *nbuffers);
> +	dprintk(dev, 1, "%s: count=%u\n", __func__, vb2_get_num_buffers(vq));
>  	for (p = 0; p < planes; p++)
>  		dprintk(dev, 1, "%s: size[%u]=%u\n", __func__, p, sizes[p]);
>  	return 0;

Regards,

	Hans
