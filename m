Return-Path: <linux-arm-msm+bounces-35091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3EF9A4E1B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 15:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 070E31C23124
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 13:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA14C2868D;
	Sat, 19 Oct 2024 13:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Plt67TzT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84D421373
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729343661; cv=none; b=mVJ1lQlrm5xKnpkHF3i9FrGogAYFZUCxusZZbMVUbz7fudCSjBnoL7goopUIieYuKrKgHH4QhCOTo7kqHEDvO+Aefx40/wi8nFr+ibdul+sTU8dMJq5dMpzafA4qZ/HQ6VEf8t58BUO85djl7nRRBVF0N+hcPoNMjdMrzcjqqU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729343661; c=relaxed/simple;
	bh=nFttUmTwQuRiqVsH4U6ZQZ/PMt4PrXLz7NgQU/oEK8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1WxyqLt6Zcg72bPk2ddWcVJmioJDVRweON53oaT9Ak4XL0ptdWhToVSs7b9atg/t4sUGin71em6dsBMFBCjsdXGdF3umJi8NwUtbwql0M71Weoy3bsgnI2k9rZSWpXGTieN3hfOuuJKcStmGsvE4qSDIbtBJmX0a6gmar1fpZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Plt67TzT; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb587d0436so30521191fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 06:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729343658; x=1729948458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DsxiJAaLUxZ8WyINPgvN9VPitcA+1/D6dK458s/cN50=;
        b=Plt67TzTl2IXLwu94G9Z15BCR0usb1bTL8g0q8gET6N5zLfwqLFZqk0M7Qh2ezB1+l
         BGoj+/8vrhWBByarMMY2BtIBF5EKRdHA14WAlhV1VSyF0oEHNWT3+a2/kMNv5Comay7Q
         EODGXDoYw92M2o0ZGgWSRdEL8xqLGX5eec9xw/zKVyFNqu2tRHVot7IAifYismHAZBDP
         9RE78/FqZ/GSvfGNIS3H2np0Z+vnEp6x4Xj2un39c05AjRMZt1E4+8Fwj1KUzkumvLz5
         HnLkpWQcq00DiM6knrQUJGeZ1phY73Kn3qxY2XEnjLfmHXkBeW2J8oJj7vzMszb/OxAg
         H6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729343658; x=1729948458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsxiJAaLUxZ8WyINPgvN9VPitcA+1/D6dK458s/cN50=;
        b=rfswREOUsJrne1Pn0dSOYSrfowa52wgwoJrmEJiTjMW4Upt5kVOzPEA106u1Nmdjl9
         wc5GpZwa0cHi/pRUObxEyf0dURKD5fSFuJi87/bAaiolq9Iw6uMJtVbfOg4P/Go4W+YZ
         nO9M8Htg6far1IyeHmnI38pGx0eYT6Bre21lkENRGLpETJt5EA71+gvZs7hzCDOTmcQf
         PZeWFC8EwkX65yp4sdtvTn40lM4QnyaRwNxO3dbIQ4vQx2bEoM9g5KK2AeetD50qkqLC
         kQ5DzSjl2zjPEpp63KdTIvGocMF1YixGqkv7VRgy2MNISmcqzQaBx+S1nKWPxbCM9YvZ
         nRoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHKNUykZteY1EgkBH7/QLN1KnDMJL31lfxzlTruJFysYWgkeIqAYKq+yg/UDWtIdZP0v05MO5L2KMZo1xo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1qWnOb9vO4wrIJuwVbcactgBhCBZGT8dAI4AjqXuSA1geAsBr
	eAv5luSlccCw8a8GD143b4lelsxdGsz5cOEdDeupmnyDy2QQEIV/DcrK8d6OiXQ=
X-Google-Smtp-Source: AGHT+IEjv+MXakpefCsgi5HLZxPHwYDurtx/yD0nuWtCXMQYx9C38W3JKkkERUExxV4d2KBsbM6yEQ==
X-Received: by 2002:a2e:e01:0:b0:2fa:cdd1:4f16 with SMTP id 38308e7fff4ca-2fb82ea761bmr22402471fa.14.1729343657256;
        Sat, 19 Oct 2024 06:14:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb80712069sm5028321fa.0.2024.10.19.06.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 06:14:15 -0700 (PDT)
Date: Sat, 19 Oct 2024 16:14:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm: a6xx: avoid excessive stack usage
Message-ID: <k42wmgziqia6balqsrfualbg73giesjxxtyaldkxsrdxkro2li@6neybqsu27me>
References: <20241018151143.3543939-1-arnd@kernel.org>
 <20241019093146.kdp25pir5onjmg4g@hu-akhilpo-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019093146.kdp25pir5onjmg4g@hu-akhilpo-hyd.qualcomm.com>

On Sat, Oct 19, 2024 at 03:01:46PM +0530, Akhil P Oommen wrote:
> On Fri, Oct 18, 2024 at 03:11:38PM +0000, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > Clang-19 and above sometimes end up with multiple copies of the large
> > a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> > a6xx_hfi_send_bw_table() calls a number of device specific functions to
> > fill the structure, but these create another copy of the structure on
> > the stack which gets copied to the first.
> > 
> > If the functions get inlined, that busts the warning limit:
> > 
> > drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
> 
> Why does this warning says that the limit is 1024? 1024 bytes is too small, isn't it?

Kernel stacks are expected to be space limited, so 1024 is a logical
limit for a single function.


-- 
With best wishes
Dmitry

