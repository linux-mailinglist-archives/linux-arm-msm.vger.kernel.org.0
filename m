Return-Path: <linux-arm-msm+bounces-259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A59C7E67CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA7411C20869
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 10:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB4118E32;
	Thu,  9 Nov 2023 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QUdgUF2f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A785B18E33
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 10:22:34 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F2C211B;
	Thu,  9 Nov 2023 02:22:33 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4FC5D660747A;
	Thu,  9 Nov 2023 10:22:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699525352;
	bh=5oMqGWhF9RtFUcxPr/fM8cd9uEm13ZIxqeJzzqdaq38=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QUdgUF2fKcDypDFObSyWWny1FqwVvon5uDJzoGpZq+KMdCfSY3qXuj2XKRdTAnXwE
	 Z2OykGhHE/8XWjFLhkXY70fLSUchYhHr6AoB/jIDQHD2RU16NgTzcq0jL29x8dYNVN
	 fwh7M7lDgp4Be+7/x+PkiF4FDjqJCtN2++4JRDUNJE4MJkyHYxRcdjw0PBdl3nU6wL
	 KLHVNGYfieNT8lWgn8kB2adh0Ati2sqyf7xH6kwkBjEdFAT45Eii+R68fOtByXen43
	 yQxhUqOZ5+f48amEfmHmeDGILb/mVcKRd1IGNec0+TOU8Hbk+YHlJUs+aEoZm1ovRH
	 iLw1fZ8gx9QtQ==
Message-ID: <9ffdd38e-4c79-45c4-a99a-327d36728f44@collabora.com>
Date: Thu, 9 Nov 2023 11:22:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 27/56] media: coda: Stop direct calls to queue
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
 <20231031163104.112469-28-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-28-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   drivers/media/platform/chips-media/coda-common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
> index cc4892129aaf..f1d85758f6dd 100644
> --- a/drivers/media/platform/chips-media/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda-common.c
> @@ -794,7 +794,7 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
>   
>   	if (vb2_is_busy(vq)) {
>   		v4l2_err(&ctx->dev->v4l2_dev, "%s: %s queue busy: %d\n",
> -			 __func__, v4l2_type_names[f->type], vq->num_buffers);
> +			 __func__, v4l2_type_names[f->type], vb2_get_num_buffers(vq));
>   		return -EBUSY;
>   	}
>   


