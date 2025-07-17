Return-Path: <linux-arm-msm+bounces-65556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 419B6B09665
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 23:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 183AC4E0205
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 21:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C6122AE7A;
	Thu, 17 Jul 2025 21:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="endpx1zJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F58013B58A;
	Thu, 17 Jul 2025 21:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752788238; cv=none; b=Tz7nNlcfER/k7mqPOHN1xHMAJXcC13XkebbefTylUNfb0wiagup2ilPdHp6cqpCXr8m5lrgRowRPOs02ApzZXb6W6ATWlILrrbnbMOkRHZS1gZZgTnrvYj8dFSMm2t1V+T9ZPy4ix9nQgmgGjva/ZTu1bVj4KaGZccAn7Q27zRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752788238; c=relaxed/simple;
	bh=Vt0eyJA3FmaRCjFqmL01QcwdudmtM4ZMzbFSb8wQFDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ki9kWd5atvHOaZtXbAPTSraLV7nhDDVWUo6zSaOcx2pxC/+NGwSLuhubs+a20H4s5Ut+4KuV8CqyzyrtnigpfUKzsIHinXLJxhgJnnz+m55cqeISAY9PXvgPldWNusN9PgXuZ8HQ19WHNCuxy2+Adze9hEdhHT434MQnQXPWMJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=endpx1zJ; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so2357135a12.3;
        Thu, 17 Jul 2025 14:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752788235; x=1753393035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrtASW4nJI5s0TcFU7BZl03KBcG7L4TmJyfK+6pQD+I=;
        b=endpx1zJrg1PxosKB/VE4fg7lX70Hb+MKoIpg4alOZ6/jQ852FXKhrEwa9pQNvhVcA
         mS0df1XQ37WvQUHVqtDbw9osNLEPWv/mP2EJZwaQPINCnMOS1K5wI+ur1qBfO4Ug6f6l
         wc07RJd0vlqO409FqWyPC5ilw5Ty7HfNrY1EMJ0TxtanVezPJmX92b9QmpQ/F46HFuot
         Bjr/W9LA8aV5Jg0Oj5W5t6u3RJZKAcUopIJPydndTV/gzQBb9uHesKp1fPGfQk3xVFOf
         v8vOrGdxNpygnGtnki6AjopZ/Cpl4lrF0PuBeQLmq9nqB8+KhDJM3MX5fG84XvIX4ptH
         jsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752788235; x=1753393035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrtASW4nJI5s0TcFU7BZl03KBcG7L4TmJyfK+6pQD+I=;
        b=QF4K+An/OeD1NDsO2R1Yku2d8rFbREJQ3KQbwNxHggSa7MPDppHAT+fVnJlgmIB88b
         fLbwExCveHJZZC3KerIVvcSWqVhUduxjMPpQuyYmzfzIK4a4HxSQtc0+uCDSitblqn4m
         4GclscPlHsZ9piX21j2ZQ1GewX7kCTm0CfxXb7TmVE8LdnNgD7oeKDgrjF9P80BWHmDn
         nXqyfAUxTU6w5Tr7PiHj6wdQoBGTqdH49m7wQYpjLhABj30KRGm66VfkFTTgCJBL+kvJ
         ZViJjPXA7wNNwKMbYlwYOYTE/y+X6aH5KB4WO9fIkhezbSYrXDqGllBpcgJ7lg5L2ve2
         SEnA==
X-Forwarded-Encrypted: i=1; AJvYcCX054ZbGsR+82+Ruyu+Y5Wd3JDFNJPYV7zciKnRLiqiEmq7Uga+C0vYV2lAeZraQVMX543CJZ+6gbAlG2ob@vger.kernel.org, AJvYcCXPx/5sqmUMMrOpOHvAfsc+vsOkagj4mnADcL5SQbrQBTjDa/Gy0Mz1Oz3JMs1txQyrDsRcZAX5LsW2WEk4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3aLA1o94j7f1h6WGND2BcpLNagQfzUFtxAEw0LHz1Yc6ZQyoJ
	TXOT14RUOY/0EKK/YiK5sSbvNxhWKVRWpnSpz6j73P0wKeZszBWg/7Eq4rd2R/gzBJRpV8K2FdP
	G4S6aD4g7Q31zprJYbkEhENCnZG2ltw==
X-Gm-Gg: ASbGncsqVJlnXeDaz/nssDnnTt20pBhkZiA3BWre4K1jDSrI/GFDIoXQXZcFQ3Hn6qf
	I9Y88yHe/cug+OkIembw8p4SqXUaaKmgKFXNVvQJCwVkxKH/IbZYyVTNWHQwU93ssQZTWS20k7R
	yhxQn9XQ5NiRf08s3LoARaRKvJ+FLAeBLZ5JrVRX9NB7pfdnEXYDLv604318fxDwfYoel1vH/QS
	XsbBKaqv5HA8uBOUmICBjraMfVyQ2WxeAzTX94=
X-Google-Smtp-Source: AGHT+IFVlRN4WGIlFsUPwjfESSFGLiHpyki75MoVraFsVt7ReruuctGVWu4zLsO1ep8kuBhcM77A+tPIk089SPdJwm0=
X-Received: by 2002:a05:6402:2685:b0:611:d497:e8a8 with SMTP id
 4fb4d7f45d1cf-612823da4c1mr8091202a12.27.1752788234592; Thu, 17 Jul 2025
 14:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714173554.14223-1-daleyo@gmail.com> <20250714173554.14223-7-daleyo@gmail.com>
 <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
 <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com> <eb0f5be5-3a6f-4969-affd-c01a6216ad0c@oss.qualcomm.com>
In-Reply-To: <eb0f5be5-3a6f-4969-affd-c01a6216ad0c@oss.qualcomm.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Thu, 17 Jul 2025 23:36:38 +0200
X-Gm-Features: Ac12FXyoN-ygLAdINlTQHq9O6GwthS9JPnfwymokk-OCpRjxgsVHQiOVjtDhOY4
Message-ID: <CA+kEDGE1kb12pW_OH1n4LmB9PVtgEsft563p9Cx_Mxev9Em3Ow@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Xilin Wu <sophon@radxa.com>, Dale Whinham <daleyo@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 17 juil. 2025 =C3=A0 23:10, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> a =C3=A9crit :
>
> On 7/17/25 10:27 PM, J=C3=A9r=C3=B4me de Bretagne wrote:
> > On 2025/7/17 04:21, Xilin Wu <sophon@radxa.com> wrote :
> >>
> >> On 2025/7/15 01:35:42, Dale Whinham wrote:
> >>> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >>>
> >>> The OLED display in the Surface Pro 11 reports a maximum link rate of
> >>> zero in its DPCD, causing it to fail to probe correctly.
> >>>
> >>> The Surface Pro 11's DSDT table contains some XML with an
> >>> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
> >>> (8.1Gbps/HBR3).
> >>>
> >>> Add a quirk to conditionally override the max link rate if its value
> >>> is zero specifically for this model.
> >>>
> >>> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.=
com>
> >>> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> >>> ---
> >>>   drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
> >>>   1 file changed, 13 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/=
dp/dp_panel.c
> >>> index 4e8ab75c771b..b2e65b987c05 100644
> >>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> >>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> >>> @@ -11,6 +11,8 @@
> >>>   #include <drm/drm_of.h>
> >>>   #include <drm/drm_print.h>
> >>>
> >>> +#include <linux/dmi.h>
> >>> +
> >>>   #define DP_MAX_NUM_DP_LANES 4
> >>>   #define DP_LINK_RATE_HBR2   540000 /* kbytes */
> >>>
> >>> @@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_pa=
nel *msm_dp_panel)
> >>>       if (rc)
> >>>               return rc;
> >>>
> >>> +     /*
> >>> +      * for some reason the ATNA30DW01-1 OLED panel in the Surface P=
ro 11
> >>> +      * reports a max link rate of 0 in the DPCD. Fix it to match th=
e
> >>> +      * EDPOverrideDPCDCaps string found in the ACPI DSDT
> >>> +      */
> >>> +     if (dpcd[DP_MAX_LINK_RATE] =3D=3D 0 &&
> >>> +         dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
> >>> +         dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Ed=
ition")) {
> >>> +             dpcd[1] =3D DP_LINK_BW_8_1;
> >>> +     }
> >>> +
> >>
> >> My Galaxy Book4 Edge with the ATNA60CL07-0 panel also reports a max li=
nk
> >> rate of 0. But I think eDP v1.4 panels need a different way to retriev=
e
> >> supported links rates, which could be found in the amdgpu [1], i915 [2=
]
> >> and nouveau [3] drivers.
> >
> > Thanks Xilin for the sharing and pointers into 3 other drivers, that
> > would explain the current limitation for Adreno GPUs. Fixing it would
> > require a big contribution independent of the actual SP11 enablement.
>
> FWIW Adreno is a wholly separate (from DPU - the display engine) block

Thanks Konrad, indeed I should have referred to the display engine.

> >
> > Is it a feature planned in the short-medium term within the MSM driver?
> > If not, would a quirk like [4] be acceptable upstream in the meanwhile?
>
> I'm not a display guy, but this looks like yet another block of code
> begging to be commonized across DP drivers,

I agree 100% in principle, but the 3 implementations are different today.

> so I wouldn't expect it to be a big blocker.

Well, it is for me :)

> Adding a panel quirk doesn't seem in order, as the panel is /probably/
> very much in spec, and it's the driver bit that's missing.

I agree that a quirk shouldn't be needed. I guess we'll work on
upstreaming everything else and keep an out-of-tree patch for this
issue for the moment That's a bit sad as this will block regular
users from easily installing / testing via the Ubuntu Concept ISO
for instance.

Or could the quirk be accepted temporarily with good comments
then reverted when the driver adds the missing support? I guess
it would depend on the time scale of this support landing.

Cheers,
J=C3=A9r=C3=B4me

> Konrad
>
> >
> > [4] https://github.com/JeromeDeBretagne/linux-surface-pro-11/commit/d26=
5cfb
> >
> > Thanks a lot,
> > J=C3=A9r=C3=B4me
> >
> >
> >
> >> [1]:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tr=
ee/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c#n2098
> >> [2]:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tr=
ee/drivers/gpu/drm/i915/display/intel_dp.c#n4281
> >> [3]:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tr=
ee/drivers/gpu/drm/nouveau/nouveau_dp.c#n101
> >>
> >>
> >>>       msm_dp_panel->vsc_sdp_supported =3D drm_dp_vsc_sdp_supported(pa=
nel->aux, dpcd);
> >>>       link_info =3D &msm_dp_panel->link_info;
> >>>       link_info->revision =3D dpcd[DP_DPCD_REV];
> >>
> >>
> >> --
> >> Best regards,
> >> Xilin Wu <sophon@radxa.com>
> >

