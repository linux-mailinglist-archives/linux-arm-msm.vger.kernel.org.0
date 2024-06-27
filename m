Return-Path: <linux-arm-msm+bounces-24522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E86E91AF4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 20:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EF0D1C22B0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 18:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5822869B;
	Thu, 27 Jun 2024 18:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FdWy26Es"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAD57484
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 18:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719514169; cv=none; b=E6X4ys5E6dc/C+AYFyLhlFKZDUBLFL5hoAwGhstiWtd8tN2sEjmiy4Qka+wIe3ifwXEhoApj9fe7GSYQeEwVdjEqJqhNgOMAwtgUgZdobMqom7xeWPVi7BI0lkEAcwAwcV1aJBzyH9ZGfoaMj0QwD0PchPsttk6HjoaAQCWUY4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719514169; c=relaxed/simple;
	bh=+loIEVQbiIvCdpK080P2B2BC20Dlavm8jb2rv/XemnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5WM85QOiThMSbP7opxWUljaX6Bb4Q5L06XNXNzKb4KQm9wWhBl1odVTkIvuoYilImK7IDinjZN3M1j0FjJf8f1GgnVdO07RwFyBLR7wpNAUxn8/5yTdFIXnQZlcFGFEDoID4uKqA1wt8vLzQbxUiWVOIm3eMZGHINVmzMyWdoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FdWy26Es; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ec595d0acbso66252181fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 11:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719514164; x=1720118964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dVlORxLyi+No4z6mzakpdO+uVb1Q8CeU42Yrc8ZopLA=;
        b=FdWy26EsYMg1O8PZFwF05yLh8qmyWIh/bJIZBfTXIukjW4SD8S5so7RUAejlmOfJJ5
         F8dC/MAIBBnDOPqFo8P66rB+OqDbAZbcRRxmTQkNo5lQUZPGwzuzn6asIVZ8sX2vzp3H
         C4zbJKzGlGY6dxTGKim0wOaCvWKwtkAGxPnjDtgvanFS5+gLuYlH6ITjqQDYV3JxiOGh
         JQP/yZGtNtV6CocGq8efMJJFUfgo8z1BYZ2kOFvCqde0izI9T9AwjK+8+UM9UZwzRBuC
         sIKIe12ebCEfgxn9Ep8s5KqEW1+FYW4bcBnMAbVDKFWgyJqmsb975PtOymgxy05VIGz4
         4Vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719514164; x=1720118964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVlORxLyi+No4z6mzakpdO+uVb1Q8CeU42Yrc8ZopLA=;
        b=i3ApxwAIK2uP1r/xL2ZxEX3g45k+Nxdz1lrO4oZob+K2npwN9uZjD0VBrn4Ky35UIF
         Zlq8EHzNl/y6lRswqNi4poskQJ4ZtwExW3LATV1nxVLLWP3l43b4xveFB1+x+R0CaPzo
         5F8snIJeVrhdp2GEr0rXtr2d92d3vIjJgI4Ikh+wL6s9DogV1X8NwS17j9sgydvv6UHj
         rGXlJZnEr8S//cMsis9KwSrxkh4hjpBUheC3SkuLFqlMrAITWnKgpG2vbLszmenFpbNk
         kd9HBFeD+fJHzxslZw9QVxYlhr0ZBMyX1Q19PlY0nbd3XvtKGnsYYH4ggq9CkjYg60Wg
         Hrqg==
X-Forwarded-Encrypted: i=1; AJvYcCUmQE6Za8ohGjaZENKtdSgSQcUuKOwfzpcz8iaWJsWfyL7LuVwiko6uDWRB3OjwhXfLM5QRI7qTI1dHNcXU0Kalkd0E1MQ/pQdxr2DwoA==
X-Gm-Message-State: AOJu0Yy9NGEnSg0w35QqVAg/x1iSzcvzDa5avlDUqLZONxNxLWoSEsFm
	J0cftnPHy73zgqeXTkcWtOqXUm4GAsGSUatwYLWhj6EO7RlXp0vB4bEoyi/dbu8=
X-Google-Smtp-Source: AGHT+IHjokj2V4brw5oo7jZhZncGgRxq7Wc7ZcWz0FJNgfC3Iqf86Brk3YH4RGDnAqwGbGyYRtJGkA==
X-Received: by 2002:ac2:464d:0:b0:52c:a88b:9997 with SMTP id 2adb3069b0e04-52ce185d20dmr11430836e87.49.1719514164382;
        Thu, 27 Jun 2024 11:49:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab101c5sm20119e87.79.2024.06.27.11.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 11:49:23 -0700 (PDT)
Date: Thu, 27 Jun 2024 21:49:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: codecs: lpass-rx-macro: Simplify with devm
 allocations
Message-ID: <dalyp774uk4ugomvdtrjkjpenfogx6dkx4vtiq6serc4unzasw@xa4adquvcijn>
References: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-1-ede31891d238@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-1-ede31891d238@linaro.org>

On Thu, Jun 27, 2024 at 05:23:43PM GMT, Krzysztof Kozlowski wrote:
> Allocate the default register values array with devm interface to reduce
> number of error paths.  The array is not used after initializing regmap,
> so move the freeing to place right after devm_regmap_init_mmio() to make
> it obvious.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

