Return-Path: <linux-arm-msm+bounces-26280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB4693218C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 09:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81E501F22750
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 07:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3FF3D57E;
	Tue, 16 Jul 2024 07:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyvW8o4J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7763A28B;
	Tue, 16 Jul 2024 07:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721116705; cv=none; b=Kyr5+ppCH7qTbaSA8HsuV5xd5mgSZJt7fAJodmpQ9qIDkWqBOIbQBkoEZTGU/VJANfOsRP5BcEpR2UDqYlA67vVcPmbSmYN1+Kq2lF0bmea/O81cO1AFoAE/lxYYm4iO46irla2U5qRVLKJdfzGFoc1gZFUNWB+5PaPZ26o682I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721116705; c=relaxed/simple;
	bh=dVAAw5mHpXBN6nFDzkRDYhgAlr351+hYJzZtRmbF0zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFhrhP9zCFaVAg86FxvNbdygBkAB2a94dfWahnsFv3dhl8IrjfUtUlRm4bVshiopT0cqdfbQyyhmdVVbTa0A7weFD+Ldjm0S3O5nvlOaOW9ax1LFTEbavJIlWXyyQxcm2pK1xedVVqZ7HRhifgK9Npgwy+psnTWhY0E8+04OGT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyvW8o4J; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-708bf659898so1510017a34.2;
        Tue, 16 Jul 2024 00:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721116703; x=1721721503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pNsFCCA1ah1L2Oboy1QhX3cnBjgH1yd/JcaTy+EApq0=;
        b=lyvW8o4J03JpgdxbNyhwqp6FFF7NJBJVlzlTYeACe+mrc2JKP2Snw6pttvsTIWkp3D
         1UL71AIgCj1cFcxK01cXseZHEwo81RlyOpOhRDG5lefSULxbGXh1sZtIL7qUCHVR5vej
         OGh4EjRPOz+In+CorqfYwQEYXL83DcK2ixmvvh0MvzMTzvwEAESLAgQFk3x1CTMfy/Y9
         3w9lE0+xdPxit0auiCrVE3bV3bqQRsEqG5gL0bbwI1G6z6iHtRHcvzbR9tYUlXJp++nD
         b3SLyjxcUGAr2x+w22TwfjT5W2maVmoIKIsPLKIkh2aghWYTEqfPhxFDTn85kIG+cWp9
         mWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721116703; x=1721721503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNsFCCA1ah1L2Oboy1QhX3cnBjgH1yd/JcaTy+EApq0=;
        b=XpZB5P5g08BI8CIwKZoQp9pTAoxv9cjekB9v39aT3bWFmHwHxj9KtObogil3KfNjdg
         0kF1vfKqU+yhvmmjH3gkK7c9F0dL9TJMTllCFz0fZ4JOMHpaEALjwY0UQDGTNdEIgyvL
         9GsRTnTOXaEfw+1W6jwSmxQ/tHBf7+w4uR7RYKXTPlpWzYQB7lAhe/YGGEdyR/Z7hE3y
         7ZWybQEGO+6UPNyhjW+YySiPXYWTb2FkQKy4dBZYkHOJIML90emdwQaX5+AMXS73zUqt
         XM9r388khJPcNRgsJJgz5VrWZkyvgbvjSGPidcv/85/CMDTA7J4VZDThm1PA5tQcJFDP
         l73g==
X-Forwarded-Encrypted: i=1; AJvYcCV8j2HM2oHvO4clBVjeY+OjNQqDi35gw4anH9hZEq+704KmH5N2KjVPsL8H5Q+mVXUaTwMgLfchzgc0Rel5mLDJyl/bVOOcSBZFNQxuuUlczNRTmo4Sd17VG5Y6pXxKSW28GJZwwdAfO1imGA==
X-Gm-Message-State: AOJu0YyAPuaRU0Kger46FxNYcu/MLyfZMIKE3zm6T7rB0JF0ywo0vERl
	C+vGL46iY+u7zLlW1TO7pHUJERykKOhVou52dXujw/VS00EndKba
X-Google-Smtp-Source: AGHT+IEnT+adPbyG1L9Mfah2uQfiPKX6MyfA1KzOgzNdpoLaW9JyMB8yAu4Qr+Sp57Sx0I5xsaQokw==
X-Received: by 2002:a05:6830:2aa6:b0:6fa:732b:862e with SMTP id 46e09a7af769-708d993cf86mr1885461a34.9.1721116702998;
        Tue, 16 Jul 2024 00:58:22 -0700 (PDT)
Received: from bnew-VirtualBox ([2405:201:3020:7812:2a86:5bd7:c7ce:a9dc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eb9b3aasm5710754b3a.6.2024.07.16.00.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 00:58:22 -0700 (PDT)
Date: Sat, 13 Jul 2024 15:58:20 +0530
From: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clocksource: qcom: Add missing iounmap() on errors in
 msm_dt_timer_init()
Message-ID: <20240713102820.GA430622@bnew-VirtualBox>
References: <20240713095713.GA430091@bnew-VirtualBox>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240713095713.GA430091@bnew-VirtualBox>

On Sat, Jul 13, 2024 at 03:27:13PM +0530, Ankit Agrawal wrote:
> Add the missing iounmap() when clock frequency fails to get read by the
> of_property_read_u32() call, or if the call to msm_timer_init() fails.
> 
> Fixes: 6e3321631ac2 ("ARM: msm: Add DT support to msm_timer")
> Signed-off-by: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Changes in v3:
> - Update patch commit message
> - Link to v2: https://lore.kernel.org/linux-arm-msm/20240712082747.GA182658@bnew-VirtualBox/
> 
> Changes in v2:
> - Add iounmap() if msm_timer_init() fails
> - Update patch commit message
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20240710110813.GA15351@bnew-VirtualBox/
> ---
>  drivers/clocksource/timer-qcom.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-qcom.c b/drivers/clocksource/timer-qcom.c
> index b4afe3a67..eac4c95c6 100644
> --- a/drivers/clocksource/timer-qcom.c
> +++ b/drivers/clocksource/timer-qcom.c
> @@ -233,6 +233,7 @@ static int __init msm_dt_timer_init(struct device_node *np)
>  	}
>  
>  	if (of_property_read_u32(np, "clock-frequency", &freq)) {
> +		iounmap(cpu0_base);
>  		pr_err("Unknown frequency\n");
>  		return -EINVAL;
>  	}
> @@ -243,7 +244,11 @@ static int __init msm_dt_timer_init(struct device_node *np)
>  	freq /= 4;
>  	writel_relaxed(DGT_CLK_CTL_DIV_4, source_base + DGT_CLK_CTL);
>  
> -	return msm_timer_init(freq, 32, irq, !!percpu_offset);
> +	ret = msm_timer_init(freq, 32, irq, !!percpu_offset);
> +	if (ret)
> +		iounmap(cpu0_base);
> +
> +	return ret;
>  }
>  TIMER_OF_DECLARE(kpss_timer, "qcom,kpss-timer", msm_dt_timer_init);
>  TIMER_OF_DECLARE(scss_timer, "qcom,scss-timer", msm_dt_timer_init);
> -- 
> 2.25.1

Hello maintainers, 

Could you please suggest the next steps that should be taken to move
this patch further. From what I understand, the merge-window for the
next stable kernel release (v6.11) is open, and I would be very much
grateful if I could get help on moving this patch further.

Also, please let me know if I need to make any changes to the patch in
order to finalize it :)

Thanks!
Ankit

