Return-Path: <linux-arm-msm+bounces-95919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBnmK/c2q2mBbAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 21:20:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F00E227724
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 21:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCBEA300FB4D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 20:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2BC44BCBB;
	Fri,  6 Mar 2026 20:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ag5c6BZ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7CF42F542
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 20:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772828402; cv=pass; b=iAqk76aD318ze6ZSq3kyUxw0PnNVSkR3nhm2fEl9m9vvW/Q2GYL5XjvMuJmrqIkwhlSwV+rscjRt6JFCtVz8ldh9AbjqMUFGLMu0Hblxdi0rlponcdscJsO1uyUG2oTUKdLTw6LmT3FtF0a0b8njvjyM/S2EuqHSkb2wOUv1h0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772828402; c=relaxed/simple;
	bh=mlpoX5490uCm8/n0+ve15WurVBy+cErH8d0orLkUSVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WD9wdxk6N5QEresc04opUWEwOoTzXI2fwkcziG6x7rMi2nkEkER9uoqgioPC/nzckOloPjuPyNi/lYedPF72TsH6BGptEOvLSLvHnnVCfmfKsy6TRV/gTMmdeBr8fHydCq4Kb3DI3e6soSIDqi79EfXkY9xFGWOUKzTDhd503UU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ag5c6BZ6; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a12f88d839so2913514e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 12:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772828399; cv=none;
        d=google.com; s=arc-20240605;
        b=aM+gIM2t0UonCXvtXBy6XNzzGWMPAgEa7txvHaJf6j26jhUL3BdFA4KUpgkXT9/A42
         MIDVSCd6LxkpLQMC3n+loN18lRp5rqtcq5xs2N/+no6vWOwgsIhYOneQhByNjZU6XvCx
         xjteBPnGrtgxaM3KaQMU8L2gFaD2PXuDf4odW9XaQD/mcM1zwB610OKPVDVjDnyGmJ+6
         0iwdY0q8uDZOW2gAWDt/59zpSeno42iMBfkwDND5hB4orrYZ1auHX33AxKCcIN8jEwrh
         PwU5au0tJjUViE1QPultsfCbRGVqqoSgCeaItlR6fByL0NxvZ784OULj8/NJGiO+j2Re
         Ln3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=02UtVONLR/Mnt9XIWD7vInj0gAX1V2YD39D2ZYc0z54=;
        fh=bcZ301NVe+Mo/InDLbeIy9nXr/wwbuRJV3CsDOgNzn4=;
        b=RRyO4LTTWOjVdDcz8gVwIkOfsAiWfZLYGNnRxzYs8q9yIyevHilZd0QJT7nJaw1oAd
         IfRUnrumKGzQN2uHzJCh6OU3n2xVZ3Nk3a8ZVahwi8bwQ2zaU/k3EiDOywIzlRZaZiXc
         rh8m8nL1C23VCsimBu7XJ0LVGnmA4lfi0SY/aKofsrThDWjmNFOj8JQnwMREio4DF4Xl
         1nwxXC8ed63jxPOdxvaMykO4Tn3abHI/V6Y8LEIZd8xXwa/CUZSSMKO9D8ePBZ5La4ky
         /1fnVYqGXe1FVRndWXrVkIiynIXQgHrrPj8TtGVoF+IT3qU+j3Ao/AEqvL5Rax6OuJnj
         cwlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772828399; x=1773433199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02UtVONLR/Mnt9XIWD7vInj0gAX1V2YD39D2ZYc0z54=;
        b=ag5c6BZ6t2X6nnrGoZSo7tzX29dml4lSSxJBVUtsVyZnK5K0ymr/Gbza98CB2oSi3K
         nnkmjrWPA8qO7MYjtA1g/fK4Qo8hZOq0ljNr0QGNfh8VKoU11cGWbDlOLKO0p6ijGcq3
         +bjFZ8GwBvoeZ4SN5cgXyyNVakrWeQfreRXk7HOUWJ5jlltyANs5wavopqsaasVLJGDE
         9b2nchwOBjlaamhRZoDqSPHO2oGZ2iOcNadJHUlWrMarsCHYQGR9TDOrwgB0C9rv5F52
         Z40fyQLZnXfWEQble9UbqTiG29Flw6P4db46LtrIEy2Qc3S9swvuyofWn0994ZHt/85I
         NeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772828399; x=1773433199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=02UtVONLR/Mnt9XIWD7vInj0gAX1V2YD39D2ZYc0z54=;
        b=uuqjD8QVIUBAMgmeZQo+euM0IparCYxsAa1MsjxhPndBeuYPYm1NqV4Ugy5/SMUKFB
         H6sSYvEF7AEKfxJxmnPWr6YAHzDmcgOIQpA4mYuKCL0FrpQsgvHD+kV9klJu3k6rBY6D
         iXWJTeOIymNlVaUbji9o3DQjEgXAGpA19+yHL/jIRw6Sfh9lQza1Xt+GKLrRZRFcWi8r
         WSFzNG0e5S92WtSLbnmFXdhzUkJHRX6DtWMSRmumo10hAqBV+6fY8cRO3s88eiXoNADx
         Rv7sM7/pnSrN7j/Vg/HM/e3YghYoUZ0bMExZWzLI4dX19PJtxBQ0OKwN/Cnn0UHcotjT
         jgXw==
X-Forwarded-Encrypted: i=1; AJvYcCV7GPA4In+B6MrFc0QYP3TvLSq7ugqHGTVj56z+wIWBeygTNPfMj6mvWXZ5Mv6y8uNCJgera9W7TwtYtSUh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ykXMNiziUPJ3V+5qrD+DYyWQX+xv/KtcMRpBEnAg+Tv2X+Ne
	EMmENAdjRE/w9F7ARgE2kE4SiMOvHJ3pBlPBBUQuiJFyVBiNVYYom+CLxTXz7ik6TD/ksIQ7wpu
	vQ7XgF4V7uCinORd7wjxj3fs/3J3CPDQ=
X-Gm-Gg: ATEYQzwV3JM9AXRhfve/kdAFkQhhDn9HTiNAa+BdaKEWqIUxYFCQY+KqAHxLCiudDdg
	bvJSg+vpZQ4K7rWFSbPwiq8qaEUVwxM0ttbSR+8EDD4vyUNrXD8CUYT9a+mQW+xP1IjM0DLUAuE
	oMXJ8BcTbg6phUX1OU/3/y56UuYFHnWJaYJkzUv4V4N5G+qam/Na7XSpD1R3AOm7b1y4bt9eO41
	f/YJ39VEQikNw2CMklSWk50o03ejcefgKakkeL0D9ELPePHLHRVG+Z47zlaIv66BRT13VL9ht2G
	iFBUm0nx
X-Received: by 2002:a05:6512:39ce:b0:5a1:2738:faa1 with SMTP id
 2adb3069b0e04-5a13ccaff75mr1211409e87.17.1772828399265; Fri, 06 Mar 2026
 12:19:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306092518.37849-1-mitltlatltl@gmail.com> <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
In-Reply-To: <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
From: =?UTF-8?B?0JXQstCz0LXQvdC40Lkg0JvQtdC/0YjQuNC5?= <fekz115@gmail.com>
Date: Fri, 6 Mar 2026 23:19:48 +0300
X-Gm-Features: AaiRm50OyrjTonmpW7cWhh3JWqXbBdsWbzC6qs6eblkKyDIRpVR1vHGgUauyhIs
Message-ID: <CAAjZPThsEGKFY_z+w9p+c1_L4CZOhkba=hz2kmAyVoMUiXMVPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: remove bpc > 8 entries from allow list
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, Danila Tikhonov <danila@jiaxyga.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2F00E227724
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95919-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,jiaxyga.com,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.953];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fekz115@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi,

I have a concern regarding this patch. The Nothing Phone (1)
(sm7325-nothing-spacewar), which is already supported in mainline,
utilizes a panel with bpc=3D10 and bpp=3D8 (DSC) [1].

Currently, this configuration works properly. While I have encountered
minor graphical artifacts during brightness changes, the display
output is otherwise reliable across all supported refresh rates
(60/90/120 Hz).

Since this panel is already upstreamed, this patch might cause regressions.

[1] https://github.com/NothingOSS/android_kernel_devicetree_nothing_sm7325/=
blob/6f027f0440e3dce8a674d9cbd2f6ad944120e209/msm-extra/display-devicetree/=
display/dsi-panel-rm692e5-visionox-fhd-plus-120hz-cmd.dtsi#L483-L484

Best regards,
Eugene Lepshy

=D0=BF=D1=82, 6 =D0=BC=D0=B0=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 21:47, Dmit=
ry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com>:
>
> On Fri, Mar 06, 2026 at 05:25:00PM +0800, Pengyu Luo wrote:
> > In upstream the msm, for bpc greater than 8 are not supported yet,
> > although the hardware block supports this. Remove them until we
> > support them.
> >
> > Fixes: b0e71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits p=
er component")
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>
> I hope Marijn, Danila or Eugeny can comment. The patch series with this
> patchset added 10 bpc panel and used it for one of the phones.
>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index e8e83ee61e..b60b26ddb0 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1824,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_ds=
i_host *msm_host, struct drm_dsc
> >
> >       switch (dsc->bits_per_component) {
> >       case 8:
> > -     case 10:
> > -     case 12:
> >               /*
> > -              * Only 8, 10, and 12 bpc are supported for DSC 1.1 block=
.
> > -              * If additional bpc values need to be supported, update
> > -              * this quard with the appropriate DSC version verificati=
on.
> > +              * In the upstream msm, only 8 bpc is supported for DSC 1=
.1/1.2
> > +              * block.
> >                */
> >               break;
> >       default:
> > --
> > 2.53.0
> >
>
> --
> With best wishes
> Dmitry

