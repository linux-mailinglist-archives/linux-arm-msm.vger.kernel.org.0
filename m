Return-Path: <linux-arm-msm+bounces-32288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF8A984513
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 13:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D066FB25FA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 11:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6021B15B56E;
	Tue, 24 Sep 2024 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rS/teoq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884E586277
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 11:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727178243; cv=none; b=mjluAGtcNX5ZiCEnfuC99yhDsMVe3/6DH/asrQ0/81ISjDc4i3AsdW4d3UAVozJD7GiuO4S8DkGK+7QVQkkFliJ5KIYYMlQGGV7qpcTi66OyRmvTtDYJLXOxU8ggIDyDI13751r7VzFDzwqwYH4jtwz+uY7TjDsuHSt7bGVnem8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727178243; c=relaxed/simple;
	bh=8SeBeMit1erdjYZ5mBMFGazV3ILdKe6iS4Sdobi/Mk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9l6KQBtj8D0KblHWdkOjwlh/ix19INYhVqJljlyGkk+3+/t/Mv0nEIbcZPCo6IFTdIm4eodnbtr8eyc0WqOydUsrsKCpwwX0bPYJJ1UCwmjzdPgKeUGNTKAiy+P5JapYCrn2FDfEeKPWv0oYWcgzN98jT2rRB8f6nO5RIlMWDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rS/teoq0; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c4146c7b28so6880557a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 04:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727178240; x=1727783040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XKduaMO4XMlChzXeXd41yjomvNaLJYSYU9jwBphsY7o=;
        b=rS/teoq0KIJHtaAF50VUV95jW5v6O7jvtvRPS5XLEZnjC3DS+6JtDwAI0yjsvdb/ne
         Do/ssYUFqNtGB/K2CH3WZ2Xa+vyXC4hhXBq3atX9dXEup67fXxzelXLU4DAx3CnyryJr
         avHL2WooiEBcVsVNKlMmGYgAWyxm3Bb31GaxefE+7NKszf2Mo/m9b9iXoo3ikpZffwH0
         b4t6Y+AjQlJbWiiqd1Zlsv8qFtliP1OuQ/3EUoF7ZDeyd5jT176JjHD5YevDr7lveecj
         VGVkksq+rDbFeapywh6g/Jk2MTK8+Qd70ZC/2R7tDHhV/RttcchnF/q4gBiv7IFieIH3
         0M4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727178240; x=1727783040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKduaMO4XMlChzXeXd41yjomvNaLJYSYU9jwBphsY7o=;
        b=bs+2zI84z8j5o278LKZ1G+caScaqQxmjvpyACY3ey5szPMme7evfMcXBT786dw7n1p
         AAX4wgAtD0z+g1dbU09I6Mzwx1wYhwsP7lijsThSids4oOHcQfWq7kcwh58S6SolhJ5A
         asrI59DUGKxD3qSIQ8M6n1CkfcxiV/sbGtxgMAmTnhKkos+GK5FMZeYyfOovk3vtT8Aq
         II6blPJBAVrPOFOtcIJ8nfOnkrwp4+SMG/UY9979ypWgr1Mj69MODLdMG9hj3Zk222hL
         WY0gO/JWNF3xPf+U3IBygwpCJr65sFpKbMwrBn22X1kLcCpb26+SYVA4yF1Llz6md7dC
         QuBA==
X-Forwarded-Encrypted: i=1; AJvYcCVKxJIH04wGeYmc+a2LCvSrgo3JOxZs9s3ciZgdvxuSYLSKGXjaYVPK+HOUuUsgIjjGMMxlkuezzFbeBk8F@vger.kernel.org
X-Gm-Message-State: AOJu0YxzLaNher2V2RtVrq5Fz7X+jiewF4PVCv9DW9bVo+63H4X9xfZ9
	t1mB+dQ/FLb3hmRaajuQJIpPTmz8yE7u3s+ELX5cCY/nl8jzcj3zMWDZMU8w3bU=
X-Google-Smtp-Source: AGHT+IHdFRTRmrq9kDY7XVL4TEPwSnDzTbPxg5dRRwKzNPceZ2XDt56AOJMtQcehLOdKTJPbRhj/oQ==
X-Received: by 2002:a05:6402:42c6:b0:5c3:d8fd:9a3b with SMTP id 4fb4d7f45d1cf-5c464df3304mr12936844a12.28.1727178239620;
        Tue, 24 Sep 2024 04:43:59 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef80:8e91:35e5:c6f3:1246])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf48c286sm659697a12.17.2024.09.24.04.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:43:59 -0700 (PDT)
Date: Tue, 24 Sep 2024 13:43:54 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: stephan@gerhold.net, loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: wwan: qcom_bam_dmux: Fix missing
 pm_runtime_disable()
Message-ID: <ZvKl-i-UESyzSG02@linaro.org>
References: <20240923115743.3563079-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923115743.3563079-1-ruanjinjie@huawei.com>

On Mon, Sep 23, 2024 at 07:57:43PM +0800, Jinjie Ruan wrote:
> It's important to undo pm_runtime_use_autosuspend() with
> pm_runtime_dont_use_autosuspend() at driver exit time.
> 
> But the pm_runtime_disable() and pm_runtime_dont_use_autosuspend()
> is missing in the error path for bam_dmux_probe(). So add it.
> 
> Found by code review. Compile-tested only.
> 
> Fixes: 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network driver")
> Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Thanks for making the changes!

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
> v2:
> - Drop the unneeded pm_runtime_set_suspended().
> - Add Suggested-by.
> - Update the commit message.
> ---
>  drivers/net/wwan/qcom_bam_dmux.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
> index 26ca719fa0de..5dcb9a84a12e 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -823,17 +823,17 @@ static int bam_dmux_probe(struct platform_device *pdev)
>  	ret = devm_request_threaded_irq(dev, pc_ack_irq, NULL, bam_dmux_pc_ack_irq,
>  					IRQF_ONESHOT, NULL, dmux);
>  	if (ret)
> -		return ret;
> +		goto err_disable_pm;
>  
>  	ret = devm_request_threaded_irq(dev, dmux->pc_irq, NULL, bam_dmux_pc_irq,
>  					IRQF_ONESHOT, NULL, dmux);
>  	if (ret)
> -		return ret;
> +		goto err_disable_pm;
>  
>  	ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
>  				    &dmux->pc_state);
>  	if (ret)
> -		return ret;
> +		goto err_disable_pm;
>  
>  	/* Check if remote finished initialization before us */
>  	if (dmux->pc_state) {
> @@ -844,6 +844,11 @@ static int bam_dmux_probe(struct platform_device *pdev)
>  	}
>  
>  	return 0;
> +
> +err_disable_pm:
> +	pm_runtime_disable(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +	return ret;
>  }
>  
>  static void bam_dmux_remove(struct platform_device *pdev)
> -- 
> 2.34.1
> 

