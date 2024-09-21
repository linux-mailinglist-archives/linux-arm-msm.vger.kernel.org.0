Return-Path: <linux-arm-msm+bounces-32130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C66C197DBFA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 09:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6025D1F21EEE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 07:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B127DA67;
	Sat, 21 Sep 2024 07:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PeCwSd/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA3C2C9D
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 07:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726903641; cv=none; b=SjyjSDcaLQ3U5s26Inx0xFVfJzKfE2CU3IwcHEkh0RZyK7YhEu7DaGlZ1K+tnPv9jpvboqAhjC+7Nk5xRFJgP7/4vfiDGagIKiF0txsQZiAapAiPRnRINyBTEvn25CM633xy2OqJEDeJ79R/qzc5b7YBFScTScSaJURpCB4Ko04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726903641; c=relaxed/simple;
	bh=Qu96Di5aW4zEqvucXhSjlkkCQLjKXM6ECA/Ulqv82cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmLDusstvYbC4d7D0VTQgobUa1jPJGwk9f4ddPFlYFU1nDZPTTAgeGMFguuJSuLnYAu0elTfBNgvlOLyZF/AvTGhpiad83XBwZMCrzczMaNq1smVdYugFnDcv4/woq4CWy8PSXL2Si6E/Iidy2uqTz7h2S41TcKwmdwMGiOaBiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PeCwSd/K; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f75aaaade6so30392421fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 00:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726903638; x=1727508438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=epbKJnWX2a4mnxddWY1VokmGlmbcMonTnO+g8xpnvCs=;
        b=PeCwSd/KQ6GiLBt0YnPdvVL8Ut9+KYg1m3FAn6WKl1HtgPLW/Oq0+V1BIxTFrmHJFI
         lSWYJGJRRM4cW/mRba3DGgzGZ5ThW3XDG2VYDwIhmQh5AWNBQDupJCypC8sZ7IXLd9Kn
         U8nQO6bzr9ZgfPv7duiFN8cHnKHo5qwi3RV9syccK5Q2zOEjgu6UNjh5Swx/2tPwiIWm
         G4/tk5O2P+opsTDMCzn2+x/YRaGjIJiC6djzDUaKYScxIBR1upe7/HC+EOJpD3wcTUJ/
         iQb5NFG6QsipLjT8EhLhNcJRCy9KSPgnWGXnPQLpV7B1s7DUeZWdKbmch4tZcJqPdyKS
         WC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726903638; x=1727508438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epbKJnWX2a4mnxddWY1VokmGlmbcMonTnO+g8xpnvCs=;
        b=RcKQBxaLPm+rfA+9cmebPPvQ3N5ehb5SJM+HiBgeglyorPiGaynuIm5MQgHcG+LK8R
         i6RsXsqHL0w3R5RPkoZTA0EZdCMRWHlJw9kbEox8VYxP3pU3xiC3a8Oq/nG9RCYVulzX
         TOVQha28rZk00Hwgk4Q6FnCSG2adly5x6UBl7gUMVT0I/XURwPWpOHIThkV36BYCRdqV
         F795kOUG0i0k5G6un3HfK+q18qAW+Hm5Y5H/H156q+8rAZvtcFGUlYnnpj5gQ/8v998O
         IivfKSeN2K/SLvWn0QDJ/5t47yWELAI/eY1eYqATlLxa4eqh5iniH5CcVG2tVzg5nPiR
         W+EQ==
X-Gm-Message-State: AOJu0Yw0aoRP0XRblJP2hiD/3+/Sti+Nz5+u1d+kQrP7rwo6igzXjoN2
	f0V+uHsnt5l1UOYq6gAp0rd/RWc9ZSkbpqQO5144pMagecJaFh4T3mb5lFvbMjfqp9l1KjB8Ntb
	g2Js=
X-Google-Smtp-Source: AGHT+IHNlrHyPvqIQ42XJj/FPRZYKpa3B8G6ggcI1MA29HcvMGWI5eZjqpXdwsQXj2omM2DflJ+tdQ==
X-Received: by 2002:a05:651c:2206:b0:2f7:6fa8:9e00 with SMTP id 38308e7fff4ca-2f7cc373a99mr31780641fa.19.1726903637464;
        Sat, 21 Sep 2024 00:27:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d2e1dcasm21448731fa.25.2024.09.21.00.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 00:27:16 -0700 (PDT)
Date: Sat, 21 Sep 2024 10:27:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: John Schulz <john.schulz1@protonmail.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/2] Changing Ardreno X185 Check to X1xxx Family Check
Message-ID: <vhuac7ac4stqkqq6wfw5lx7ftalphmmfuiytkm4etydoy7nu3m@uxs475wlm4ca>
References: <eXTmCkW-1fFjQPMz9pDuTV6stWYM2-k_vUP8hhFhSQGIVNAITUWcadIMLvtpufgBOIUY4S8RYGU-vSxIEehZknZv9n1tnS2ivaSvUSyQpGQ=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eXTmCkW-1fFjQPMz9pDuTV6stWYM2-k_vUP8hhFhSQGIVNAITUWcadIMLvtpufgBOIUY4S8RYGU-vSxIEehZknZv9n1tnS2ivaSvUSyQpGQ=@protonmail.com>

On Sat, Sep 21, 2024 at 01:03:00AM GMT, John Schulz wrote:
> Hello,
> 
> First time submitting a patch. As work is made towards integrating more QCOM X1E and X1P SoCs, using a family identification function seems better fit than checking individual devices. 


Please use git commit and then git format-patch / git send-email to
format and send patches.

Commit message is not an email text but rather a patch description. It
should explain why you made the change.

Patches should be atomic and non-breaking. E.g. if I pick this patch w/o
picking up 2/2 build will break. We frequently use git bisect, which
means that (ideally) after each commit the kernel should still build.

Last, but not least, your patch misses DCO signature.

Please take a glance at Documentation/process, especially
submitting-patches.rst.

> 
> Thanks,
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 06cab2c6fd66..34ca8f6d5d99 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1026,7 +1026,7 @@ static int hw_init(struct msm_gpu *gpu)
>  	gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
>  
>  	/* Set weights for bicubic filtering */
> -	if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gpu)) {
> +	if (adreno_is_a650_family(adreno_gpu) || adreno_is_x1xx_family(adreno_gpu)) {
>  		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
>  		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
>  			0x3fe05ff4);

-- 
With best wishes
Dmitry

