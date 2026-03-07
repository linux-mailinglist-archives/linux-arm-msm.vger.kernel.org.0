Return-Path: <linux-arm-msm+bounces-95935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAJfJznKq2nggwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 07:48:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C989B22A750
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 07:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49E2F3017C26
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 06:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D363644D3;
	Sat,  7 Mar 2026 06:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3HsctRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56300355F30
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 06:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772866102; cv=pass; b=tH/122ao1E0oMiPX4lGVGCEcVVaL1y1x1Yhn7Rd73Fpb0GS3lRucQ9PlnW2rQD7c9lW05Jo7DCAi0VMV2o8QlG58OyCU8LhIrgQc5ByQFXkRwLvY4zXKH3DrQscRnvaUczuAQGdjV12fe8ZQ7Kyh4JbUmTH2NZq/CGKnZHc39fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772866102; c=relaxed/simple;
	bh=zBk/hYOwdMyNe8++Q7uU4UaqeVMpUweMlc1eg7mx9fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rV4cCP4bou5/ogjiMekNvbI+yVd7etxsq+farmL7w8RFhS2EH4vQ8RIvhzp5oRsPi4sluoOrLdY9u9JQDUj7GW+VAr42tTxHXVc1xzZxI4oB1py/mrVS/sa8L3ta8gtHEBYYuNW0SrEYxa6eA02IJMeZEqKgbBKkY8NbSFCCgrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3HsctRE; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5fff13d5a19so666025137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 22:48:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772866100; cv=none;
        d=google.com; s=arc-20240605;
        b=NX5sQLcjjowRa4ubUXjAtniNiK2vs3EkGp/pUnMhHMfXzEjdvxgBDQamr1/NBUfUYo
         VRmYNi2/obWZZCzEOyW057XvnHizFSEehT7pN3QM9SI8YGSlMjYWeU2G67gCXFcijm5I
         dq4XPrWWbIQgbBa1xvfMexKCrIlalEw4mVfwjzPqxbPq2DozN9PXpcAHO1dafTDxiwI9
         r2236g8HaY9EqoysHlijhGXXfN4Sk1GWMxHheqLKsRY0t9TG8VGI3TcdR0QdXQp69rjp
         ZR/zd0XNLeK0O29cE2HOS8pesvV2jmIrHG53LSLHTIc9qq2VeDzVUlsi8Qwzm/oSLR5U
         2JBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hRmLXS/lUmRTfDQsR0+X9BfBWlcLxAvlkJqbJwNWd/w=;
        fh=3U++ElmZn5MbZgTQGK/D4b6axtyvFfLDSepO+xqZ9P8=;
        b=PsZlO14Oc1MFjkhB9PsLnSl1Hl0hwGrrB6NHX8b7ohmr/zGpYMisCXaWYXd4o2671J
         NFNQN3yc6NW9WGQHPLEZlWshjg/DudkZr0CnZ+wLNwrevUxhlDIe36TZ+4MaTD1VGk1+
         nuH74QiFuzxI4KMT8VAbSQpFF7DCqF+s5pli0riSPNx135KZT3/Sd6wv4LQz/pXN0WW4
         vip6uKe2eUhBjF5X7jnEamNWIfO3Ob0SUcOtTyDN8SnFV4KSpybnDFoEI/d/v0XQgP/h
         Ns4OrrQ7i031mGdBa7BlVH5yRRJXpinamQCVjl+9gY0VDUhM8qfMVcTrj+PooSRBxGEt
         cAxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772866100; x=1773470900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRmLXS/lUmRTfDQsR0+X9BfBWlcLxAvlkJqbJwNWd/w=;
        b=N3HsctREd7hIS3RdoqsDYS+hSdmuAsbK+tyN86l75shSTkn/pS2KDUq6Rf5MDCELb8
         4axEpIQhFm5kajkHcRkPH008oK14PvlWOV9d2eZhZJj1NOMaVQ6zZ5eZIdml/KUoyPq8
         9pmU83chOdYTHk/1uYSEG4/S6ZaO6AhBWqFIlA3yt8AWsUO6tNGS+VsDJkOZKSMa3n6Q
         rgq1Kg+7EdKXaJbJCBHeSlCq9uKNXGEWycR9aCGRRg3FVBtIwJ+m6GlBNL1lMaajBEkM
         tp7VLqZIATSmINGz+EtdDNFbiaEGYc6Y33QZuXJ+F1Ryzb1mtZ1WKwNCTvNBmFra5zWc
         9dSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772866100; x=1773470900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRmLXS/lUmRTfDQsR0+X9BfBWlcLxAvlkJqbJwNWd/w=;
        b=f8m8ujNRPjcNABVMRR5rW0dBsn5BJks8KyxKVJxRG+6u0wpSW1u0S59n5rmbOzFXGC
         p/U70f4VHqrLtuTMUjYHywIP9bzbC9LB2GESgPmo6pkpewbd/kDNFkivjRjW6HI1/Ble
         MdkENifxqfbcgXa4w5DGFH7F3G1O1bbaDnIs9Iq/BlZBA8FcxJJAixXua4a6wp20s0kd
         y8oORSCsfzsZODG5QyipqitCPrRyOiuxk4HdUA/MgvE9l6eBpn6lVzTA7o94bW6ZVR/C
         32PFozKmw22JWUHuAo1RTya4pbkWSdAbE7l/BWXaQ5/2uHpmz6brqpSNNaDfA5DYmSxz
         3Xow==
X-Forwarded-Encrypted: i=1; AJvYcCUqhFGjHorL4SMLteGRldlTnYRpReqhxub1D2TS6U0yAi3PWZvhTw++trqaQZ0+1OYA1xr4K43XgTYOnRB2@vger.kernel.org
X-Gm-Message-State: AOJu0YzUpAzgMGDcLPxs/q8ypCNKrdJotY/DJObZLbTUBCILCrrcaFb3
	F/N7HDBMb+yTyEpsIwO1IAYy02aAQ3rHw+mCYy/Tu0xLtKrOmK8jQKdVNntykq+9i+KDuKxNpUK
	d5LVBmCoasLY8orFFqrfoJOb+1xf+Fvs=
X-Gm-Gg: ATEYQzyKUCHqKPwUc10QmZWa4PrsrbrIidEn8uEk9rztrQsy+qeu4xtYU8pS3+QWmPj
	8Wazlt0maV/l0HDm+VrG0B0tTZI2qa2jlUHhdkLeRkhOKyN92Zvg0E59nX1GvTlImvIlfjUmlA4
	phasYg5Vg3pLbeYtz0cGDx2enK+cich7gBAKNSFv3iURVx8xXDk4Uf1E9gYOZEr+nxS4Wbn/w8N
	RMzM3loZvkTn4IBc0lHFwOdzqCYBEjiPT/u/Ao7TbpNkdZICOGJSdkIKheJhsmQ0qfzHWhoA/iV
	Jx9SwdD+
X-Received: by 2002:a05:6102:c10:b0:5fd:ea47:d317 with SMTP id
 ada2fe7eead31-5ffc8edc536mr3588422137.15.1772866100236; Fri, 06 Mar 2026
 22:48:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306092553.37973-1-mitltlatltl@gmail.com> <n4ytt6euoeh5igk7a4rn4zawpr4psckahc76375ls7a4qqcty5@7bxj7otyuevw>
In-Reply-To: <n4ytt6euoeh5igk7a4rn4zawpr4psckahc76375ls7a4qqcty5@7bxj7otyuevw>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 7 Mar 2026 14:47:59 +0800
X-Gm-Features: AaiRm502i_G8lNln1FvqaR8RKnFFtJwjyfIVaHU8Qf-bf8HfTg4sZ9nSgY3iuS4
Message-ID: <CAH2e8h4-ZF52a7kMU4YJ7fmaRb-H57FXofzcohvC3hoHBd9DJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: setup RC model properly
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C989B22A750
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95935-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.960];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sat, Mar 7, 2026 at 2:44=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Mar 06, 2026 at 05:25:53PM +0800, Pengyu Luo wrote:
> > Using incorrect parameters does not seem to affect the display, but we
> > should use the correct in accordance with the DSC 1.1 or 1.2.
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 31 +++++++++++++++++++++++++++---
> >  1 file changed, 28 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index b60b26ddb0..276c63d2ac 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1843,10 +1843,35 @@ static int dsi_populate_dsc_params(struct msm_d=
si_host *msm_host, struct drm_dsc
> >       drm_dsc_set_const_params(dsc);
> >       drm_dsc_set_rc_buf_thresh(dsc);
> >
> > -     /* DPU supports only pre-SCR panels */
> > -     ret =3D drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
> > +     if (dsc->dsc_version_major !=3D 1) {
> > +             DRM_DEV_ERROR(&msm_host->pdev->dev, "Unsupported DSC vers=
ion: %x.%x\n",
> > +                           dsc->dsc_version_major, dsc->dsc_version_mi=
nor);
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     switch (dsc->dsc_version_minor) {
> > +     case 1:
> > +             /*
> > +              * For DSC1.1. the upstream lacks SCR parameters, the dow=
nstream
> > +              * parameters are unverified here, we support pre-SCR onl=
y.
>
> It doesn't. It's the same as DRM_DSC_1_2_444. Please send a patch adding
> the comment.
>

Indeed, I didn't remember this correctly, and I recheck it now

> > +              */
> > +             ret =3D drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR)=
;
> > +             break;
> > +     case 2:
> > +             if (dsc->native_422)
> > +                     ret =3D drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_=
422);
> > +             else if (dsc->native_420)
> > +                     ret =3D drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_=
420);
> > +             else
>
> It's not that we support 422/420 output... But yes, it's easier to fix
> it now.
>

Yes, this will fallback to 444 unconditionally now , since I noticed
dsc programming takes 422/420 into account, I added it here too.
But calculations don't take them into account, like we use scr_bpc * 3
in dsi_adjust_pclk_for_compression(). Should I remove them and add a
comment?

Best wishes,
Pengyu

> > +                     ret =3D drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_=
444);
> > +             break;
> > +     default:
> > +             ret =3D -EOPNOTSUPP;
> > +     }
> > +
> >       if (ret) {
> > -             DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC R=
C parameters\n");
> > +             DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC R=
C parameters for DSC version: %x.%x\n",
> > +                           dsc->dsc_version_major, dsc->dsc_version_mi=
nor);
> >               return ret;
> >       }
> >
> > --
> > 2.53.0
> >
>
> --
> With best wishes
> Dmitry

