Return-Path: <linux-arm-msm+bounces-263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 414B87E6807
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED7132810E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 10:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7902019440;
	Thu,  9 Nov 2023 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VduSF+4j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C318E29
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 10:28:53 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336F79E;
	Thu,  9 Nov 2023 02:28:53 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 96104660747A;
	Thu,  9 Nov 2023 10:28:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699525731;
	bh=YUI2716BL9MVVQKR0wOZgCkV9ZOFJ6M0hDxDFXWF8Os=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VduSF+4jFjCIiOCw9PdW4Xm9Hk4QGuGR5xTJ46FG+sS1ktnWtunI7b3tg/OqJUIPa
	 CuMwLN1yJisi8JFrb2oFENwUbCmWBKLb1Z/JLpAoMd2qfHCKRw2Hzr5RfAI2MqSAIE
	 uu+mi6eZpgyvFbmwviQUyIfssORhuPElWeooCByiYm7A0aOzYdipB8ZrOaKTr9V6Pc
	 90LWux9RryGgf/ag0l7/BfZoETFy1RY+igfM/q0qsWFi2eTxS0qBv9gVOvzGsbLnI8
	 u+KRjmP/Xtn1QtyMmKM3uoQ99HFgGYgBHGdazZZKdfZ+CAo29Hr//67/FMEN736MLB
	 if7F4ggybw02g==
Message-ID: <919d0ff4-2e8b-4481-970c-5b9aa0f882bb@collabora.com>
Date: Thu, 9 Nov 2023 11:28:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 29/56] media: verisilicon: Stop direct calls to queue
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
 <20231031163104.112469-30-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-30-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>   drivers/media/platform/verisilicon/hantro_postproc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
> index 64d6fb852ae9..8f8f17e671ce 100644
> --- a/drivers/media/platform/verisilicon/hantro_postproc.c
> +++ b/drivers/media/platform/verisilicon/hantro_postproc.c
> @@ -195,7 +195,7 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
>   	struct hantro_dev *vpu = ctx->dev;
>   	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
>   	struct vb2_queue *cap_queue = &m2m_ctx->cap_q_ctx.q;
> -	unsigned int num_buffers = cap_queue->num_buffers;
> +	unsigned int num_buffers = vb2_get_num_buffers(cap_queue);
>   	struct v4l2_pix_format_mplane pix_mp;
>   	const struct hantro_fmt *fmt;
>   	unsigned int i, buf_size;


