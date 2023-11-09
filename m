Return-Path: <linux-arm-msm+bounces-270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 049C27E6970
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 12:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A954228108B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B422199D0;
	Thu,  9 Nov 2023 11:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MHJMl57V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8649199D3
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 11:19:47 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7410C2D69;
	Thu,  9 Nov 2023 03:19:47 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0F597660745F;
	Thu,  9 Nov 2023 11:19:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699528786;
	bh=n5ME7SmWZNZRvgb0w3nunEyLQd4iUQAOH5nCJG6H6ik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MHJMl57VTOZfvON/Jp8Vvh0d3D0I2lnpz0lA/SZHcMhZTPxcKOwBQJFW4fVzLcrpS
	 McA9j84OjxTAJSEjibqMq8qdWfYbJTJT/I4+ksSJhRMngy7vUr9bJJbEkP5rdxGqnF
	 NX7TCLKHwe2QyCQ8gexteKddZ5poBYKdmq9PcOc9aptXnWiZbpO7JOJBkRsTwipSw3
	 5JUIAieQyeH+uM1rF1IN3UQWTO8T+TCg60qGufgYfQ11NExnXuDVD1VM1q4hF4jb+v
	 Om4itFV4xodHJkKXkN1VkJC8Wcae93BgNuSgj4U75MYrjhV3MJ19UkuwCJth7XkpM9
	 jfTrL0VrRLdrg==
Message-ID: <705dfab2-dbb5-44f2-b40b-c7d56945ba22@collabora.com>
Date: Thu, 9 Nov 2023 12:19:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 34/56] sample: v4l: Stop direct calls to queue
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
 <20231031163104.112469-35-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-35-benjamin.gaignard@collabora.com>
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
>   samples/v4l/v4l2-pci-skeleton.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/samples/v4l/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
> index a61f94db18d9..a65aa9d1e9da 100644
> --- a/samples/v4l/v4l2-pci-skeleton.c
> +++ b/samples/v4l/v4l2-pci-skeleton.c
> @@ -155,6 +155,7 @@ static int queue_setup(struct vb2_queue *vq,
>   		       unsigned int sizes[], struct device *alloc_devs[])
>   {
>   	struct skeleton *skel = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	skel->field = skel->format.field;
>   	if (skel->field == V4L2_FIELD_ALTERNATE) {
> @@ -167,8 +168,8 @@ static int queue_setup(struct vb2_queue *vq,
>   		skel->field = V4L2_FIELD_TOP;
>   	}
>   
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;
>   
>   	if (*nplanes)
>   		return sizes[0] < skel->format.sizeimage ? -EINVAL : 0;


