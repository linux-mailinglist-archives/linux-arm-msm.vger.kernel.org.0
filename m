Return-Path: <linux-arm-msm+bounces-261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 111617E67F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE6C1281278
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 10:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC55518E33;
	Thu,  9 Nov 2023 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BAtkW3nS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE0B18E29
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 10:26:48 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702C5325C;
	Thu,  9 Nov 2023 02:26:47 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D2D08660747A;
	Thu,  9 Nov 2023 10:26:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699525606;
	bh=jAf4h4sgiviqaZEssAa8sbH54nGXtCyoEsIxJZmdzJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BAtkW3nSb+sNgx50yyTGQ9U2c9crSZN5E5WHdG/IQfT68/C3wCDJZHuQbBmCy+ojN
	 3MglN24Kx8MUhPiz2uKGyX9I7yJW0HF+t3NBQ44/k+ZaP8e/sGKIpaEg++Ki7s4Grj
	 Hucv6gCSDbUabTKvIcvgKVlTq2AUmcQ1mAWUdzrBle1PyHMbpMjMVwekITmwxNXzfJ
	 i9TnEvwkN6dSprJKaqi6DaMXA+JUn7WVkof8qqKukLUGF2PvZCf8BFvW3cLByi/xws
	 rpFiyas46Oi/pfNv9COmYd4k2fyU0z49KifjM9H7Jjm1nDMjWn6EoTj3reTTZ3cZ7g
	 ms+dUVLdOPA/w==
Message-ID: <1a25ef8e-4e72-4915-b9f1-d6477bbd2e21@collabora.com>
Date: Thu, 9 Nov 2023 11:26:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 28/56] media: nxp: Stop direct calls to queue
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
 Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-29-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-29-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewcz <andrzej.p@collabora.com>

> CC: Rui Miguel Silva <rmfrfs@gmail.com>
> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> CC: Martin Kepplinger <martink@posteo.de>
> ---
>   drivers/media/platform/nxp/imx7-media-csi.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 15049c6aab37..4c467fb82789 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1245,6 +1245,7 @@ static int imx7_csi_video_queue_setup(struct vb2_queue *vq,
>   				      struct device *alloc_devs[])
>   {
>   	struct imx7_csi *csi = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   	struct v4l2_pix_format *pix = &csi->vdev_fmt;
>   	unsigned int count = *nbuffers;
>   
> @@ -1254,14 +1255,14 @@ static int imx7_csi_video_queue_setup(struct vb2_queue *vq,
>   	if (*nplanes) {
>   		if (*nplanes != 1 || sizes[0] < pix->sizeimage)
>   			return -EINVAL;
> -		count += vq->num_buffers;
> +		count += q_num_bufs;
>   	}
>   
>   	count = min_t(__u32, IMX7_CSI_VIDEO_MEM_LIMIT / pix->sizeimage, count);
>   
>   	if (*nplanes)
> -		*nbuffers = (count < vq->num_buffers) ? 0 :
> -			count - vq->num_buffers;
> +		*nbuffers = (count < q_num_bufs) ? 0 :
> +			count - q_num_bufs;
>   	else
>   		*nbuffers = count;
>   


