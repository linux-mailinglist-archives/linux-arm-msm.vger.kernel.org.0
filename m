Return-Path: <linux-arm-msm+bounces-86613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7295ACDD899
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 09:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2246E302EA03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 08:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345BA314A7D;
	Thu, 25 Dec 2025 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H3jPgQ7K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABFD1C701F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766652581; cv=none; b=t62IukU8sUUhS8nZGqi33VDpjy1cHBtBElVHDV+GlFMgNlQCZTRRyxvMTKwVVQolAJ9xfRGH/JRK88Q7Py4yH2YEiuoxVpo32e5/utazI4x4+I/V4kkIZf7L7yFHvXHraAvmTzhhn7bNfopkV1qcVhySgSRk98atd6U4AJaLiC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766652581; c=relaxed/simple;
	bh=IaUv/bEmXrjpgGeev5PpfBcVPxklP5nZb+aJj6da84s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oODbchXD7vlwtakyDElhngeT48M2+ih1VlMEziBufq0jDC5QPgCstSpobGhPitfgPzBMYPxyYHMSceEIXxIi7Ssh0V3oIVpb7ALVv4ppGyI/ZqWCqVgPtuSnIhuQ9Uz7kvOENsgh+NYvYIvfsKQ3TLCiF/VU5kqsB0wYc8E8LWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H3jPgQ7K; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so2785380f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 00:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766652576; x=1767257376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoBDRxVmXrYcyUWaWX2M43BL+d+5SL+xKSZsptXvX8M=;
        b=H3jPgQ7KOgsizim0eNqQY2zrUgWHSpswyD8Wrf5yk/QeqpMpVP6XI+/XZiU+XPUWOL
         XvQ5rqM8hPxbgB6fuHTkGsl4vjMfRJU0NTirnWIXOA2RN8Bcs0d0WopI2StKkPVBqLRb
         PpP2a9QFGLVV3Vxc691HiTe21nKYQUjS1Tz3E5jIa4EOnvZsGDALEG0MfyqgqCeN9csM
         JKBsZjooq60kPU/PJ0TxIFmysUeSi9ILp+dbPT5sYtNf7pZtRZO3F4Tr518iyBi7pI9x
         ZZJQ6tQp2WcF92Lu/Pb8cek79ssuW9wzPhQqn+aPTuDy6mMvYw2X/m+ytH6IBovv8D30
         CgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766652576; x=1767257376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoBDRxVmXrYcyUWaWX2M43BL+d+5SL+xKSZsptXvX8M=;
        b=SxvgSvh4RV7b0r1ELGTvz6FvGNXw+m3s2B+43tdimtaln7jncfDlgEsoiz48+2zG5B
         /NMOr7yXSpMuH+WxOqZJ8TuRdRZuNISKutfQZDR3fgfcOaYLZUA62KM01iS+KEoPeijB
         /3o9DjNPY3drnicrw41aJsqid5IT5tcm+3mVRbSNhvPh6+XIvruRLmGnNJYBSnRNaCWX
         tbuQRro+SGlpfY0aqpHO+jjMg1nzkk3aDhp8x8zRQw6uVsDbPt2QGZHLb36zWspvlqE6
         1mN60bKuGPqspdd3SlGF2pfWjUrFEQVfiQm1cm9UjPJZh4n/DBIOVGQ2l8Mc+5DFFyww
         /f/g==
X-Forwarded-Encrypted: i=1; AJvYcCVTmlBThdg5XT/whMvrHx9RPdAVA84CNamNobMlb9xIg3g4wymLx1dGOsowWi5f4gUUEcuhh9yfZcaBvvLT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0UgZUug+r+tl3YCS9WNSfZ1GnTAamzwbozEQrsX1bQOteCJa2
	kM9+6ioJArj2Cnm6qzNr92hueoJqoR8mqJ7YMUigAmVxVbrQjPepOBXiOUwVzmH+1Vo=
X-Gm-Gg: AY/fxX7iFV/DRYKAom2Dq4AdKYgnn/fGXgXhsA30asPJ0VdNYnPcPr66jWsDWraSGG1
	3b2OJVAg/TnfjEyYr8f4ksV2YiPsItfv26vYktMwC1E/MPGMoOJyKym020ktzN+I0OtIt+hXFsc
	SMs0m9qkNeP7XfrBOMC33TF7bMg7qW4XFeXqiWqR7L/eZwai0/i+fvb/ZEnIkmM9oaKv6srTVXc
	QCUcgIHN6RMa7ySCxFM67S5ywOT52fUN04+zvU697sT4C8fNa0GDm2ooR9gSHIgA7XHyCqK4aHO
	G44kykKdDE7GkYLBe5c7dZPX0Vp/3XJih0P9eJhXXPnxLZMsiBHP6MLesb270Mxl/B/zT1Hp7YE
	dqHkl4bcs8LDkIZ87VRa4KfFHoae3cU48psA+/wf28JEJZHhJUopDktcPuyAPypSxoCqXFklUIV
	uR8INqC8x9QuCosrNo30wb5lj982taZzV5pD+f/vQBXsIJuFSepfU4
X-Google-Smtp-Source: AGHT+IGB03s/TFHHK32TGVs9YpBfcIdvRZx8YFRPv17geyEukeVgPpI7hyWLxapWo3sPx+1F2nXfzQ==
X-Received: by 2002:a05:6000:420c:b0:42f:9e75:8605 with SMTP id ffacd0b85a97d-4324e45d3efmr18403483f8f.0.1766652576404;
        Thu, 25 Dec 2025 00:49:36 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm38939643f8f.5.2025.12.25.00.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Dec 2025 00:49:35 -0800 (PST)
Message-ID: <1b8b0f61-6907-4ae3-ac2b-54a3e25045c7@linaro.org>
Date: Thu, 25 Dec 2025 08:49:34 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: iris: Add buffer to list only after successful
 allocation
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
 <20251224-iris-fixes-v1-1-5f79861700ec@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20251224-iris-fixes-v1-1-5f79861700ec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/12/2025 06:27, Dikshita Agarwal wrote:
> Move `list_add_tail()` to after `dma_alloc_attrs()` succeeds when creating
> internal buffers. Previously, the buffer was enqueued in `buffers->list`
> before the DMA allocation. If the allocation failed, the function returned
> `-ENOMEM` while leaving a partially initialized buffer in the list, which
> could lead to inconsistent state and potential leaks.
> 
> By adding the buffer to the list only after `dma_alloc_attrs()` succeeds,
> we ensure the list contains only valid, fully initialized buffers.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index b89b1ee06cce151e7c04a80956380d154643c116..f1f003a787bf22db6f048c9e682ba8ed2f39bc21 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -351,12 +351,15 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
>   	buffer->index = index;
>   	buffer->buffer_size = buffers->size;
>   	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
> -	list_add_tail(&buffer->list, &buffers->list);
>   
>   	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
>   					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
> -	if (!buffer->kvaddr)
> +	if (!buffer->kvaddr) {
> +		kfree(buffer);
>   		return -ENOMEM;
> +	}
> +
> +	list_add_tail(&buffer->list, &buffers->list);
>   
>   	return 0;
>   }
> 

Missing an appropriate Fixes: tag.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

---
bod

