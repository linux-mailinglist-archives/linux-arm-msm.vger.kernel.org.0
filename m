Return-Path: <linux-arm-msm+bounces-282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 637CF7E69B8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 12:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D3811C20843
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B30E1A70F;
	Thu,  9 Nov 2023 11:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QsYIjutQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681431A714
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 11:33:29 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEAEF10A;
	Thu,  9 Nov 2023 03:33:28 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A420660745F;
	Thu,  9 Nov 2023 11:33:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699529607;
	bh=RL6tVdN786HzuIYtIKZ/wRgGAmwBs43mCyxPsiLz9tw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QsYIjutQbzLX8OoAaohFvDooKFHRyMfCxu9xhlBcvz5CbNb91+vOXg8w8EcIlJG2v
	 fL8sF04sDQIoXbiFxxnlcv0NCo1HT2FLF1FSrbER5jT6sO+WNC03usaXAklGtYXJk/
	 sOeENSxF+kI0zUHImHEaZOk60rpQ4EUoeQU6oTjuEPVh2ihRqV17M/O35sCrZF6JRb
	 dzwv9/KZuUctUWWijHZmYoH5leTYYPQFe/qJW0hvyAlDHjmrDxN1ELbwBrr763w1qw
	 l6axlxOUp/TY85dgPsY4CPCYS2w+2SlQuZBCNMb6mJEnTMT/XmCQNwrfkOya2KmXn0
	 buvlQTLD0uL2w==
Message-ID: <f0961dc1-3584-48f5-9c78-57543859ba53@collabora.com>
Date: Thu, 9 Nov 2023 12:33:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 39/56] media: usb: airspy: Stop direct calls to queue
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
 <20231031163104.112469-40-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-40-benjamin.gaignard@collabora.com>
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
>   drivers/media/usb/airspy/airspy.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
> index 462eb8423506..e24e655fb1db 100644
> --- a/drivers/media/usb/airspy/airspy.c
> +++ b/drivers/media/usb/airspy/airspy.c
> @@ -482,12 +482,13 @@ static int airspy_queue_setup(struct vb2_queue *vq,
>   		unsigned int *nplanes, unsigned int sizes[], struct device *alloc_devs[])
>   {
>   	struct airspy *s = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	dev_dbg(s->dev, "nbuffers=%d\n", *nbuffers);
>   
>   	/* Need at least 8 buffers */
> -	if (vq->num_buffers + *nbuffers < 8)
> -		*nbuffers = 8 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 8)
> +		*nbuffers = 8 - q_num_bufs;
>   	*nplanes = 1;
>   	sizes[0] = PAGE_ALIGN(s->buffersize);
>   


