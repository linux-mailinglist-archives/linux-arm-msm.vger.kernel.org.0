Return-Path: <linux-arm-msm+bounces-41685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 971CC9EE20C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 09:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CCEA163171
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CF020E02C;
	Thu, 12 Dec 2024 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aGTVv0gN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0E8204C1D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 08:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733993900; cv=none; b=N7vOit4Bb2czOK7YPzZcGSFxqSfIoaOetxlCjrfyDzxE1VRIcUtTAFtedQe1dsimDr8Ism/fNmov80rhaxsqTmnhcqxTkohGXjcsZ3zurqMUcRo0UY520kvbWnPKv9Nzwl9ddJIdraTq3wv8HGcMR1x/5CN42LOXXr5qaMaazwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733993900; c=relaxed/simple;
	bh=I4Xk/D8rfiESpxcW0fqo/qFa7AlWlyEHMzoX9E5YCvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyjZP/XjtHoeFepkF9e/g6s+wAj5m76POmSawz7bsbfsl+cWqpcA+27SshH1VjGpfRR6/3Qm1EVbKeM6zWus73CT7y3nGDG/71oiVlVLk3JLsk+shi3pV/N420qplf7CKRr8fqPO4A/tTVCIFH6OkYyzGy5D5g17RxOXZfOACM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aGTVv0gN; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e3a5fa6aaso1576078e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 00:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733993895; x=1734598695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0zULvzH3pBwj/buB357mGt94OsxfZJXtnXCYQYT/Q3I=;
        b=aGTVv0gNW0+hzvZbSAgiC77FO9xllafa2qYC+ldZN1cFAAkU+hB5qKRBiXnJLKe7oi
         ww98wFpcP1ci2IHdPRQq0VL8uow6JzM0S1wx+3DS5oBFf6Buut7zpjrL3cxkwRVoSBKv
         VSdXv8m5luMazuQmHBZDousjOJhAizCS03ycIm9DqQronM61yPXdS7H9LRDY21EETVQV
         CgnKCrRiJypUtTp3Ij6QmPaOQ8TVvxSDlFkmzPF1sQ0zylKrA1ZyFdOeT7YlX7YZ2ZZH
         lUaIdhotV2hyDgnFMj554Mz4Yk1KpzzII6HZoNlPD5kjcxv8SFlZ1LJhmPc4bpjIW2YR
         H7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733993895; x=1734598695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zULvzH3pBwj/buB357mGt94OsxfZJXtnXCYQYT/Q3I=;
        b=bntxhWXsMUFANlsYck1dZOW7g+BUw3rZzWG2d1r4jADnbCNPHCuocUzTf7JE0NqoEt
         93d3iD/56nhYPZtGeLRlBmxs+GI8xD3KofLomjcqroQu+fAjAy1QzGO3z5KZg60y859R
         ZMrXV/9YHtb59XkHvikbwWFfibQjUUP7zwtBWGq2zQvk0h1muGNQ1g80L8LApe3yuHSL
         wm8ScS73ho9VFPmuiN57xNQwpzNl7o63QBqdhuXbeIp4PlkS1/a2gO28xtI9XD7rQNFP
         tTz6hmVQNheNBTY64vCwL8fFdWXOCXpEmzML3or64eG2b86Z4kQ5wH8IQV36BqYKyq7V
         FjOw==
X-Forwarded-Encrypted: i=1; AJvYcCXl3gMy/8ocYoycNImZZgVOakHHNci0BxaWl5kL/sN5zvjEALHSq7BhMqKBeqYAUtgxcuXjtcAYQ6XD3pvj@vger.kernel.org
X-Gm-Message-State: AOJu0YyfETZdlalewDBGdNbc2HVRncwuoEVjPC0RjG725MtyMIlmQqDF
	p5Xw/7bLdh7FpNbFENiLn2lVou7ookWjzxJOzPkLzLdpHUjSZ5LgPqhZOYACAFY=
X-Gm-Gg: ASbGncuDoNPLUD/nzmqF0K/flpTfx0KyzaeVxT2KoSzDu3hBm6UtBP7Iy0Vi+FbKOLR
	ADYcK7Y6tzFD7S5oRhbC2oduXIyYj/yVTZfBI011+ak1GjCrkd1fMEBqSEza7nBrT65jD2cyaVk
	D5oY/T50L7Nechj3sY50nTvFUG0F2pH8xBLfEMuJJ3kJQ0mM8Jg2tIORhIwQWPvIdCz1bJ1RvkP
	2FLcN/3GeSI8H49NWgihEWXhKFpat2Vd7jY24TU0EEBUCpvO027NZT/GPZGsspVaS5wK105/oJJ
	wWSJwIwzN3S+tD7tiGL7ane19SY++R7T9BOo
X-Google-Smtp-Source: AGHT+IFu73D5FA5z5HI+3RvFUYF8dHx/2OrBQKBCGrrR98zpwQOoDZGpuD2JAU6jhKxYEcNRR36Ziw==
X-Received: by 2002:a05:6512:ba0:b0:540:2fe6:6a3c with SMTP id 2adb3069b0e04-54032bfde4fmr243145e87.0.1733993895382;
        Thu, 12 Dec 2024 00:58:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e36ec76fesm1884440e87.246.2024.12.12.00.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 00:58:14 -0800 (PST)
Date: Thu, 12 Dec 2024 10:58:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 01/14] drm/msm/dp: set safe_to_exit_level before
 printing it
Message-ID: <iugoc25pnh5zzzr5mamutycqohj2z2255omgh3ztyoqgyjkg23@c7axf3mg5wy5>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-1-0b1c65e7dba3@linaro.org>
 <01f84965-8a11-4d6d-99a6-b0e37240d4cb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01f84965-8a11-4d6d-99a6-b0e37240d4cb@quicinc.com>

On Wed, Dec 11, 2024 at 05:14:18PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> > Rather than printing random garbage from stack and pretending that it is
> > the default safe_to_exit_level, set the variable beforehand.
> > 
> > Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202411081748.0PPL9MIj-lkp@intel.com/
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_audio.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> > index 74e01a5dd4195d5e0e04250663886f1116f25711..5cbb11986460d1e4ed1890bdf66d0913e013083c 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> > @@ -329,10 +329,10 @@ static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
> >   		safe_to_exit_level = 5;
> >   		break;
> >   	default:
> > +		safe_to_exit_level = 14;
> >   		drm_dbg_dp(audio->drm_dev,
> >   				"setting the default safe_to_exit_level = %u\n",
> >   				safe_to_exit_level);
> > -		safe_to_exit_level = 14;
> >   		break;
> >   	}
> > 
> 
> This was already picked up in -fixes, so no need to include

I have been rebasing on linux-next. Please make sure that your -fixes
branch is a part of linux-next.

-- 
With best wishes
Dmitry

