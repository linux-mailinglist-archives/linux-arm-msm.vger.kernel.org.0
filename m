Return-Path: <linux-arm-msm+bounces-254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9C47E6770
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 622A51C2092D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 10:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4120F15AC1;
	Thu,  9 Nov 2023 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k57Pw8VU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8441D156F6
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 10:09:12 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CEC62D51;
	Thu,  9 Nov 2023 02:09:12 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D8BE36607435;
	Thu,  9 Nov 2023 10:09:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699524550;
	bh=aeVeUG1Bv88ZjGIClWEmz4XfSpRJX1aTzaeyOElvMGM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k57Pw8VUIO6ZkT1V+3dq3Vyl9GislRp5LQvodV7d+URgmVEIDNpXN9d7t+HF5EzMq
	 Yo73slhYGCR1ij0YA4QTIdLGr+SSh+uVNPNV9XFNueAf7T6GnM6JltQ1Uj76v8Vgq2
	 vQI1O/z9aoW3sRmkXNX5hEsqPtSM34PYftnMU+v4h7neHTEFNX+AIoEWzV4/JdVSsz
	 rUpKP3CYxTn/HZGeBgYy2RWigK4Uj2NH8PZWclYaY900eKPsx9px7/554Ywb9RNcso
	 wnwDKwkJeEKRVIj1P34NgsSUq+eBiBMWzePVLkE/MLzEkCBqI01TJfx0t6cqjUbiUf
	 4TRJMeGzrP6+g==
Message-ID: <b3027a75-80e1-4583-a25b-5cb8523a1d8f@collabora.com>
Date: Thu, 9 Nov 2023 11:09:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 24/56] media: pci: netup_unidvb: Stop direct calls to
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
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-25-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-25-benjamin.gaignard@collabora.com>
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
>   drivers/media/pci/netup_unidvb/netup_unidvb_core.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
> index d85bfbb77a25..557985ba25db 100644
> --- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
> +++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
> @@ -293,12 +293,13 @@ static int netup_unidvb_queue_setup(struct vb2_queue *vq,
>   				    struct device *alloc_devs[])
>   {
>   	struct netup_dma *dma = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	dev_dbg(&dma->ndev->pci_dev->dev, "%s()\n", __func__);
>   
>   	*nplanes = 1;
> -	if (vq->num_buffers + *nbuffers < VIDEO_MAX_FRAME)
> -		*nbuffers = VIDEO_MAX_FRAME - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < VIDEO_MAX_FRAME)
> +		*nbuffers = VIDEO_MAX_FRAME - q_num_bufs;
>   	sizes[0] = PAGE_ALIGN(NETUP_DMA_PACKETS_COUNT * 188);
>   	dev_dbg(&dma->ndev->pci_dev->dev, "%s() nbuffers=%d sizes[0]=%d\n",
>   		__func__, *nbuffers, sizes[0]);


