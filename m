Return-Path: <linux-arm-msm+bounces-33258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A575C9920B1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 260131F215B8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0A018A933;
	Sun,  6 Oct 2024 19:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWaeBYRS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D04518991E
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 19:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728243019; cv=none; b=fqvLqI/oHGfsxTbBvGoJqOkRS6lafqQnUk7WJEL87Vr0tRDBOsGixTFu+kyQbds5wq5t400soZc+SdW6+6/rn1izjfJXNHQz2x5pnEvXrnqNJPg65fx3OyfDgW21g3rGgBA+2uLVjBxvVThBGkKon40Aue/zNYdnIpK6HE3w0DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728243019; c=relaxed/simple;
	bh=fJ3Ho1cEdovWeSk+dmhUKf7LRaPVSa3qPIgn+4HwhHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daoDPtG1sGNVW50GfyHtFmWpszzpwa2Qv5e1NhigPW8n9OtHRF80cEt1xXATbQ/6ZZtClQA8AX77GE2sO9uNxpSYs/cb5PMXyhBfR1+WxWBfTw+jKXVZOy4M3nOc9zXb2FzFY4DwpQbV/9JxWG9hGLA70Y2WTgzn892az9wIv+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWaeBYRS; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2facf481587so30794391fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 12:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728243016; x=1728847816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dVvLRaPldV6ASEnwNgEvh18GwJNwB87mJYTcs6m+9+g=;
        b=EWaeBYRSU0yxpdwqPkw66l/Yowx7fa3/GD6bCrEpWaFUFcmBnI6Ma9NZePKhl2/Vfp
         iX3Wtp+3uapMXSWiri3hfSho5GzpReW5LxXUTpss/NICgM0tpsWkzKv9G+jpmirj0RB2
         PGfoxCRVvMg8RkEXF8tSAA0Yxw0dJB3ahYO1Umcqpayl9SaEEgVNVZRXDzwoJOL956xf
         ETqXbH79E4hGvfcrMQ33R9T6wT1olY2RUW9XgU9Ls+0jTgKK5U+C44L+AAoEKAm45qlT
         ZBgOtyMY4FuzHFUDLs/I1x9IQoSlg0T37BkOCkMWfudxCt2PxblYbKzF86JbtQHrYWRP
         FsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728243016; x=1728847816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVvLRaPldV6ASEnwNgEvh18GwJNwB87mJYTcs6m+9+g=;
        b=gFB+76H0gFg+5qwyuJZO1hAk0JA4SvNUB/rqgg/kYyl8FZCUPhE3qVNFRjFh1FItCi
         QkzPlqTjANoVgHIqan16eAXs5hJMFzGb5x5BNAa3T9HXPnlgLWBL8UZF7XyHQPS//JIg
         cICBW8dWeCkSRk3t1g/54/5FPnXanITbURGNxLmbGJ3KpTPRr3adq2KZlQUTWSX+Q1jt
         qEm8yIVdznYuaRL/TMgLwdNsI57zU+s2QwqkIV2/7l9DaYGNvtu0oZ2if1dQz/mYJcLo
         KKbxdd4nn5dCGxdMQvItUtDirPZ8BVNnCO5tPESkPyI67PDbc3vOYIFaIHowpCambbH0
         DERw==
X-Forwarded-Encrypted: i=1; AJvYcCUEp8CH+gUBt0/JEs2gobAOVuhp4cVSv6Opy3tHiFxK5XSsRak7zXleWq4rC9FZySlOwOZKyb/GqRoKMJnM@vger.kernel.org
X-Gm-Message-State: AOJu0YytC4ueH4yZKrFryyWAM09+lnODJmDB/iCEQF62lRWB2fYFkOvl
	U/BVVdVxdylu6VL76AFT1mJ+rJSVzYO/2LcsALLM3iJXiry8TQKAfAk9+4ABx9H+lWpgcpBf72S
	faowaOCMp
X-Google-Smtp-Source: AGHT+IEPMlnQaj8tK84Cvl35raB/6qevbHmBlz/A7YMY4Fe0ApZE7Srgfx2UlCF4CqSyAln9kD1HXg==
X-Received: by 2002:a2e:8514:0:b0:2fa:de13:5c1b with SMTP id 38308e7fff4ca-2faf3c66252mr29896271fa.29.1728243015517;
        Sun, 06 Oct 2024 12:30:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9b24898sm6190881fa.90.2024.10.06.12.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 12:30:13 -0700 (PDT)
Date: Sun, 6 Oct 2024 22:30:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuldeep Singh <quic_kuldsing@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: qcom: qcom_tzmem: Implement sanity checks
Message-ID: <wzrj4vhrb4h3pe5dft7vqz2tl55txdyuciuxlysuck5isi7r4z@bs2ts3popy2t>
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
 <20241005140150.4109700-3-quic_kuldsing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005140150.4109700-3-quic_kuldsing@quicinc.com>

On Sat, Oct 05, 2024 at 07:31:50PM GMT, Kuldeep Singh wrote:
> The qcom_tzmem driver currently has multiple exposed APIs that lack
> validations on input parameters. This oversight can lead to unexpected
> crashes due to null pointer dereference when incorrect inputs are
> provided.
> 
> To address this issue, add required sanity for all input parameters in
> the exposed APIs.

Please don't be overprotective. Inserting guarding conditions is good,
inserting useless guarding conditions is bad, it complicates the driver
and makes it harder to follow. Please validate return data rather than
adding extra checks to the functions.

> 
> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> index 92b365178235..2f2e1f2fa9fc 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -203,6 +203,9 @@ qcom_tzmem_pool_new(const struct qcom_tzmem_pool_config *config)
>  
>  	might_sleep();
>  
> +	if (!config || !config->policy)

config can not be NULL
Ack for config->policy check.

> +		return ERR_PTR(-EINVAL);
> +
>  	switch (config->policy) {
>  	case QCOM_TZMEM_POLICY_STATIC:
>  		if (!config->initial_size)
> @@ -316,6 +319,9 @@ devm_qcom_tzmem_pool_new(struct device *dev,
>  	struct qcom_tzmem_pool *pool;
>  	int ret;
>  
> +	if (!dev || !config)
> +		return ERR_PTR(-EINVAL);

dev can not be NULL
config can not be NULL

> +
>  	pool = qcom_tzmem_pool_new(config);
>  	if (IS_ERR(pool))
>  		return pool;
> @@ -366,7 +372,7 @@ void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp)
>  	unsigned long vaddr;
>  	int ret;
>  
> -	if (!size)
> +	if (!pool || !size)

Is it really possible to pass NULL as pool? Which code path leads to
this event?

>  		return NULL;
>  
>  	size = PAGE_ALIGN(size);
> @@ -412,6 +418,9 @@ void qcom_tzmem_free(void *vaddr)
>  {
>  	struct qcom_tzmem_chunk *chunk;
>  
> +	if (!vaddr)
> +		return;

Ack, simplifies error handling and matches existing kfree-like functions.

> +
>  	scoped_guard(spinlock_irqsave, &qcom_tzmem_chunks_lock)
>  		chunk = radix_tree_delete_item(&qcom_tzmem_chunks,
>  					       (unsigned long)vaddr, NULL);
> @@ -446,6 +455,9 @@ phys_addr_t qcom_tzmem_to_phys(void *vaddr)
>  	void __rcu **slot;
>  	phys_addr_t ret;
>  
> +	if (!vaddr)

Is it possible?

> +		return 0;
> +
>  	guard(spinlock_irqsave)(&qcom_tzmem_chunks_lock);
>  
>  	radix_tree_for_each_slot(slot, &qcom_tzmem_chunks, &iter, 0) {
> @@ -466,6 +478,9 @@ EXPORT_SYMBOL_GPL(qcom_tzmem_to_phys);
>  
>  int qcom_tzmem_enable(struct device *dev)
>  {
> +	if (!dev)
> +		return -EINVAL;

Definitely not possible.

> +
>  	if (qcom_tzmem_dev)
>  		return -EBUSY;
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

