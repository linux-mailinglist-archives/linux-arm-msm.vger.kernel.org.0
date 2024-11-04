Return-Path: <linux-arm-msm+bounces-36927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1895E9BB3E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFFD528360E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35531B3942;
	Mon,  4 Nov 2024 11:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OAXaKUbu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0189118A6B5
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 11:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730721080; cv=none; b=taXPNjMjkD9oIHLGIXTXgT4lJQ1WLOQ+wopwvHr3uu+l5gsUWiQ9Vuvn77cR3Ae+IPl/Sc7ME03Nb9QJjhq4aRC8AuOto1z0PJokpPxp1dbicrJnpWCWweSKA/68lTmXSxHV1nBPf5sA2xIlvkiqNkuJSWpKK40YTniBDyqi24k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730721080; c=relaxed/simple;
	bh=fq3lCresZ1Gwfrzz4iTgq6DRQp5LWSYxXJfy/VGpkik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qy+aJx3YX95joZZLYWEKcwCrfnwguA6NEPB+SnkbpqDRm7bEhmpaqchLqLaCFcNL/933MVHBrr1X70bdVkNsxmze9YY8AbGBW6mhwksrxcfSQ60mgpnd599hNagK2zB3OaKNBphXMmKqYzhVYgbCIRSdbg9O5wPSo0HUSD2F3+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OAXaKUbu; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539d9fffea1so4220774e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 03:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730721076; x=1731325876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gWjZ2fAcFvfnugj2MZeg8kZ1+ISzIxVNaHCOGBN1kPI=;
        b=OAXaKUbuysgK5C3SIrEmiOTfrCetzV2MowtK6jojX7ubIQPCbJUXglHgsZtO+59GsM
         yCnUl8XxLgkZl3l3lSqmEo9GIKISY6l+owra3aSNLd5czKYwx373BC5bZL9qawznc/zo
         C2mQP5bQ3kbyvjXPbgAPElVgyUkpk6TMEhyU1hJ93ypdk1TTrc/LR5vwkER8oP5/gjPu
         892IDfLand+HK8aCqv7eWz6huGvV8Bn9iKy9LP2CmMvYYet8S3wL9111pxAatuP0v+6v
         cqLKz94hReEfMVPhv3mwJeQHQD0rHfVvw04ts/usu0y/EFUGyz+zj4EBS7P1ADaOL9jD
         ep+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730721076; x=1731325876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWjZ2fAcFvfnugj2MZeg8kZ1+ISzIxVNaHCOGBN1kPI=;
        b=ZRsFlZEa6kIu8xqLvdvQemPVYXsEXlJfbGGaXLNxZxgjgArn5Dol/QsXhxQeIc5QhH
         yti7q5hW7ftiwn69dce5lmdva2x34nrqH2v0zimm6keM4C6pUk4hOEdoISIPpu7WbZhS
         1jCu8WELBlcZ+V5S919a6qE0Oj1tVHOGVFPcwtJYtOc2tkPp3jja8fope8MgL+Yl4L+r
         5wYCzSsATPZPGiAGcQTBDqwSRL8BPwmmN5zgG5RAE5KB54pF380cEYllGRmyanZpZz4n
         kt7MXzdEcLBGU5ZpLZShn9KC7uE58MI4l7IYSS9sV7iwcLUEr4J+45lEO4QXHLrbITHC
         tDpg==
X-Forwarded-Encrypted: i=1; AJvYcCWHgx8CH1pJf3jOFUun3QX13WM5nFQZREY0Bt/nI1VmRX+bPE7PWKB+G8wK5opKjR7tZy/jHe1EjSJJi55G@vger.kernel.org
X-Gm-Message-State: AOJu0YwT6AFgcyieuMcgYGdx2yVZQkwEvDCsav+FC5LopeT9zjw5ZXWJ
	qhH+jk9Cl4yKUBq/Ohjv2A0VTlygH8pbcTUc7/ByIVMCMhfMR2ZNZOdlBvKwhigy+qTvVspgm4s
	TSKk=
X-Google-Smtp-Source: AGHT+IEsY3WjapLgqqKasH08PLy7V+a6fwGhSfU7jg1V7TNXGG6HrJAt/MV9sJGj+pU1ZVOUP2LHAA==
X-Received: by 2002:a05:6512:31c1:b0:530:c239:6fad with SMTP id 2adb3069b0e04-53b347234femr15796297e87.0.1730721075949;
        Mon, 04 Nov 2024 03:51:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9c0b5sm1643431e87.98.2024.11.04.03.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 03:51:14 -0800 (PST)
Date: Mon, 4 Nov 2024 13:51:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/2] ARM: implement cacheinfo support (for v7/v7m)
Message-ID: <dk7dxsyunx47gvmlnarjkqx63en52hktdnzwyyeyhohts7rkjn@a6lx6sq46vb4>
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>

On Mon, Oct 14, 2024 at 04:55:19PM +0300, Dmitry Baryshkov wrote:
> Follow the ARM64 platform and implement simple cache information driver.
> As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it is
> limited to the ARMv7 / ARMv7M, providing simple fallback or just
> returning -EOPNOTSUPP in case of older platforms.
> 
> In theory we should be able to skip CLIDR reading and assume that Dcache
> and Icache (or unified L1 cache) always exist if CTR is supported and
> returns sensible value. However I think this better be handled by the
> maintainers of corresponding platforms.
> 
> Other than just providing information to the userspace, this patchset is
> required in order to implement L2 cache driver (and in the end CPU
> frequency scaling) on ARMv7-based Qualcomm devices.

Sudeep, Ard, Arnd, Russell, I have been struggling to get reviews for
this for several months. Is there a chance to hear anything? I'd really
like to scratch this off my 'pending' list.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Handle cores like ARM1176, which have cpu_architecture() ==
>   CPU_ARCH_ARMv7 (because of VMSAv7 implementation), but no CLIDR
>   register (because they are ARMv6) (Arnd).
> - Link to v1: https://lore.kernel.org/r/20231231-armv7-cacheinfo-v1-0-9e8d440b59d9@linaro.org

-- 
With best wishes
Dmitry

