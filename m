Return-Path: <linux-arm-msm+bounces-253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4B37E6766
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9014FB20B71
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 10:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04209156FD;
	Thu,  9 Nov 2023 10:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aPdvntNY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D34156C1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 10:07:24 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A5030D2;
	Thu,  9 Nov 2023 02:07:24 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1479B6607435;
	Thu,  9 Nov 2023 10:07:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699524442;
	bh=2u4132PKQo/IFXxEHHXQCfjEEBtnpTKPKk3Jkg0X8BA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aPdvntNYeqjb+XoPa1QOJWzij5Diogua7gCy81chfR2XskUq1ILkXzf2tZRnG3JP7
	 phwa5ILJKXBUJNil2qBTzLotFJcrNeFLUPu1d7XoMzWtTPyFR1nLM6DwIxHdkvoj1/
	 Jp6XyNdh9JXMySrU9kpIB5DXb8A3RAHMx9n0kucsSkAZAzg9mkO+utTdnp+dE47s4z
	 uVauM1T92AGxYC5Vo2ibB5bJMDeIHosARg3QA0cjpXGm6PKhRK45DpdILnmtsPYnsf
	 mL5JH3wTXwWXQgMh75/hAjYMUUVm/cjfq6YltNYU97n0DQyVSdQAJouj849HgL22hl
	 WSSDwlp0gymLQ==
Message-ID: <c4f47aaa-d712-4905-b77d-6fe1b897d94b@collabora.com>
Date: Thu, 9 Nov 2023 11:07:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 23/56] media: pci: cx18: Stop direct calls to queue
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
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-24-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-24-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Sergey Kozlov <serjk@netup.ru>
> CC: Abylay Ospan <aospan@netup.ru>
> ---
>   drivers/media/pci/cx18/cx18-streams.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
> index 597472754c4c..cfbc4a907802 100644
> --- a/drivers/media/pci/cx18/cx18-streams.c
> +++ b/drivers/media/pci/cx18/cx18-streams.c
> @@ -104,6 +104,7 @@ static int cx18_queue_setup(struct vb2_queue *vq,
>   			    unsigned int *nbuffers, unsigned int *nplanes,
>   			    unsigned int sizes[], struct device *alloc_devs[])
>   {
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   	struct cx18_stream *s = vb2_get_drv_priv(vq);
>   	struct cx18 *cx = s->cx;
>   	unsigned int szimage;
> @@ -121,8 +122,8 @@ static int cx18_queue_setup(struct vb2_queue *vq,
>   	 * Let's request at least three buffers: two for the
>   	 * DMA engine and one for userspace.
>   	 */
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;
>   
>   	if (*nplanes) {
>   		if (*nplanes != 1 || sizes[0] < szimage)


