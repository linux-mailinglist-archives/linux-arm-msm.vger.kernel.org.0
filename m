Return-Path: <linux-arm-msm+bounces-32187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D74CA97E81F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 11:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 492BBB224E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 09:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650ED194A5A;
	Mon, 23 Sep 2024 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="slAGrwUG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F31194A54
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727082310; cv=none; b=j5LvCYl5UpV0ClJ5X2DM8djlROCzw8oANAhKph8G/7k77hXOhektquSGm+YoK5powVwAgHL406grSazElV+YUx3e+kz1JXymt28cScx2UFsBhHgUC2NQPmD+z29nIYog2kEF/FkiHRtfOMCC9/jDCgZxqd/AjlH58m6/6ruOuNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727082310; c=relaxed/simple;
	bh=EniyWOtEdnbNi2rwwBhfFnPwy0wBz8/e3/+ziz04LgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7m+H+I3RGXxbFguaZuecPoTYDjGf4WZT4tlHZjTQp/OCKfa/MMqpfNyJryZWkjPL4Cw1ZoQr7ktlpmHmhRaAJwfKEVc0JEArZ4CJ1WpT80IuCYC3m1w+uD3tucE2kyDF4cdIffgY7an3HM9Fzk+pt+UTyFbBDi07//FekxlTz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=slAGrwUG; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c413cf5de5so5523404a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 02:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727082307; x=1727687107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VoXvEx+NCVxh3EK+2wXfEFAeRE68YG+ekO47ABcFRUM=;
        b=slAGrwUGjlpGoWwlpHRu15s/nvgLu7qHOoQao8c0uIBrRkFWDxqYQsJtEyN6iTgao1
         uanJdbTq5e0z/Xm1NTmF9UeWnDpWphtUVXt/Jb3nqWwtDMDUkeLNy+i9bJpQM+2wvGVG
         vwxNe0z2acnllebszDO1N3cXUkUGlvHt+NYfMnOOEbacckJSIVm17u26dNPYgcs4wWvt
         KZKsMi4slh7bP2wz5jEJ4/YyiT29S2d5vDYWKO/xfsCZDrSQWPhGJYJw+kFnFp1MYVhb
         yqzSfOc1sebH3MleB/aSPfDFRSmIwQ8BsY3Bocqr1eREe+yr0NiojPp5vFc2oVl/baPp
         To5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082307; x=1727687107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoXvEx+NCVxh3EK+2wXfEFAeRE68YG+ekO47ABcFRUM=;
        b=fKnLQJYT47zkLBbcs3vKtQmtve6jE/CKvNFsHxBfvWU5toMr46eXRg/rnNf0c26KTI
         1FHW/h3IC3mTfMFRdCBryNhTal33izgZcnQO7p71T1zZ0qNkJqrWF9Qf1vSGcz1sdlFx
         HWWPhdcY5IqeE4t2EcxPkZ3Hs7SzeT8JBBy4zx3is8RJnuRdnMcz163BAfdZV7WJLu7j
         qC8xwSZfO5co0Qo/Sc/hy1bUPOBxEpzhawfvbSElhgbd/PmdVI4pFKD3ma+5dzk6A2XM
         cjPWnbJb04H88cp/oRBbutlIb2EZAW+UwKjBBDNpDqO/OD66BhfYxV5IHy/sMiHA+Zc7
         SdTA==
X-Forwarded-Encrypted: i=1; AJvYcCUPU4rvcZJmADB0IdTLRWQH0p/W9ouPI+udqLwgq1uLnsSbfjjlh6EF8fih4I3VrEjiQ38dtdaBJidmJ1aD@vger.kernel.org
X-Gm-Message-State: AOJu0YyWJemz6GZdKH91Dyr/MBevrAYDhOc+mfmuIgx0CPW9KlUSgmGY
	MTWPrcUQ3IdJhsWTyh5wwiZvd/jZgkehrelq/fk+C0Gpyuw67rKeTGPLmkmH2Q0=
X-Google-Smtp-Source: AGHT+IEUeWQarWNeiW5GcVTIVc38PsrTX66OVaiu3ZiYRz9qQteuOAnaDLCl0BCaBWr5Fc+i3x6z1g==
X-Received: by 2002:a05:6402:430d:b0:5c4:24c2:43e0 with SMTP id 4fb4d7f45d1cf-5c464a3bcc2mr9397282a12.13.1727082306415;
        Mon, 23 Sep 2024 02:05:06 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef80:4cfe:4cdd:8e34:3996])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb89f7esm9890849a12.66.2024.09.23.02.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 02:05:06 -0700 (PDT)
Date: Mon, 23 Sep 2024 11:05:00 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, stephan@gerhold.net,
	loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] net: wwan: qcom_bam_dmux: Fix missing
 pm_runtime_disable()
Message-ID: <ZvEvPIsraXpZFm4k@linaro.org>
References: <20240920100711.2744120-1-ruanjinjie@huawei.com>
 <lqj3jfaelgeecf5yynpjxza6h4eblhzumx6rif3lgivfqhb4nk@xeft7zplc2xb>
 <Zu1uKR6v0pI5p01R@linaro.org>
 <CAA8EJprysL1Tn_SzyKaDgzSxzwDTdJo5Zx4jUEmE88qJ66vdFg@mail.gmail.com>
 <Zu165w1ZzLiRvXOp@linaro.org>
 <04cf9e68-ef69-dade-0b56-205a3aa4e653@huawei.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04cf9e68-ef69-dade-0b56-205a3aa4e653@huawei.com>

On Mon, Sep 23, 2024 at 10:25:28AM +0800, Jinjie Ruan wrote:
> 
> 
> On 2024/9/20 21:38, Stephan Gerhold wrote:
> > On Fri, Sep 20, 2024 at 03:05:13PM +0200, Dmitry Baryshkov wrote:
> >> On Fri, 20 Sept 2024 at 14:44, Stephan Gerhold
> >> <stephan.gerhold@linaro.org> wrote:
> >>>
> >>> On Fri, Sep 20, 2024 at 01:48:15PM +0300, Dmitry Baryshkov wrote:
> >>>> On Fri, Sep 20, 2024 at 06:07:11PM GMT, Jinjie Ruan wrote:
> >>>>> It's important to undo pm_runtime_use_autosuspend() with
> >>>>> pm_runtime_dont_use_autosuspend() at driver exit time.
> >>>>>
> >>>>> But the pm_runtime_disable() and pm_runtime_dont_use_autosuspend()
> >>>>> is missing in the error path for bam_dmux_probe(). So add it.
> >>>>
> >>>> Please use devm_pm_runtime_enable(), which handles autosuspend.
> >>>>
> >>>
> >>> This would conflict with the existing cleanup in bam_dmux_remove(),
> >>> which probably needs to stay manually managed since the tear down order
> >>> is quite important there.
> >>
> >> Hmm, the setup and teardown code makes me wonder now.
> > 
> > Yeah, you ask the right questions. :-) It's really tricky to get this
> > 100% right. I spent quite some time to get close, but there are likely
> > still some loopholes. I haven't heard of anyone running into trouble,
> > though. This driver has been rock solid for the past few years.
> > 
> >> Are we guaranteed that the IRQs can not be delivered after suspending
> >> the device?
> > 
> > I think bam_dmux_remove() should be safe. disable_irq(dmux->pc_irq)
> > prevents any further delivery of IRQs before doing the final power off.
> > 
> >> Also is there a race between IRQs being enabled, manual check of the
> >> IRQ state and the pc_ack / power_off calls?
> > 
> > Yes, I'm pretty sure this race exists in theory. I'm not sure how to
> > avoid it. We would need an atomic "return current state and enable IRQ"
> > operation, but I don't think this exists at the moment. Do you have any
> > suggestions?
> 
> Maybe use IRQF_NO_AUTOEN flag to reuqest irq and enable_irq() after that?
> 

I thought about that too, but I think that might introduce a small
window in between the two calls where we would miss the state change:

	irq_get_irqchip_state(..., IRQCHIP_STATE_LINE_LEVEL, ...);
	/* if an interrupt arrives here we will miss the state change */
	enable_irq();

Thanks,
Stephan

