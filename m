Return-Path: <linux-arm-msm+bounces-240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACF77E66EB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 10:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 725A2B20C45
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 09:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13824134B3;
	Thu,  9 Nov 2023 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h4x0LuYO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F36412B98
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 09:38:29 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09042702;
	Thu,  9 Nov 2023 01:38:28 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BC86F6607412;
	Thu,  9 Nov 2023 09:38:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699522707;
	bh=F5eCvJZp5ZHGYJ0Dg13WChawV85jAIVEdBjM+7DBShE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h4x0LuYOIAo1skdu7fwYrmP1EsAl9jR5pHuC5CcWQpO+v/63t7EkfqoA2gudh/Yjj
	 S4tR4kKJFm7JRr7UHiuvBE87TNfl2fRXQunZrLnuQr37bLIRn4MZziVHGYQ6Ku1tzc
	 gPGykHkUX2YwpeDjllD73G6KszY5cOMwgmtOMKKItNacwHlljXwzspmnOOnL45nu3/
	 zTCSab62P7WQD6F687rgUKZCmo4HdOOonhCr/GRtefEBgsZ7VBvOJnzYi2xVWsrq7k
	 Y0d46UD2AWp+hNaPQtsBkjOcuthgIcEgj0MhBf1cy9+earEuxW4fIJnjL3aGlxI8PB
	 GydHiHn8gkRAg==
Message-ID: <b812aae8-a600-433e-81ba-d330f40dce21@collabora.com>
Date: Thu, 9 Nov 2023 10:38:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 15/56] media: visl: Use vb2_get_buffer() instead of
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
 Daniel Almeida <daniel.almeida@collabora.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-16-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-16-benjamin.gaignard@collabora.com>
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

> CC: Daniel Almeida <daniel.almeida@collabora.com>
> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>   drivers/media/test-drivers/visl/visl-dec.c | 28 ++++++++++++++++------
>   1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/test-drivers/visl/visl-dec.c
> index 318d675e5668..ba20ea998d19 100644
> --- a/drivers/media/test-drivers/visl/visl-dec.c
> +++ b/drivers/media/test-drivers/visl/visl-dec.c
> @@ -290,13 +290,20 @@ static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
>   	for (i = 0; i < out_q->num_buffers; i++) {
>   		char entry[] = "index: %u, state: %s, request_fd: %d, ";
>   		u32 old_len = len;
> -		char *q_status = visl_get_vb2_state(out_q->bufs[i]->state);
> +		struct vb2_buffer *vb2;
> +		char *q_status;
> +
> +		vb2 = vb2_get_buffer(out_q, i);
> +		if (!vb2)
> +			continue;
> +
> +		q_status = visl_get_vb2_state(vb2->state);
>   
>   		len += scnprintf(&buf[len], TPG_STR_BUF_SZ - len,
>   				 entry, i, q_status,
> -				 to_vb2_v4l2_buffer(out_q->bufs[i])->request_fd);
> +				 to_vb2_v4l2_buffer(vb2)->request_fd);
>   
> -		len += visl_fill_bytesused(to_vb2_v4l2_buffer(out_q->bufs[i]),
> +		len += visl_fill_bytesused(to_vb2_v4l2_buffer(vb2),
>   					   &buf[len],
>   					   TPG_STR_BUF_SZ - len);
>   
> @@ -342,13 +349,20 @@ static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
>   	len = 0;
>   	for (i = 0; i < cap_q->num_buffers; i++) {
>   		u32 old_len = len;
> -		char *q_status = visl_get_vb2_state(cap_q->bufs[i]->state);
> +		struct vb2_buffer *vb2;
> +		char *q_status;
> +
> +		vb2 = vb2_get_buffer(cap_q, i);
> +		if (!vb2)
> +			continue;
> +
> +		q_status = visl_get_vb2_state(vb2->state);
>   
>   		len += scnprintf(&buf[len], TPG_STR_BUF_SZ - len,
>   				 "index: %u, status: %s, timestamp: %llu, is_held: %d",
> -				 cap_q->bufs[i]->index, q_status,
> -				 cap_q->bufs[i]->timestamp,
> -				 to_vb2_v4l2_buffer(cap_q->bufs[i])->is_held);
> +				 vb2->index, q_status,
> +				 vb2->timestamp,
> +				 to_vb2_v4l2_buffer(vb2)->is_held);
>   
>   		tpg_gen_text(&ctx->tpg, basep, line++ * line_height, 16, &buf[old_len]);
>   		frame_dprintk(ctx->dev, run->dst->sequence, "%s", &buf[old_len]);


