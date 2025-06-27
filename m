Return-Path: <linux-arm-msm+bounces-62857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA6DAEBE1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 19:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74BB17AC195
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F522EAB8D;
	Fri, 27 Jun 2025 17:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qh8R7gRo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531A92EA730
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043842; cv=none; b=LsaspKzvcmRIz9D6aAdtivIqRV8HpbbCqQBg1Ik+SAMmqmlfb7ckNWbiVAcgf3AL5QqwqvzIgqW55AOFK0kkK06X4E1K9ZwIwW8SmzZ6kusSYW1ML4Ea1KZ2hBOkTZmVhOwM/oYDYdrfHBr6UxFUph5XHsxayDu/NrumEpRv7sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043842; c=relaxed/simple;
	bh=HSdDzpGEZh0Z+ObhrUewY7ZjXhceaEJ5COoUxc2cJis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tf/vUP1z0zGCjJbg56LNUib1Q6JBMEwAYN+klWbfSX2XSF7p9xsl6FEh83HUGhlYAWaKNVwsHkQZ8GpM7Lqe5i67ump0Hm7ehAYVSHEoOoAXGXUiY679F80AL3giCxbUheJjJJskfCpk5uG0CQNWkTNjyWi7JygyzVJHsiQV3Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qh8R7gRo; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so2169155f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 10:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751043838; x=1751648638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0lM+9jotmOVOM1lf7WJ8vyAHMjEM1wCcsIwWRjnqrk=;
        b=qh8R7gRoLMJtn8znL8iuP+5EtC9hEvibIe+YPvnaIgeM5vpRLRGSCJP2Lht2b6slpc
         jsMZbc80LDgYL7ZNF03OxgRqYkiyR1lRWhIEuLRzYd0ILxrI1XH96aKWrMI0LAj61Ivn
         kOU3M6HY4j+wVp308CByEa0ZGhSjI8WqGvnErI1QqVNWWHmK7pU8dkpcYTHjR37az02y
         TVOZZ8mV0hs3k5fMOyVi6IpBP5aIdQxTcW3+u+kYsMWHQOE82i57+A88CO3ZtBszmPhY
         YDTCMvHOgM4OCy9baWXN9xgEankQYFFIo6BrYxyaxbuWmHsGMQsvcLXnOG/vvRNrYmlW
         YAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751043838; x=1751648638;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0lM+9jotmOVOM1lf7WJ8vyAHMjEM1wCcsIwWRjnqrk=;
        b=BLLOpflmgIcrx2U4nVqljp8if1jVTsLK2KA1lBy550MOz0bnvjbvj8iXE38KEso6jz
         O4U6U/h4w3WfMHZMGBr1e8JsSUlm3SgUlBBz75pOCvSXqMDeiS9HvPT56gMgld/zTPb1
         Gj7YqFDWdnPdIsEpfmSHTg7AL+9pZcBUBisBubPR00eqpPKNMjWTxzbYXNyASs5HWBvI
         qOUYdVc4gyv01cLomoy6fLAEDkWnOVgcbJ3q0yjIwQRqk/TTb0SnWpbJHJmDv9jTuU/6
         0RgDFJHtwwExw1r34ameQaizOTcc7gqOajCQ4Kj/cCcyPDxqIisonGg6Mm1p8t0TfIRV
         81CQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8hprLvuPfVWiIUzylA/ifX049cJ8CLyNY1D8bWxSouaRl/gbnom4KY92dpknrxBE2FbX/9f2zj1cr85Hc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9EZ3C22yCTuKxwF3yuzjkD6CfTEO3zNRUkIU9Mh5K4fby9aWP
	PWh3h8PyBh+akBGK0LGi1F1J3Zu/oQgAlvRC+Wrt33Pn7INihqN4MUmVA/tReHdoWSw=
X-Gm-Gg: ASbGncu7J1Brebim/YVcqNqHllEk0xvYUtpdgXS3sLaqlls++OhH5OopLibBjWewqyZ
	R0dTzjww6/j8qF63aDA9fsiJXrtmfnMHCh1PSOR1FXXcjuICk7gDxPSQ1g/qaBAnSV3/9ArFFT4
	7R4QM8Vxj7oblVGJ1/BZ5in+D8yKAbwqlNpdhYsAzZzxYOASJ3TQ0kDlNPDicrQQsgFQkkpBZmB
	9ztm/UvYpPeMt3uYnv2okx7MoRzZguax74S9xdLVYqH6uixvbeAa8aDVX5UdilF3jA1FGoyn+fB
	/2mVwCn8iqHfO+BXOYNZF7XFZSEzP+unemr9Ar/f2UPJtr52Ovs3lCiKZ7VcRHpCZZ5+VBKMVcR
	2b07AJ1l2QWh1GxZYtj+Chtm/o9w=
X-Google-Smtp-Source: AGHT+IEQnYHLVvvRdo07ECuZNx96gkoirCSuaogNuBRIDfH0KzcTC9kqZQWgGcTR8Zpls8/g0XN7fg==
X-Received: by 2002:a05:6000:481c:b0:3a6:f2a7:d0bb with SMTP id ffacd0b85a97d-3a90d0d6cd6mr3642010f8f.12.1751043838332;
        Fri, 27 Jun 2025 10:03:58 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm57074825e9.27.2025.06.27.10.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 10:03:57 -0700 (PDT)
Message-ID: <ebdbb517-ffa2-422a-989e-a4f19ab0163a@linaro.org>
Date: Fri, 27 Jun 2025 18:03:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] media: iris: use np_dev as preferred DMA device in
 HFI queue management
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-3-51e18c0ffbce@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250627-video_cb-v3-3-51e18c0ffbce@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 16:48, Vikash Garodia wrote:
> Update HFI interface queues to use np_dev(preferred non-pixel device)
> for DMA memory allocation and deallocation if available. This allows
> platforms with separate DMA domain for non-pixel to use the appropriate
> device handle when managing HFI queues and SFR regions.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index fac7df0c4d1aec647aeca275ab19651c9ba23733..a31ebe947f525f0d7c09f8b786939d01b62532c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -247,24 +247,27 @@ static void iris_hfi_queue_deinit(struct iris_iface_q_info *iface_q)
>   int iris_hfi_queues_init(struct iris_core *core)
>   {
>   	struct iris_hfi_queue_table_header *q_tbl_hdr;
> +	struct device *dev;
>   	u32 queue_size;
>   
> +	dev = core->np_dev ? core->np_dev : core->dev;
> +

dev = core->dev;
if (core->np_dev)
     dev = core->np_dev;

Is much easier to read.

>   	/* Iris hardware requires 4K queue alignment */
>   	queue_size = ALIGN((sizeof(*q_tbl_hdr) + (IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ)), SZ_4K);
> -	core->iface_q_table_vaddr = dma_alloc_attrs(core->dev, queue_size,
> +	core->iface_q_table_vaddr = dma_alloc_attrs(dev, queue_size,
>   						    &core->iface_q_table_daddr,
>   						    GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
>   	if (!core->iface_q_table_vaddr) {
> -		dev_err(core->dev, "queues alloc and map failed\n");
> +		dev_err(dev, "queues alloc and map failed\n");
>   		return -ENOMEM;
>   	}
>   
> -	core->sfr_vaddr = dma_alloc_attrs(core->dev, SFR_SIZE,
> +	core->sfr_vaddr = dma_alloc_attrs(dev, SFR_SIZE,
>   					  &core->sfr_daddr,
>   					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
>   	if (!core->sfr_vaddr) {
> -		dev_err(core->dev, "sfr alloc and map failed\n");
> -		dma_free_attrs(core->dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
> +		dev_err(dev, "sfr alloc and map failed\n");
> +		dma_free_attrs(dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
>   			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
>   		return -ENOMEM;
>   	}
> @@ -292,6 +295,7 @@ int iris_hfi_queues_init(struct iris_core *core)
>   
>   void iris_hfi_queues_deinit(struct iris_core *core)
>   {
> +	struct device *dev;
>   	u32 queue_size;
>   
>   	if (!core->iface_q_table_vaddr)
> @@ -301,7 +305,9 @@ void iris_hfi_queues_deinit(struct iris_core *core)
>   	iris_hfi_queue_deinit(&core->message_queue);
>   	iris_hfi_queue_deinit(&core->command_queue);
>   
> -	dma_free_attrs(core->dev, SFR_SIZE, core->sfr_vaddr,
> +	dev = core->np_dev ? core->np_dev : core->dev;

and again

> +
> +	dma_free_attrs(dev, SFR_SIZE, core->sfr_vaddr,
>   		       core->sfr_daddr, DMA_ATTR_WRITE_COMBINE);
>   
>   	core->sfr_vaddr = NULL;
> @@ -310,7 +316,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
>   	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
>   		(IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ), SZ_4K);
>   
> -	dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
> +	dma_free_attrs(dev, queue_size, core->iface_q_table_vaddr,
>   		       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
>   
>   	core->iface_q_table_vaddr = NULL;
> 
Other than that.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


