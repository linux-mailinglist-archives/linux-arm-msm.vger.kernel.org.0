Return-Path: <linux-arm-msm+bounces-65545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 828DDB095AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 22:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ECE51C449B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 20:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512A21E0E14;
	Thu, 17 Jul 2025 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZOFJ4bW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9A8224AEF;
	Thu, 17 Jul 2025 20:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752784112; cv=none; b=DxAS1/O6U/p6mES589rZb8lNw6mFeQoFEkR97hhkCi/0JnqAWmA9oz3w6xCbXGPTQwbbXf7dVoVWGH/BDX+RcrtqWdc1Mldxv16hPqJGd82YtZW7IDQURPl0dMTA8R/j4gpErfK2Y+Q0ODy40X05GKcnvjMmjX/OKErQb6t2niI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752784112; c=relaxed/simple;
	bh=AmQvqcOnD0iq2PIWrxPmxKUdfFNwM12oj/nuxjFdL6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6nzsRaq4HcD6VH086YK7mAh47MABVVPL1l4X5Mspvn00nRVZZz21hIzZUhitIX+aQVLvPJCFO8w35AUe6tNLthidcXE2a7y08MoCNFk4mxwnZJ/rWqUObYD+Sjt2uoYDdwciiu1x47J0rZ6Xmca2RYHeXF/PxIGzEtJsQiSfLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZOFJ4bW; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso2451209a12.0;
        Thu, 17 Jul 2025 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752784109; x=1753388909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGydj71aILIamuVYXMAhah/i/gdu8v+ZS/ho+uyn49k=;
        b=jZOFJ4bWikW39uIPE77KceyymL2wdyWTT9pB5B2+QZ5Fw+iBycfPGb29ZlLmoGsLUy
         fDbYzzFcsNTVRsofSYobVFQIVoMJ3xfIQi4IwDmYjYGmH7s6Yh1ihDaaHFw+n3HiXfNV
         TVGqLrKIydAa/61IsTQ7gNS3CgNtLeeznYjoEjwcGFHLbyaja8NRww9WRZqnWV+YBSeR
         Zn/n3gdtru3TtUGWlXnUjKC6wxtdmAeoZtWOVTviPw0r0CgTxMT8GD6pxrq3pfgijwmt
         xIIY+Dr0srvZCG8fU8YLYVh0MnvCJoIYm/cZnhiAcc5Gv8O4zxuwEqsoDUHhVTzukzRd
         ecsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752784109; x=1753388909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGydj71aILIamuVYXMAhah/i/gdu8v+ZS/ho+uyn49k=;
        b=ZmuPAB43DF0mCfaco2N9YwZ22mXVtPgLzgfX7e4VISz3SrV4HppUFI/HP/I3oPvmvM
         rOb2g1tANASiHdXVpCdyOmszxwWILkp9ehkir/BK1I/p27lqiYXMWKYjc6CKniqmwSPm
         IAxv+4fjxCy/liOCtxALHHlSCcaU3j6m230Vwq10L8sLYCpyAXIaIFuPS+jxejPFe9tM
         kcNeWkkhjHKvbInm5BMg9Rs/EoiR//bie4Uk5hW220+e8qJc6ekPKvvLb+ofPebtM4W2
         vL7sDo4gS7bAjxMDmf3NnuXpM8N3BgouVpewEtKHPDood5uZy1tzF9NA3KgXMARvo0aJ
         vaIA==
X-Forwarded-Encrypted: i=1; AJvYcCUHsEUZxIE3izpO/rdxGua85B0IpyfkrZvp5868hh6zj5pzVvlsSiThUNHk4V6utExNndN9eGGVkCkLi8ug@vger.kernel.org, AJvYcCVgugyx/rPCVqIzgfFYXXFwUgdNVracPTvX1GIpn6XIv7X2QhFR7RCwQa4Vy/kDTS8Cw3liFqyMQDce3zbg@vger.kernel.org
X-Gm-Message-State: AOJu0YwooCUeK3qT0CdY46g+AwS3wnfaMt2O/8j1eZQ7lh8lIzfhbesh
	ZSUenoh5Qjfm1AiTJReJsFJDaKzaetiA/jeLMnXIYNiqd3n+EI0ZcUSOOwPzGGNh8GKdxgCwHmS
	peaBccjL2JxlN3vHFiNqIZ5biXbtdbQ==
X-Gm-Gg: ASbGncujtpvSZC+gEzD5EHaUoswkrE1Dr/RWUN4qHPkZ+jcnYNK6CQcGNT+df2S1BO4
	3GCT4X6yLjsOumoENiMoJvcgOJ3Tuzmhse3Y7gU0Q9i4BDu1Wgv+NBfP+tZE73lOReJnCua8QFS
	B/cA+4uSnD64cmq4XolOjNn2XfPPtE0rleO4vtTcC1RSSqA8BWppGuyS+dkHHfJtUimkPJsQd74
	sruy5DWkZ4iAIdgJBD2t5YZqalEKBda3cfYqVE=
X-Google-Smtp-Source: AGHT+IHGXL1UeZWOicM9mQkop2yE0ztjvDn7Io0cLaau/+RxX/PbQ5rxP/KoTTrmql+QnMO3IynXbQNQW4NQTYLDMMI=
X-Received: by 2002:a50:d695:0:b0:60c:6a48:8047 with SMTP id
 4fb4d7f45d1cf-612c7372b54mr112177a12.11.1752784108513; Thu, 17 Jul 2025
 13:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714173554.14223-1-daleyo@gmail.com> <20250714173554.14223-7-daleyo@gmail.com>
 <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
In-Reply-To: <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Thu, 17 Jul 2025 22:27:51 +0200
X-Gm-Features: Ac12FXxK_a1WSy8MtOR75-LLEFBaa3unYMUy-NNcME395brztJd9rIFyyqygTaQ
Message-ID: <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: Xilin Wu <sophon@radxa.com>
Cc: Dale Whinham <daleyo@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2025/7/17 04:21, Xilin Wu <sophon@radxa.com> wrote :
>
> On 2025/7/15 01:35:42, Dale Whinham wrote:
> > From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >
> > The OLED display in the Surface Pro 11 reports a maximum link rate of
> > zero in its DPCD, causing it to fail to probe correctly.
> >
> > The Surface Pro 11's DSDT table contains some XML with an
> > "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
> > (8.1Gbps/HBR3).
> >
> > Add a quirk to conditionally override the max link rate if its value
> > is zero specifically for this model.
> >
> > Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.co=
m>
> > Signed-off-by: Dale Whinham <daleyo@gmail.com>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp=
/dp_panel.c
> > index 4e8ab75c771b..b2e65b987c05 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > @@ -11,6 +11,8 @@
> >   #include <drm/drm_of.h>
> >   #include <drm/drm_print.h>
> >
> > +#include <linux/dmi.h>
> > +
> >   #define DP_MAX_NUM_DP_LANES 4
> >   #define DP_LINK_RATE_HBR2   540000 /* kbytes */
> >
> > @@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_pane=
l *msm_dp_panel)
> >       if (rc)
> >               return rc;
> >
> > +     /*
> > +      * for some reason the ATNA30DW01-1 OLED panel in the Surface Pro=
 11
> > +      * reports a max link rate of 0 in the DPCD. Fix it to match the
> > +      * EDPOverrideDPCDCaps string found in the ACPI DSDT
> > +      */
> > +     if (dpcd[DP_MAX_LINK_RATE] =3D=3D 0 &&
> > +         dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
> > +         dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Edit=
ion")) {
> > +             dpcd[1] =3D DP_LINK_BW_8_1;
> > +     }
> > +
>
> My Galaxy Book4 Edge with the ATNA60CL07-0 panel also reports a max link
> rate of 0. But I think eDP v1.4 panels need a different way to retrieve
> supported links rates, which could be found in the amdgpu [1], i915 [2]
> and nouveau [3] drivers.

Thanks Xilin for the sharing and pointers into 3 other drivers, that
would explain the current limitation for Adreno GPUs. Fixing it would
require a big contribution independent of the actual SP11 enablement.

Is it a feature planned in the short-medium term within the MSM driver?
If not, would a quirk like [4] be acceptable upstream in the meanwhile?

[4] https://github.com/JeromeDeBretagne/linux-surface-pro-11/commit/d265cfb

Thanks a lot,
J=C3=A9r=C3=B4me



> [1]:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c#n2098
> [2]:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/gpu/drm/i915/display/intel_dp.c#n4281
> [3]:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/gpu/drm/nouveau/nouveau_dp.c#n101
>
>
> >       msm_dp_panel->vsc_sdp_supported =3D drm_dp_vsc_sdp_supported(pane=
l->aux, dpcd);
> >       link_info =3D &msm_dp_panel->link_info;
> >       link_info->revision =3D dpcd[DP_DPCD_REV];
>
>
> --
> Best regards,
> Xilin Wu <sophon@radxa.com>

