Return-Path: <linux-arm-msm+bounces-229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5EC7E664F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 10:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1BC6280FA0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 09:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15BC1118A;
	Thu,  9 Nov 2023 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BfE5xHs8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BAD1118E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 09:10:24 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C89210E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 01:10:23 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6c4b06af98bso345867b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 01:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699521023; x=1700125823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=trb4MuQ6XLLHp9cbrU7Qhxh5OD3/4hryMzvH31htzlg=;
        b=BfE5xHs8SaXQXG0b9xYL59BZex2/UqiE11tZAi0CgLK7Ydexx4iCva8h+xgM0e9krJ
         ueCIcl+A8AUONksNUSdbecpH2Imox49H8q2vc/lz8fuOabf9zfvmLsERsMN3NSlYmD9u
         xufmGgtvftJXrnScHK2RugsszirDt7DCcdb8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699521023; x=1700125823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trb4MuQ6XLLHp9cbrU7Qhxh5OD3/4hryMzvH31htzlg=;
        b=as1vm7bngrcdjOcVmVpdhKFcK15gJLYNPqCCVGYeAlX9JXCkGR17SptJD6zAi8872H
         9WErmpH3dfhtOsLPFCAEkJcs1jjLUrLOUglkZv6GiQag3uyNre3MehQj10W1A3+twk1b
         EwoQ/vaXPdoa7vyvLh6YZ9J58sI1Hi1IH3vrQ8a7hsloY5oWEiD0FTxlf0gztjC1oqaD
         HGjnaGCNFs1Fr35tbq15d8lFdsJ2/5uBj7XwJkI9FcLnUosq5Sjp3H2j3Bf3KZPDcpjD
         RNHlO4TV5z/alT5Os75KPQy0ZN/MhW6UPpQScitTzduCBAtlQlUh4HZ1SD6LIZUWkS+V
         /7RA==
X-Gm-Message-State: AOJu0Yxpn9lROvB9/200ESG47hBpqLGjgwvilO86Hk2mBV/sB1mzY0uY
	/J4V3VahbtgixYJw556OTMUgDw==
X-Google-Smtp-Source: AGHT+IHeH9bwSDaqUzS/5j97Pi2uukXE85TheRG3ama6+WbfBb0l8z3y1v7unvrgCAzIC5YVZM0pcw==
X-Received: by 2002:a05:6a20:7493:b0:15d:e68d:a850 with SMTP id p19-20020a056a20749300b0015de68da850mr4661238pzd.29.1699521022894;
        Thu, 09 Nov 2023 01:10:22 -0800 (PST)
Received: from chromium.org (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id i4-20020a17090332c400b001c9d968563csm3041205plr.79.2023.11.09.01.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:10:22 -0800 (PST)
Date: Thu, 9 Nov 2023 09:10:18 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	kernel@collabora.com
Subject: Re: [PATCH v14 53/56] media: core: Free range of buffers
Message-ID: <20231109091018.tzodchqp44tmwq3k@chromium.org>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-54-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031163104.112469-54-benjamin.gaignard@collabora.com>

On Tue, Oct 31, 2023 at 05:31:01PM +0100, Benjamin Gaignard wrote:
> Improve __vb2_queue_free() and __vb2_free_mem() to free
> range of buffers and not only the last few buffers.
> Intoduce starting index to be flexible on range and change the loops
> according to this parameters.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 59 +++++++++----------
>  1 file changed, 28 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 6e88406fcae9..010a8bca0240 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -519,15 +519,13 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  /*
>   * __vb2_free_mem() - release all video buffer memory for a given queue

This comment is kind of outdated. Maybe we should replace it with

	release video buffer memory for a given range of buffers in a given
	queue

?

>   */
> -static void __vb2_free_mem(struct vb2_queue *q, unsigned int buffers)
> +static void __vb2_free_mem(struct vb2_queue *q, unsigned int start, unsigned int count)
>  {
> -	unsigned int buffer;
> +	unsigned int i;
>  	struct vb2_buffer *vb;
> -	unsigned int q_num_buffers = vb2_get_num_buffers(q);
>  
> -	for (buffer = q_num_buffers - buffers; buffer < q_num_buffers;
> -	     ++buffer) {
> -		vb = vb2_get_buffer(q, buffer);
> +	for (i = start; i < q->max_num_buffers && i < start + count; i++) {

We could make this (and all those numerous simialr iterations) more
efficient by using bitmap helpers (probably wrapped in some vb2 helpers),
e.g. for_each_set_bit_from() (vb2_for_each_buffer_from()?). It can be done
in a follow up patch separately from this series though.

> +		vb = vb2_get_buffer(q, i);
>  		if (!vb)
>  			continue;
>  
> @@ -542,35 +540,35 @@ static void __vb2_free_mem(struct vb2_queue *q, unsigned int buffers)
>  }
>  
>  /*
> - * __vb2_queue_free() - free buffers at the end of the queue - video memory and
> + * __vb2_queue_free() - free count buffers from start index of the queue - video memory and

nit: How about using the @count and @start notation to refer the argument
names? (Can be done with a follow up patch outside of this series later.)

>   * related information, if no buffers are left return the queue to an
>   * uninitialized state. Might be called even if the queue has already been freed.
>   */
> -static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
> +static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned int count)
>  {
> -	unsigned int buffer;
> -	unsigned int q_num_buffers = vb2_get_num_buffers(q);
> +	unsigned int i;
>  
>  	lockdep_assert_held(&q->mmap_lock);
>  
>  	/* Call driver-provided cleanup function for each buffer, if provided */
> -	for (buffer = q_num_buffers - buffers; buffer < q_num_buffers;
> -	     ++buffer) {
> -		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
> +	for (i = start; i < q->max_num_buffers && i < start + count; i++) {
> +		struct vb2_buffer *vb = vb2_get_buffer(q, i);
>  
> -		if (vb && vb->planes[0].mem_priv)
> +		if (!vb)
> +			continue;
> +		if (vb->planes[0].mem_priv)

nit: Not sure if we really had to change this, but I'm fine with either.

Best regards,
Tomasz

