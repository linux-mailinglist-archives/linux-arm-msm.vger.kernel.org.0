Return-Path: <linux-arm-msm+bounces-35852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F639B00B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 12:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAD431C2252D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 10:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8C41D9668;
	Fri, 25 Oct 2024 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T8U0+Fr1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B721FCC63
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853912; cv=none; b=Al2mUmmg/u7IiUpt33vDO4mDacJk9+9mXQcKjZR3UFoOoufrgRaGDlTbBXUO5eL/7kMBxtCL+m6u4w9TsPa1e83eaw12L9kwXze1CbOhrUuckIA1TQRGjwjyTsbWU8DOAzjYClJWI5WMFUIot4RTge7YAmsTD/LHowpsITy+mqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853912; c=relaxed/simple;
	bh=ECX1hukPZNtp8BMXg37Df/yrLwJE8VU8+3Y5LlZlLIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHJi6aQVvdejFxQ7MvCs3lUslDgCM9+iEhuNopn3thJESAlNLW+qAt+LaIaqBBKSaRCgQI7QFJa2g39YbdrHE+AnVBkLU7bxtSf70iNlCStvBOESyhsjudyYmfo1r8f5yc4+oXf8dFHvkYnXrsxkel3njPCMKzSzi0UZq9J45sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T8U0+Fr1; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso19818871fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 03:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729853908; x=1730458708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ls7AmwwkTfKSPwgzIwQ1t7Vt1x1W+KysTayrz2pRuBA=;
        b=T8U0+Fr1RqQIP0wQIdhh+E2fs1bau/aDbDGxJ92pE8pzLF4/WgKvBpqOnVJ0AzTmjF
         UPUoaFgOO8lE7SpSS359tYGfsrmOKiuqgisfQcLZ5+KMDzeZPu2SD3bTsjNEXy4OAq4C
         VjyqVnyzPyXKWJ2Rs9Emo4znDCAdeHZS/w9OGlmdflrZqouSm2lL+5ubDMqrHgIvEnTQ
         1asAIjCatepicrzhKirqQgVVckycZrFWWYiDnlTcwYm4um05CcjC/S0JT0d0jv84NtN7
         IfZaC+xTh90lYi6puT87JAxwxBZwaN7EM8FPuu0x52r3zZabDv3WhU+wLOHAWjQGcZI3
         CaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853908; x=1730458708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ls7AmwwkTfKSPwgzIwQ1t7Vt1x1W+KysTayrz2pRuBA=;
        b=Mqz4lPf+0ATX2xwRTWX2BuSZasPzZChAEeqP/Q8mgOZ+QpHm5+VVUlK+w5/AMhpRpA
         ZgQFs27bqc2lcdULgwfsdevZzbQxybp6kTsWtbEAgzZs1zWarWkZF5NfMdSYzeVYHW4k
         cvYs4twdPlGm98/NZN0X6SFQ5gmcE5TmczHE/dpSyfFFK4evs8/BqOJilf/Q0Mhkqn41
         UV/qKmrEENAaaa6SNz+wda1ljS/JCzXueuEOaOip4cw6PeEGI2rb7mByCeje29y/XfoJ
         aMYjReJIBuyaaEd4b2aPgtSj7VoDRp2LvkzU1bIusfYSWtT+UKy62Iho9v01xT5FlHg6
         ddBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmws+2wyrZO0QpO+qDjT+PAMjIl2gdSrRzY3v0a2HO7HCJPOeX4M1gTcl0AgqIwa1ewg001KJ5t/s8eOeC@vger.kernel.org
X-Gm-Message-State: AOJu0YydtfbPxpUrbAZcysFhvsaJ3dKfS1ww+GrSoGsCP2Zgmu1RKy42
	9JYAeEX4ad21eHXHxxSUcoGbrp6a315NHDJlKLibGKQql0N5CKAUaigKp+oMZMIP77sHIbxG5wh
	p
X-Google-Smtp-Source: AGHT+IGA/Z7KmLl04J3eJ2bC/viGIJw7qPUnp5t83Rz5gQFdfFqzRrmTT/u2f9tQqAp5ONS6t/SWPA==
X-Received: by 2002:a2e:a547:0:b0:2fb:5035:7e4 with SMTP id 38308e7fff4ca-2fc9d2e54camr55436891fa.5.1729853908499;
        Fri, 25 Oct 2024 03:58:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb460169asm1442601fa.113.2024.10.25.03.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:58:27 -0700 (PDT)
Date: Fri, 25 Oct 2024 13:58:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: shaojiedong <quic_shaojied@quicinc.com>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4] um: Remove double zero check
Message-ID: <ekqjargt4udiqu2kp5awlxzm4l4xydu6fh6an5pspbt6rwr57l@qza5od72umxd>
References: <20241025-upstream_branch-v4-1-8967d1b6ea3a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025-upstream_branch-v4-1-8967d1b6ea3a@quicinc.com>

On Fri, Oct 25, 2024 at 02:48:49PM +0800, shaojiedong wrote:
> free_pages() performs a parameter null check inside
> therefore remove double zero check here.
> 
> Signed-off-by: Shaojie Dong <quic_shaojied@quicinc.com>

Doesn't match the From field.

> ---
> Changes in v4:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

NAK. Please get somebody from your team do an internal review first.
Please descibe all the changes, even retroaspectively.

> - Link to v3: https://lore.kernel.org/r/20241025-upstream_branch-v3-1-f6ec670e0206@quicinc.com
> 
> Changes in v3:
> - EDITME: fit the git setup and simplify commit description
> - Link to v2: https://lore.kernel.org/r/20241025-upstream_branch-v2-1-072009bfa7d0@quicinc.com
> 
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20241025-upstream_branch-v1-1-4829506c7cdb@quicinc.com
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
> Shaojie Dong <quic_shaojied@quicinc.com>
> 

-- 
With best wishes
Dmitry

