Return-Path: <linux-arm-msm+bounces-34238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3657299C0DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 09:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE74B1F236F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 07:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A03433C9;
	Mon, 14 Oct 2024 07:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z0TF3mS/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B765145B3F
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 07:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728890006; cv=none; b=SNiyTxqpYeciuZdtmGXN/ZJ9Orc4EfExqKFc8jg+0yS07/hOVKX1ddN8GxcAFsifYJ5KdUL4wyFnibKXPFjB10HDKLE7XedoUjyt1K0U7LboivQPrrT5aKjwAKeuOAjO8AnyunTDcEXr20vLn7YYgthtxa747HZfjsqJubJp444=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728890006; c=relaxed/simple;
	bh=soZUGN/CewBFVNfdz3KR1OQHSXx2AxZY9PlPrmTUB3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGieLuj68m7uGbg/hK7ySIjTAXxazPo5zaovM37hnuZRaYEU5mmciln6mic3jmJa7xuOUG9viVXkZLEe1NWUpBhM759gezjjiQDaSRNGk+io5j3I/v8d36QjnEwMP48KWKtv5BRgyQ/GQ+XIFTau66d4WBgKWvjsWO1iTs3sUdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z0TF3mS/; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e6c754bdso1100391e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 00:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728890002; x=1729494802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0cthvJbNHIUuZVAOfCaJNB5q9EvmZX6lNdstcrG6zo4=;
        b=Z0TF3mS/KRDkX2o+DMktKlS0MlrXrbbV3PtR5XQmp+LiHKlkPfPZ0QNMBmYpjY7obu
         KtSYnHm/WcfRVnHoyKhvuceQ/wMIubgXTkfaVUDWiVJR3fP8BxdGtEUeJG6ZDG0NJF0Z
         I/v58gBBYt31/z5K2OCw2nTkXngpwEfb4dmTA3gaFGI07fN1VLp+xzbTUgsLQJxNkrXV
         xFZJL1tMzvLsyubGCQSXWF7bLgA/9SfwfVWAoJAKeDaJ7gWLpuNoBfCPybyQ+GO72ZYW
         YikR7YvV12IoGm7MFn5yil0WpzrSx6P9Y18hcXXJ8bhxymbsz3RP98UVyYmpu1z1mw9A
         JJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728890002; x=1729494802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cthvJbNHIUuZVAOfCaJNB5q9EvmZX6lNdstcrG6zo4=;
        b=HLti6RyIjMVhfJ1Yrk2ygqx3d/gwMMN8NlIMaMppb0VGLI5od4AO9TyFu0qhTj2Pyg
         KgGrElsMwdLe1hSIwcqOeh+ILHZvwPsjgSgRg/v+x9Gg24rzQ6Otr4MK6UJuemHhPvci
         fCiaCmbqYw3NhqPid/C9BDckrNty5Y5Fr5zcMNBMKMZj0YAxF576DNCAZ3k1GqKnsgFv
         2L/MMGClRbSL8keNAkh501jXE2SE8PnqHiyTtqYAABlUZCJcfHN1qkWgvSyjZf0V29hY
         17nUrLWS2EG6HMccutaLuZxIKeMmObihF9A91GEmkkolZ0un9nJMWkXy6xoiQV7w0b9j
         UcLw==
X-Forwarded-Encrypted: i=1; AJvYcCX02BHCy2fRknK57rrJgR72w2XXEVOYHyhQteFoNLrRP99zUn03Mpu9ufTwl2/hPU2bixzzxubpIvO5r0W3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3wXbHI+4ohI+tbY/4eVs0ZvjPJI05Xy4wBjI/PpstW1BT1vYY
	OCOURLCGwjZ/bEtPcNsbmhYlj2/gyxAiENAZXhQh6vHQoVOGpFPKognrdLyQpLk=
X-Google-Smtp-Source: AGHT+IEBN6UgXvC/JiYyQZMKU0lBe2gQnD6YwBDWWDisNaW1eInShMqX2HIrW1+nlG/NKSGaVJphGw==
X-Received: by 2002:ac2:4c4e:0:b0:535:d4e6:14e2 with SMTP id 2adb3069b0e04-539da4fb618mr4542670e87.36.1728890002303;
        Mon, 14 Oct 2024 00:13:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539d69405e9sm1224978e87.280.2024.10.14.00.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 00:13:20 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:13:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: don't always activate merge_3d block
Message-ID: <pahfbstxa6snym7bem456npsp6bdekjqhnjcsrlpbfn77hkrut@uviaesubwz2a>
References: <20241011-merge3d-fix-v2-1-2082470f573c@quicinc.com>
 <kah73euzauizsxvcrgmfsatshfe4pytgb7xe5iprtajg7abhsv@l7jdcxza5gd2>
 <0ca707a4-bd5f-4a31-a424-f466afa08e0d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ca707a4-bd5f-4a31-a424-f466afa08e0d@quicinc.com>

On Sun, Oct 13, 2024 at 07:37:20PM -0700, Abhinav Kumar wrote:
> Hi Dmitry
> 
> On 10/13/2024 5:20 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 11, 2024 at 10:25:13AM -0700, Jessica Zhang wrote:
> > > Only enable the merge_3d block for the video phys encoder when the 3d
> > > blend mode is not *_NONE since there is no need to activate the merge_3d
> > > block for cases where merge_3d is not needed.
> > > 
> > > Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
> > > Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > > Changes in v2:
> > > - Added more detailed commit message
> > > - Link to v1: https://lore.kernel.org/r/20241009-merge3d-fix-v1-1-0d0b6f5c244e@quicinc.com
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > LGTM now. Please clarify, is there any dependency between this patch and
> > [1]
> > 
> 
> No dependency as such. Both are tackling similar issues though. One for
> video mode and the other for writeback thats all. Namely:
> 
> 1) We should not be enabling merge_3d block if two LMs are not being used as
> that block needs to be enabled only to merge two streams. If its always
> enabled, its incorrect programming because as per the docs its mentioned "if
> required". Even if thats not causing issues, I would prefer not to enable it
> always due to the "if required" clause and also we dont need to enable a
> hardware sub-block unnecessarily.
> 
> 2) We should be flushing the merge_3d only if its active like Jessica wrote
> in the commit message of [1]. Otherwise, the flush bit will never be taken
> by hardware leading to the false timeout errors.
> 
> It has been sent as two patches as one is for video mode and the other for
> writeback and for writeback it includes both (1) and (2) together in the
> same patch.

I think it's better to handle (1) in a single patch (both for video and
WB) and (2) in another patch. This way it becomes more obvious that WB
had two different independent issues issues.

> 
> I thought this separation is fine, if we need to squash it, let me know.
> 
> Thanks
> 
> Abhinav
> 
> > [1] https://lore.kernel.org/dri-devel/20241009-mode3d-fix-v1-1-c0258354fadc@quicinc.com/
> > 
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > index ba8878d21cf0e1945a393cca806cb64f03b16640..c5e27eeaff0423a69fad98122ffef7e041fbc68e 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > @@ -302,7 +302,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
> > >   	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
> > >   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> > >   	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
> > > -	if (phys_enc->hw_pp->merge_3d)
> > > +	if (intf_cfg.mode_3d && phys_enc->hw_pp->merge_3d)
> > >   		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
> > >   	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
> > > 
> > > ---
> > > base-commit: a20a91fb1bfac5d05ec5bcf9afe0c9363f6c8c93
> > > change-id: 20240828-merge3d-fix-1a8d005e3277
> > > 
> > > Best regards,
> > > -- 
> > > Jessica Zhang <quic_jesszhan@quicinc.com>
> > > 
> > 

-- 
With best wishes
Dmitry

