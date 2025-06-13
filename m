Return-Path: <linux-arm-msm+bounces-61250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED8EAD90CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 17:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E734B3A351A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 15:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2DC18DB0D;
	Fri, 13 Jun 2025 15:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uu85/vqp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256B829CEB
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 15:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749827293; cv=none; b=F1canhNG3csQsYBUEO3O9QY6ouhUEDbeiVmUWOacU9a+BPF8bOo406x5D+ZdFiPji++Hhd9mNhdfhuQTfVLbnl0iRfkPIFEYdMNfIUKM6V/JuONNNhaLe9A4gG3/czmXTE3H/1P45QQYM4dSb2nAtW5ms9BVFJtGvvgnxtvkINA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749827293; c=relaxed/simple;
	bh=FtG3I66FqYT1tUCZQmlDf+InZrOupB4bScJhfvq4sfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Dk0qXaZu33Q5Xq9RW4BtIYmQmL/WtkZEqkp3M6bGBeVUqNQ3/miq2PrSXgtpuF4zyzt+fkahLojBO1Uo2v/fBSPfQDHY6rb9bjF/dWYKdZla2Lb8G7iN7tg4EmgaRRpGqXE0D4jc7cyKl6eq4o30TQt2ExrtJzEtziOJg97cJ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uu85/vqp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so17392295e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 08:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749827289; x=1750432089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lz+5Ufv+N4wr4OfU0yaF0pAXdIJ20SMn6Rj1KLQDZyk=;
        b=uu85/vqp96GwrQiJR3qQO1Kgsypm07VvCaMAO+idRoBrfCCUNfB7o6xKniqXdTdUlH
         R5pyR8kmqXvK5r+sXmaUtMfnlwlb2jmD9U6btDDsV7KpVucYBQwxh24RC2daA/m/kEzo
         R5WBI9XQKN/LbINHApCDXICCjPHA2fO0yCfOvbMuTK4jKcp19NBgPe61BjDOaQJegOZS
         dsxjKgkAMruV8TyWWwfQn9hgMTC3HxaykBA3iQF/rErPPZ6EyVA1vpFKMvThMplvCrLL
         tXzPBgn5ZHHyl+Y0XnWoioP8u9pCAZdy1xlm4+OIDhx1z+pqsTHwhFsznC3D+1WX3DK/
         jkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827289; x=1750432089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lz+5Ufv+N4wr4OfU0yaF0pAXdIJ20SMn6Rj1KLQDZyk=;
        b=puocYUh1rHECxjn2IMBFCIMuI+DYd+3MqgSW4bvcChTPr+8qmX6XspfLX5gueWWdGh
         HwG7IiHRCOFxsh0OTEUrQppt7JAWAd/7KoRYC7fRzWt6ftdTQYmYEEB5uDiU1fXoXFSF
         pWlVKefPp1Vfkcj5FGyqHL5xheyvaQc1YYv8FrRx0p7xwZpesuiZwR3L6ZEQKammXjjD
         ip08rZavcE+8Iupr1Uc8tp/oQWYvzaxCSYYPmOA01fuZGCUGmw72nQp+FNIR+pYlNYLZ
         X6vJYNZUGmFSg1ZkvTTfhtyE1XTXlvc25ZzVVOeXP+2g5zvu6jgfS4vtJliol3lF9hdv
         fojg==
X-Forwarded-Encrypted: i=1; AJvYcCUI+UqP3BaleGaZoDugdUvOkHcbrAHgssXKlp/HwkbEJWap/5Cy/LleFFDrnZPIcu6YvpSVe140jByFBAnS@vger.kernel.org
X-Gm-Message-State: AOJu0YyMUnxIcozxQBjlDaIrZohxO4Ny0gDANtH/v21+BqrigdsTH61W
	McDxfUd8PisIpeKx2h1Il4lXWgoyww+w2pMvoRDs0jzuq2XQt1XJfA4a7oEEmAgmhrw=
X-Gm-Gg: ASbGncvEplkm3uBYCT/1q/mFvXLyUfMjjE9krnC5aivxc+bfKE9rVV4rmNoUevlCSf8
	K/U+ne5CKNcDW2Y4kpzJm1HILkNEq9rPNxjANZyFy+7apA0v+LfauybXHBltOtZWJzA/dWw70c2
	drrqql6DyKT/JOWN5l72dca+ekZ/bLiD+nHFBhjHVIfsBIP7oJxarmJrXZSiIGkzGymdNWh5/oh
	FYzgWUYZp3CS9EnSZ0RKo2DwYyu1nXF770+ZRS2MiXdVTID8JS6C6dc/SEjt/4PvRLnx7IKdVns
	+AjbLfHYDl6HXmplSPep8A2taDjeGSA/GrPy+lxwTyPKWFtbyEcJllc6YW3c+HM9ixGCk6kwpbo
	TLtaJ5FIxAqG1RE82H9GIGgb9OuY=
X-Google-Smtp-Source: AGHT+IFJIg0Gj68VQKAlMAJRfYkDpbVOEVofugZ3MQmGf4pwkHhZggzYw1g48atezyiXnnpUlo3tgw==
X-Received: by 2002:a05:600d:d:b0:453:608:a18b with SMTP id 5b1f17b1804b1-45337f6735bmr26676485e9.9.1749827289285;
        Fri, 13 Jun 2025 08:08:09 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b087a9sm2656748f8f.55.2025.06.13.08.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 08:08:08 -0700 (PDT)
Message-ID: <0091f6c9-db75-457c-b14a-ce3f972f6f50@linaro.org>
Date: Fri, 13 Jun 2025 16:08:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Power pipeline only when streaming
To: Richard Acayan <mailingradian@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250526232837.686822-3-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250526232837.686822-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/05/2025 00:28, Richard Acayan wrote:
> The libcamera plugin for Pipewire may keep an open file descriptor to
> the video device, even while streaming. This simplifies its operation,
> as it only needs to keep track of a number instead of a file path. When
> the video device is open but not streaming, the pipeline can be powered
> off. Move the pipeline power management to the prepare_streaming and
> unprepare_streaming functions.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../media/platform/qcom/camss/camss-video.c   | 39 ++++++++++++-------
>   1 file changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index aa021fd5e123..8d05802d1735 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -225,6 +225,21 @@ static int video_check_format(struct camss_video *video)
>   	return 0;
>   }
>   
> +static int video_prepare_streaming(struct vb2_queue *q)
> +{
> +	struct camss_video *video = vb2_get_drv_priv(q);
> +	struct video_device *vdev = &video->vdev;
> +	int ret;
> +
> +	ret = v4l2_pipeline_pm_get(&vdev->entity);
> +	if (ret < 0) {
> +		dev_err(video->camss->dev, "Failed to power up pipeline: %d\n",
> +			ret);
> +	}
> +
> +	return ret;
> +}
> +
>   static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>   {
>   	struct camss_video *video = vb2_get_drv_priv(q);
> @@ -308,13 +323,23 @@ static void video_stop_streaming(struct vb2_queue *q)
>   	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
>   }
>   
> +static void video_unprepare_streaming(struct vb2_queue *q)
> +{
> +	struct camss_video *video = vb2_get_drv_priv(q);
> +	struct video_device *vdev = &video->vdev;
> +
> +	v4l2_pipeline_pm_put(&vdev->entity);
> +}
> +
>   static const struct vb2_ops msm_video_vb2_q_ops = {
>   	.queue_setup     = video_queue_setup,
>   	.buf_init        = video_buf_init,
>   	.buf_prepare     = video_buf_prepare,
>   	.buf_queue       = video_buf_queue,
> +	.prepare_streaming = video_prepare_streaming,
>   	.start_streaming = video_start_streaming,
>   	.stop_streaming  = video_stop_streaming,
> +	.unprepare_streaming = video_unprepare_streaming,
>   };
>   
>   /* -----------------------------------------------------------------------------
> @@ -599,20 +624,10 @@ static int video_open(struct file *file)
>   
>   	file->private_data = vfh;
>   
> -	ret = v4l2_pipeline_pm_get(&vdev->entity);
> -	if (ret < 0) {
> -		dev_err(video->camss->dev, "Failed to power up pipeline: %d\n",
> -			ret);
> -		goto error_pm_use;
> -	}
> -
>   	mutex_unlock(&video->lock);
>   
>   	return 0;
>   
> -error_pm_use:
> -	v4l2_fh_release(file);
> -
>   error_alloc:
>   	mutex_unlock(&video->lock);
>   
> @@ -621,12 +636,8 @@ static int video_open(struct file *file)
>   
>   static int video_release(struct file *file)
>   {
> -	struct video_device *vdev = video_devdata(file);
> -
>   	vb2_fop_release(file);
>   
> -	v4l2_pipeline_pm_put(&vdev->entity);
> -
>   	file->private_data = NULL;
>   
>   	return 0;
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

