Return-Path: <linux-arm-msm+bounces-17998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5E48AB761
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 00:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 479F7B211DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 22:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4662513D60E;
	Fri, 19 Apr 2024 22:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ve1zoOjS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF8A13C3F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 22:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713567563; cv=none; b=LEPPrk3nof8azTQvDshImKaBBw1T1CZ0N2fznWntkgpXczEgHolPli6r07c8BokisHTIp4/i3Dag/hUbM0sb9lOGiyJ16Xe/+3YrVNNok3MpP9+TcoyuKX1G07yOa4B+gjkjllsfNgV1jGysiDvYe2xypgJvQBB0Je/FE0MxQsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713567563; c=relaxed/simple;
	bh=dq66rNJndbQc60lsm/BjaeR3uKnAGkQCnG7ybzMIKnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKEhymmUhCOrO+Si4hnxN6DnRVSwDcXJhdatXeDoSrSBIRvAm8gmXPvVUl57zBnpPc3j6HEpsaztlfO/Jzs4FcRTkrrbP00HfffvannxQs3EXFerX71LrnlC44eY6ScEOdRTpSkKsFxopVc7lqJeNLcpJMLa50Gt3Uc6cyaineA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ve1zoOjS; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516d6c1e238so3185664e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 15:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713567559; x=1714172359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/pykJ+iNZaZvxsy5yVJ+QnkNtTRNc8ccYnjEfcauKg=;
        b=Ve1zoOjSG3xxakg5n72/UVdaXqdwP/tkldZ8KXQqaRdFWEba+Qv990rwKcTqst1Vi0
         fSOV4RiX+nixGdu3VrVZC55daDW/HSv7rwz5nJg8eZI8r7q5aa/B4xoICw9xmQLT6rRG
         /SPWrX1duZIjJaIBNq6Sasge0M7MJZkDFEg6fRQRlXIrrlvdASlzkeSxLqHqCcbLN9d/
         B8vSFC7vHBpG6s6bDGUT6BRl2PFngxEzRcDikBiQwCIYEnEwIbDd1M6pK6d39s04Fgce
         gxvd/vhNZPkouL2ojaxVkpFuW/ZWb0jW4jR7bTl7DRBZNLumNZwSEFsjoXzfZ3x5vCZu
         kfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713567559; x=1714172359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/pykJ+iNZaZvxsy5yVJ+QnkNtTRNc8ccYnjEfcauKg=;
        b=iNm/+LFsb6pdNJc+8p/CW9KlXdevxtXriUb+rqOK5Xt+01fuBx8iKlTKtyPQ6q39B5
         KRxGqe9xL6P9JuKyB2vMKSVJFJJGXMMrkIzvqcBU6Ip3C2+WRp4Z/+qTzrELBqnEl1F2
         jpb7YTE0p8GDjD0b7YvvfYX4KtxEplONQBslH/jZg/4CbrhSw5FQJuvXO2gCiEQZ0cSN
         TyTzw8Q5RJ2AXUd8xP+XDpsqsXNFboofo3yi15nOH+mARG//1ZlZbI3bRrgAIimXO6xE
         k1Ab+dFcMTCV/TAV8GLzTzGmHGiaMY2afrG5KWoM4qyGdffZsQNykjtO+Dm7zD8KN28g
         L8qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaHC/9Vkl9ZseZaFxDlWFsLxU/qrjATAoEvtsJ01yS3AfYyZFv0iPjdGyTAkDGsuOVGwfh+U3JhgcWI4R2gLWGP2kVwOVxgEr9OZkRbQ==
X-Gm-Message-State: AOJu0Ywg+7LS7KCksELY/BdVQmao7CJeiO4vEMEaQo+3vCB1aICGLqLU
	vDC/kKj4z8shsSIZ9LyQqi2qWPFAO4E9gT44fWQ0Vzo4kcjz+nPc2UV1cGNOtMw=
X-Google-Smtp-Source: AGHT+IESWYEtVXjigtQ0L5bOUF7zr3weAYEinceRJ7EB6HeSNIHj7J9wJmp0cfKzhv8mnoUheJDP1A==
X-Received: by 2002:ac2:58cd:0:b0:51a:bdd6:e718 with SMTP id u13-20020ac258cd000000b0051abdd6e718mr1877655lfo.31.1713567559098;
        Fri, 19 Apr 2024 15:59:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
        by smtp.gmail.com with ESMTPSA id s6-20020a197706000000b00518d7c38cb9sm913814lfc.284.2024.04.19.15.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 15:59:18 -0700 (PDT)
Date: Sat, 20 Apr 2024 01:59:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, 
	Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>, 
	Jeykumar Sankaran <jsanka@codeaurora.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>
Subject: Re: [PATCH 2/7] drm/msm/dsi: Pass bonded-DSI hdisplay/2 to DSC
 timing configuration
Message-ID: <omnlm4e6yq5u2iurxld5gwo7rma4jpfmmhvpzsddjz5aensumc@ffsolnsblmyx>
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-2-78ae3ee9a697@somainline.org>
 <CAA8EJpq-1QwoM2hEyegpfKnVH+qrswjmTd_hpYs9d9B7gikHjg@mail.gmail.com>
 <7fqwkryeumkt7zxsec6va7ys22nfs3tr4rrcz323extdz3f6zv@w4uu2lk4uh7v>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fqwkryeumkt7zxsec6va7ys22nfs3tr4rrcz323extdz3f6zv@w4uu2lk4uh7v>

On Sat, Apr 20, 2024 at 12:18:39AM +0200, Marijn Suijten wrote:
> On 2024-04-17 14:58:25, Dmitry Baryshkov wrote:
> > On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
> > <marijn.suijten@somainline.org> wrote:
> > >
> > > When configuring the timing of DSI hosts (interfaces) in
> > > dsi_timing_setup() all values written to registers are taking bonded
> > > DSI into account by dividing the original mode width by 2 (half the
> > > data is sent over each of the two DSI hosts), but the full width
> > > instead of the interface width is passed as hdisplay parameter to
> > > dsi_update_dsc_timing().
> > >
> > > Currently only msm_dsc_get_slices_per_intf() is called within
> > > dsi_update_dsc_timing() with the `hdisplay` argument which clearly
> > > documents that it wants the width of a single interface (which, again,
> > > in bonded DSI mode is half the total width of the mode).  Thus pass the
> > > bonded-mode-adjusted hdisplay parameter into dsi_update_dsc_timing()
> > > otherwise all values written to registers by this function (i.e. the
> > > number of slices per interface or packet, and derived from this the EOL
> > > byte number) are twice too large.
> > >
> > > Inversely the panel driver is expected to only set the slice width and
> > > number of slices for half the panel, i.e. what will be sent by each
> > > host individually, rather than fixing that up like hdisplay here.
> > >
> > > Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Thanks, it seems this patch has already been picked up for 6.10 [1] to test at
> least, but I'd advise you to drop it until I resend it in v2, as it no longer
> performs as written in the title.

Ok, dropping.

> 
> When I wrote this patch in in June 2023, commit efcbd6f9cdeb ("drm/msm/
> dsi: Enable widebus for DSI") from August 2023 wasn't there yet.  That patch
> updates hdisplay (because it is unused after that point) with the number
> of compressed bytes to be sent over each interface, which is effectively
> hdisplay (based on slice_count * slice_width, so as explained in the commit
> message that corresponds to half the panel width), divided by a compression
> ratio of 3 or 6 depending on widebus, thus passing a way too low value into
> dsi_update_dsc_timing().
> 
> As a result this patch regresses the DSC panel on my SM8150 Sony Xperia 1, and
> likely also explains why it was quite hard to get the porches "just right" on
> the Xperia 1 III with its dual-DSI dual-DSC 4k@120Hz panel (that these patches
> are specifically for).
> 
> I'm still thinking of how to best fix that: probably introducing a new separate
> local variable, though dsi_update_dsc_timing() only uses it to calculate
> the number of slices per interface, which again as written in the commit
> description, is currently required to already be for one interface (in other
> words, the Xperia 1 with only a single intf sets slice_count=2, but the Xperia 1
> III with 2 bonded DSI interfaces sets slice_count=1).  Which means that this is
> always equivalent to slice_per_intf = dsc->slice_count.
> 
> Let me know which approach is preferred.
> 
> - Marijn
> 
> [1]: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/110

-- 
With best wishes
Dmitry

