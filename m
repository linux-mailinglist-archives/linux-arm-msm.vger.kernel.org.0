Return-Path: <linux-arm-msm+bounces-26623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF62A937721
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 13:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C53A1C20D37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 11:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF35E84D2C;
	Fri, 19 Jul 2024 11:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aX9w0ErI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE5784E14
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 11:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721388570; cv=none; b=foZEJRQIcPmeZ4YQ140ruP9zYP/9iISbQfxtQ9RpyJ99VSMKkZxPIhRL0Xg5ZHdKKpA047/4ziONa4nMbYvS9ppQ5NU/O80gn/Tx2eSpvx3cxKE9UpxtaOLMsyFHXL2gfOFPyxEJnnonFE2K39dDN/kDJJIhW2/WcohAeMclHsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721388570; c=relaxed/simple;
	bh=d885wO6ZZiqVGlX5skkPomIniLdQSV0WS6LUE03sajc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZC1t/qBkvdPTg41FDs7UL5GxSfJ5n4vy0WhkibkEfI/P58prM8cTzCvU3ERzTBlBAewdnuW2C1UYBd3y9/NJOtGuUFfjqDzHx13skQpDQsxlCNRHK+qJZlTxPttJWWQD6gdi4KlZm3oMdm6z9W1GtRQuyhJm45ArLyfqKSzvM4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aX9w0ErI; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ed741fe46so1935179e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 04:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721388567; x=1721993367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EUe1KmR1homs38GJN3VUTc88rskqy350KhsEGjDSIQs=;
        b=aX9w0ErIB0J0POqQ0dlmNLBIhlXQRI0+IXGUcl1C4q529gPTkCYk+FVGnCZUW5b+3V
         9OOBANcQtwwzhyUT2rx7XcxzGsqCiH586Ayokdf8V1bohYxprIpz7lm/umI18CFFeRNr
         STVp+/+F9FvH3lFmK/a8hxzIB3mAVo7FCb6rCA/QLWvPfRL0pCgrcUKHDgr32k7PUgm4
         ev2VpzUopD4uMUD9V8Uas4HfUnB6iH2IdW7LdeKdxRSyPIJovuEuba0UXGyspwStry7h
         YNXHjZ5dohRRco5R1g1ttVXS+0ss9HoNmd5qTpuc/0eW+beZcrOuw7kvhbwY2hmahujR
         T2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721388567; x=1721993367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUe1KmR1homs38GJN3VUTc88rskqy350KhsEGjDSIQs=;
        b=Tv0uQuekrIMPygqsRHe6b0cfpRn4JjiiL2C9lZgdmN1mXXKLAmHtbDM3ryTrOPsOkd
         NW539Eu5EFpjTpn56hmOQ+KpWbgGTED+jhxyNkKZS1PnMwW3qrUN9fMtdm6vvBbUmBj8
         Y3dilFvrIEhmTgcKlGGypoD3/Am2YcBbBClu3wBJs8ByZgrIjaD6PkFt4oigNd1f2aKm
         zQ3+hPuANdbHTb3FFfjgZ2IAoe1eKJiUhYbOLjryTkdbmKNdJuMMm3/rMViYaoRnr1WU
         JNVVv4bnxTgvrOKcbzN8rQD2hz3LcHKrTjsplLapa6T1SWsqwmR0MYewtmUp7BbVXI2L
         LVeA==
X-Forwarded-Encrypted: i=1; AJvYcCUlCDEaxkNw13xhmr8Kyd7fpMNEoarTQU6bpFuD2Go1TrvjDImMVgz1y1B2bJl573+xjkt9ICux0ZkPe0NYeCrGHRtHsnHMwohD2irbmg==
X-Gm-Message-State: AOJu0YzbL+Cyewet5WB8KdcTWuWdQ66j6cvsxOj1Clm48I5z++0tLU/6
	372+lbE430Ix714+cRAU4+ZDTs93vOMMYdgPSR6TTgX6mxrB9F0YdVjfgDTSbWY=
X-Google-Smtp-Source: AGHT+IGrP39+ZynNEPP6XIz3gZODEK4Pgdp9fJGvd1Id55KuEB5cig6ZzbIGYRSM4zawNwPDyyjpjw==
X-Received: by 2002:a05:6512:33ce:b0:52e:9428:c6dd with SMTP id 2adb3069b0e04-52ee543e86cmr6100144e87.59.1721388567414;
        Fri, 19 Jul 2024 04:29:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef556acd6sm166955e87.148.2024.07.19.04.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 04:29:26 -0700 (PDT)
Date: Fri, 19 Jul 2024 14:29:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Chris Lew <quic_clew@quicinc.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: mark qcom_pdm_domains as
 __maybe_unused
Message-ID: <4bhowo76xl3ktpjwpclbvruv2bsbfrs643kdjn6sfivxt2dgx2@yqyojdlk3egu>
References: <20240719101238.199850-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719101238.199850-1-arnd@kernel.org>

On Fri, Jul 19, 2024 at 12:12:31PM GMT, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The qcom_pdm_domains[] array is used only when passing it into of_match_node()
> but is not also referenced by MODULE_DEVICE_TABLE() or the platform driver
> as a table. When CONFIG_OF is disabled, this causes a harmless build warning:
> 
> drivers/soc/qcom/qcom_pd_mapper.c:520:34: error: 'qcom_pdm_domains' defined but not used [-Werror=unused-const-variable=]
> 
> Avoid this by marking the variable as __maybe_unused. This also makes it
> clear that anything referenced by it will be dropped by the compiler when
> it is unused.
> 
> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

