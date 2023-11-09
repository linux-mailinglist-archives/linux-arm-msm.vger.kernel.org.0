Return-Path: <linux-arm-msm+bounces-268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BAB7E6965
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 12:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 521A51C20841
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06CB199C7;
	Thu,  9 Nov 2023 11:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LFpzg58q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53495199D0
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 11:18:06 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BEE2D5E;
	Thu,  9 Nov 2023 03:18:05 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C5E86607421;
	Thu,  9 Nov 2023 11:18:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699528684;
	bh=I504Z+CG3YiZx4Vj5jJplJQXnwlNFB6qyZMvx/v7OwQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LFpzg58qWNb9jJefSQAPJdRVV60nbfvp7R2wUIzcSIW2N9QkRCLFmKRwfrDgu8Alg
	 4W3q4maR60goIRKz1R9N53+n+g9fjlA4VtdRllKHxdLnpqywQtaROhkG13EPGidoqB
	 qDdL823VyFRpt7hNMzrpQQohW5EbNL1yYp868/cq75IGLDjkgBKloPw1BSC3ZxPMcy
	 UbnQRRIG+ax5xnlMokeOMPk/F7aispaGNIRmMwcOtuyFV8W3Al+k7TeZ/OR9II0HWJ
	 h7WSGoINBSqOTR7wId9VmZnEu2Ul/GxA5TqnW0fHMr0NYdHnUL2Qkkd0TOVO0Apd/a
	 K0BWxOR+w8cGQ==
Message-ID: <20023047-775a-4bd3-8bdb-932347e91c66@collabora.com>
Date: Thu, 9 Nov 2023 12:17:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 32/56] media: meson: vdec: Stop direct calls to queue
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
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-33-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-33-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/staging/media/meson/vdec/vdec.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index 219185aaa588..1e2369f104c8 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -167,22 +167,23 @@ static void process_num_buffers(struct vb2_queue *q,
>   				bool is_reqbufs)
>   {
>   	const struct amvdec_format *fmt_out = sess->fmt_out;
> -	unsigned int buffers_total = q->num_buffers + *num_buffers;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(q);
> +	unsigned int buffers_total = q_num_bufs + *num_buffers;
>   	u32 min_buf_capture = v4l2_ctrl_g_ctrl(sess->ctrl_min_buf_capture);
>   
> -	if (q->num_buffers + *num_buffers < min_buf_capture)
> -		*num_buffers = min_buf_capture - q->num_buffers;
> +	if (q_num_bufs + *num_buffers < min_buf_capture)
> +		*num_buffers = min_buf_capture - q_num_bufs;
>   	if (is_reqbufs && buffers_total < fmt_out->min_buffers)
> -		*num_buffers = fmt_out->min_buffers - q->num_buffers;
> +		*num_buffers = fmt_out->min_buffers - q_num_bufs;
>   	if (buffers_total > fmt_out->max_buffers)
> -		*num_buffers = fmt_out->max_buffers - q->num_buffers;
> +		*num_buffers = fmt_out->max_buffers - q_num_bufs;
>   
>   	/* We need to program the complete CAPTURE buffer list
>   	 * in registers during start_streaming, and the firmwares
>   	 * are free to choose any of them to write frames to. As such,
>   	 * we need all of them to be queued into the driver
>   	 */
> -	sess->num_dst_bufs = q->num_buffers + *num_buffers;
> +	sess->num_dst_bufs = q_num_bufs + *num_buffers;
>   	q->min_buffers_needed = max(fmt_out->min_buffers, sess->num_dst_bufs);
>   }
>   


