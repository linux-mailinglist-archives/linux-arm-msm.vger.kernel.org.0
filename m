Return-Path: <linux-arm-msm+bounces-37904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 847C19C8997
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 13:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 317D41F23B0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 12:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F8D1F9A9A;
	Thu, 14 Nov 2024 12:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dd3nE96Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BCC18BC2C
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731586376; cv=none; b=p+9ZvuzouFPH339Ru6yNqJEh5H2EWZnlOl+Wr8EEvyUiBuhIbQqzNQF3JCSC4LwDcCywrPU5PRKSgDVkD8oqyowuCWeoz3bRRcWwojQlOcQSb9Mpeq9RCoBBhOjnOKTOeqwn3xN57Rx36NqiIUkeQzb59xJR9f+8DzWbvtE0ZC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731586376; c=relaxed/simple;
	bh=0N4u2tvQVfKeWhKuS6RSfLlT70Xj9TPhYMFHBgms7tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wfjp0ya245RlAQrEmhrk5fJATVTHC47jzZgxINEwcgTFuksCAV/yG4mVBf50d6FjoFo9oUwCGhtzcd6PjgZV1NilC9cGpGkQAJ27QYjT0adGf2Bg+n5G5hNOZ7eFS/zl4soQ1f6IBSfwGPniaVy5hhiDypjrjvl6rjI+svQ6aoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dd3nE96Y; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53da3b911b9so531309e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 04:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731586372; x=1732191172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R1osO7NFmTGmX19JFLUCez78ik/qFqOXaEh8yYgfrqY=;
        b=Dd3nE96Yvf9KhC5sscy2bWPKumUdAspIKhoz/e2k0vUBFeyQ3n9QSfa8rREXYKzsis
         Yqxc5SAB50BpdTfeW2QmUIOCDy4cR9LmVmB42xxrUYXWWzm7YIzcH95XbJYa1kAE6jqT
         vF7kU6tks6MvOxEQRoR9DaHcf62SY8dwmwkCQWnJnuZdPa0DBJ04ggLs80mP9K68UtbU
         +LCzRif75GROmJ1Kh7iNNizIGixzrA11ZKpBKOWuVBaS8N0Ts+bSr313GIO5pwzi3JcV
         +USWIye425YVJXMN/GXRyzg7cTRGe+fLBff9ckFGlOYxb9QAEh7xF3GvTwncCp2fabip
         0dHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731586372; x=1732191172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1osO7NFmTGmX19JFLUCez78ik/qFqOXaEh8yYgfrqY=;
        b=VnS79uJrc9RuYYs0Zv9cS7LK0TmGGSZLfFqm1UL4tML3R4nqgptEKbxMHH7iz5p5pk
         GIccqqH4qQh1R5ERjvJ3601rWZ/z7PW8+MGNmgw3whxW5gSnL/MSLp8VUqj3JdzqaQJQ
         JKRmlm+v+NbzMzWLSWyF5Xp5JtZEuZskWWVcEoeVDD+yz5L3cMVXOIXX2EGpOEpZmVlY
         +QMOOEGdZ5ZzHMq6vi21ATG3ddxGbSYzo7UdndzKTxvCybP8w91q+qfFkyAChj/1vmoY
         tRJGzOc66UEz/9/hpRKTXlwjFl6S/3f3BjbfrVU/9euexaMoeSgFQABrAe8XuwX8IzLf
         IlDg==
X-Forwarded-Encrypted: i=1; AJvYcCV0Y2PWZ60+R6k5E7VlPP0ZwAAxrhq64m2NdzsfXM2YKDrh7+c8lNh5d0r/qngAoaM0hLAm3SCO/rb+o4Af@vger.kernel.org
X-Gm-Message-State: AOJu0YyAw+mxm9ZW/fL9J73lovioMH1EQ6GqcECTq7rrgakbxcMgkJcS
	U8m0b4bN+5kVuOc0jBc0OmSjoS9UuoctbnS50HMk+sePDeWis14YtUD/Qo2qwWw=
X-Google-Smtp-Source: AGHT+IEuR0xLWMXeFH8Hj+BtIFR3zIeL3E9KlzQyVZ9bHzcIKoypj3g/lYGAKeRXG1eysRTlMVJEog==
X-Received: by 2002:a05:6512:3e17:b0:53a:7e:bcc6 with SMTP id 2adb3069b0e04-53d9fee3452mr3399322e87.53.1731586372180;
        Thu, 14 Nov 2024 04:12:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da653dd4csm162919e87.170.2024.11.14.04.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 04:12:50 -0800 (PST)
Date: Thu, 14 Nov 2024 14:12:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rex Nie <rex.nie@jaguarmicro.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, airlied@gmail.com, 
	simona@ffwll.ch, avrac@freebox.fr, sean@poorly.run, marijn.suijten@somainline.org, 
	jani.nikula@intel.com, mgonzalez@freebox.fr, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	angus.chen@jaguarmicro.com
Subject: Re: [PATCH] drm/msm/hdmi: simplify code in pll_get_integloop_gain
Message-ID: <gqej2hhenngqzcla6mgxywfft5qbpglrlotetgiezdrt5t5fjo@tpazzxp7gleb>
References: <20241112074101.2206-1-rex.nie@jaguarmicro.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112074101.2206-1-rex.nie@jaguarmicro.com>

On Tue, Nov 12, 2024 at 03:41:00PM +0800, Rex Nie wrote:
> In pll_get_integloop_gain(), digclk_divsel=1 or 2, base=63 or 196ULL,
> so the base may be 63, 126, 196, 392. The condition base <= 2046
> always true.
> 
> Fixes: caedbf17c48d ("drm/msm: add msm8998 hdmi phy/pll support")
> Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

