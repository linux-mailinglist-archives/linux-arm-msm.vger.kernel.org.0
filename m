Return-Path: <linux-arm-msm+bounces-21103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DECD18D4BFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 14:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9448E2820F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 12:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D6B13211A;
	Thu, 30 May 2024 12:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PSJw65x+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FBA1E515
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 12:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717073349; cv=none; b=ZHQyluTcms7EAioLmQOo6daBvNhN/eUHz2Ac9nBVtTJXqIjH5EJKrPuAa4X4kIky+xaRARN35vZ58k0V56hF7QOPAua0pdISbm4gqLcfk0WLZYuWpuQZ9lbO4cdvMQL57AfgzMGZPP/DqB79sW7l14GP9bLIwdOzzsM9kRtGEDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717073349; c=relaxed/simple;
	bh=tcIw3mu21mSIThLbo4pmWvQMyDGmEVJ0zhtv+cfxk84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0kwuPVMzEVLVYy6VE8q3snl4vjcYj03ZQn9KT4DDlx5DdACJGh3vLcdVA+N8fVvZA1ltaf5+l8ZtojGYZMSk14p+vueHsIfKrXBkRbquQJHeaVZm0vc96w/DRZdhq22Pj4CMlZqFg3BAcdpXVOdp/YOdO+zRFJ9eKdediWwYQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PSJw65x+; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-62a08092c4dso7865297b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 05:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717073346; x=1717678146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcIw3mu21mSIThLbo4pmWvQMyDGmEVJ0zhtv+cfxk84=;
        b=PSJw65x+N99u2+sh1w5NO9Hp23X9RAg8mZyWN7hXUV3qfXYi8OhHT83EmyfhsV+Afk
         uJKNgSiax0DtkzAvJyOVrtyZzPsVlMgJucoEAGA/ux2XZOkuep+8vEAO/tnm4vvzKx4J
         EZYMOBti6wqU3Dby5BZzjCiXZwwJYGo2OdUEp9lidNx7jfWnzA9i797JkrXKwIvEDLRC
         GZ6eeqvKLqzipSQ7UpBSwx1ZvrSu9eJvS/TDeUyI+mxdSKuT5XsogTRGMcN+gfqahYnP
         2ofY9+CksN4cllnmsyjWBmiaPOlJboAPJ2I/fNjzIdk4KGlBFdqgSySlHBAM7jdvKEU6
         rQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717073346; x=1717678146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcIw3mu21mSIThLbo4pmWvQMyDGmEVJ0zhtv+cfxk84=;
        b=jNmDuamtl6+WJWNHRh43/qxfmdw5hLKIXVtB3A9knDI5ncmCOoqiFav/u7Yr7T1eBF
         z18lLVCtcroIXYfdeQjyyYGmXIcHftdMQr3RMuuvAVHJqh91ZoDgXDtf75Iy/Wqdi960
         uerilq03IwLZmOI16ejXJDvQl0YH12ytSgVSDHxYq49E0wzsBVd8tuI65Eo/2ZTigWJD
         zHLVc/6IxKKE1MWoMhdTP0WKtFWDBF45MfXtEIT0o8QJyABCddxfuJcI0rWUsE43CyZk
         f8aD7GnG4ft49yyUs/vlWdBt3OJozSJN0d4vEHoph/zWVIi4i8AoPX0C2aapvmIUq1wx
         eFEA==
X-Forwarded-Encrypted: i=1; AJvYcCW++isWQW7W57T1pswrfoblGtphsf/v3s1mG4kF7LleDIDZUZSSO045O8s6cUTbLQQMZLHCfc9VApMV7KBRl5NlnsZE9aWyPR319teD+w==
X-Gm-Message-State: AOJu0Ywos0jOrKHUCHNQfsVTA0RqYL/VBj1dxoeeqQHrGk2tTlCuarMn
	lW3kfiLx/EMYnhc1GRfixaU8upXbd2BOJJiLQOBdzDAKIE4JkpOR5BzCuhE43GC3VcBljloQDzw
	RQnvsCdeDdcK0ZCsNbAOr3lKTOCjtBkFeNBvZYw==
X-Google-Smtp-Source: AGHT+IH9reN3k9B5alZuQHzGsBX3pJuGAJhOvhCUMJYzD/NF7mywytMlezP/lEAG+hGzVP28iGPYs0J0xalsNECb288=
X-Received: by 2002:a25:ad51:0:b0:dfa:6c83:81d7 with SMTP id
 3f1490d57ef6-dfa6c8382d2mr202060276.38.1717073346405; Thu, 30 May 2024
 05:49:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1715691257.git.jani.nikula@intel.com> <93d6c446ed4831dadfb4a77635a67cf5f27e19ff.1715691257.git.jani.nikula@intel.com>
 <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt>
 <CAD=FV=XgpD_JqxpVezZ=RzudwxLJb+gN3Br8U03ONLGv9n_JmQ@mail.gmail.com> <871q5jii2u.fsf@intel.com>
In-Reply-To: <871q5jii2u.fsf@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 15:48:55 +0300
Message-ID: <CAA8EJpqoOtoidm3kBWrQ8RzxoWOPVfrvgsmBkyFX6PGQSg00xQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] drm/msm/dp: switch to struct drm_edid
To: Jani Nikula <jani.nikula@intel.com>
Cc: Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 30 May 2024 at 15:45, Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Mon, 20 May 2024, Doug Anderson <dianders@chromium.org> wrote:
> > Hi,
> >
> > On Sun, May 19, 2024 at 2:01=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On Tue, May 14, 2024 at 03:55:14PM +0300, Jani Nikula wrote:
> >> > Prefer the struct drm_edid based functions for reading the EDID and
> >> > updating the connector.
> >> >
> >> > Simplify the flow by updating the EDID property when the EDID is rea=
d
> >> > instead of at .get_modes.
> >> >
> >> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> >
> >> > ---
> >>
> >> The patch looks good to me, I'd like to hear an opinion from Doug (add=
ed
> >> to CC).
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>
> >> What is the merge strategy for the series? Do you plan to pick up all
> >> the patches to drm-misc or should we pick up individual patches into
> >> driver trees?
> >
> > I'm not sure I have too much to add here aside from what you guys have
> > already talked about. I'm OK with:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I assume you'll want to pick this up for msm instead of me merging to
> drm-misc.

Yes, it's on my todo list.

--=20
With best wishes
Dmitry

