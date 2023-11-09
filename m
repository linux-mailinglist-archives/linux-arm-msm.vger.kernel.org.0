Return-Path: <linux-arm-msm+bounces-283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D307E69C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 12:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 553541F2130F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAD71A72E;
	Thu,  9 Nov 2023 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="c2HZJPMU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430661A72B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 11:35:09 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05AC1991;
	Thu,  9 Nov 2023 03:35:08 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D3ED6607421;
	Thu,  9 Nov 2023 11:35:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699529707;
	bh=wGG+JYaee46Jc94cdQPHhrwgWxti1g7uR47NXJMRWPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c2HZJPMU+RJlp9bGpU/z/4TDFlnLjBdWVnSHnQ/RzeERzo16ueDJWzTkwclEBsg2Z
	 dZt+YphS4hO6SgU5kizdOR+bIwXd7QQCM+IMcGQoAiiethCYZLoPylhihnExZZTk+t
	 xJ50alw3c6iuzotTobkKzmTDDP3DpyBIJT8MqExsmR05XAuI0i2L4Um0xp7d3TV6vc
	 xIGstsv0FC1BdjoOJ7m0U1McFFjQIwP/lmhfql6m3K+DYz5SCR573p3QCxCkTMNoxq
	 H42aquTBINLz3ywE7l3Ku5vFm9UGQ2StHfIncCHYn2z3BytaEu5zyUrcBTSC5z3SXx
	 HjSAMjR7Y6BSg==
Message-ID: <43985ffc-ca34-4051-8ae3-1d52c0337918@collabora.com>
Date: Thu, 9 Nov 2023 12:35:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 40/56] media: usb: cx231xx: Stop direct calls to queue
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
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-41-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-41-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   drivers/media/usb/cx231xx/cx231xx-417.c   | 5 +++--
>   drivers/media/usb/cx231xx/cx231xx-video.c | 5 +++--
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
> index fe4410a5e128..45973fe690b2 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-417.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-417.c
> @@ -1218,12 +1218,13 @@ static int queue_setup(struct vb2_queue *vq,
>   {
>   	struct cx231xx *dev = vb2_get_drv_priv(vq);
>   	unsigned int size = mpeglinesize * mpeglines;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	dev->ts1.ts_packet_size  = mpeglinesize;
>   	dev->ts1.ts_packet_count = mpeglines;
>   
> -	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
> -		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < CX231XX_MIN_BUF)
> +		*nbuffers = CX231XX_MIN_BUF - q_num_bufs;
>   
>   	if (*nplanes)
>   		return sizes[0] < size ? -EINVAL : 0;
> diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
> index e23b8ccd79d4..c8eb4222319d 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-video.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-video.c
> @@ -714,11 +714,12 @@ static int queue_setup(struct vb2_queue *vq,
>   		       unsigned int sizes[], struct device *alloc_devs[])
>   {
>   	struct cx231xx *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	dev->size = (dev->width * dev->height * dev->format->depth + 7) >> 3;
>   
> -	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
> -		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < CX231XX_MIN_BUF)
> +		*nbuffers = CX231XX_MIN_BUF - q_num_bufs;
>   
>   	if (*nplanes)
>   		return sizes[0] < dev->size ? -EINVAL : 0;


