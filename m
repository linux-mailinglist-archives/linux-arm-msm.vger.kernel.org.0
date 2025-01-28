Return-Path: <linux-arm-msm+bounces-46404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5320A20E15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 17:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33765162B12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 16:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928A118D622;
	Tue, 28 Jan 2025 16:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YB75uTDa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8724E198E65
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738080631; cv=none; b=IuFoNZ7iHdeOLLjIlnUUfblXTOBUfmChsV7iWcGZ5SJT2/fy8EsBzgMNOj7NQL8sl19nLmrJp/N7MEMPMKC2XJPyrjcBF8P4gSNY6YHJldzc4jPOOaC2b8kE+PEKqeN2hk/NTwo3OAol6e7U3Lq41LppkXBJtC6KegcBEXxgw4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738080631; c=relaxed/simple;
	bh=egOux6gcmaoTI0j9MjbYb0pXyysca3tnIQKYYnqVgV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgePpmtxJYi2XleF0SLV6lPWoynyvxhdY9RvbOfOGUxSEIseTNR+H+VHTJD03FIBb+nMcizQzX3YP80ShE9lR6VcR10KBFGDMXnFTPp8/F/c90xed3y6nRl/GP0q2jgIc9lyyMF+DWtmUeP0r/6kP1gbWy569hsdw212LjRXKqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YB75uTDa; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e384e3481so5562208e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 08:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738080628; x=1738685428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZf10GZliLRxUQeGZ7ym9uDe5C3UZVqCnkotswK+/Fo=;
        b=YB75uTDavBK5y9lxFX/9KQGbQbaGviUhkQtoJc9VA3FaTESXtLTESxzEyPMKpZyr0l
         lofCo9+m36uJxPSxi8ih7tMUCe7XFDSXOK8AR/tFJ9WZlb4W1IDCvm/VebHhAFT3B6S0
         h9IE2gpfxu/iOQs5+eyepIKVjpj5nJdrIGluKJKN6xwBs9NyX1f8+DI6uwqFyY0iVV5Y
         EhZ7xWlr8r/ztjUg9uyGA96kbUB2Aob04011LRN4qZ1R/WFASFNMwncUFNM89SAKKlgs
         DWGxn/SQbgadqropC1kgXfiTfGrNOhe8e9Mq6YCAxjlwM5TysDk3OfkZ2QnNudULjRHE
         SSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738080628; x=1738685428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZf10GZliLRxUQeGZ7ym9uDe5C3UZVqCnkotswK+/Fo=;
        b=E7yB2K/XOiueQWFOG+pBFa0Hd3GCMwmqjCsMGorx6MjThtkWvZlvrHNoUMMPj142pd
         UpK9PE8tuGz1CTDVI1SmjcK5w5lWuarhmvXVAVcKjoD3wM+DySJxByHZfEr4yBYlGiJm
         eap1l3t+EaQDXr0UE5t8fwaqo/z+sT5jxeJmXALNUdYD/eZfVgeVlS0wTVOlIx3EokUD
         fw5A7/Z6u8wl3/xze31RVUjPA7+XwFNDkfUfMuNhc9zrR82GeBrdykjib+BtVU6aAC/D
         +BmF8etd4SogkzR17p+SrhLF4kjMqWnmkQ0TnVCJngo8LvBuOGBlx4S/wkZz+KGhfe+4
         MCTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFlBO8kEOk6PR6V4rBowNTA3Jox7WB+OQIQO9KI21YpBfTCMEIe+dkgOkQ7JzNhVoNgMabpYaxAkDwSs6a@vger.kernel.org
X-Gm-Message-State: AOJu0YzB2RfvSNESfjk6qLE+uENGW2UfmaUqmTTv+MrgmEAbdmXewqrN
	sFShTykxUIiqQoYo/0ZcwvJkdiBxKNWWFjArFTuMD34xcSQ2gxX6JJJfbN/YamYLEWGVu1qrTvK
	2kJo=
X-Gm-Gg: ASbGncvDjky+taLoqctiX4KRnbydkvGqpMVMDe2lxymjsi+4nNuGEj0nga9UtYUxVFV
	M6kOFCX2g06WxiqBevnb2Z/Bz9pZRe3/a3xmxsBVtJnewvBYO+7Y/hNU57otzndDiZaIMjOtShh
	dNI+tRrz60K9Mtiwni8rX52Ulb+9uA9pY06ri6mh3vqw8Pp9NGQFqRIT2zGBkXF2ZOWQlsHgGW7
	FOagDkEQaAe7+gGfFgbVxbRgv/Jl4ug0/LdBQNfEGJJKmYXjOufYvJYDVd2z3qSLl6JsORVc9eU
	QsCjJmoZz7rEhbgkED9fG15fjAfET1nnbKvu/3F3/UtHSJx+woq9GJZF+tKWJZuG+VWrBiw=
X-Google-Smtp-Source: AGHT+IH3bdg/f9LscmTQMikpEOOTfKvr/U/CMVxZsJUs0BVXmhJpdoCHO0gTm5dXPQNrCEOxQX19nA==
X-Received: by 2002:ac2:4826:0:b0:542:9987:6e9f with SMTP id 2adb3069b0e04-5439c27d3e7mr11858528e87.53.1738080627598;
        Tue, 28 Jan 2025 08:10:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83816b2sm1668905e87.233.2025.01.28.08.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 08:10:26 -0800 (PST)
Date: Tue, 28 Jan 2025 18:10:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Saranya R <quic_sarar@quicinc.com>
Subject: Re: [PATCH] soc: qcom: pdr: Fix the potential deadlock
Message-ID: <3upgcew4ulzxtjjnawqiu4jomm3mm5nf2kxworgeod23nurfrv@5ato4wq54mpm>
References: <20250128080751.3718762-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128080751.3718762-1-mukesh.ojha@oss.qualcomm.com>

On Tue, Jan 28, 2025 at 01:37:51PM +0530, Mukesh Ojha wrote:
> When some client process A call pdr_add_lookup() to add the look up for
> the service and does schedule locator work, later a process B got a new
> server packet indicating locator is up and call pdr_locator_new_server()
> which eventually sets pdr->locator_init_complete to true which process A
> sees and takes list lock and queries domain list but it will timeout due
> to deadlock as the response will queued to the same qmi->wq and it is
> ordered workqueue and process B is not able to complete new server
> request work due to deadlock on list lock.
> 
>        Process A                        Process B
> 
>                                      process_scheduled_works()
> pdr_add_lookup()                      qmi_data_ready_work()
>  process_scheduled_works()             pdr_locator_new_server()
>                                          pdr->locator_init_complete=true;
>    pdr_locator_work()
>     mutex_lock(&pdr->list_lock);
> 
>      pdr_locate_service()                  mutex_lock(&pdr->list_lock);
> 
>       pdr_get_domain_list()
>        pr_err("PDR: %s get domain list
>                txn wait failed: %d\n",
>                req->service_name,
>                ret);
> 
> Fix it by removing the unnecessary list iteration as the list iteration
> is already being done inside locator work, so avoid it here and just
> call schedule_work() here.
> 
> Signed-off-by: Saranya R <quic_sarar@quicinc.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Missing Fixes tag.

> ---
>  drivers/soc/qcom/pdr_interface.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry

