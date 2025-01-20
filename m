Return-Path: <linux-arm-msm+bounces-45636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ABFA17500
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 00:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FED93A8C7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 23:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564B91EC019;
	Mon, 20 Jan 2025 23:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QhVUiYti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183A319B5B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 23:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737415513; cv=none; b=PbLieTTeYt9aGTLGfEcYiPbMf5uSHnvexRLbj8/E4KRbPVxyq5im+x6i2+4RT6zpMecoewItPZFxGvDXfSAVO7NGK+yc26eNqpQ2aHnAyHPWqfjF3IX8yz69wX/GvXfR9ulyRJSM5YJf+uU+uQDOey3ifRhQLlz3gVcDqM2PtCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737415513; c=relaxed/simple;
	bh=Tx1rYKKOJKkU2K0XBMuMSvRlBVMRzwjOc/bweFSaQaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIGIm5Yl1V4TO3bLiBllkjtWrXnaIPXU8TN9+OEH3PTolQjJRYkgNCCX1pBgRnGU7XPkv41fy1QIW420L75RVtHhwx595lmEmQ/5Q2SdKeVKa5EKYiC4eR2HeeK3bqkNLAzVuoPChNIbFfBfqPHiFXj2H+6muPIWkXS6MIXMoho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QhVUiYti; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e398484b60bso7325480276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 15:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737415509; x=1738020309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3K4n54rL+8zAM59g2r+WZLNP4o+zWfFr7g2g8lZuIE=;
        b=QhVUiYtigx6Pju3YDzjICoOsi2ildCRASYleBrN9EoNBnm3qLkYgPyyBrzZlX4l6WM
         LpWWxO0ba7cdOl1tAbYAekoq888DZpvSbCcG+tjG8eXZixzAwpat00X6/lBSSiRaYD6h
         i/1HptLNc1nYdoIUeJtnvJmtY1c1fAP3AuoKVy+3BMnKQ20AtH+qjSjmDg+Z0I/L3JMR
         BhHpuZJNDulIAmvD0nePTz+755l26quhZlVun9ls/kCpOv0noyElN26wXPpKFPHBJUPh
         9B/W4xSbTw1R3opLmmITsh3MBgOHQmoWlBYZbNJsVIhRzezsDcWUoJ8oOGEbNdNtqZnG
         RUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737415509; x=1738020309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3K4n54rL+8zAM59g2r+WZLNP4o+zWfFr7g2g8lZuIE=;
        b=Rw3Zxkn5+Sxq6fzZVl90CG+oPbovn0tc56A6xuRm60zlBPW8tMjwEVQgASILe8T6Tp
         pU5v+vQ0Rccuisa0faOysm7lH9zD9yIzakIMMKeqAr99LYU0PG/cZUoxefTyZN/tv3eN
         Eaf7+H9sMhML3erVsjWm8/LpfZW+fzHvryG0c5AdqUtfpjuO4y5NqakfFk4+LLxGe5xu
         imRtePganrftqJXGc10U6eP6xtlEHzi3QwbWi/2wjcrQp8ApX0kM/Q4XGjzP0NrVKtS4
         gSTrzPwd/1n8XvEK7Z0eSc9lZLFjdfAyfXvZyrwsWuz+Lz6QdZ3HmTSmJ60ZfSOvX2FR
         zBWA==
X-Forwarded-Encrypted: i=1; AJvYcCWc1Jejj1iF02cHv9MzTqweFlvG0TUBPxzJiZCnAnaNBkfKUJAeK5VzA2gAv9zr3pEp8H3jUuMmqxUyx+61@vger.kernel.org
X-Gm-Message-State: AOJu0Yws4qls+dY8ivZ3EMAPDQ5L2cYA1kpIPGF5uyQxkXQV84QBKbO3
	ALRm65BXj6Y6hHd+Z8zOfqxMMo/SGkn3q5jmvbK7ZrWKk+zr7PV9cUOM9jIu6inytYBxgKrOdr+
	wXnWZIOg/1Zbzw9kJ50Pa6geYyVeaClYdhhPe0A==
X-Gm-Gg: ASbGncsB6c7FV8nxoVvzJj3V1ZSo1RnaG1HqLPWKJR6EwExDB2JLQBGRQT9rHsjU945
	qnwzvph5aFLdkWi5zRW2Eienwrj11t951yCilLV2m1NDLR1iKNg==
X-Google-Smtp-Source: AGHT+IGm1c0IGKgVC6DLGYrBRuOWXwI+xePGXQTc896moba7ai4TGKvAfmuOwpvFx/4v6WNLwRBA/G7NVG8/Ni/Otfk=
X-Received: by 2002:a05:690c:3703:b0:6f6:ca9a:30d2 with SMTP id
 00721157ae682-6f6eb6b58ecmr119970797b3.22.1737415508949; Mon, 20 Jan 2025
 15:25:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
 <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-8-9701a16340da@linaro.org>
 <6n655caflr2snsgmqtmpzxt4jynrwjqdjurnixujfuefldxhxj@uunzpzfezfqy>
In-Reply-To: <6n655caflr2snsgmqtmpzxt4jynrwjqdjurnixujfuefldxhxj@uunzpzfezfqy>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 20 Jan 2025 15:24:58 -0800
X-Gm-Features: AbW1kvb8c5L96IpOkU0MvYJy9U4O8cLtv8Vu7rlOigF1727zF2y-_YzwepU20HY
Message-ID: <CABymUCMbWW9TAo=LfB7Aad+8hBSjJmMVytNN7b6R-AWMeB6E0Q@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] drm/msm/dpu: bind correct pingpong for quad pipe
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marijn Suijten <marijn.suijten@somainline.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 05:15=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2025-01-18 00:00:51, Jun Nie wrote:
> > There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
> > interface to 3rd PP instead of the 2nd PP.
>
> Can you explain why this patch uses the number of LMs, instead of dividin=
g the
> number of PPs divided by the number of physical encoders?  This detail is=
 not
> explained at all, or that we're filling hw_lm now for no other reason.
>
> - Marijn

I see LM is 1:1 with PP in catalog header files. So assume their
number are identical
and 1:1 bounded. Using PP number is more formal for sure. Will try to
replace it in
next version.

Jun
>
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 018a1a49ca7d1..b0cab3ccbb57c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -1220,7 +1220,8 @@ static void dpu_encoder_virt_atomic_mode_set(stru=
ct drm_encoder *drm_enc,
> >       struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> >       struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> >       struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > -     int num_ctl, num_pp, num_dsc;
> > +     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > +     int num_lm, num_ctl, num_pp, num_dsc, num_pp_per_intf;
> >       unsigned int dsc_mask =3D 0;
> >       int i;
> >
> > @@ -1275,11 +1276,21 @@ static void dpu_encoder_virt_atomic_mode_set(st=
ruct drm_encoder *drm_enc,
> >               dpu_enc->cur_master->hw_cdm =3D hw_cdm ? to_dpu_hw_cdm(hw=
_cdm) : NULL;
> >       }
> >
> > +     num_lm =3D dpu_rm_get_assigned_resources(&dpu_kms->rm, global_sta=
te,
> > +             drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > +
> > +
> > +     /*
> > +      * There may be 4 PP and 2 INTF for quad pipe case, so INTF is no=
t
> > +      * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
> > +      */
> > +     num_pp_per_intf =3D num_lm / dpu_enc->num_phys_encs;
> > +
> >       for (i =3D 0; i < dpu_enc->num_phys_encs; i++) {
> >               struct dpu_encoder_phys *phys =3D dpu_enc->phys_encs[i];
> >               struct dpu_hw_ctl *ctl0 =3D to_dpu_hw_ctl(hw_ctl[0]);
> >
> > -             phys->hw_pp =3D dpu_enc->hw_pp[i];
> > +             phys->hw_pp =3D dpu_enc->hw_pp[num_pp_per_intf * i];
> >               if (!phys->hw_pp) {
> >                       DPU_ERROR_ENC(dpu_enc,
> >                               "no pp block assigned at idx: %d\n", i);
> >
> > --
> > 2.34.1
> >

