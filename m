Return-Path: <linux-arm-msm+bounces-235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E1C7E66C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 10:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E78621F210D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 09:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D3123C8;
	Thu,  9 Nov 2023 09:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="S4rtDO/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4073C125C4
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 09:30:05 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B852525BC;
	Thu,  9 Nov 2023 01:30:04 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0D57B6607410;
	Thu,  9 Nov 2023 09:30:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699522203;
	bh=9DyG7QadW/ZB77/AoaK7eHY4Fj3oy5z9XOUorXxwg9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S4rtDO/y59Vlxzgq+9apsVQ+c0wLEonjrqKtts9FP/zBEeFqFUQ3t/yUeGkMA1NBl
	 mMGxINOPTbW55hhfHMMdk04M7yfVHd8dBtvbF+ExamdW7pYgsqohm+OyICXc7e1qRN
	 F75S7r/aXl7CECgk2bH2+sOPnQ+ik3eZdmKzxTAQtoYr7ZV81MSVYPfPunWB4jBEvS
	 MyNgISo6khl5tK1iS4f4Q4sIQqynZJKFH0YTq2CZTmlU1jyrfI6EvzHgcAqeinL8kI
	 xjxbqc3pGRoLPg3AhuajlyvcQmTmhO2CZjKcc+koKP1JXPV9v8OYqOPHAHgZ2ZSvDc
	 bKujPujjg4Gjw==
Message-ID: <1d9c20f8-9735-4957-b718-7e0835ba7096@collabora.com>
Date: Thu, 9 Nov 2023 10:29:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 14/56] media: sti: hva: Use vb2_get_buffer() instead
 of directly access to buffers array
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
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-15-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-15-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Benjamin,

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_buffer() instead of direct access to the vb2_queue bufs array.
> This allows us to change the type of the bufs in the future.
> After each call to vb2_get_buffer() we need to be sure that we get
> a valid pointer so check the return value of all of them.
> Remove index range test since it is done by vb2_get_buffer().

Actually, the patch uses vb2_get_buffer() instead of using vb2_get_buffer().
IOW vb2_get_buffer() continues to be used before and after this patch is applied.

I'd rather reformulate the commit message body to say that we remove
index check because it is already performed by vb2_get_buffer(), but
introduce a check for a NULL result.

Regards,

Andrzej

> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
> ---
>   drivers/media/platform/st/sti/hva/hva-v4l2.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
> index 3a848ca32a0e..cfe83e9dc01b 100644
> --- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
> +++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
> @@ -569,14 +569,11 @@ static int hva_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
>   		struct vb2_buffer *vb2_buf;
>   
>   		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, buf->type);
> -
> -		if (buf->index >= vq->num_buffers) {
> -			dev_dbg(dev, "%s buffer index %d out of range (%d)\n",
> -				ctx->name, buf->index, vq->num_buffers);
> +		vb2_buf = vb2_get_buffer(vq, buf->index);
> +		if (!vb2_buf) {
> +			dev_dbg(dev, "%s buffer index %d not found\n", ctx->name, buf->index);
>   			return -EINVAL;
>   		}
> -
> -		vb2_buf = vb2_get_buffer(vq, buf->index);
>   		stream = to_hva_stream(to_vb2_v4l2_buffer(vb2_buf));
>   		stream->bytesused = buf->bytesused;
>   	}


