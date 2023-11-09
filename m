Return-Path: <linux-arm-msm+bounces-285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E387E69CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 12:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6975280FD9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A08199B9;
	Thu,  9 Nov 2023 11:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nkL9i3Il"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0970C1A72E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 11:37:17 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC622D76;
	Thu,  9 Nov 2023 03:37:16 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D800F660748C;
	Thu,  9 Nov 2023 11:37:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699529835;
	bh=wUHoc5zpet6eywYkyKBwFgxm3jsVkAzT68bGG5YHoIY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nkL9i3Il5m690763T3RMOIMD67YVb03EoPmOSqYCDXOlmo75ZLTIXKuy//GXgwLul
	 uHn26mhT0z35qefwsRtuufOwdrvykYJ8yyJxfdZYR35hTqHqOwkvo+PZqZNnqGsIbd
	 SU6USvy4GtCn+VvxmLwPKldxc/wQZo5JRJ7DozA1H1nunrbt4KeMQQersrLbciEYSn
	 WxOMSIeKEp8qJPfQRDgBgiJPjFO3xp+Xw2LSYJQOJJyVpdFFXAKd/Jy1k3El9zI0e9
	 PQj0GdJqxJ6wQZTY/33Fb8MpBnn2SFQNtLojwoPhM00+gFhQZMh5KLSVfO7ckAd9Mp
	 FBE0SBgZySLyA==
Message-ID: <71cfb62d-1ad0-41cf-ac7e-f0a9ac6fe926@collabora.com>
Date: Thu, 9 Nov 2023 12:37:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 42/56] media: usb: usbtv: Stop direct calls to queue
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
 <20231031163104.112469-43-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-43-benjamin.gaignard@collabora.com>
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
>   drivers/media/usb/usbtv/usbtv-video.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
> index 1e30e05953dc..62a583040cd4 100644
> --- a/drivers/media/usb/usbtv/usbtv-video.c
> +++ b/drivers/media/usb/usbtv/usbtv-video.c
> @@ -726,9 +726,10 @@ static int usbtv_queue_setup(struct vb2_queue *vq,
>   {
>   	struct usbtv *usbtv = vb2_get_drv_priv(vq);
>   	unsigned size = USBTV_CHUNK * usbtv->n_chunks * 2 * sizeof(u32);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;
>   	if (*nplanes)
>   		return sizes[0] < size ? -EINVAL : 0;
>   	*nplanes = 1;


