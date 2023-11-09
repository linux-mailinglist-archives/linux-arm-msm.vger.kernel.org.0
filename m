Return-Path: <linux-arm-msm+bounces-232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1311E7E6699
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 10:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1683280FFE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 09:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EB211C8A;
	Thu,  9 Nov 2023 09:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d7i3viPT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC60B11C92
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 09:23:07 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC472139;
	Thu,  9 Nov 2023 01:23:07 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CA8AD6607410;
	Thu,  9 Nov 2023 09:23:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699521786;
	bh=79QW7iQquBnwYm14N3AIvehKWVXP1fEi05nVMlo3R2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d7i3viPTau1TXKkUDV057Kz7FIJc20TwGqpUXPN+RkCqA1YQ3Tm6xQQbJTKXbrGk7
	 vDybVoh3QyJP++z4JQrE7N5ofEZhnFMCP4NPewB8oI6+6QvA2gEWidVxXZh0YackUg
	 d3SkTIWIUe3tGLxgwnFadAiSuq0bRQVUQ6OjhZz/JbKfsaUuA4aRa7fhSu4PkrAdP9
	 uMZsnimIy3G6B/BMeub95Bk+EN7LtM8m6Q/iKTrnobb2jkAeue+VYticlFOdZlx3Sk
	 EGMRuhtS2jn2RN2fJRVWJcyHl7TTombrj3pnJKbUtEHRzuJHDRwWbUW2o+jefxNNVw
	 wjGXQQbgfVWrg==
Message-ID: <aca318c9-8d6d-4c04-afdf-8eacb80f79d8@collabora.com>
Date: Thu, 9 Nov 2023 10:23:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 13/56] media: mediatek: vcodec: Stop direct calls to
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
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-14-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-14-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry for the noise, I made a typo in my email address. Resending with a proper one.

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Bin Liu <bin.liu@mediatek.com>
> CC: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>   drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> index eb381fa6e7d1..181884e798fd 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> @@ -912,7 +912,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>   	return 0;
>   
>   err_start_stream:
> -	for (i = 0; i < q->num_buffers; ++i) {
> +	for (i = 0; i < vb2_get_num_buffers(q); ++i) {
>   		struct vb2_buffer *buf = vb2_get_buffer(q, i);
>   
>   		/*


