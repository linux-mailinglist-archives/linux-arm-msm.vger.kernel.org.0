Return-Path: <linux-arm-msm+bounces-267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD48C7E6955
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 12:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE5701C20939
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586B4134DB;
	Thu,  9 Nov 2023 11:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kJpNuahc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CD4199B4
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 11:12:32 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58CD2D5E;
	Thu,  9 Nov 2023 03:12:31 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 39CA8660741E;
	Thu,  9 Nov 2023 11:12:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699528350;
	bh=kjznN3RZO4AREL4Gg9y4Yf3GgjVsJaN4QypN6NO9UfM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kJpNuahcdwBQR70WBWuPjvdfDbzzSvYEhaMNLUDTys2nMOx5sE6RUaiTiDu4ux6b0
	 vxNe3EsE0h17in/Rv4NeesbTIU7W6j4bzBz4qTeqF1auLHvpVum48UK+4yCV1M82Y4
	 BGCJO2me9W1YHyYpU1oCMOZ08elF9L2uZPDgghMk8/z0xe6ts4nAz3bgVHu21Ba/lr
	 A3Sj1MhjunmP3xsRnOKoIyzjXny4T7jd0N2ZQvFApOXNhCqeK8c6cIQF434RFYX5S7
	 1DsDF5m/7BJB51VSUeBJ7UseMl1uDU7SFNeiFo3VB/mJM8dH/BSI3FbOgBY1b3r179
	 2RxaEXOZL4z3A==
Message-ID: <31a67704-373a-407e-88c7-e079c7260e82@collabora.com>
Date: Thu, 9 Nov 2023 12:12:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 31/56] media: imx: Stop direct calls to queue
 num_buffers field
Content-Language: en-US
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Steve Longerbeam <slongerbeam@gmail.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-32-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-32-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Steve Longerbeam <slongerbeam@gmail.com>
> CC: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   drivers/staging/media/imx/imx-media-capture.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index 4846078315ff..ce02199e7b1b 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -605,6 +605,7 @@ static int capture_queue_setup(struct vb2_queue *vq,
>   {
>   	struct capture_priv *priv = vb2_get_drv_priv(vq);
>   	struct v4l2_pix_format *pix = &priv->vdev.fmt;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   	unsigned int count = *nbuffers;
>   
>   	if (vq->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> @@ -613,14 +614,14 @@ static int capture_queue_setup(struct vb2_queue *vq,
>   	if (*nplanes) {
>   		if (*nplanes != 1 || sizes[0] < pix->sizeimage)
>   			return -EINVAL;
> -		count += vq->num_buffers;
> +		count += q_num_bufs;
>   	}
>   
>   	count = min_t(__u32, VID_MEM_LIMIT / pix->sizeimage, count);
>   
>   	if (*nplanes)
> -		*nbuffers = (count < vq->num_buffers) ? 0 :
> -			count - vq->num_buffers;
> +		*nbuffers = (count < q_num_bufs) ? 0 :
> +			count - q_num_bufs;
>   	else
>   		*nbuffers = count;
>   


