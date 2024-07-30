Return-Path: <linux-arm-msm+bounces-27427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3376941DBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 19:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20AA81C213F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 17:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC52B1A76C5;
	Tue, 30 Jul 2024 17:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UYFCHii2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B04A1A76A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 17:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722360046; cv=none; b=KXoomNCYHET2dQMEVsGKOeF6VKclK8xTGQenXY86LQZzbdRSQIJcOthwtpS5M3/Vu1G6ldH6BFlkfCiAr3T+uT/Ixzy1HJvvrC/yEGTU5kgmg6Dm6tzbB1uKgZBsqtDGqTHI08pKO+j43+oiO8UlDg/09PqQXoGz4qCZ6z/SlgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722360046; c=relaxed/simple;
	bh=vllOU64qgOZSEQ9z1np2KefJc9ch4rCTf2JyxG1ZzB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUMU5Qk0yp5w+WHGzDdBsEwqdKWkBTH50vA66YfzLTMPdbQzbAzRy6qzqSUaFJEeM9gf3miflB3++xQXWcdBeqV6Up7G0XYyj/ANvsLOfh/BA0zQ/sKV3Fw2BhF5bha1vsnuxza4PLvQiVCF3wGZFPuSGDhOgxKB7gsfFuZDgAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UYFCHii2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722360043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VnWrZUr3XTGc9rWoojma5OUUSoy6Blh+X8bHgZMhN+8=;
	b=UYFCHii2Px7bqeCMmbQGHvaTKWJS16O6gcS7o1KXAuueRjxTeFbJ5MPxowoD4ESxA3hhQ6
	dHximz+VhZ3OYh04nhhbqQWZVy9uP9UZ+gGs++GOIxTym9Ak1rWkL6v+H/8iGy6qvOlnsB
	GgxOd9FXdL1Uzm6/kA1XOWq8ajvAo1E=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-xYO2g0mWMyC47Iq_Pcw9Cw-1; Tue, 30 Jul 2024 13:20:41 -0400
X-MC-Unique: xYO2g0mWMyC47Iq_Pcw9Cw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6b796b30abfso62855326d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 10:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722360041; x=1722964841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnWrZUr3XTGc9rWoojma5OUUSoy6Blh+X8bHgZMhN+8=;
        b=iH94yRObZdzZ1pS0oM+x1ta0rizTzVlT4sYIEhefQUq8OkUk5Fyu3AVlGwwHHlxEft
         fey0GweoBhZ3plRtsm7dyxQ/BI/irkR9wglJI97tf29z2Yjk+lSBkJYw9+GHH8ElA4xF
         xFF2mAdUc39KilHSNkN4PJUhNXYSxTgqgcdWPJYKMc3wqUeYQ3MNw0pEsNLPo3A8lSU7
         R3fl6e6ySKNYQl5o/GYlEX+BR7+mG+aO72BQjDQkT1jXLDf7GfoKz0kxGfxkjIQVRG6L
         QEHAbt+KV8gEsosaed3Gi9OOgJiHwLEpry++tpEf7mN3UoOqemhQKcqFAQArup8338KC
         Gffw==
X-Forwarded-Encrypted: i=1; AJvYcCUmlh6Sze2lQ0iU3vAG9TXRNOCom63qRio7At2wvthEbQEdOi+l6zqD6f4tkvw7WtqXRpLYh8DTbG2bNEYGVJ+U+scH8Iy13nnUWYnuBA==
X-Gm-Message-State: AOJu0YyW+PLt6haUlSDCuTkSYvaDOU4kUtyXjJEONHARXVXFuj+R50zY
	n0oAC2zLqaBs8wkld3mUGK72Qp4Y5fdNlrsZlhMafzmwGXcJfyxzakKlYDo1sGphUI4ZBRJgTNx
	1QG4lU6T+CxLRBKwAiZLT2+sVHiZdwdMYZAimuW78Hwfwz/Rz/PZnBV+dE+K29Ho=
X-Received: by 2002:ad4:5bcc:0:b0:6b5:17a2:887c with SMTP id 6a1803df08f44-6bb5597d0eemr164177786d6.10.1722360041313;
        Tue, 30 Jul 2024 10:20:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqeyGsJFBHbEzj2FboEWy6B8OLfQrlTw3ZAzMmST64ENrLhEMusvdb5Ms/LCX/k50gGq0BAw==
X-Received: by 2002:ad4:5bcc:0:b0:6b5:17a2:887c with SMTP id 6a1803df08f44-6bb5597d0eemr164177336d6.10.1722360040806;
        Tue, 30 Jul 2024 10:20:40 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3faef212sm65362896d6.122.2024.07.30.10.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 10:20:40 -0700 (PDT)
Date: Tue, 30 Jul 2024 12:20:38 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	Amirreza Zarrabi <quic_azarrabi@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>
Subject: Re: [PATCH 1/2] firmware: qcom: tzmem: fix virtual-to-physical
 address conversion
Message-ID: <p4wbqdmytbzjmxsdovnboetjxbyvuhkwunieuwoh6rui72v7pb@huxwyphj63yv>
References: <20240730-tzmem-efivars-fix-v1-0-bb78884810b5@linaro.org>
 <20240730-tzmem-efivars-fix-v1-1-bb78884810b5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730-tzmem-efivars-fix-v1-1-bb78884810b5@linaro.org>

On Tue, Jul 30, 2024 at 05:38:48PM GMT, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We currently only correctly convert the virtual address passed by the
> caller to qcom_tzmem_to_phys() if it corresponds to the base address of
> the chunk. If the user wants to convert some pointer at an offset
> relative to that base address, we'll return 0. Let's change the
> implementation of qcom_tzmem_to_phys(): iterate over the chunks and try
> to call gen_pool_virt_to_phys() just-in-time instead of trying to call
> it only once when creating the chunk.
> 
> Fixes: 84f5a7b67b61 ("firmware: qcom: add a dedicated TrustZone buffer allocator")
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Closes: https://lore.kernel.org/lkml/20240729095542.21097-1-johan+linaro@kernel.org/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> index 17948cfc82e7..1294233a4785 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -40,7 +40,6 @@ struct qcom_tzmem_pool {
>  };
>  
>  struct qcom_tzmem_chunk {
> -	phys_addr_t paddr;
>  	size_t size;
>  	struct qcom_tzmem_pool *owner;
>  };
> @@ -385,7 +384,6 @@ void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp)
>  		return NULL;
>  	}
>  
> -	chunk->paddr = gen_pool_virt_to_phys(pool->genpool, vaddr);
>  	chunk->size = size;
>  	chunk->owner = pool;
>  
> @@ -442,14 +440,25 @@ EXPORT_SYMBOL_GPL(qcom_tzmem_free);
>  phys_addr_t qcom_tzmem_to_phys(void *vaddr)

We should update the kerneldoc here, it currently says:

    /**
     * qcom_tzmem_to_phys() - Map the virtual address of a TZ buffer to physical.
     * @vaddr: Virtual address of the buffer allocated from a TZ memory pool.
     *
     * Can be used in any context. The address must have been returned by a call
     * to qcom_tzmem_alloc().
     *
     * Returns: Physical address of the buffer.
     */
    phys_addr_t qcom_tzmem_to_phys(void *vaddr)

"The address must have been returned by a call to qcom_tzmem_alloc()" is
no longer a strict requirement, it can be within the buffer now.

Otherwise, I believe this should fix the problem you and Johan
highlighted and looks ok to me, thanks for the fix.

Acked-by: Andrew Halaney <ahalaney@redhat.com>


