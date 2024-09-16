Return-Path: <linux-arm-msm+bounces-31850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D5697A600
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 18:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A71A31F22EFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 16:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FCF21340;
	Mon, 16 Sep 2024 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v35pTz0n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A63C1C28E
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2024 16:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726504267; cv=none; b=hMDvrMuyn0Ndbw67uqWMbuco7hNxUBWP5Qyuz2n8fIrIb3eQ1miSvYzOEGQN1ARiGw9/pJA5ZQU7eDKHk82gW+aZZH3RGb/daT5Nhv1wAPboZMwwcFBGnQQmuGJLnRjHNe2H6wTCQ5VcILFZW5UMlfDb07ibaM8pFtRc/VXh6LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726504267; c=relaxed/simple;
	bh=twZ7JSDjTZ7qLCxxJfnFADUgyhOWi83roOLkFdyjsRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6lVweLQXu1Ku6uwrPsR4FJKvvaRnnjymuIiyUgShEQPOJgCuiccPoY/J+LoQ5JAlwhWt/h1zBVdrTAPQkSKlV7KvaYPnNSpV05GKyEGBG2FKaWUOpdwqiy9roPSV2FaVUICSoYtAK/ULP/tpvtOll6VOj7KRidE3CKRYeRnKVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v35pTz0n; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-5c4226a5af8so4241728a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2024 09:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726504264; x=1727109064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oeLbs9OXhMnlBIcWIkX8j3XVqxgwiiC+SrF871pYLus=;
        b=v35pTz0nItyAPVprXANBA20TnpqN/tyfqGCLk80lEkKufzGQU+jqzbAlUskgZ+Bv/s
         fqU63wZFer3PnTW7CYj54aYakk+RKi+f8fTvVAqTvG2TSHyhYRvL8/4wxYbiiGt06/zi
         ZEcSRbAbnCx2gmHDkJ8/FsoCGJ0Wsrxe18a1CQ6+AbYIshp69TNmJ8FXaLtquRknMEI3
         sOjWZD248TXeNKERQ8DemH5NVKP6TiIHKpHqMd40u/ULK9yI8Nnz61x06C81A0l9hV3Q
         imCEZWAkczDptj6s5QPHyRh528mAWlGIvmsFg5jPE3V6oIZ3DXjDsdLWep0lPvY7hmvn
         BRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726504264; x=1727109064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeLbs9OXhMnlBIcWIkX8j3XVqxgwiiC+SrF871pYLus=;
        b=sT0wP/H5rVfTGFI91b7Qid38d7T4y41ZHOONTijPygHvvJBOWdddaSIuWEJRIDWKlU
         Cx4cGeK6t8Urpdb5yn9NQMU7AtQuRBuGPBWZ8Pu4jwO/2kqGq7eh0XsG7iG0MYfyNHli
         lxOEjE6t9Ew2MRgrqwEte5rjuJGy9oQnGlMewzigVh4VtHj94S3zCaq5bS7md45a/aYu
         +VGaqA0lO393lbcm2OAkAeOvXbmUsLR+OJ8bVUBJwmnWLF+ZSCjnOE07bYrTtTDoxxHj
         hf0TugixL4N/QBcC1oNYEMhiAsL9aoRgdp/bzN+pcrG8nMUSMlkrUVgYLat45ut6kcyN
         hcyg==
X-Forwarded-Encrypted: i=1; AJvYcCWPBujuBuBqxhJYBPog+ZqAmU9Sc12s6KEXr8TMk3Va1V0QLkCfjBdjfQsFoA63FDoZxepo7YWMVTeQffVi@vger.kernel.org
X-Gm-Message-State: AOJu0YwOn3SpiCLUczXWRWi6nmTF9MdGkWn7U0F5m9pA1brMkURpwsZT
	oGiu0l2UmU6vMSBNsP011sQZ+iTLWsUt5ESgCxU0JzoyLI2mAVB1s9PMdCkYt30=
X-Google-Smtp-Source: AGHT+IFqpg3y0eNAYuExiXvmR/2L/8uC+QISfZle1BD09rOpbBxe8848iIdI2mo/9A6GoZK0Wi6Z5Q==
X-Received: by 2002:a17:906:730d:b0:a7a:a46e:dc3f with SMTP id a640c23a62f3a-a90296eabc9mr2013207966b.45.1726504263616;
        Mon, 16 Sep 2024 09:31:03 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef80:251b:f65d:68f8:ced1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b384fsm339725066b.142.2024.09.16.09.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 09:31:03 -0700 (PDT)
Date: Mon, 16 Sep 2024 18:30:58 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rudraksha Gupta <guptarud@gmail.com>,
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/2] firmware: qcom: scm: fix a NULL-pointer
 dereference
Message-ID: <ZuhdQiyH_E4qVXtq@linaro.org>
References: <20240911-tzmem-null-ptr-v2-0-7c61b1a1b463@linaro.org>
 <20240911-tzmem-null-ptr-v2-1-7c61b1a1b463@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911-tzmem-null-ptr-v2-1-7c61b1a1b463@linaro.org>

On Wed, Sep 11, 2024 at 11:07:03AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Some SCM calls can be invoked with __scm being NULL (the driver may not
> have been and will not be probed as there's no SCM entry in device-tree).
> Make sure we don't dereference a NULL pointer.
> 
> Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
> Reported-by: Rudraksha Gupta <guptarud@gmail.com>
> Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/
> Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  drivers/firmware/qcom/qcom_scm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 10986cb11ec0..8bac4915c211 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -216,7 +216,7 @@ static DEFINE_SPINLOCK(scm_query_lock);
>  
>  struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void)
>  {
> -	return __scm->mempool;
> +	return __scm ? __scm->mempool : NULL;
>  }
>  
>  static enum qcom_scm_convention __get_convention(void)
> 
> -- 
> 2.43.0
> 

