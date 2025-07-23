Return-Path: <linux-arm-msm+bounces-66351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B680CB0FB18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 21:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 718CCAA33D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 19:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A81922E3FA;
	Wed, 23 Jul 2025 19:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVp2Sbv7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E303422D786;
	Wed, 23 Jul 2025 19:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753299801; cv=none; b=PoClrpFjpmKoNCNqtXvZomF19i3GFd2u8uTnH9Xf+4Fcs4HAzTCChMpf973L8h5ykF11oKiHzTsLkB4p6GMpNWUbIaVhcIdK/xIbQoTvRDbc+wq8ONhnBvJMRGR/xvbcOLjcFky/h8GcFyiV320hZw/IlCIclkvh0NuS2olWGpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753299801; c=relaxed/simple;
	bh=XZwDo8p3c0ghdLjLhRqJHVAbr18HMzibut0ANrq6aK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qfHORw5sHqQVky4bZQXTnIaAuWkq7GKsb6K3IssKuIUB7kWOnVeqbyzxSBgEuHGecs8JJooEsftsZ49bwluAXuBM8MskLezDEX3/SfHs8qznOn6W1/Io9taLsO4Z/c6T9HXt0FNnVlU4kpkgqdGO4DtCWE+vKOCbU1BPdxIRGRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVp2Sbv7; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-87ef0423934so14664241.1;
        Wed, 23 Jul 2025 12:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753299798; x=1753904598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLwJLwrvxgt/xsPZw/m3LYggy+8iY07yBN+YnVJglfg=;
        b=NVp2Sbv7OWn6eEcvgr7dPty9YXH8OsDEUmgAjLOInmBvYi7VerbuGYBLzUI1G7lNHb
         klGtuypYPv+t9yQnrs+2Fp7mJoNNsYWchNKsQpMS7F2BHKRYsd6zp5VYt+2AL5yjUj3J
         OnohxhSHyRPAseJP8DXtvdDOn+viT0hKwJV/3y49dAvCBm6kwbyaYyv6kbuH7ACaurev
         DeBjdy5IjINbR7GIwrnL9jJmmHZ6Lxzr1bTO19fFLAujWzoWIdX6TEKY5qp7Fwd0PNus
         zj6YIyNvJqaKRhaZKsXkAP4I9bRyBUZykzrXfrsI2fpgVrWS9DtlHqz9uuQax4t1VEWe
         o48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753299798; x=1753904598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLwJLwrvxgt/xsPZw/m3LYggy+8iY07yBN+YnVJglfg=;
        b=drm54OwrOJoBGnmyT2EFdzW2jf1yIy85D+ryKt5dVbN3zQ51YQZ1eGWjA+BwKsmW0O
         DZz0HsylUnSZxjKYiBGL7GXnuG3FXvWeNFJXcx2IxGUUIcXUtEYPlc13fBD8TUDwRaj5
         yYHIhKodvHfNqRRs/5p9TvuoGhamIOx8mu0lAJFfZD1lxXgLUfPKXOlBExnVMo+TfLBG
         WJ8HkTvGNHl6/memz/3zrRvGMBdKozkMniTzhHuaKPEv9RCUpx2BVmm51aE3dTG6Lr9A
         y0HqYPFHvap65MOh1Kev84xPsr8qWUUoQPQwNGBrbfwXpq2jhuxlFgYPgbagzBgYST/Y
         +PEg==
X-Forwarded-Encrypted: i=1; AJvYcCUNrk8t8TNdDoFEIy1xl8mGdoGpYFRODqiW1ecV5FQPAfh8+7oYI0Z+YSxRfnP5+TH951YAxIEmRtB+LMl0@vger.kernel.org, AJvYcCUysFtn1OgylyuuSA6oZxbR9rAc445+FfIYFfVMW7M2iitYc27HD2nP4DSQHiIWnloPGc7Djtahlw7cd+K+@vger.kernel.org
X-Gm-Message-State: AOJu0YwKUnmK/a6Dl+NI2Hm+xwlYSGpRbkM1X6HBDME3ZV8aAjax5Il8
	1GxMG9ilgkRGmoRmkmEtmSjgj+bZjifugHPKhjekE2hUPaL2Z5nAJ4rfh4B+Zg3jCzf5zVJ72bZ
	bnyNEYxCPq+uPNf5bMeCbr5VjojtrZg==
X-Gm-Gg: ASbGncsBK816bET5C3vpQWthCEBibJR1aP94YckGxCagOXpMoPQDvmSelXaWgkUx/6U
	9JBtSetjVeXOVjvb/M8ULnuklYONCAStUFZJxsSMMs4Dg/R4OmW2XxczLOZPTXrjg9fgjJOYAek
	Hy3nZVau3vXMcdGHqkVlCHhBFoxjw2ucAnUjXbmSLUCVcC0c91vVQB7qX8DV9mHZ/YrJa+QVuVD
	8VOxdU=
X-Google-Smtp-Source: AGHT+IHeKBka0XSBYI9j8YgnKfuDdyTEyHmyHYiq8wsuJyyYC0gkyj/gafdGPZCNFkUQKu6gmocFiIRCDZh089FWNic=
X-Received: by 2002:a05:6102:5985:b0:4de:ec93:edde with SMTP id
 ada2fe7eead31-4fa14fbd4d1mr811264137.2.1753299797703; Wed, 23 Jul 2025
 12:43:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722211740.3697191-1-chenyuan0y@gmail.com> <ciawdvjevycjjuowmykfux2v25lvr66kzey4jklq7t5cjzqalj@qfcva77k2bvr>
In-Reply-To: <ciawdvjevycjjuowmykfux2v25lvr66kzey4jklq7t5cjzqalj@qfcva77k2bvr>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Wed, 23 Jul 2025 12:43:06 -0700
X-Gm-Features: Ac12FXyfDgvypAhX518Ytb4IDIHsDM1ZIOFH6GXk5RFMsuqTApG8e4d9TBwGU60
Message-ID: <CALGdzurR2XPoai8qshTX6hzgF-zLQ-FrsWxu5NGjrkjNzWaHaQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Add a null ptr check for dpu_encoder_needs_modeset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev, 
	jessica.zhang@oss.qualcomm.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, 
	tglx@linutronix.de, krzysztof.kozlowski@linaro.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 12:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Jul 22, 2025 at 04:17:40PM -0500, Chenyuan Yang wrote:
> > The drm_atomic_get_new_connector_state() can return NULL if the
> > connector is not part of the atomic state. Add a check to prevent
> > a NULL pointer dereference.
> >
> > This follows the same pattern used in dpu_encoder_update_topology()
> > within the same file, which checks for NULL before using conn_state.
> >
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > Fixes: 1ce69c265a53 ("drm/msm/dpu: move resource allocation to CRTC")
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index c0ed110a7d30..4bddb9504796 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -729,6 +729,8 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *=
drm_enc, struct drm_atomic_st
> >               return false;
> >
> >       conn_state =3D drm_atomic_get_new_connector_state(state, connecto=
r);
> > +     if (!conn_state)
> > +             return false;
>
> Did this happen in a real case or is it just
> yet-another-static-analysys?

This is a static-analysis detected bug.

> >
> >       /**
> >        * These checks are duplicated from dpu_encoder_update_topology()=
 since
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

