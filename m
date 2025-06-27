Return-Path: <linux-arm-msm+bounces-62859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D81AEBE37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 19:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49A551C471D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C6017A306;
	Fri, 27 Jun 2025 17:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R0alO3p3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE1D2EA73A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 17:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751044061; cv=none; b=sl0hG9tUrdfR7oI9iyfJWUfBYa4G9Dh8s35Z7mwRpgKFW+3QCZmw+NegK/SMjujIoyGAdgJDpzCQJKoMNqJOeHBCCWIwQl55vS3+NrQ5tViaYjN/PPz13O6uaf9oRIRCX8sihKVYQaWp0xKUJNtZ2X+MQwpnSkH9RbXcFqTb5ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751044061; c=relaxed/simple;
	bh=fozUXgzdys12L7XIOaNewlTS0SdNY9+9Qgo5gNsnZe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ip77B/AE8jrj39/vWLmpuwAgdcXD4mk1919nyYXn2nk0HduVsuAQajFXb506iuUhQPeltX7op1cJpuLDzBLBgzDhLzAoNNl80EohoChzZdN1knYGXdcssv6L9GSQyosPDHzm0ZB0/EtO7hgyhuWJTdJU3i0OttlNWW1dsjufzyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R0alO3p3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d54214adso17184665e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 10:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751044057; x=1751648857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uICgYiY+G3JspFAyT3xgva3fPY2F/XGPfCaGX5O6oEY=;
        b=R0alO3p3hTdZr06m1pakC61V9Fk97rsWGw+bKG7oKLjYCn141+UYLbJ7bkxjxeNAP3
         TrDgMAdUpBexc7N5Qcjuj8lfkar9dyTEhC7ipMGWaAwSshiz1r1De9RgTcqLcoEIRZpN
         iLDG2w9Nj0KrjHQraZdkvIeCnTpV518lZXhX7v1dJAhdPbByu+C0HQ7cGmJundfFvrrg
         FVdOPrL2ZcsUC7Nc7BukLLyFa9Xqu34j22gQG1jD8Ta5aacd5/j3TjzzdXlFy94XdDBw
         Y9C4Ok7b3ZV8dqSCqJ7S9KkOASjqbBJXw0pq6jzqFcIYyHo8JJ1s42M3tGmQAUyTOzmi
         l4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751044057; x=1751648857;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uICgYiY+G3JspFAyT3xgva3fPY2F/XGPfCaGX5O6oEY=;
        b=Lyz/6Uv/ao1tT07xhWfIm7TiRsRKSEoZQXkzZl/p60kAho5EwxZ3fLXaGETuh8CiVz
         zaRQpbHMFfDRVlWJ0qkWNau3JHf22VPoeOlG3o465zus6U9IxZkLuxsJwJsPwpSWjkqS
         3sI9nY3KFPXJlKmuHouBBfLKVKuaCYpzK6BLxD6v48UHOo0LbyzS4ABA3i161kLiZq+H
         I0P1+FLYXpsJ9krzTGFRcQbGr5cRlC0V8sycJHZ3bM0oDFh3tXbhnxtzfM1oWse+ZXDW
         wlIxMYYoDbeIA6MEIeYlQC8NA/9VnPfia2nEu919XyKsnumx4UTSzEhi4m9GPCx5wI82
         OgDA==
X-Forwarded-Encrypted: i=1; AJvYcCV4eeCbjBVYlsBFImVZ72cXl2nASSoQ1sy1l6XWUcjbnFhgMIrA0pxHpMsKJGS3fT5kF4bn2c80QIlhUcKj@vger.kernel.org
X-Gm-Message-State: AOJu0YwoVoZDwOEsNl5br6xX9eNsDOmbDZ+7wy3HBpe0qEC3QkaOFPQG
	zE9ZPGE5dlRzML8GhwhRANLaE/yzjBGJ83ciUM2e6lDvHOfHJk2N1kO8CHMixdMoJgU=
X-Gm-Gg: ASbGncuwbihsHYi/Tk3lNToCC4HoWDtL45pxMzxHrI/AK4RljVSS3PDWGKtIj0Ns1d7
	c7uTS7w77at/B22chCB9LjpJ+WsUQoPb2mBbIEru5jmq4JD0zX6I9BBg2PhL2R4D2La+OChkBg9
	4inWAnCuIRF/eFr4P6qvPZIsdttUktowzYEsRSIa1g6TQdvjerKLcYBsUbT5p0jNIwWF6FRKwuq
	UPCxFDuO8duPilwjdXlHK8iWSH+kqdgCrA0wipoR3uBqwVgnscrNlFX1dU2/rvmk9pOyrjRwz2M
	0jCxZI/nhB+3qeWN+wmnI16U0RQ72EFF1+SuJKw3snxDy9m+52EiKiwVWtY7XFyWf84PYlPVCZm
	HdJ8Pliz5sgvB/WhesjP7/bOT4ec=
X-Google-Smtp-Source: AGHT+IH31SkLI3Vsbb2Y9EKuOMKX6EReaApoDazwONmaL3DKqX/243XHNKIPxGCAkbSxqfNRW2Vmuw==
X-Received: by 2002:a05:600c:198a:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-4538ee7df15mr52309315e9.16.1751044057276;
        Fri, 27 Jun 2025 10:07:37 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe0efsm55339995e9.24.2025.06.27.10.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 10:07:36 -0700 (PDT)
Message-ID: <000a9208-4a4d-458c-bf28-de4b10ed0678@linaro.org>
Date: Fri, 27 Jun 2025 18:07:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] media: iris: select appropriate DMA device for
 internal buffers
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-4-51e18c0ffbce@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250627-video_cb-v3-4-51e18c0ffbce@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 16:48, Vikash Garodia wrote:
> When a non-pixel device (np_dev) exists, it is preferred for DMA
> operations for internal buffers which are specific to bitstream data
> processing. DPB(decoded picture buffer) buffers are internal buffers
> associated with pixel buffers, hence they are not part of "non_pixel"
> device.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index e5c5a564fcb81e77746df8c4797a10a07f2ae946..0bf6041936175d03a51985be148e78894fc3e990 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -265,6 +265,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
>   	struct iris_buffers *buffers = &inst->buffers[buffer_type];
>   	struct iris_core *core = inst->core;
>   	struct iris_buffer *buffer;
> +	struct device *dev;
>   
>   	if (!buffers->size)
>   		return 0;
> @@ -280,7 +281,11 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
>   	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
>   	list_add_tail(&buffer->list, &buffers->list);
>   
> -	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
> +	dev = core->np_dev ? core->np_dev : core->dev;
> +	if (buffer->type == BUF_DPB)
> +		dev = core->dev;
> +
> +	buffer->kvaddr = dma_alloc_attrs(dev, buffer->buffer_size,
>   					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
>   	if (!buffer->kvaddr)
>   		return -ENOMEM;
> @@ -367,9 +372,15 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
>   int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
>   {
>   	struct iris_core *core = inst->core;
> +	struct device *dev;
> +
> +	dev = core->np_dev ? core->np_dev : core->dev;
> +
> +	if (buffer->type == BUF_DPB)
> +		dev = core->dev;

Again I think the hooking of dev is clearer with if/else instead of 
ternary operators.

Its not against the coding standard to my knowledge ..

>   
>   	list_del(&buffer->list);
> -	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
> +	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
>   		       buffer->device_addr, buffer->dma_attrs);
>   	kfree(buffer);
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

