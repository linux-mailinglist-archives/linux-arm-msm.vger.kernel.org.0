Return-Path: <linux-arm-msm+bounces-194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F84B7E5BC1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 17:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4431F281346
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 16:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0334E1944D;
	Wed,  8 Nov 2023 16:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PmGxV2yy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EAD18C3A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 16:55:20 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29351BE2;
	Wed,  8 Nov 2023 08:55:19 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3B5B56607699;
	Wed,  8 Nov 2023 16:55:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699462518;
	bh=x0X3+hz1eLsm7RowObDnmSRMEbSmWS82Ri5R/c672DI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PmGxV2yyqYJ8vEh9UpWUC0nxLHF+0jH5ErcGBLcYoi2aIZ4ChTZ1LA3CAJxCLiPQ5
	 cSk2Tw2eO31X9c3EGfEUtn71/H6a6BAGOab8O2DIAKB3xWzLB/NbzjqEsUKAd3YqcV
	 moVeFO0HtyAYFSwkHdwRb/1ASUsFFxSjBtU6AwwN/fkLuGKkSnNzNjBBwF43v46OZ5
	 Qr8zmnwqcf8D3BluW3TuRmStKOHrsnghwQQ2BtquuNzh6dG8/CLuKfPu1V0zd0uGFB
	 66qkyJ4w08bxdxJLNTALH0L1CoqoNQ7lKcnoq/PCoHfcM7UCgRyK4Husut9wLMJsZ3
	 x4jQsFDAPXlqQ==
Message-ID: <be16b724-a8fb-4928-bff6-d95e1224bd20@collabora.com>
Date: Wed, 8 Nov 2023 17:55:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 09/56] media: amphion: Use vb2_get_buffer() instead of
 directly access to buffers array
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
 Zhou Peng <eagle.zhou@nxp.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-10-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-10-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_buffer() instead of direct access to the vb2_queue bufs array.
> This allows us to change the type of the bufs in the future.
> After each call to vb2_get_buffer() we need to be sure that we get
> a valid pointer so check the return value of all of them.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Ming Qian <ming.qian@nxp.com>
> CC: Zhou Peng <eagle.zhou@nxp.com>
> ---
>   drivers/media/platform/amphion/vpu_dbg.c | 22 ++++++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
> index 982c2c777484..a462d6fe4ea9 100644
> --- a/drivers/media/platform/amphion/vpu_dbg.c
> +++ b/drivers/media/platform/amphion/vpu_dbg.c
> @@ -140,11 +140,18 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
>   
>   	vq = v4l2_m2m_get_src_vq(inst->fh.m2m_ctx);
>   	for (i = 0; i < vq->num_buffers; i++) {
> -		struct vb2_buffer *vb = vq->bufs[i];
> -		struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +		struct vb2_buffer *vb;
> +		struct vb2_v4l2_buffer *vbuf;
> +
> +		vb = vb2_get_buffer(vq, i);
> +		if (!vb)
> +			continue;
>   
>   		if (vb->state == VB2_BUF_STATE_DEQUEUED)
>   			continue;
> +
> +		vbuf = to_vb2_v4l2_buffer(vb);
> +
>   		num = scnprintf(str, sizeof(str),
>   				"output [%2d] state = %10s, %8s\n",
>   				i, vb2_stat_name[vb->state],
> @@ -155,11 +162,18 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
>   
>   	vq = v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx);
>   	for (i = 0; i < vq->num_buffers; i++) {
> -		struct vb2_buffer *vb = vq->bufs[i];
> -		struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +		struct vb2_buffer *vb;
> +		struct vb2_v4l2_buffer *vbuf;
> +
> +		vb = vb2_get_buffer(vq, i);
> +		if (!vb)
> +			continue;
>   
>   		if (vb->state == VB2_BUF_STATE_DEQUEUED)
>   			continue;
> +
> +		vbuf = to_vb2_v4l2_buffer(vb);
> +
>   		num = scnprintf(str, sizeof(str),
>   				"capture[%2d] state = %10s, %8s\n",
>   				i, vb2_stat_name[vb->state],


