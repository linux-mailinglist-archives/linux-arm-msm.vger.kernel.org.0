Return-Path: <linux-arm-msm+bounces-78172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A425BF6940
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E95744E13E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48FA2C0282;
	Tue, 21 Oct 2025 12:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KvUfadTO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C224C2F49EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051482; cv=none; b=vBov0rkNd+j4wdU1XWP38yFWQGj8sL6tzrFIACAft+jzUxwSq/LBB/XM1jlaztY2oaXuDT/zQN4jbjyPrrRooAko0evRfZcECGr4vDcsk2lCS8AlUjrvQiF0nM4i9bpkVAtCLcbTZLcvt3yL1BXSriyjGfswthUJhA4UodyvQQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051482; c=relaxed/simple;
	bh=FfcoUUoPUpOsa0VkWk/Dk1Pdl70TqifwXFfjdZWH8QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOU3UVaWXFwGKBFZnIkQX2+1P/0VZguk/nb9gMqe8AydJe7AGnnFpAowJ9Vu30lQEC/oRKOvN6F9DgFglLa6Gw2Jn0aqC9vZAyRox26UTDSUbv7H0tnugOWhViVC55FHPVuKroJsW3gKCqahBBmP585rURahKOEsQIJrgTz6npo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KvUfadTO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DvdJq2dPLugSFjjKOvXm1LBOxtEu3BmwSDlhR75aYWo=;
	b=KvUfadTOtYd4YATO2qf/JDmnvJJrevXEbpk+CFSbWOhR7RckZ/3ODtaY7/IIu4+6r1Sy7L
	BcBiUYktOxQ43SVpj4S5LlRy363zrykdXmukbdx3gCk2Vx6HgAveg0093Yuq5XupkCEPUt
	7PXGSjjWpqpn9olEfwaroxKKHrLc4Zc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-YKC07kRVOH6Ax9192bdSKA-1; Tue, 21 Oct 2025 08:57:58 -0400
X-MC-Unique: YKC07kRVOH6Ax9192bdSKA-1
X-Mimecast-MFC-AGG-ID: YKC07kRVOH6Ax9192bdSKA_1761051477
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47105bfcf15so30482855e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 05:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051477; x=1761656277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvdJq2dPLugSFjjKOvXm1LBOxtEu3BmwSDlhR75aYWo=;
        b=DDN+AnD5Y+NwUbfOVCTTXA9kmtaNsy8wYa6DJgTJR1lwTXbWGAUsTO2AFRDT6gMGd6
         IlcQ9OSCsqUnv7fz4fvqS88CYaOAuvkdKgRHapiyrPMMNIhvqCx+D00dMuBLlcTthzcO
         Is06ZxP5+EpxJ5U8m6HESv37xBfykK1CCvLe6GdCVDMM6xDbR6I6O2I58h70ILrYuGVb
         5+dhc/DrqsEVUC/HEpasWRblUR8lZnEvFEptQ98XoBfot4kTv/5YjBhXjah67FoMZk71
         bu5Y38/jLqZVc5qoxDJ+ViuVYrOI1EzAulOqKutPSnVL9w1ETMQIQwRKwWXZ5FSSecn8
         9h7g==
X-Forwarded-Encrypted: i=1; AJvYcCW/anx0ML4HJHhjk9wpfO2BGjQNyNWy9WLB/7Ck8KhHttCbaAw/qMvaXewX8zJnI9aQ/0yIojaGQn3crd2N@vger.kernel.org
X-Gm-Message-State: AOJu0YzSvtNiGWpFGBK70TRT1AImRi78pTsoAVlqFfjc6WxrmgMU1Soi
	pVI1Sj8HtiuGH3I+ZXEdQetN4OVfGujydIQhsuphdKgCs4JbhUqR1R90vjiJcTVxs1TpCbUWJIJ
	CBWphz3KN6eDjzUmWZzLcHJv1Wwzoau3cCcX1oaJfYE8S1FwRAsSzwtvZhbXJvlrJTVcCtqMr+s
	I=
X-Gm-Gg: ASbGncst+CEo3DSZpnvxM7hAr0WLaHEKILJBVQ43LOBeFOnAvEXVYBtYoNd0jwxC3/w
	h+LDC+sOq8P81aK+hg/hzvtBzhay5L2jqQKyI1td422ufkVrlaR6L1ztURdKPYSxemh5pq+LHsU
	ZAlGYw7jSGt7a7fqtJhQWRcqhuh9vBpVDEU5vwF4XX3OifNobLeqcs+J64P8NaGa4vTDIInLK+9
	kV98y8GYKzWdTfaaQyZLPFVovmBWvuDGuMoRRWBYSUM0AKs7Qe6Y94cIPoJC8lsBpCBKEE0+Iq1
	6fesqQGp115XhvNeEFInQ5VCk1M3gnLV19X+Y4MHiBhX8Ln0nSp0siGpH4rRhxvIwz6N
X-Received: by 2002:a05:600c:198d:b0:46e:3c29:ce9d with SMTP id 5b1f17b1804b1-4711791c57bmr139775015e9.32.1761051476906;
        Tue, 21 Oct 2025 05:57:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMQOVxMDKEqgOB4aV0YZaSaGuRZMfduYN5i5pIKMunnPmVy9cLSdbbEF1RTdTSlw3qu+1DNA==
X-Received: by 2002:a05:600c:198d:b0:46e:3c29:ce9d with SMTP id 5b1f17b1804b1-4711791c57bmr139774785e9.32.1761051476400;
        Tue, 21 Oct 2025 05:57:56 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47154d3843csm195088345e9.11.2025.10.21.05.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 05:57:55 -0700 (PDT)
Date: Tue, 21 Oct 2025 08:57:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cong Zhang <cong.zhang@oss.qualcomm.com>
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	pavan.kondeti@oss.qualcomm.com
Subject: Re: [PATCH] virtio_blk: NULL out vqs to avoid double free on failed
 resume
Message-ID: <20251021085030-mutt-send-email-mst@kernel.org>
References: <20251021-virtio_double_free-v1-1-4dd0cfd258f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-virtio_double_free-v1-1-4dd0cfd258f1@oss.qualcomm.com>

On Tue, Oct 21, 2025 at 07:07:56PM +0800, Cong Zhang wrote:
> The vblk->vqs releases during freeze. If resume fails before vblk->vqs
> is allocated, later freeze/remove may attempt to free vqs again.
> Set vblk->vqs to NULL after freeing to avoid double free.
> 
> Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
> ---
> The patch fixes a double free issue that occurs in virtio_blk during
> freeze/resume.
> The issue is caused by:
> 1. During the first freeze, vblk->vqs is freed but pointer is not set to
>    NULL.
> 2. Virtio block device fails before vblk->vqs is allocated during resume.
> 3. During the next freeze, vblk->vqs gets freed again, causing the
>    double free crash.

this part I don't get. if restore fails, how can freeze be called
again?

> ---
>  drivers/block/virtio_blk.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index f061420dfb10c40b21765b173fab7046aa447506..746795066d7f56a01c9a9c0344d24f9fa06841eb 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -1026,8 +1026,13 @@ static int init_vq(struct virtio_blk *vblk)
>  out:
>  	kfree(vqs);
>  	kfree(vqs_info);
> -	if (err)
> +	if (err) {
>  		kfree(vblk->vqs);
> +		/*
> +		 * Set to NULL to prevent freeing vqs again during freezing.
> +		 */
> +		vblk->vqs = NULL;
> +	}
>  	return err;
>  }
>  

> @@ -1598,6 +1603,12 @@ static int virtblk_freeze_priv(struct virtio_device *vdev)
>  
>  	vdev->config->del_vqs(vdev);
>  	kfree(vblk->vqs);
> +	/*
> +	 * Set to NULL to prevent freeing vqs again after a failed vqs
> +	 * allocation during resume. Note that kfree() already handles NULL
> +	 * pointers safely.
> +	 */
> +	vblk->vqs = NULL;
>  
>  	return 0;
>  }
> 
> ---
> base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
> change-id: 20250926-virtio_double_free-7ab880d82a17
> 
> Best regards,
> -- 
> Cong Zhang <cong.zhang@oss.qualcomm.com>


