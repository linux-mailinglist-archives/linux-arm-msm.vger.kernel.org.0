Return-Path: <linux-arm-msm+bounces-77321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8259FBDD36C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 09:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 08E4534DDF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 07:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C163148BD;
	Wed, 15 Oct 2025 07:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bmXn9JrQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E9F221555
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514804; cv=none; b=gcnvPjX1QEzCUw1o97Y9E3vNGYWeQeskxywkpO/mPAwjTZyVpPYxHpauHkifn1BqKofNwTE7eIKApl81H7I4D7y3qTx41AB4x5vjun+ti2rbqR4b23YLwj20clVkKYFxbUoDAnmDfrjJYFYeo+jOI8Vm1tMWkYq7qQdkzjC8KA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514804; c=relaxed/simple;
	bh=/BrnxgRvfxsByTFmhZBOY+/B1WEWcZSF203srsQwXF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phxLBWkTWGKRKACZBOJpAM5g/jKFjkCTNbTUaH+kJxLVd4KFTIS+2e9BPvi3toYkhBqe5YPJLSTmCIL6pQLejEF6dYhYYKG1tCcqTXW7SDCLjqhUCLVuR/rEme2LXjj1Q5Bk3dP9vTTFWCrTX4X2uid+a7ZjGhFTdbt1dy/QhlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bmXn9JrQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760514801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+HZgDzRdpaVTxvZqJl2rTn2R8LelhY8vbHUCgBN35M=;
	b=bmXn9JrQpnXIgBIw9B+OdbBlL8xcHTvHbrxrnsbTtxgjCncHiCTt/DbEuiDjvVFwMjndkt
	2PF5rM9yjd+e8qgJFXmy1tTrldkMDEyfLeAHj/CHvWU5dvO8oY0t7++1wlpYSvR/9/ede6
	m/NfpDIEEpnp+bHWCnjX1QcxhEFbKqA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-maIWSFEbPQiUrECoz1A0JA-1; Wed, 15 Oct 2025 03:53:20 -0400
X-MC-Unique: maIWSFEbPQiUrECoz1A0JA-1
X-Mimecast-MFC-AGG-ID: maIWSFEbPQiUrECoz1A0JA_1760514799
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47105bfcf15so1432675e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 00:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760514799; x=1761119599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+HZgDzRdpaVTxvZqJl2rTn2R8LelhY8vbHUCgBN35M=;
        b=bBW3drzFl8FKg5ebw9Lj7653QbOqIjNX6zl//zogKd/Re1/IlR05OBs19wPDhriUlk
         692OFyxL7je1iMR7k5w8NPUlnC6eeX0syu7UKObzMEruL2PxZa5D6Tj9bzc35FHEORjr
         AsdhcgtFh1tpJE8Wv11IYwk/Avrus2dLjxZnyWcZhzjrktU74i5fguJqCmmDVjsofx5n
         2XE5IuiiBsieN4qVUjMfAZ5D4OTWHmhUuebkdZkqRy+SUtDx9LkgiTwU9rhL4NiCp7Ae
         miYkQGMim7crxBwSaAopawvZ0pP9ptAs0A6eKI/9ZPRkU8chqIWcXtweDCP9aec7/gYH
         rRqg==
X-Forwarded-Encrypted: i=1; AJvYcCU+4NoWgv/nTjLfh5fI4J7BJdA4OiKeUm9pPngqAP7DmG7+1V4Wkl9xrRbSTQ6ejW8IVgKLFq3RZWZHNI7D@vger.kernel.org
X-Gm-Message-State: AOJu0YxtBvy6g/InYi99FvQvHku2bvPzckGZY25r07nwOK06L1b+P3J9
	dIbtHUzMWpF59kXLqUytTl2NRm1iolPzhHNozfqisbs+thA27mRj3lhMzYaWuXMmNFbpSp79MR6
	fqDwmXQzuO/3Ol0hXgKSTWFWprEc75KO64mHOJIndrWUpukE0MvSdt4XLHg5QW0RRk2E=
X-Gm-Gg: ASbGncvaUtOecWRf23XjHUK0q4AeMcA4fHiR0VYKwMZEhSdZnzzP7/Lyy605xohEBYn
	PlmAKhPccVGUoeKIWMjmf3V8swvZRGNTnJ4QUkrsfst1VbYEDcylu8uB2UjojrrdpVMPkeE0rXa
	VR0F99ax/E8gMvsQJ9Qz6WEzuglcJ0ZEe0lPUvj8MqCMnybB3SDrh2g59RF/Ip17rWhSEjmvcp+
	Jjke9W6XwtfP+Js0PRwP2vetG9KLyowyMZpbAX29S/ki6Q59WQxXp/lrsgKz9fsYlqZ22+sY46L
	BADT/UKGh1qY5XUFwIXAlFS5flAPP5cAQMOYpNwsONCvWKUy+yNntv3wnkAORGpw7Cl1vZp1htL
	m06GB
X-Received: by 2002:a05:600c:1e28:b0:45b:47e1:ef6d with SMTP id 5b1f17b1804b1-46fa9b11746mr202661445e9.36.1760514799494;
        Wed, 15 Oct 2025 00:53:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZf7d9TK63edfjPsh4LrX74Y6wRlhtOgKLsjlyk6mKGtY9U4BbM1bQ2mcLbjosAJUslcGWjg==
X-Received: by 2002:a05:600c:1e28:b0:45b:47e1:ef6d with SMTP id 5b1f17b1804b1-46fa9b11746mr202661265e9.36.1760514799084;
        Wed, 15 Oct 2025 00:53:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47101c21805sm14875785e9.10.2025.10.15.00.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 00:53:18 -0700 (PDT)
Message-ID: <c256b8d9-ec9e-4841-9136-1198ad2d590a@redhat.com>
Date: Wed, 15 Oct 2025 09:53:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/log: Add free callback
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-4-tzimmermann@suse.de>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2025 15:16, Thomas Zimmermann wrote:
> Free the client memory in the client free callback. Also move the
> debugging output into the free callback: drm_client_release() puts
> the reference on the DRM device, so pointers to the device should
> be considered dangling afterwards.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index 116e0ef9ae5d..470df4148e96 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -293,19 +293,26 @@ static void drm_log_free_scanout(struct drm_client_dev *client)
>   	}
>   }
>   
> -static void drm_log_client_unregister(struct drm_client_dev *client)
> +static void drm_log_client_free(struct drm_client_dev *client)
>   {
>   	struct drm_log *dlog = client_to_drm_log(client);
>   	struct drm_device *dev = client->dev;
>   
> +	kfree(dlog);
> +
> +	drm_dbg(dev, "Unregistered with drm log\n");
> +}
> +
> +static void drm_log_client_unregister(struct drm_client_dev *client)
> +{
> +	struct drm_log *dlog = client_to_drm_log(client);
> +
>   	unregister_console(&dlog->con);
>   
>   	mutex_lock(&dlog->lock);
>   	drm_log_free_scanout(client);
>   	mutex_unlock(&dlog->lock);
>   	drm_client_release(client);
> -	kfree(dlog);
> -	drm_dbg(dev, "Unregistered with drm log\n");
>   }
>   
>   static int drm_log_client_hotplug(struct drm_client_dev *client)
> @@ -339,6 +346,7 @@ static int drm_log_client_resume(struct drm_client_dev *client, bool _console_lo
>   
>   static const struct drm_client_funcs drm_log_client_funcs = {
>   	.owner		= THIS_MODULE,
> +	.free		= drm_log_client_free,
>   	.unregister	= drm_log_client_unregister,
>   	.hotplug	= drm_log_client_hotplug,
>   	.suspend	= drm_log_client_suspend,


