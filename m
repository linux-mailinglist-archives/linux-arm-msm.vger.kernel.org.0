Return-Path: <linux-arm-msm+bounces-258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ED27E67B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3E701C2092A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 10:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB1F1865E;
	Thu,  9 Nov 2023 10:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="S7hKjWNq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CB7182CC
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 10:18:54 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9B810A;
	Thu,  9 Nov 2023 02:18:54 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 400616601F0E;
	Thu,  9 Nov 2023 10:18:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699525132;
	bh=KpcH3p7Di0WfpDAec7/coHT3wwJ2tMCcKVBEP9IvkxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S7hKjWNqdY4+kEYTV3fHYECTnId1ck6/Q8VjUtOzsTzCur5OxfLGsk8FZafnsHbHQ
	 dhKL/PrZE9qssX7AgYWZfg+dKczsNmmn5FCQceo9tR1XilOCt2tcsDotyc0s+zXCKX
	 lLdKPcVjh27J/oRLsGMb83WQXLuxrMulequvQfVkPOTiB+8Kj7cCk5o/y5JW/hRByM
	 83wxC67EdZ+CTVjPH9WXNEZI7ahrP+eIu95J/BgcQL0tIjZIN3PC1je2T3KkcbTrqN
	 +215fO6cvTMxZdmc1K6xyr3EzUUi2TbgR/qD6BasIsWFBVCP/BqWf+04jHKXe55EOE
	 tEs96G0UWbtTA==
Message-ID: <683359b7-bab4-4eef-a047-c3dc1a04f9d6@collabora.com>
Date: Thu, 9 Nov 2023 11:18:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 26/56] media: i2c: video-i2c: Stop direct calls to
 queue num_buffers field
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
 Matt Ranostay <matt.ranostay@konsulko.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-27-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-27-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Benjamin,

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Matt Ranostay <matt.ranostay@konsulko.com>
> ---
>   drivers/media/i2c/video-i2c.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> index 178bd06cc2ed..ebf2ac98a068 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -405,9 +405,10 @@ static int queue_setup(struct vb2_queue *vq,
>   {
>   	struct video_i2c_data *data = vb2_get_drv_priv(vq);
>   	unsigned int size = data->chip->buffer_size;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;

This actually changes the logic. Maybe it has already been discussed and
the result of that discussion is this change in logic? Looking at other
drivers *nbuffers = 2 - q_num_bufs; seems the right thing to do.
But then at least the commit message body IMO should mention this change.
Or, preferably, the change in logic should be a separate patch to be applied
before this one.

Regards,

Andrzej

>   
>   	if (*nplanes)
>   		return sizes[0] < size ? -EINVAL : 0;


