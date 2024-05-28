Return-Path: <linux-arm-msm+bounces-20737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DF68D1A63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98E14281EB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C803116C84A;
	Tue, 28 May 2024 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CL3KAjlV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9984C97
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 11:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716897407; cv=none; b=nomw2ddqXdqCj/3B7fs9ci5KH7CELUnkAEx333DSRbj0oisWP7l0oolXpGrbIcT0oGnB/Hol9x4IeONR/EO53OMT8/bqbnHG+/1d8ae5Gq90dMLPjmFvYdLWQ5RDTPKWm64BGP/oPnBZtVsnhJYMDC1cN4mUADWoddd2i1Ksc5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716897407; c=relaxed/simple;
	bh=JoFKSxnpuAFmFALL4XOOxMVE666JdBUw5hFTodj0Jok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFgz77O9ZCWQbFwacrX1gfotDw+CWd2UY6xrRhfyHT+Et1bT49RO5p0/XhNmya3zZm4BGwwcelqvAyYzbhmvLaVOcI7pfLk5Ulfv0rrR7cJ9NiaGRvk1kxAk+9Qc+pFS0UEtN7vTkKx2rUYQpeVLxGS5zsz6CSgM7X5Ar32kMYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CL3KAjlV; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e724bc466fso7282181fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 04:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716897404; x=1717502204; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oCjaRC8Eu5PO/jMlynPBkhbwEoTzC3Pm/rk64eh59dQ=;
        b=CL3KAjlVydEbiEutMnkbvpPZEB9c+6zsTebZCzS86Av2RbMYEoL69qIlOXbIoTaB3b
         0TJg7iMaDNNckcHdu1aCR6sMfvNe9m+Yg66kogy/V52HHqdsTTmmOcd6CO7jceZ7YyRA
         jO9xVCuox2U9pXNT8hoDNkIm/eS9T/b1zhCepcO+pk10dHukfskUjxVovMf4TPTt47SB
         mhw7YTyPt1FaZY9AS2TZRAQESl9Pooe+ZuF2P/5C1OUQRZkVxwhHRu3h/N+8ExAH7I6y
         iP2SJCBTDk3Y6Icetwj5D5xUVA1Sg4uNBUHwtCEXt4pBa5lgq9iSFqKlCofW3IcL0XqI
         xuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716897404; x=1717502204;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oCjaRC8Eu5PO/jMlynPBkhbwEoTzC3Pm/rk64eh59dQ=;
        b=wqv20N+y4OCS6X7iAZpP1422PFWaOpatFlR4fsXxsesElihmOIe74NkaZzlNUsQjHF
         YDXNtdPzgk6iKFopXK1CWucu54Mu4E4gumXd0C3SgPlTtjdu5oPDPagKAEmWBkiIezd7
         r+xCN9V5g4Vq+R073qfNd6cwI2J3NSNCPoKFNywZ3TMiPRtdwc7GloujjvL1l5gTxPUB
         Qa0wuoNvPVr/SO/ewlfqpODXem+DYQMF8KlhElIqV39WiLo9cukkmHw0qW0zZJ6Wjbyj
         u/xzAyhGehNgEEtEMMWNbqSJp70UlQvYraAIZ7Fj8bmAMayigNv3CLf5Z3zEOhITf+x1
         GQ2A==
X-Forwarded-Encrypted: i=1; AJvYcCUf7m56TezMbaEbdIoIYDhyMfU9wedUCyXmOGYq4n64FDOv/41iajpryR0iwtcJfCxQE/VtbvHDXhJpHI9WaZJu7M86Cplkpu9xu7UNmA==
X-Gm-Message-State: AOJu0Yw5vftgkc+FKXhWScZjB/6ESIq3lgbuG685MyqJ82vnlqq0VyZ8
	pfdZxiDvpQgP3KfzBJPSOXSbfcOFrM1ubwGJb2az6WnaYtJZ3gdrR1WrKDcGJ0g=
X-Google-Smtp-Source: AGHT+IHsJsDnQl+EL8lCVJ54Xb104AElU7vavZkJuJ90hTUqa4aoOEIcclt6lXoq7iXLRtqyt4A4DQ==
X-Received: by 2002:a2e:b0ef:0:b0:2e9:834e:b9e8 with SMTP id 38308e7fff4ca-2e9834ebb5amr28341211fa.1.1716897404252;
        Tue, 28 May 2024 04:56:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcc4962sm22516371fa.11.2024.05.28.04.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 04:56:43 -0700 (PDT)
Date: Tue, 28 May 2024 14:56:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/6] drm/msm/dpu: adjust data width for widen bus case
Message-ID: <sjz2el73774uaht7gfwbyuteprd3nv73gvj6g557putrxh7jut@g34dvy4s23ui>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
 <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-2-f797ffba4682@linaro.org>
 <57sr3ssi6nwermdqtnb2ackmu4tlxs4gcslvp4v6ndafnvbqhb@4npuqfpkzzan>
 <CABymUCOCcgfHsBaFBk63z+CLJu6Lee983nCM14PgPWZjkFFikQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCOCcgfHsBaFBk63z+CLJu6Lee983nCM14PgPWZjkFFikQ@mail.gmail.com>

On Tue, May 28, 2024 at 05:59:13PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2024年5月28日周二 08:48写道：
> >
> > On Mon, May 27, 2024 at 10:21:48PM +0800, Jun Nie wrote:
> > > data is valid for only half the active window if widebus
> > > is enabled
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > index 225c1c7768ff..f97221423249 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > @@ -168,6 +168,15 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
> > >
> > >       data_width = p->width;
> > >
> > > +     /*
> > > +      * If widebus is enabled, data is valid for only half the active window
> > > +      * since the data rate is doubled in this mode. But for the compression
> > > +      * mode in DP case, the p->width is already adjusted in
> > > +      * drm_mode_to_intf_timing_params()
> >
> > Is there any reason for divergence here?
> 
> Lots of parameters in dpu_hw_intf_setup_timing_engine() is calculated
> from timing->width,
> such as hsync_period and display_v_start. So the width cannot be
> adjusted beforehand in
> drm_mode_to_intf_timing_params(). Otherwise, we get below error.
> 
> I guess the interface timing configuration differ in silicon, thus the
> software shall handle the
> difference. If we adjust the width beforehand for DSI, we get below error.
> 
> [    6.625446] [drm:dpu_encoder_frame_done_timeout:2469] [dpu
> error]enc31 frame done timeout
> [    6.642369] [drm:dpu_encoder_phys_vid_wait_for_commit_done:525]
> [dpu error]vblank timeout: 4200c1
> [    6.642395] [drm:dpu_kms_wait_for_commit_done:493] [dpu error]wait
> for commit done returned -110
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

