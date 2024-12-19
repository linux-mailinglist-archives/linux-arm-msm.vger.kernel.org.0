Return-Path: <linux-arm-msm+bounces-42870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E779F87D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD0541658F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140541C07EC;
	Thu, 19 Dec 2024 22:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CiFlbLVa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D47F16FF3B
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 22:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734647303; cv=none; b=LsDWxISRwF91TtHrn8EOKmd62I9lJr43SkVhtLjvKfqWR7fVQMnwz6RA2oGo+9gal7P26N2ih4O0xk1mmfnsihSujNTFnsI22EyPQZ/YkYHbqIJsJBx4AkQvn/zxJc0UV4E8Bb6wJUmn810CAFJq+5HkPPXn3RT7XSCOWzRrNXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734647303; c=relaxed/simple;
	bh=GM5DqXteAbZmRvOI4VG1NhWl8B36D534z0t2lNHjp3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5LFV2zLAKSOjnLw3aKYuqzjb/u+8t3vbjRoxTW/ybc3S0ohEFYngl3oiXTN+z2uGLFgo+B31uDjL9KlDHpkQVgmBha1Jv4xDfYoKLpv60ycEb9gDcRXZzH6Zg/dHNVVERU6Qx0kfAEBIbcGWd0xPHnizAWgCnI9mqU2HldnUss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CiFlbLVa; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so1560222e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 14:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734647299; x=1735252099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qq6TLQjKymtoXQuAu5gsaufR4Ph+rQRffBYS4657Z1s=;
        b=CiFlbLVa5vlUCX5PSjdvNhlFRBnqKUcHZmCf8/4kbvOTBlvqLHoe9sjOsczSRNXedN
         SyTwwVgmr2eoz8eqnSiy8oAu0UKPgSzPT7by5KsgbHgysq+AFO9Dnyj3V2csmMgwMEjs
         n3B5YZgfEupKyRJz1hTutm6xVTynWdV00zrMf3UF+zuJ/iuHh1XXHJWaMpZIUqaw1hOg
         GxSmkzTatnh7zaYqZ9oyowEkxHaP9dn5fB6h4oB0OCZLlcsG7xbUYGnmu9gUm9J17ZIL
         hJh1/RlQBkFAWyRVmA0bMW4wqhWNbVSOcOOzJKAGKikrscYqxupnpr+NdjPZscX7sP7e
         urYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734647299; x=1735252099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qq6TLQjKymtoXQuAu5gsaufR4Ph+rQRffBYS4657Z1s=;
        b=fOeE10m8fzVQT4iF6zNM6NsewT1tpUIgSDdsxwOKcdNX1g+YoCDyuIYOdyfzbHEM8i
         Og50D+vGqwxuKA2jv3cyBtqzImdA5/G3NwKT2l0igweFCXumShhj5MHgXp6FVlpF565n
         VRq/L7HVGlOdR0kFGSC2iyjNothEeXAZpWMCKeF4OGggud5+24L13m3DKMvjlZ2nHBa0
         tyjqeO7LzaskWrTQcRZJXVrHPu7/WgG5F2MaBvujqLUnvoPODZnrCDClj79lhjdmKfDa
         ln78r58lR1oZ53AnY1TZullehgeZSeFAo7KAQ54EsjxTxH9k28j0LmnPAoOwo4NLI2pr
         Lr1g==
X-Forwarded-Encrypted: i=1; AJvYcCV9T2SlotT1Y+beBSNsf15t/Ee90h44pgAUyWLC8gtCRjtxA4qb40hEf58AvtTXgeF86w7kR8Ga43s5cYYg@vger.kernel.org
X-Gm-Message-State: AOJu0YwGmeoBSVp5Es9UAU61OnFn2XNn3Ja7K0wxKTvskI6v1QmUhfK8
	AuFQb9xJUWQ+xawQHGh1fJOO0FL9AoVvLwcXmEDt59ENVHoH64YwVW2Sc/tVOkU=
X-Gm-Gg: ASbGncvEUWoT2p94rHMDeDNnhLTTLR7pMuptnQ5IgKwQszXa85o/r18AAiPoQ5H93+z
	K/6iwsupNc4+OWmWBy3ctsS0cjj5Etwzro2YuuefR4RZiH3kT7FSQQ3DCEe9cXS5wVxDR3wVxgS
	aKhwFjEKoOY9WBged4FbWfNMxpjNzQzZ34lj+LlZz94SGpsQXBRtTAGL4wuIhWg2Vqj67Em/sfq
	L3ozhIAiJfTHbbdHsLbNZVGx9AnjKeyMSevO7lu7KtbYeeaRMZxd0LuzpatFGVXN/gKj/Tgmlfu
	NkBuM5rnwUWKXM92ZFTh0IHFSKGrqTJZMX+9
X-Google-Smtp-Source: AGHT+IEw43tUBJRchCl8MuOYQW8rqwep01JG2Y96KkYtjaNzl6mBKUMCux0sBcGmrJiKrqRwBmyENg==
X-Received: by 2002:a05:6512:318e:b0:540:2fd2:6c87 with SMTP id 2adb3069b0e04-54229533e65mr94118e87.16.1734647299006;
        Thu, 19 Dec 2024 14:28:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238217d0sm288222e87.212.2024.12.19.14.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 14:28:17 -0800 (PST)
Date: Fri, 20 Dec 2024 00:28:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/15] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
Message-ID: <oqlzulxq2mtgxopmhirp5ftj7k5hmsga72xpbsj47dx2vlxazt@mv62qtxvfmbs>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-9-92c7c0a228e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-9-92c7c0a228e3@linaro.org>

On Thu, Dec 19, 2024 at 03:49:27PM +0800, Jun Nie wrote:
> Split PIPES_PER_STAGE definition per plane and mixer pair. Because
> there are more than 2 pipes in quad pipe case, while 2 pipes at most
> per mixer pair. A stage struct serve a mixer pair, so pipes per
> plane is split out as PIPES_PER_PLANE.

I can barely understand this. The patch itself LGTM.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 +++++++++---------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
>  4 files changed, 14 insertions(+), 13 deletions(-)
> 

-- 
With best wishes
Dmitry

