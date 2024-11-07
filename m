Return-Path: <linux-arm-msm+bounces-37261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9819C0905
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 15:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C8711C228ED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 14:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE167212F14;
	Thu,  7 Nov 2024 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LQ7zv3BP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C75F212D00
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Nov 2024 14:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730990082; cv=none; b=DhrCT5oaT3fRG8gInwbyorkFN4O1lYbpRG34IN01SMwIuRpOsfiflDDWUnO1lFDQsf7QdNxmfx8fC+btouQMBuSEoX3zdUm9ASzzMN9r7HSo4JTlfUHD1Pmae5yZIfqvHiqNH7qM8+ih7Jzc/sQEuZS3z0gL0Fso+/HabkoBLGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730990082; c=relaxed/simple;
	bh=sYdP0JlYzj4mQQL95qniZ5n95iC6ImunCygdVJuw3YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDgNZ+bcW3+MPIOfj5FPLtomVDDV57lPZgqQh70ztpEsIa9/QBF5mN8rAAjPWzSmZDWZhFKvYvMVHt41r9ylQn9Nl8lrPY5L0dYtv3CDdYOdL1O+qLMlMTf1eI+ULCalgxsZFw8xVceWnjj9X+OsC41NWSXpiwbyaOd8epszY50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LQ7zv3BP; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so8863271fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 06:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730990079; x=1731594879; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sFw8yXJLqrkXU5hRV9LHBA5xHB7hRhKhK9JeN1oXec4=;
        b=LQ7zv3BPWWliXdprNS1MplJaIxFfxajUzC0nK9ukyhAgWq6YJ8kZY65cNQJg4k/LNR
         zRF5fAkN+AWbuYr2+4/l+2DmyfxX5nQ0IDv+fA3oGWi/COhL6fziKX3FO6qnQ3cDbJfb
         6X4WUUYeMAdWj9QEKJ1wMCc3yyztCQQ8O71ecxiwyKm+nzd7jFu9Fk8rUpH7AB2zPP0s
         dQWgg0H7ZJotHECOlV61oyUdBKMpBfhMXQGH4uBTqeCBm4KGxd0T5YSykqPOvRPXDu49
         cLEKOMYC5Y4m10eCzXKyNOj8ye2FqWFs5CJrJt7fJx/LCGAFjdmTOgirknC9cOLNQoqa
         yt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730990079; x=1731594879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sFw8yXJLqrkXU5hRV9LHBA5xHB7hRhKhK9JeN1oXec4=;
        b=spa87iaWItriu9WHrbIem+J/FckrYiDL4bg7D7U3HHN3/SQfXT9XfAuvQoX6ekbUhv
         HyjAzP+hyrRmo7v5Z1ErPY9QAirruKfdPcQN8Pgr1/wKryATzDti3xGKo+0yA0LDqNPu
         Pqxq6A3RiZn3WhghK848s3yI4ydV1dA+iYup1iJsYueXIX5ReAU6nQimF7fCVmBio608
         1eWySXwuW0Bl8uWeaxzEOWXcFHqQXmJqgVBI/hiaKq3ozKeHumRgUK9BxwCAN2aSYfvT
         DDxkIsOaqkf0/hIGtaxCeNyxw831Nz0Uhd6ck3FsIMJw4F21hJrU+KNxo5EB/Ap9MWfe
         N/BA==
X-Forwarded-Encrypted: i=1; AJvYcCXyHG12peeD4DjGHx3mbHQviRS/VEe+7s71Z/uL9PJoSw0CSAWn59Fd4uM77ffFebQfn4g1YzQdQQUiuuna@vger.kernel.org
X-Gm-Message-State: AOJu0YyRXcmt7ynQEu8fWf0C3CViW8QokBB3nvh6WrLlPQZrxMJ5ClR2
	pVCu0+wcPamUZPyBAuO3ikrFdil2LYm7fYJzbZcRDyjIkGPtcpnT9E8slLNiSjQ=
X-Google-Smtp-Source: AGHT+IE6u/vwpetFFBTpREnEATNArVxMnib3hilqhpSQwRreBBwE7Un+H8iFwlJKP4tC/3/OAp4Img==
X-Received: by 2002:a2e:a1ca:0:b0:2fb:9180:250f with SMTP id 38308e7fff4ca-2fcbdfd77bfmr168671801fa.18.1730990079154;
        Thu, 07 Nov 2024 06:34:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff179d7d5dsm2406701fa.108.2024.11.07.06.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 06:34:37 -0800 (PST)
Date: Thu, 7 Nov 2024 16:34:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/2] ARM: implement cacheinfo support (for v7/v7m)
Message-ID: <lkxm6m2u25o4qfvpja7qsldqm7zjxejkn6d5qihyxbg2zvntwh@icvun74e6rll>
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
 <CACRpkdbfckBBW5W5sEvz1LwzdOvTKi_fi7tDu+9nPeKumYkPeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbfckBBW5W5sEvz1LwzdOvTKi_fi7tDu+9nPeKumYkPeA@mail.gmail.com>

On Thu, Nov 07, 2024 at 02:55:55PM +0100, Linus Walleij wrote:
> Hi Dmitry,
> 
> On Mon, Oct 14, 2024 at 3:55 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> 
> > Follow the ARM64 platform and implement simple cache information driver.
> > As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it is
> > limited to the ARMv7 / ARMv7M, providing simple fallback or just
> > returning -EOPNOTSUPP in case of older platforms.
> >
> > In theory we should be able to skip CLIDR reading and assume that Dcache
> > and Icache (or unified L1 cache) always exist if CTR is supported and
> > returns sensible value. However I think this better be handled by the
> > maintainers of corresponding platforms.
> >
> > Other than just providing information to the userspace, this patchset is
> > required in order to implement L2 cache driver (and in the end CPU
> > frequency scaling) on ARMv7-based Qualcomm devices.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I added my review tags to the v2 patches, can you put them
> into Russell's patch tracker?

Done, 9432/1 and 9433/1, thank you!

-- 
With best wishes
Dmitry

