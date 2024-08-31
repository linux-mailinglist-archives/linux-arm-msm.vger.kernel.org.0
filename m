Return-Path: <linux-arm-msm+bounces-30343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 872C19671FB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 15:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 402A328168C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 13:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDA1168C7;
	Sat, 31 Aug 2024 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V1jjL5XG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3F31400A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Aug 2024 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725112440; cv=none; b=iQlfGZzeBlPQpfYrEV3cR85fdi/8lpEVnRmG0OmaMHZTYIfI0ph2OUKxTwQbtJ0fF6wh7187tZZYsUUYZ955ivhA9XrvVqP/FSBcirHQwkjVkw3kP1n4y9REOPbby5NvhFWB9pHNIovgYk2bOuhm1vl1+nTNjInnDzTdqbh3GoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725112440; c=relaxed/simple;
	bh=wJ4QgFNuqwu/Leb/N4TW45209mZ5WZDv25eNPwvyxO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HASPJipLgAk6OGP1+nPzynPMJzvf1YV7q0Z/bwUKAvPw1FgTAq1LEWRMp+VouVHHp4MW3XbZF40BauY5xk957nveCL5E1fsOnCfGhMtB5hPE6TH/wNvVRZVSAgTUmUGr9Oj0L+TsIb+T/8fXde5vWS+7jw8MNHE2WPdCyHhUDTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V1jjL5XG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42bbd16fca8so11964585e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Aug 2024 06:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725112437; x=1725717237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=36D9CATQ2pvh5CBMOXJIawRjTPDBw45elgFZcq41bNg=;
        b=V1jjL5XGEq/3FxsxLbbIBYQP1A3m+CNzjc0UwmTIAf8wcRF9bLUw1UYeU5PPWw7Lsf
         AyStAX/hfsp7xSYO9/1AjXv8qk6jZczpQjGfiuJ3+Ku7CKZfSmm0E404Ai6xqu26E+Mg
         5VHoewo6DBbe1s4I+wZ6651TjANCPwP7iwRaRlPMyE5cJXc+EV7r+Lklcbi5HuSNBJex
         jQzuu/AN23x7KaVxUF5Rcf/rHT4yB7biBUabHEGZxQ0B2aJOfEInlQmWEoEgs/QuqPx/
         KTnOJRdUQUfWQPmI8oqdZuvC5tOpDFmvXZGiW3WkGSS7eKCHn0k/rMf3Hl9KFv3LFlEx
         4qoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725112437; x=1725717237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36D9CATQ2pvh5CBMOXJIawRjTPDBw45elgFZcq41bNg=;
        b=eYSo/HK1GnAc8x0X85rcBePCOqNIszjGRSBg/GOrY3TbLafMIr4+z+N7EHfYFGc/IU
         RdPS5R75FZKhaIOE7unLDchJuJjr+dJmCjA4oL6DK7Q8zfj9KelUg+nl6+7Ip6akBW0S
         lUWl8fUUK4EgLwIBfpFUBQa7z0ZohEaqCoTMOWkBcFveAIgcWIQxirE15BYmEwApQZks
         m9IhG2/RK5Hxn6oe9fSncYhVUwKRDea6J8dlIiA+tPBussAu0UfCgMAzWuXsDbLft7hs
         4XLN728XZSG7jFOltrHpF/OAUfnEOMDNlg+aU4EqLyZQfxZCFirz5aLlKu5dVQkq6mtF
         Wz/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCGgkcJRJrUIs9C6QDOnotHRQXfQKLCn+pqRwL/xCgqclX5Uc6YuWvnJ1JjkurxXBa3PZxgW99ysTEEAvn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2IqcYioKpcZ8ELKbRUgb9xsBqe1tUizGJQFshhC1a+K0Cb6O6
	VFQizCmw6A7jVBsuJ9Aq0kgALZHUGBFyLEbZZIQP5Hs0ih7ej4SQjgTl0m3wobY=
X-Google-Smtp-Source: AGHT+IHX2XVIKii7FuT5487mVz6P9wGbmrCYDRQmGLpqd0rgF3FqG6sdOGhjn9n4TnD5FCIX0Rz0Cg==
X-Received: by 2002:a05:600c:3b25:b0:428:d83:eb6b with SMTP id 5b1f17b1804b1-42bb0294357mr77516125e9.15.1725112436454;
        Sat, 31 Aug 2024 06:53:56 -0700 (PDT)
Received: from linaro.org ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6deb2dcsm77602925e9.1.2024.08.31.06.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 06:53:55 -0700 (PDT)
Date: Sat, 31 Aug 2024 16:53:54 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now
Message-ID: <ZtMgcsjpA6e5kSoc@linaro.org>
References: <20240830-x1e80100-bypass-pdc-v1-1-d4c00be0c3e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830-x1e80100-bypass-pdc-v1-1-d4c00be0c3e3@linaro.org>

On 24-08-30 11:09:07, Stephan Gerhold wrote:
> On X1E80100, GPIO interrupts for wakeup-capable pins have been broken since
> the introduction of the pinctrl driver. This prevents keyboard and touchpad
> from working on most of the X1E laptops. So far we have worked around this
> by manually building a kernel with the "wakeup-parent" removed from the
> pinctrl node in the device tree, but we cannot expect all users to do that.
> 
> Implement a similar workaround in the driver by clearing the wakeirq_map
> for X1E80100. This avoids using the PDC wakeup parent for all GPIOs
> and handles the interrupts directly in the pinctrl driver instead.
> 
> The PDC driver needs additional changes to support X1E80100 properly.
> Adding a workaround separately first allows to land the necessary PDC
> changes through the normal release cycle, while still solving the more
> critical problem with keyboard and touchpad on the current stable kernel
> versions. Bypassing the PDC is enough for now, because we have not yet
> enabled the deep idle states where using the PDC becomes necessary.
> 
> Cc: stable@vger.kernel.org
> Fixes: 05e4941d97ef ("pinctrl: qcom: Add X1E80100 pinctrl driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> Commenting out .wakeirq_map as well would give an unused declaration
> warning for x1e80100_pdc_map. The map itself is correct, so I just "clear"
> it by setting .nwakeirq_map to 0 for now. It's just temporary - this patch
> will be reverted after we add X1E80100 support to the PDC driver.
> ---
>  drivers/pinctrl/qcom/pinctrl-x1e80100.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
> index 65ed933f05ce..abfcdd3da9e8 100644
> --- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
> +++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
> @@ -1839,7 +1839,9 @@ static const struct msm_pinctrl_soc_data x1e80100_pinctrl = {
>  	.ngroups = ARRAY_SIZE(x1e80100_groups),
>  	.ngpios = 239,
>  	.wakeirq_map = x1e80100_pdc_map,
> -	.nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map),
> +	/* TODO: Enabling PDC currently breaks GPIO interrupts */
> +	.nwakeirq_map = 0,
> +	/* .nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map), */
>  	.egpio_func = 9,
>  };
>  
> 
> ---
> base-commit: 128f71fe014fc91efa1407ce549f94a9a9f1072c
> change-id: 20240830-x1e80100-bypass-pdc-39a8c1ae594f
> 
> Best regards,
> -- 
> Stephan Gerhold <stephan.gerhold@linaro.org>
> 

