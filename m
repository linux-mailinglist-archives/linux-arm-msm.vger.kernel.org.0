Return-Path: <linux-arm-msm+bounces-23408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D0F910D59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 18:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C74A71F22AE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 16:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E981B29C7;
	Thu, 20 Jun 2024 16:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+Djnr/9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0171B1436;
	Thu, 20 Jun 2024 16:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718901735; cv=none; b=bX3vlan/ha0tUF9BVritgivZf02udYxY0qDYlqOFb5QtWboFNuRhmI5CmqEGWsMmYvsHgzqZssmhAbl7seKnSm5Jvy/6EYzrye2fET6soRD1n4of6b5N2tSfovf3OhOHGHvY1C/BxIb+1MTp2LwTqn5FEFYypehhaiyC9ZUj3ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718901735; c=relaxed/simple;
	bh=FfRRl+rsm+XdgwUHVha+tPzWG2zp10p4W/7/pDVEpW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQFzV+9xgjB7MzavoDXbq9abBKHW4GECZVzPITftRO8Vf0pkjBmBzgifbTbn9EMLb74Zxc3Wt5k7KL6j8UEXJ687uNxOJvjou8XdmPm4irDZF+KkjaaSySvYyPWf+27Qg3KONVwlpXIieSol/Gom/aburCbVDFifXGcrUfldIfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+Djnr/9; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ec4a11a297so5453501fa.0;
        Thu, 20 Jun 2024 09:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718901731; x=1719506531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvPWAGvnBNSgSHBYq/LlacrTlJVn4K7wbKBfHfFlQnU=;
        b=h+Djnr/9nbePqhx18uANs11PllFw6CBysip6ENd3kYDiZUz6WCyoVeJqfUfHSl99GH
         ZyQowyHQcmjemcMFIWWXYFfC7LIS8Gc5NN9O9YDVzuj9hnJd163UFBRPrn6lKc/QZyVQ
         u2rGXJqi7ioVppVj8PE9CTvrO1KLLP+aI35EW/mmeQyBGYO5cQHdWKyih+LZKdoQojr0
         QxzfR8g+IFr1WifBvKpUuMzLFWULyB8Blr4MmmEhUstFu/+Z+JyVJMNd4XNHBJzlJWzH
         ceY2Tb12xL1Q37v7Ki7vsov/5CN7duTB2AyXceKyJirhEpgRQ/1LxZUI3yCz1SV3kTeN
         1uUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718901731; x=1719506531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvPWAGvnBNSgSHBYq/LlacrTlJVn4K7wbKBfHfFlQnU=;
        b=jay48Verfxc4CQISGMOCro5Ru3jtTLOpyrIMgnZBR9vubOoDMYw7B4QtaA9fYTrD0P
         LV9EKmn9Redn9zhvMv63R+FdMP/SydIcpwrKBt1PXAsLKzKWZHoqZgoAyaGSLfhuPkI9
         0upN36HtvjmaHOHt1fuWs2Dh8IAvNXipzg9bi8aae1iIgVp4Jg5evnTxsLu0Na7QbZ9R
         4fejgSlXapMDC5RRT7VDjci6AdLJwPpD5acRsHl7aay67InXAfg7B5a+1URqNyFknw/B
         6ScepRG2ALtGsE/PZ5yBGjD2B61PX/HBTCG7E9H4rI7ThfE0fKYw4dSmsrsSfALOlk9C
         EggA==
X-Forwarded-Encrypted: i=1; AJvYcCXK2G9GMkpKooGQdnZBWJ5NIb/dZzBA8rRGSSWL9VqF/XAeffWFYWFABcDUCDU7tWp8MOj1iY3GD+MTfpKF7VBp9+q7gh95sufOdx8FkH3/Yt5YNyvdDm9w6dS9guhXfIl6GIJbBHNCN7Rrwg==
X-Gm-Message-State: AOJu0YyokwBRdtB8dH0cJ5mxTfBwWXlwZ9iBn21rCiR3l9qSn+4A4PJm
	C0vbRdSHmlf74IjPjoO15BMmptMxz85l+VFzQCVo/XujCz5sz8Ckx4MdbKAoLM768arG2xSvsM8
	Mu8tOu3jM5Yxj3op7DIlIfMnCvzo=
X-Google-Smtp-Source: AGHT+IFlO0TjFwAgwe7jW4uv3d0LZl69UkHI5u0XxEuqIMBFANIynjGf5rVmxXcoSuPa4ro4jZJLuLzDKYolw72m6ao=
X-Received: by 2002:a2e:be8c:0:b0:2ec:3dd4:75f9 with SMTP id
 38308e7fff4ca-2ec3dd476d9mr46118991fa.35.1718901731039; Thu, 20 Jun 2024
 09:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619212743.3193985-1-quic_abhinavk@quicinc.com> <CAA8EJpowTONWNQH+Sqe1w1eL85Ty4tw8_Qkc1yToQu9s17Tokw@mail.gmail.com>
In-Reply-To: <CAA8EJpowTONWNQH+Sqe1w1eL85Ty4tw8_Qkc1yToQu9s17Tokw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Jun 2024 09:41:59 -0700
Message-ID: <CAF6AEGsQLqf96g9iaUqB1D6zcay8csvUH7oyirTd04x+bUzvYA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: protect ctl ops calls with validity checks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, dan.carpenter@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 6:08=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 20 Jun 2024 at 00:27, Abhinav Kumar <quic_abhinavk@quicinc.com> w=
rote:
> >
> > dpu_encoder_helper_phys_cleanup() calls the ctl ops without checking if
> > the ops are assigned causing discrepancy between its callers where the
> > checks are performed and the API itself which does not.
> >
> > Two approaches can be taken: either drop the checks even in the caller
> > OR add the checks even in dpu_encoder_helper_phys_cleanup().
> >
> > Adopt the latter approach as ctl ops are assigned revision based so may=
 not
> > be always assigned.
>
> NAK, these calls are always assigned. Please make sure that they are
> documented as required and drop offending checks.

agreed, I'd rather see the obvious crash if somehow a required
callback didn't get set up, than a subtle/silent problem.  It is
easier to debug that way.

BR,
-R

> >
> > Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for=
 writeback")
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/all/464fbd84-0d1c-43c3-a40b-31656ac0645=
6@moroto.mountain/T/
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 708657598cce..7f7e6d4e974b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -2180,9 +2180,12 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_=
encoder_phys *phys_enc)
> >         if (ctl->ops.reset_intf_cfg)
> >                 ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
> >
> > -       ctl->ops.trigger_flush(ctl);
> > -       ctl->ops.trigger_start(ctl);
> > -       ctl->ops.clear_pending_flush(ctl);
> > +       if (ctl->ops.trigger_flush)
> > +               ctl->ops.trigger_flush(ctl);
> > +       if (ctl->ops.trigger_start)
> > +               ctl->ops.trigger_start(ctl);
> > +       if (ctl->ops.clear_pending_flush)
> > +               ctl->ops.clear_pending_flush(ctl);
> >  }
> >
> >  void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_e=
nc,
> > --
> > 2.44.0
> >
>
>
> --
> With best wishes
> Dmitry

