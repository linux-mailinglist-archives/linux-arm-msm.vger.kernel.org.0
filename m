Return-Path: <linux-arm-msm+bounces-77332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7CBBDD5A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 59B4B4F87EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 08:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A331239E7D;
	Wed, 15 Oct 2025 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JOfLyAd5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CBD2D3EFC
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760516452; cv=none; b=JA2zamhEGwEZzxYSRuzh86I5nkip/B71Uft/fquyhiaDhkllTEbLvgsQY/A6kxoCstD9l4OzFJUQGD19LtE+oT4HS2l1S/Q8ic8lMiBWtqLNWYSU46KzGZeX9vLdEs/n1JcgkHUl9SwaAKDVQwUFCaexOLaNgTvn5s7/Z5pIXG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760516452; c=relaxed/simple;
	bh=gdBDLPt4sGdp4vau56vsKCZGKHYOD8ibbTQ+im2l4Ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fac+KNh6eGC16FtDDqW4PoM6byl6NpDlQoZYIM8ewfOEP/BUUFCAnpb1IOqIckJw2bEU+gjJ7+iP3GaVI9NNLLMsOsX6nsZXq+v56wrAJcWqQwtnAsrPWuRE4dBDdYLzqDm06OPIR1d0NCOuaEEuLaG3mKvrIZ2+aGHz8mGzaJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JOfLyAd5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760516449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HU62gMpjIaFZFXMtNGaeiDMNZ4Zv7CCqH8t0PFzlFoY=;
	b=JOfLyAd5BIsXGsx9Oz7hu9boXLH2G0GAoB0pGg+5hMITbciLUmHJ/pwTqK7nKg5VLJ8CVz
	GN2unXteq7eMZjrO5FgTys+huHsyPcDK8tBtP21nKcN5v33oRKZnVBZKTTZlET/6ooe6Y0
	9HL6RXykMK5POxtcNcfVVI8x6vvLa1c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-saAbmDLvO0moMk1tpgoiQA-1; Wed, 15 Oct 2025 04:20:47 -0400
X-MC-Unique: saAbmDLvO0moMk1tpgoiQA-1
X-Mimecast-MFC-AGG-ID: saAbmDLvO0moMk1tpgoiQA_1760516446
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47105bfcf15so1611285e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 01:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760516446; x=1761121246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HU62gMpjIaFZFXMtNGaeiDMNZ4Zv7CCqH8t0PFzlFoY=;
        b=jZrRiMoEjR3gAcvJRZRe26VrLnU9hnOFYbDw/8hOM6WTeReTy44xF6F+MRRY0SKuQJ
         yIbJbn44l+QB8me0HmT2Fl51EM0p+bUyp4lravpGvkP+Nt9xHaTVuYHO9ARQiiFYUbYH
         eU3dUy2lEWTEKPzp08jqH4ob7/lCF9bsRp+dZkS4N+5yLzJwpzDT8jeMXIMvjCtbNj7f
         wqo6VQ1g9NAojYu0iYFoFMbsBhHRaPfSLvx4kGHUHiEcEY59zWAGL7cYFQw5Ol3zCEnP
         Uu1uu+t8IV04vG05Kr3jwVghJNzoRSf1q/I9aT/IYbaeQXZZbSrmkmwBSWAHNFMfnraE
         n0PA==
X-Forwarded-Encrypted: i=1; AJvYcCVcVUZ1YGFJOw3gl+uah4lpvrjAM5sVVY8NY4E3N/NP3ZqW+dDe3hj40wqZw9+pD5NMaIvHRJYXePfEDxHg@vger.kernel.org
X-Gm-Message-State: AOJu0YxrBBC9zQt/pxH8Z5VhYpe/eYXnTn0NoY13OJ/x1plaKCWx4Oh5
	tTOWf+ZPAec5PefXnTr7R1ZU5V3ODrYvhBe9I+7V1VZtC4X4he2QyLFGY6BlHpcaNguckYh9AVs
	wghS9wqVTDYWZoEpFDIpgyKtOud/s6lf0wg4m8Bahq38jzq/mYkX7AywdhlXToTe6GWM=
X-Gm-Gg: ASbGncvsonF+QBZR1NBCl5sioMzJQ+ISt7bmgNxOjZBwiHuibn++aXc/E1maQM8y9M/
	nBxdwL7u4XpHMs0fpqvI0k67XKz0wVAkXicSCgz9g3ph3/NKajElHHUBzF2eEjiKHwLOwXWIiPd
	aljlKw0dk92Zo+e10YRI+USK+ifItByEL7n+xTlQ9pIdO3sXfJy1TRhR9zw4DbrUt24beoG7tJv
	Ls/9IOhOhL0Mzyh+a95DcPV2LkBTls5uTrmQBbiiy/jNAn7//L87Z/hU0bYTYJscKNeMqNervgl
	QUp/KfS9lWF5/6RTsU9zyd70IAXOj7WOO6MUaYUtV5bExgbxRm136qV2dG8WBpRCOOI8qr8YePt
	/ExvX
X-Received: by 2002:a05:600d:41c4:b0:471:7a:791a with SMTP id 5b1f17b1804b1-471007a7a96mr9522755e9.7.1760516446518;
        Wed, 15 Oct 2025 01:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKG0piBaN7As1r+PD/K5QtUV2Z28HHZlEUD35iBfCWvoyf69YaDGLCaS5NwDRxAhyjJ4bu3g==
X-Received: by 2002:a05:600d:41c4:b0:471:7a:791a with SMTP id 5b1f17b1804b1-471007a7a96mr9522475e9.7.1760516446097;
        Wed, 15 Oct 2025 01:20:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b9absm327503135e9.2.2025.10.15.01.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:20:45 -0700 (PDT)
Message-ID: <c85d528c-6787-4023-8883-3519b7498627@redhat.com>
Date: Wed, 15 Oct 2025 10:20:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/client: Do not free client memory by default
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-5-tzimmermann@suse.de>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-5-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2025 15:16, Thomas Zimmermann wrote:
> Make no assumption on the allocation of the client's memory. For
> example, amdgpu stores a client within another data structures,
> where it cannot be freed by itself.
> 
> The correct place to free the client's memory is the client's free
> callback. All existing clients implement this.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_client_event.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
> index c83196ad8b59..f36fe0392ce6 100644
> --- a/drivers/gpu/drm/drm_client_event.c
> +++ b/drivers/gpu/drm/drm_client_event.c
> @@ -39,12 +39,13 @@ void drm_client_dev_unregister(struct drm_device *dev)
>   	mutex_lock(&dev->clientlist_mutex);
>   	list_for_each_entry_safe(client, tmp, &dev->clientlist, list) {
>   		list_del(&client->list);
> -		if (client->funcs && client->funcs->unregister) {
> +		/*
> +		 * Unregistering consumes and frees the client.
> +		 */
> +		if (client->funcs && client->funcs->unregister)
>   			client->funcs->unregister(client);
> -		} else {
> +		else
>   			drm_client_release(client);
> -			kfree(client);
> -		}
>   	}
>   	mutex_unlock(&dev->clientlist_mutex);
>   }


