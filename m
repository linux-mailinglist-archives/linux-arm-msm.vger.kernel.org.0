Return-Path: <linux-arm-msm+bounces-272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E948C7E698B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 12:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CF0FB20C26
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9CB1A5AF;
	Thu,  9 Nov 2023 11:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b+9kQAiw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C4019BB1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 11:29:28 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC1B2D69;
	Thu,  9 Nov 2023 03:29:27 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 16C196607421;
	Thu,  9 Nov 2023 11:29:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699529366;
	bh=MbNXLia+jC7hLR3GZ2i7bjau3A6rpAnLgPDOnuSzDCA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b+9kQAiwNaExBK6WtWt4ggbc6a2sRS3psYkGAorlUhLSWPtH5rxieRN1SgFbmVkna
	 uWYH4S2KLRX/J9rp4KtO+ufMlyRaE4d49N6b2SnF7GrC7x8NdMfWgKfU+9V/IbEv11
	 KCi2qK8jc89URqTt0LrBrD4n0yDsLBCLzUS9ycG1JrqUchTFktA0rYow+gA1gFV4Oc
	 +zlMc2JiE2TvRHM7edTgA66BqUEgKOCnLBsq62N3DHykNVQaMgLdbxckeLjFLb7/sw
	 wIl/3GDcyTKABMTes1GiWFN9ffnerxmxbLPg1HixHSh9GqRt8NG9Kn6b7QUSErF/py
	 O0SDTZK3ws2HA==
Message-ID: <47aad456-30e8-4b42-bbe4-d40bd808d155@collabora.com>
Date: Thu, 9 Nov 2023 12:29:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 36/56] media: nuvoton: Stop direct calls to queue
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
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-37-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-37-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Joseph Liu <kwliu@nuvoton.com>
> CC: Marvin Lin <kflin@nuvoton.com>
> ---
>   drivers/media/platform/nuvoton/npcm-video.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
> index b9e6782f59b4..f9b4e36a5175 100644
> --- a/drivers/media/platform/nuvoton/npcm-video.c
> +++ b/drivers/media/platform/nuvoton/npcm-video.c
> @@ -393,7 +393,7 @@ static void npcm_video_free_diff_table(struct npcm_video *video)
>   	struct rect_list *tmp;
>   	unsigned int i;
>   
> -	for (i = 0; i < video->queue.num_buffers; i++) {
> +	for (i = 0; i < vb2_get_num_buffers(&video->queue); i++) {
>   		head = &video->list[i];
>   		list_for_each_safe(pos, nx, head) {
>   			tmp = list_entry(pos, struct rect_list, list);


