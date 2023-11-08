Return-Path: <linux-arm-msm+bounces-185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A887E59FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 16:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 602A1B20C68
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 15:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA6A3033F;
	Wed,  8 Nov 2023 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="djJXzGdn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF963033E
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 15:26:56 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476231AE;
	Wed,  8 Nov 2023 07:26:56 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AF8A6660768F;
	Wed,  8 Nov 2023 15:26:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699457214;
	bh=QqlLL9kNrk/fbeVq2Dqeqlod3Fg3sLGKscFWcTHXcHM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=djJXzGdnzSXimNfjLl5Qq7zcOFrzuXbckNeGqyn/cx6amD5E2DCW9Ogn/QqWjal9G
	 hAjYq0elviVxHaE8IpVZzAhs6qQlHXyYWRMOTV3TKY758VD66dAFaUesdsSjalhgGb
	 8RCVBe6fOuIrNY7xpuR+QpvliOXqKL3o1TkXVuCECGBvzNCs7+Jfogo5gtPwD9jC5t
	 l/RiBmUA0u2/ibdRE7muc0U4fTJNzLMfpb7UslrXOvJxUorVVmwHz28zhnEWlAIZeh
	 gQIELt6IrzXAa2MeG3J5aqdMBfnVQdGuCAa2ll+1a2dJb3RrgG8bV8Pc4V5wjlXMUn
	 GHDTJxBJWuYSw==
Message-ID: <c460d3d0-792a-4daf-8f95-9005e24261a1@collabora.com>
Date: Wed, 8 Nov 2023 16:26:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 03/56] media: videobuf2: Stop spamming kernel log with
 all queue counter
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
 <20231031163104.112469-4-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-4-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Only report unbalanced queue counters do avoid spamming kernel log
> with useless information.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   .../media/common/videobuf2/videobuf2-core.c   | 79 +++++++++++--------
>   1 file changed, 44 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 09be8e026044..47dba2a20d73 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -533,25 +533,26 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
>   
>   #ifdef CONFIG_VIDEO_ADV_DEBUG
>   	/*
> -	 * Check that all the calls were balances during the life-time of this
> -	 * queue. If not (or if the debug level is 1 or up), then dump the
> -	 * counters to the kernel log.
> +	 * Check that all the calls were balanced during the life-time of this
> +	 * queue. If not then dump the counters to the kernel log.
>   	 */
>   	if (q->num_buffers) {
>   		bool unbalanced = q->cnt_start_streaming != q->cnt_stop_streaming ||
>   				  q->cnt_prepare_streaming != q->cnt_unprepare_streaming ||
>   				  q->cnt_wait_prepare != q->cnt_wait_finish;
>   
> -		if (unbalanced || debug) {
> -			pr_info("counters for queue %p:%s\n", q,
> -				unbalanced ? " UNBALANCED!" : "");
> -			pr_info("     setup: %u start_streaming: %u stop_streaming: %u\n",
> -				q->cnt_queue_setup, q->cnt_start_streaming,
> -				q->cnt_stop_streaming);
> -			pr_info("     prepare_streaming: %u unprepare_streaming: %u\n",
> -				q->cnt_prepare_streaming, q->cnt_unprepare_streaming);
> -			pr_info("     wait_prepare: %u wait_finish: %u\n",
> -				q->cnt_wait_prepare, q->cnt_wait_finish);
> +		if (unbalanced) {
> +			pr_info("unbalanced counters for queue %p:\n", q);
> +			if (q->cnt_start_streaming != q->cnt_stop_streaming)
> +				pr_info("     setup: %u start_streaming: %u stop_streaming: %u\n",
> +					q->cnt_queue_setup, q->cnt_start_streaming,
> +					q->cnt_stop_streaming);
> +			if (q->cnt_prepare_streaming != q->cnt_unprepare_streaming)
> +				pr_info("     prepare_streaming: %u unprepare_streaming: %u\n",
> +					q->cnt_prepare_streaming, q->cnt_unprepare_streaming);
> +			if (q->cnt_wait_prepare != q->cnt_wait_finish)
> +				pr_info("     wait_prepare: %u wait_finish: %u\n",
> +					q->cnt_wait_prepare, q->cnt_wait_finish);
>   		}
>   		q->cnt_queue_setup = 0;
>   		q->cnt_wait_prepare = 0;
> @@ -572,29 +573,37 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
>   				  vb->cnt_buf_prepare != vb->cnt_buf_finish ||
>   				  vb->cnt_buf_init != vb->cnt_buf_cleanup;
>   
> -		if (unbalanced || debug) {
> -			pr_info("   counters for queue %p, buffer %d:%s\n",
> -				q, buffer, unbalanced ? " UNBALANCED!" : "");
> -			pr_info("     buf_init: %u buf_cleanup: %u buf_prepare: %u buf_finish: %u\n",
> -				vb->cnt_buf_init, vb->cnt_buf_cleanup,
> -				vb->cnt_buf_prepare, vb->cnt_buf_finish);
> -			pr_info("     buf_out_validate: %u buf_queue: %u buf_done: %u buf_request_complete: %u\n",
> -				vb->cnt_buf_out_validate, vb->cnt_buf_queue,
> -				vb->cnt_buf_done, vb->cnt_buf_request_complete);
> -			pr_info("     alloc: %u put: %u prepare: %u finish: %u mmap: %u\n",
> -				vb->cnt_mem_alloc, vb->cnt_mem_put,
> -				vb->cnt_mem_prepare, vb->cnt_mem_finish,
> -				vb->cnt_mem_mmap);
> -			pr_info("     get_userptr: %u put_userptr: %u\n",
> -				vb->cnt_mem_get_userptr, vb->cnt_mem_put_userptr);
> -			pr_info("     attach_dmabuf: %u detach_dmabuf: %u map_dmabuf: %u unmap_dmabuf: %u\n",
> -				vb->cnt_mem_attach_dmabuf, vb->cnt_mem_detach_dmabuf,
> -				vb->cnt_mem_map_dmabuf, vb->cnt_mem_unmap_dmabuf);
> -			pr_info("     get_dmabuf: %u num_users: %u vaddr: %u cookie: %u\n",
> +		if (unbalanced) {
> +			pr_info("unbalanced counters for queue %p, buffer %d:\n",
> +				q, buffer);
> +			if (vb->cnt_buf_init != vb->cnt_buf_cleanup)
> +				pr_info("     buf_init: %u buf_cleanup: %u\n",
> +					vb->cnt_buf_init, vb->cnt_buf_cleanup);
> +			if (vb->cnt_buf_prepare != vb->cnt_buf_finish)
> +				pr_info("     buf_prepare: %u buf_finish: %u\n",
> +					vb->cnt_buf_prepare, vb->cnt_buf_finish);
> +			if (vb->cnt_buf_queue != vb->cnt_buf_done)
> +				pr_info("     buf_out_validate: %u buf_queue: %u buf_done: %u buf_request_complete: %u\n",
> +					vb->cnt_buf_out_validate, vb->cnt_buf_queue,
> +					vb->cnt_buf_done, vb->cnt_buf_request_complete);
> +			if (vb->cnt_mem_alloc != vb->cnt_mem_put)
> +				pr_info("     alloc: %u put: %u\n",
> +					vb->cnt_mem_alloc, vb->cnt_mem_put);
> +			if (vb->cnt_mem_prepare != vb->cnt_mem_finish)
> +				pr_info("     prepare: %u finish: %u\n",
> +					vb->cnt_mem_prepare, vb->cnt_mem_finish);
> +			if (vb->cnt_mem_get_userptr != vb->cnt_mem_put_userptr)
> +				pr_info("     get_userptr: %u put_userptr: %u\n",
> +					vb->cnt_mem_get_userptr, vb->cnt_mem_put_userptr);
> +			if (vb->cnt_mem_attach_dmabuf != vb->cnt_mem_detach_dmabuf)
> +				pr_info("     attach_dmabuf: %u detach_dmabuf: %u\n",
> +					vb->cnt_mem_attach_dmabuf, vb->cnt_mem_detach_dmabuf);
> +			if (vb->cnt_mem_map_dmabuf != vb->cnt_mem_unmap_dmabuf)
> +				pr_info("     map_dmabuf: %u unmap_dmabuf: %u\n",
> +					vb->cnt_mem_map_dmabuf, vb->cnt_mem_unmap_dmabuf);
> +			pr_info("     get_dmabuf: %u num_users: %u\n",
>   				vb->cnt_mem_get_dmabuf,
> -				vb->cnt_mem_num_users,
> -				vb->cnt_mem_vaddr,
> -				vb->cnt_mem_cookie);
> +				vb->cnt_mem_num_users);
>   		}
>   	}
>   #endif


