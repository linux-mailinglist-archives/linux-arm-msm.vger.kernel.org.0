Return-Path: <linux-arm-msm+bounces-24581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3CB91B929
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 09:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBE9D2822A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 07:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FC9143C43;
	Fri, 28 Jun 2024 07:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nNEq6kZ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72A4143745
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 07:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719561535; cv=none; b=mV4db1jRELB1oMOVteVnlAvkyDpH9tqvbS+ZpVgzLj5wXBjCcaZ0fiVLbT5LQJqx3vyiLdSTmxae3cPA7C1WmwQZO1+A4f5aJcIUfT02CLJY5IMyknYj41nBt8BU1a+3oFm35l3prSqxm3LL8qc8f78wZYMX2LXnb+mYR7morxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719561535; c=relaxed/simple;
	bh=KSHFHEJQOwcEyLomFOH9oKcThmx8vwRpmht/1wMqglM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnhw93d/zpjFg3y8KD10MH+U0g4XRqcU+huT1QvuE2EuUsORpGnvv2XjQkuwHSH8GIoBGpB7/HsXXOfaLg2mFKnT5kqcBgmXt+L8Dbw2rKHKTgVJmAfxYNj4jMOgVTXOXoApzV+kqG9nQmpIpsIg+TJkBUCGoGNxNH//dWa04ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nNEq6kZ0; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec10324791so2638701fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 00:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719561531; x=1720166331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hpVThxLKAwW8nm2tVnNjG2KBHYs+YTfM3+uWLBBi4MI=;
        b=nNEq6kZ0iW5NUaPNWFEldF4tC0Od5jCUKwZiQC8ywXRgZ8GG8H67+BDd5fonVVfBDk
         TfMtvRg7tBmVc+8DaZvZ+EWtKzqGdm1ZW9JNriQsQxvg3yalQkMuN9MCrAcliMP4Q68N
         s+4Rif/AitBee/1Z99+I4YgietHpZaxtfVCUEyHw0oY6cznVaBscAs7j2x9H6JRYuDiN
         vrS4IT1TkRkw/x1V8uMzc666z0qYiYGS8WjHCIXYG/GWmJe2hpvEw2A/ZWISgBKTAzxg
         jjsDl1Hc3XbscfxEMP72nnd7xZve90USQGtLoK6XtSjp/re7zWL++pbuXxr5xdR0n/qV
         lL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719561531; x=1720166331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpVThxLKAwW8nm2tVnNjG2KBHYs+YTfM3+uWLBBi4MI=;
        b=kqtLynZDifdqQLuq9yW9sL4mGe57aNwNBcrEcXixe5PvJWIZW7M4h+RiZ6AkKDM5Wd
         Klwxoe/A1O3TggNGbKknhcQycoaJk2Q27ibgdiGZ3SmfMcGOQf5utjum9WFNE+JkWwZU
         zi9yfT15kxIYarMQNESXIN0R56cxuR+bzcPQIionLyyuTU4Q9pXgxkVb1dr/eCmLrwr2
         EoIy/4oA/qaZt/L2aj6eRB/8s8FPbQy/syxzL5SfC4WRvrAhX8pVNA9IIQun40OJ0ICw
         eT3NBvl+UUgy5q6u4G+u+eyFtzykMRnAi0nMU/dhjpp0agqEWAAePhyjODpQ3WtgqIeJ
         lq/A==
X-Forwarded-Encrypted: i=1; AJvYcCWFn/ll8ykgN03lE8Jos++RGvEs6ozrcihQ0dgckgGo1DUKZw+6GEgTdENbC17ajC91xnfnMlQqRxhna0+L7PUaGpRolB00y31aHOTsGg==
X-Gm-Message-State: AOJu0YyfSEl34gKspYAabb9mcldRzsckT0f7xFORZYoB6kfAneRd5GSR
	g0PU++P9pBzzKJZ5MDe8qJJCgvu5EFc7iPRwM5Ox2Iud7Hid0WI4SFDVB2NZ/m0=
X-Google-Smtp-Source: AGHT+IHT1dN0X9G5ooLDoHTtpwGUZgml6ThHILx7KnXjSbHrlHKUYpf6rwFCzqavRCfGgLPHp3W0wA==
X-Received: by 2002:a2e:8792:0:b0:2ec:5699:5e6 with SMTP id 38308e7fff4ca-2ec5b28ba0dmr94114421fa.26.1719561531089;
        Fri, 28 Jun 2024 00:58:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee51680226sm2034711fa.95.2024.06.28.00.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 00:58:50 -0700 (PDT)
Date: Fri, 28 Jun 2024 10:58:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linus.walleij@linaro.org, srinivas.kandagatla@linaro.org, 
	linux-arm-msm@vger.kernel.org, andersson@kernel.org, krzysztof.kozlowski@linaro.org, 
	linux-gpio@vger.kernel.org, konradybcio@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: increase MAX_NR_GPIO to 32
Message-ID: <bkl3ry452jzhpoyzvidcvr3cquyx3dq5wbzulut3dzmlozi6ev@zjfdd6z2aqso>
References: <20240627003654.242870-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627003654.242870-1-alexey.klimov@linaro.org>

On Thu, Jun 27, 2024 at 01:36:54AM GMT, Alexey Klimov wrote:
> Account for more than only 23 GPIOs in LPASS Low Power Island pinctrl
> generic driver. The previous value 23 was chosen to satisfy existing
> SoC-specific drivers. However SM4250 LPI pinctrl uses more than 23 GPIOs
> and its probe routine fails on:
> 
>         if (WARN_ON(data->npins > MAX_NR_GPIO))
>                 return -EINVAL;
> 
> with the following message:
> 
> [   10.709014] ------------[ cut here ]------------
> [   10.719085] WARNING: CPU: 1 PID: 56 at
> drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:446
> lpi_pinctrl_probe+0x308/0x388 [pinctrl_lpass_lpi]
> [   10.719108] Modules linked in: [...]
> [   10.719238] CPU: 1 PID: 56 Comm: kworker/u33:0 Not tainted
> 6.10.0-rc2-00012-ge45ddb1f8d34-dirty #7
> [   10.719245] Hardware name: Qualcomm Technologies, Inc. QRB4210 RB2 (DT)
> [   10.719250] Workqueue: events_unbound deferred_probe_work_func
> [   10.719265] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   10.719271] pc : lpi_pinctrl_probe+0x308/0x388 [pinctrl_lpass_lpi]
> [   10.719278] lr : lpi_pinctrl_probe+0x44/0x388 [pinctrl_lpass_lpi]
>         ...
> [   10.719357] Call trace:
> [   10.719361]  lpi_pinctrl_probe+0x308/0x388 [pinctrl_lpass_lpi]
> [   10.719369]  platform_probe+0x68/0xc4
> [   10.719378]  really_probe+0xbc/0x29c
> [   10.719384]  __driver_probe_device+0x78/0x12c
> [   10.719390]  driver_probe_device+0xd8/0x15c
> [   10.719395]  __device_attach_driver+0xb8/0x134
> [   10.719401]  bus_for_each_drv+0x88/0xe8
> [   10.719407]  __device_attach+0xa0/0x190
> [   10.719412]  device_initial_probe+0x14/0x20
> [   10.719418]  bus_probe_device+0xac/0xb0
> [   10.719423]  deferred_probe_work_func+0x88/0xc0
> [   10.719429]  process_one_work+0x150/0x294
> [   10.719439]  worker_thread+0x2f8/0x408
> [   10.719445]  kthread+0x110/0x114
> [   10.719452]  ret_from_fork+0x10/0x20
> [   10.719459] ---[ end trace 0000000000000000 ]---
> [   10.719589] qcom-sm4250-lpass-lpi-pinctrl a7c0000.pinctrl: probe

Nit: usually you can ommit timestamps when posting the backtrace.

> with driver qcom-sm4250-lpass-lpi-pinctrl failed with error -22
> 
> Fixes: c2e5a25e8d88 ("pinctrl: qcom: Introduce SM4250 LPI pinctrl driver")
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

