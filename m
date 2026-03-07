Return-Path: <linux-arm-msm+bounces-95934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPuDMNrHq2mZgwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 07:38:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E69422A634
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 07:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C603D300F7B7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 06:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA71285066;
	Sat,  7 Mar 2026 06:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VF6MzwK/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DEF249E5
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 06:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772865494; cv=pass; b=IghyEG7Tq5oPsSICaFOwixIncnswCe1C7HqDKE4jzgI/7z+CeTfZeNef5YXEpZGGZ/tAYMr2Njz25Tyv90sYz3ONdRmIUEDSQ+/yyubiKg9l1YdpJe2MlTgfIarxlTGyS68h8oopklH6PkEME/M5ohMZZ5SuKt6D5PdV1CHNpt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772865494; c=relaxed/simple;
	bh=rHY2K67oIsXTwwoCN0WGLPDk1VR6bp3rIF7Ta2WUhe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VKlBXG0gElFGLv4CH6RYkCGhF4KjkbvsOaCoJ+9nPzXhpSS6f16HB72dFUdxSzYg9mxJUsXWAJT9IByV/aG1rTgOMf3OLRNgVxF57K34L3TTcLl3OM3N/9Odj9klSJMXr3t45Dow6Upy7Dhibp3beXPE5VewOIa2o1r4clLAQEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VF6MzwK/; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94dea0e029fso2977002241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 22:38:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772865492; cv=none;
        d=google.com; s=arc-20240605;
        b=k05Jyk+OIU3ekuAmzQlQhztapH67+efhjMaREkrLVxJEx45VLNNlvS2atwA4k+ZSlj
         JLRtvZR6KJoesWLnhHc9D7UOnjAiPqnRwygNZGBSDldzxADkpa2wMms8I/8nZKzTe3Eo
         uBVnQA9S6SoBJWbrsaL7abDRyNElpLct7wAs31VajLD3TEPWRR5txepE6z8p3mAzps7P
         qsi2ZHCNtznuGwd2khe3/YP6vrkEfCz/njvrnjWSbImW/GOcD3/+ZO54VBKh/ipiHCQp
         vAgZz2RPHlEWsoQ1qSJ30SMM2ykNA4zbgUlzelecup2drG4B1z8jKG+4HviJch0Z7p+q
         /I1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EBVEj6M68804v9va0+q2jki79x2IL4Aa9REwQR+xUpI=;
        fh=z8lozlbH3EoVia0/W7plC6NCBStytZE3vhWlaiTEETE=;
        b=J1FwRwVRaXBgK+b/8Twb7qDy6Oqpx39tOZ2N7VCLCL4oNGzq7j1QgKWoIh+9jLOscb
         jl9hOaNRCjBwSFIU3KRqn7uXTy84MsgukgQSKIRhcUiUTWSPevaAkl5RNlLFg1xmh4qO
         rF1UVXgfQxuryp2l2jTaoOC1+HqeUiCobDDG4qkGEQByAkhAvtmoh8xolSpZMBa9bIxH
         N5Bqedm6+UXX2t2WtMVz5VBy89S5Lsihj+QatP/Wo1FEPIs17cUC5xSt5qlEAwo0P60s
         a9Oln7K33N/nzI+clollJEVH/FTPNDhcQ6Lil6Db+WUDjSatRgJahiL/iHvL699limeD
         wF2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772865492; x=1773470292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBVEj6M68804v9va0+q2jki79x2IL4Aa9REwQR+xUpI=;
        b=VF6MzwK/ej/6NE60YzEzXTe3rws5xurYVXX9kMldssHQmh7LEJblndhJLYybeC+Bs/
         EJKHMyfRgkwNWuT4usuvKtaE0+J6qS/QbHIqaZPU1jy0ovLPE1PN5x3Gs0WhDA57oszF
         madotycr6y5ptNSQmg0aEaUcXsFg3rIODSnACgpCQirBCQMjiwm+Ena69bj38R1kN3z1
         njUXFU9n+1jmSJECN73j5LTx7vdimMaUVucKlyjbcBN0zsolRqkvoLfVOHLBA8F0UWBR
         iCfP/VdnXYYra3jsWBGA/o7eWdrhlPaXtLxrVg273y0bsKQfB4kKv+UT3AbMLnx1gl9n
         AjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772865492; x=1773470292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EBVEj6M68804v9va0+q2jki79x2IL4Aa9REwQR+xUpI=;
        b=H+ySfiYc6twowdGEOix195Bjv93g/nQ8sRwrwIcDHQ2CrXp2ak0/o4tIIOrFoh83xp
         RfFGWuZxggF/EDF+a4t+vVZhHU+Ahx0vKPLH1f1JvfZfYBrg2zDco1ic9WVTSmPmZOZd
         xBRv3XGijGXw6uC0INsqFT42XHpo4z82YGdW4kY82aPgsS+bxDfRaxN8pZC6VC7SwtFl
         FOqByDPJkXJ69mX59qtirJfphWGNyN60AvkVZGoIgAnGaY01VsvR6TQFZ7ldjwzmodji
         OwkcYoU/nEitvySlzturwBDphY4dczcm266dvOQpgmVrSKsZj0MFw2YjXRKSeQ32zYMH
         3laA==
X-Forwarded-Encrypted: i=1; AJvYcCWU1kyzxmqNQGBD3ciuBtsd6KxyVxUYAx378R79cesNbDlfP6vmqG1U7hzJTdzfeUWGpdalbfCFiwXfHxrG@vger.kernel.org
X-Gm-Message-State: AOJu0YytVOHRFBKK4Z4oTFS5Z3izdUuUlpexg7oXlZxcDHI+PBZUY+xi
	TX3vcxAqL1yb28+2JUjtrq9yNeUXWfvdz0uzX7d7ozaiw6OwWFyOC+lYCVTDwjqRGcvewJCsuPM
	AI9ADWcy451YkPPY1Tc2jHe1Bj/wOze4=
X-Gm-Gg: ATEYQzxWVeYUb8iiordwv4BwHg92yKUM460uIV5BfXcwCtkLJckCYww44PD4By3PpbA
	21AJ//Z6/vQrsKxD6EfbhSJsPRyPNkl6cPYUy4CaQ9fj+9DTTPYLVq3POVF8xCRd4MdsxU5r2+Z
	YfuMexvBCUHFMyMCboMv/81D6/g9QQeR+o5w+QfkyMUGCwBtoSKKOLCy6b8ftkJP2i8NUiWwnDn
	VEp0gfEb0QLo3HAqurC0XBxh38xOWbCejIuGzDH4djSfjJCFreq09+qclWJ16QM/HhLlELFgfdD
	QbyDsSVP
X-Received: by 2002:a05:6102:3a0b:b0:5f5:40ab:2d65 with SMTP id
 ada2fe7eead31-5ffe614cb63mr1619980137.22.1772865492332; Fri, 06 Mar 2026
 22:38:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306092518.37849-1-mitltlatltl@gmail.com> <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
 <CAAjZPThsEGKFY_z+w9p+c1_L4CZOhkba=hz2kmAyVoMUiXMVPQ@mail.gmail.com>
In-Reply-To: <CAAjZPThsEGKFY_z+w9p+c1_L4CZOhkba=hz2kmAyVoMUiXMVPQ@mail.gmail.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 7 Mar 2026 14:37:51 +0800
X-Gm-Features: AaiRm51z5Jl0rIbfj9Qhdy98oqHJyd1EH7rdlZU1JRZ1VO1ldASebfgwROZoW5I
Message-ID: <CAH2e8h6zQRi5XKLpb5bnQAdamc9qp06PvUU=AqVbtOq-g4OTyA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: remove bpc > 8 entries from allow list
To: =?UTF-8?B?0JXQstCz0LXQvdC40Lkg0JvQtdC/0YjQuNC5?= <fekz115@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Danila Tikhonov <danila@jiaxyga.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2E69422A634
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95934-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,jiaxyga.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.950];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sat, Mar 7, 2026 at 4:20=E2=80=AFAM =D0=95=D0=B2=D0=B3=D0=B5=D0=BD=D0=B8=
=D0=B9 =D0=9B=D0=B5=D0=BF=D1=88=D0=B8=D0=B9 <fekz115@gmail.com> wrote:
>
> Hi,
>
> I have a concern regarding this patch. The Nothing Phone (1)
> (sm7325-nothing-spacewar), which is already supported in mainline,
> utilizes a panel with bpc=3D10 and bpp=3D8 (DSC) [1].
>
> Currently, this configuration works properly. While I have encountered
> minor graphical artifacts during brightness changes, the display
> output is otherwise reliable across all supported refresh rates
> (60/90/120 Hz).
>
> Since this panel is already upstreamed, this patch might cause regression=
s.
>
> [1] https://github.com/NothingOSS/android_kernel_devicetree_nothing_sm732=
5/blob/6f027f0440e3dce8a674d9cbd2f6ad944120e209/msm-extra/display-devicetre=
e/display/dsi-panel-rm692e5-visionox-fhd-plus-120hz-cmd.dtsi#L483-L484
>


Oh, I see. I messed up bpc, it is fine now. Recently, encoders have
supported src bpc > 8, dsi don't support dst bpc > 8. But the nothing
phone panel does not require dsi to support it.

Since the panel is a 8-bit panel, and src bpc !=3D dst bpc. Although they
are equal on some devices(they are, on my 8-bit or 10-bit devices).

i.e. qcom,mdss-dsc-bit-per-component !=3D qcom,mdss-dsi-bpp / 3

Please ignore this patch.

Best wishes,
Pengyu

> Best regards,
> Eugene Lepshy
>
> =D0=BF=D1=82, 6 =D0=BC=D0=B0=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 21:47, Dm=
itry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com>:
> >
> > On Fri, Mar 06, 2026 at 05:25:00PM +0800, Pengyu Luo wrote:
> > > In upstream the msm, for bpc greater than 8 are not supported yet,
> > > although the hardware block supports this. Remove them until we
> > > support them.
> > >
> > > Fixes: b0e71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits=
 per component")
> > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >
> > I hope Marijn, Danila or Eugeny can comment. The patch series with this
> > patchset added 10 bpc panel and used it for one of the phones.
> >
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++-----
> > >  1 file changed, 2 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm=
/dsi/dsi_host.c
> > > index e8e83ee61e..b60b26ddb0 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > @@ -1824,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_=
dsi_host *msm_host, struct drm_dsc
> > >
> > >       switch (dsc->bits_per_component) {
> > >       case 8:
> > > -     case 10:
> > > -     case 12:
> > >               /*
> > > -              * Only 8, 10, and 12 bpc are supported for DSC 1.1 blo=
ck.
> > > -              * If additional bpc values need to be supported, updat=
e
> > > -              * this quard with the appropriate DSC version verifica=
tion.
> > > +              * In the upstream msm, only 8 bpc is supported for DSC=
 1.1/1.2
> > > +              * block.
> > >                */
> > >               break;
> > >       default:
> > > --
> > > 2.53.0
> > >
> >
> > --
> > With best wishes
> > Dmitry

