Return-Path: <linux-arm-msm+bounces-37084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 275999BD52D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 19:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57D7F1C22B4F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 18:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BBE1EABCD;
	Tue,  5 Nov 2024 18:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="quRqXxyQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C251EABB4
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Nov 2024 18:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730832159; cv=none; b=rCTeRnLrNEnG8fPJTyeB45SZXVCIDa2Y/W5LO7jzHWT0wRHXLKRTZiWja0u354XXNeExJEB8q4M9q/hWe+CcRJ95t177QviNtT3Fr9O8fLf7Wud7kep2szcbiiAjRix9rkrAqjcBBeJ64/7xKiaPdeIIDk4ZNUtfPG723qDBIy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730832159; c=relaxed/simple;
	bh=uRFSGSp6I5JuMM4uZmsg8At2nGyRL0YDNEodwAq8/EY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZgvctCqFTHtrZdJdLP0CT0WanYShDa+RbHzFT8bkxHtcGgQDSuZx4lSY+UhXneJ/tS0MjgiW3ydz+gIq8ZUdfK2MmyVlCvVXgxNdBK3+Bwr94nu5TDIq+Rj3SaFxPUPeVQXHDIqgiQqSakclpBH+yyTr+8+CIydA4i8LcefO26o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=quRqXxyQ; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3a6bf539cabso12011515ab.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Nov 2024 10:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730832156; x=1731436956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/5k2rLKTo7KgnD4BR9+2dIjyjzlQVVkq8ThtV9wFto=;
        b=quRqXxyQcW2ur/r6B/n0BVaC+lLlki4s2hSmLr2FCPBpd7q8940fec2BUoloLWEOAd
         abxx/qi2UiiLELk9VimGFf+uW8ftTZtPIfXYJ0L+EH3we1Qzq3vOX3LwCbg93+WY1uPj
         35XSO84/fId6m1UKZOmcj5Q4jPXCIqoOSYi5pFADfxxFqsyTZ1/EETZTNXk/7fw702Yc
         6x2VAIeeGHC1PnWlqFC6q0CHqZnG1iiDgluwIIr1bndtSQTQQ81AMl4T4/u/LuK0hfuO
         mWBHTseM70oMxLKLnGGvaVgJtPY/liXSk6QO3IuBL3RZjAG0cLRiS1Pnnr3NtUsFQuT+
         1T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832156; x=1731436956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/5k2rLKTo7KgnD4BR9+2dIjyjzlQVVkq8ThtV9wFto=;
        b=mKYc12fWe4+UOij89cWoNLabHccPrYqb1CSr5/LH8Hpo392fR7535zslHZf+yVNYRv
         BEMbKnLqPvAFE0mXbiW7CKQ5x8t6D4a20+U/eplLRLu45VnZ1Uluy4tf5PNglgKZyECC
         nPEHfKHYeRpuWqwCdAo+r16lbaXn9aPR1Kn2wk+wDh3ZeYW1Ca54ScSrV19AwMLyWuf6
         kCDs7bOfuopI4MBuhkp0FVpbqEiZWYmspiPm4dCZ9Q50sZZS59VEpbLMCM9fNuh/TIoC
         ACFNU4qygGlyRkzRu5JT7lAeZu/iXKFPmjh1N1/jovRidssC1a/vM54dG/eU6FX30p8Z
         /NIg==
X-Forwarded-Encrypted: i=1; AJvYcCUSqT164rFvf9NXb00qbhyT8MHOmFfcxa1wdcf7i6WwTagLIXqpYSA7DRGyUA1dcK0xL5P9VqD7rcT6IWwh@vger.kernel.org
X-Gm-Message-State: AOJu0YzVjNu6JSqT1JlQBdMsUkpwjCvOdWq0ph+CLANnqxatv8AL8JZa
	5lb2LH4CCTelc6wXQ93U9nV2NnsDFOOSshwyFFoGu1wELCDQZhZ8YeMBZ5zgWBWjcyx1sGEFQn0
	kKhLf/wdJxO10tZkQELArfX9msKlGevLnPECTMg==
X-Google-Smtp-Source: AGHT+IHafiE56RLycAX61PwBNuvy4TPzSnAPrcXkk0qt/3LnY4O4q/UmngQM9Vlm/dj0VEmvvCeNfFq4tqlEFF5LAvc=
X-Received: by 2002:a05:6e02:152e:b0:3a6:b445:dc9c with SMTP id
 e9e14a558f8ab-3a6b445decemr144631815ab.3.1730832155951; Tue, 05 Nov 2024
 10:42:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104064650.799122-2-u.kleine-koenig@baylibre.com> <6b5b4f25-0f42-4f83-b6b5-82c1adbefe83@arm.com>
In-Reply-To: <6b5b4f25-0f42-4f83-b6b5-82c1adbefe83@arm.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 5 Nov 2024 10:42:25 -0800
Message-ID: <CAH2o1u77TViePZ2eh+FY7oQXxFAp+SEVM38ROP1uKfeMZ9E7hg@mail.gmail.com>
Subject: Re: [PATCH] iommu: Switch back to struct platform_driver::remove()
To: Robin Murphy <robin.murphy@arm.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Rob Clark <robdclark@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Michael Shavit <mshavit@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Georgi Djakov <quic_c_gdjako@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> > diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
> > index da336863f152..382ba2841849 100644
> > --- a/drivers/iommu/riscv/iommu-platform.c
> > +++ b/drivers/iommu/riscv/iommu-platform.c
> > @@ -81,7 +81,7 @@ static const struct of_device_id riscv_iommu_of_match[] = {
> >
> >   static struct platform_driver riscv_iommu_platform_driver = {
> >       .probe = riscv_iommu_platform_probe,
> > -     .remove_new = riscv_iommu_platform_remove,
> > +     .remove = riscv_iommu_platform_remove,
> >       .driver = {
> >               .name = "riscv,iommu",
> >               .of_match_table = riscv_iommu_of_match,
> > diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
> > index a2f4ffe6d949..e84806eee281 100644
> > --- a/drivers/iommu/sprd-iommu.c
> > +++ b/drivers/iommu/sprd-iommu.c
> > @@ -531,7 +531,7 @@ static struct platform_driver sprd_iommu_driver = {
> >               .suppress_bind_attrs = true,
> >       },
> >       .probe  = sprd_iommu_probe,
> > -     .remove_new = sprd_iommu_remove,
> > +     .remove = sprd_iommu_remove,
> >   };
> >   module_platform_driver(sprd_iommu_driver);
> >
> > base-commit: c88416ba074a8913cf6d61b789dd834bbca6681c
>

Thanks, LGTM for iommu/riscv part of the patch.

Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com>

