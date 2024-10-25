Return-Path: <linux-arm-msm+bounces-35800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFF79AF9C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCC0FB2118A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 06:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F9418CBFB;
	Fri, 25 Oct 2024 06:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6TRYkim"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AAF18C346
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729837035; cv=none; b=by3hXhiccSt27hEWcqJhbon5cQn6i1VsHr2ykjv9fJ36iOWIFhv5RPUweufoqdvjkyOexb5ov7bzuLu5bk7GHyKgI56rQ5rkm/QPI8Gex/0Mqehl/1n8YWtLnWFUuZDt1e/4t6tfBwtqvaM/Y+c6qauvd0ZKD0JqtO83+/ycrLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729837035; c=relaxed/simple;
	bh=W+h2hIxaTbJbCq1bNpDtgZkmCi9QEQjHAWql4hmsveU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPVqam/1zlrQvOW1BRr0hOdk31Uy3YevCnb+a0dJaHhnt3eqBdbSQMBa7fUTbhu+1KAF5tAoH6C7abLqdZUkfhekNJxIiCa1qpWwK8aWhihcqeIXvVrxXygv/WMiXjClCXsTdGkf3lHbmIZBYXMDIZ+rhoHtcaclnl2Gah3qwMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s6TRYkim; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so2321935e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 23:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729837032; x=1730441832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9E9GMT2zq2mbEV2O4EJezVByPCXnnSe1whzVTADesk=;
        b=s6TRYkimjiqXE2MU2cDvoXYLDh8KvavSKRJ9YB/3NUsHw14B4j+Oike0qRqqG9Y8gx
         /UTKeIQ0i1A6Uw3I1MerApfdSv2rDMWrNNTdDirdP2DMWgQLMB3r7k+ztssHyQ7tH4Ih
         iEyfbQzKRjMtIAZIyNJORrwXhnLNvy5AL5teSc/K6k8KMXayTKhVkZWDWWomWf6Iw278
         47dmd9I3cSnGGoda0xeYnAkBN6uI46Q3YcsikfTrmW2G8tdYJU2LkT0/zh7x3VWWd/C/
         TVoyQfWfyp5QUfUJlXpXem1P5xIqeoks8m0i/Xl8SQzJaH7arN9tzcweDqforuLV9Dem
         GL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729837032; x=1730441832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9E9GMT2zq2mbEV2O4EJezVByPCXnnSe1whzVTADesk=;
        b=OIbsepc+BUL57vnYqMJv6TtEwK4rJzLO5fXVap7GPQw5JCPa61H7TUACtCJSGozNlI
         wLZ92tzefDDsixoiZQIvlsKyO62wkY/guhE1/UIf/SpUbIJNtmoEwxJM4/0nNUBTqvTB
         8YPOAbhMfvPixiii6HdGRJ5g5mvLYl3qCz0hH12ZkS1ZEnCUHa1TeR9NK3NeLHNQtKC8
         xuMPljp+s6wzIo1iwfsLc2s0wd0kwSP2g8yFynvZ/qKSnFZeRKHBQSumqw9BwpI9SJ/l
         YmQJGfYTqJ+VOfXavHm0AkdmLQvar97HjoPTwf4EIUpeh894uuTeKE0kJhQ3AVWG2U+C
         K7kA==
X-Forwarded-Encrypted: i=1; AJvYcCVm65QEWx3r5/y1ezNDDoySTf5lCtPt+PGle62rU1uFZIx10Qk/eIm9TrdsKcowZQdAvr2Vzz7rYe/oYpGQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyAr1wF6XGLR65nWRv9Sl3XUVRn/jhKT4mlGMuTy8cIq4vfWc8B
	Usdsg18xZh6aXrXdJ7qfPa1Zs0jslPdXv9bBlBjfTkzzBG5UME80vuZB7Me3+mZXiJwRt+IXzTJ
	l
X-Google-Smtp-Source: AGHT+IEDx+cWa6c49QM56SmL045f7P5omDdP8ivPrip/QefrKIOVKTvQckFUkvIgY0d73GGf+SZImQ==
X-Received: by 2002:a05:6512:130b:b0:539:fc86:ce38 with SMTP id 2adb3069b0e04-53b23e9db11mr2248556e87.60.1729837031557;
        Thu, 24 Oct 2024 23:17:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1df2fesm65324e87.251.2024.10.24.23.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:17:10 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:17:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: shaojiedong <quic_shaojied@quicinc.com>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] um: Remove double zero check
Message-ID: <7b5opuxfpiciwocyewt3u5ghtcczhzl56fh4xlkyujqq4r77zo@uge6nvlphiod>
References: <20241025-upstream_branch-v1-1-4829506c7cdb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025-upstream_branch-v1-1-4829506c7cdb@quicinc.com>

On Fri, Oct 25, 2024 at 02:02:20PM +0800, shaojiedong wrote:
> free_pages() performs a parameter null check inside
> previous code also does zero check as following
>     if (stack == 0)
>         goto out;
> 
>     to_mm->id.stack = stack;
> 
> therefore remove double zero check here.
> 
> Signed-off-by: shaojiedong <quic_shaojied@quicinc.com>

Is this your name? Please fix git setup.

Also please don't send more than one iteration of your patchset in 24
hours. Give reviewers time to react.

> ---
>  arch/um/kernel/skas/mmu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/um/kernel/skas/mmu.c b/arch/um/kernel/skas/mmu.c
> index d3fb506d5bd6084046cf5903c629432cd42b5ab3..0eb5a1d3ba70134f75d9b2af18544fca7248c6d6 100644
> --- a/arch/um/kernel/skas/mmu.c
> +++ b/arch/um/kernel/skas/mmu.c
> @@ -46,8 +46,7 @@ int init_new_context(struct task_struct *task, struct mm_struct *mm)
>  	return 0;
>  
>   out_free:
> -	if (new_id->stack != 0)
> -		free_pages(new_id->stack, ilog2(STUB_DATA_PAGES));
> +	free_pages(new_id->stack, ilog2(STUB_DATA_PAGES));
>   out:
>  	return ret;
>  }
> 
> ---
> base-commit: fd21fa4a912ebbf8a6a341c31d8456f61e7d4170
> change-id: 20241025-upstream_branch-06a9ea92948d
> 
> Best regards,
> -- 
> shaojiedong <quic_shaojied@quicinc.com>
> 

-- 
With best wishes
Dmitry

