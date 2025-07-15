Return-Path: <linux-arm-msm+bounces-65106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4F4B0696D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 00:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 038565647B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 22:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1203829B8E4;
	Tue, 15 Jul 2025 22:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOQjYLOG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A73617BA1;
	Tue, 15 Jul 2025 22:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620015; cv=none; b=KqSE7Ju87qvD+c8vSw8OlRrdaQNL2trC+FoSj0Q0mquEH/DLHrg/GFbDfWWB8tyS5lYVijEEx+VScx11kCC6+QUFxsJnZGM8PrjF8d/ufD0os1wYpubO5kRhZLI9jk1FEiOkFfLiSPrzy7VxMW2mtFXeH53emWZwRzL/iiKVG3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620015; c=relaxed/simple;
	bh=ljxJ+SFkW6aY6aiTZ31psEPivA3qn39ohK3y5x1r46E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UF+5227EPajfwGdz5CDPGnR5sirRCe5FmdsIAYRMc3lsdIQ47qoUPGoh6JwLMQMBmFB9WBZKBGVH97g4mQeXNgXsSjS50LRUnsA9tIxfxTF0KvuHR6/NLFbLjBvh493PQXirW4jbsZXeqsh1A/doyddOByFMKM94CBnrFq0RJxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOQjYLOG; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so718115a12.1;
        Tue, 15 Jul 2025 15:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752620011; x=1753224811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XsV7dB0/dBV/4w5KD5MsUTgHRRbA9nMltbkQvDt2jw=;
        b=dOQjYLOGtXgOIaYI6lUiyRWN+aMnbvoJVg8c4PA8GS/Ux61E99vhiBY0opvdK1Gbu1
         oV9DB9ELJwD5QMagu4UPoV3VV8jB9Oz/VIL/mT/HMT0VJ4kMgyn3N60WoBCZgnTTnYN2
         zJkdDoylFuE2c4CWmhu53gip+mXTNemew7PXCLIABs5EXn0aWNEqKEtk9XbwYAKusYxg
         KSyRa8vgb3MwatV/Z3LsRZdqY+vC/DRzfKHT8/07vcNCyc1Na465AMlO+8lUkhgi03ki
         yEbrDvSXb+7j5j/cnOyR/45qE6GGH6TRN+1mMIzhNIyK7urBaKvAieaXAaEjn/86Ea1S
         0Btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620011; x=1753224811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XsV7dB0/dBV/4w5KD5MsUTgHRRbA9nMltbkQvDt2jw=;
        b=PP7szchDLEjOU0k1URWBw6KNTVq8+G+mlgivtCnVJrvbW0Vy+QBg7t0AIHwxMUEWaH
         lE3NmfVVbQhCGuNOwtqzFzsv4x9AEHeqFTbRhQ98Sg1CCeWkrFcqsBLVCgk0imWL1lmI
         CGBKc5W9q+HNfsspV9+DfX/0b1+3PBWY04TFttHq5lG8DzV89gRuy3KpDzb9TLqlP1eZ
         Ry1JSqpbPJxlL8L+P92EOwL8DcAopI6qDjbBNKkwSaS4k0ubuJ73aCPqDy7T02Z5AJ7q
         hFEL711PeliXfLQ6Y/pnH01vRWa6RM+SpB1hI49184yPnvsSk2wdQ3YW655/1RL+otIx
         bC9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxmZohUdm4PEuOhZd1ElGa5FgqoCy39SM1OAqzzwameGEvK1KCnuZJ38F2/UpiY1f/ox7zCGxigDbzMStC@vger.kernel.org, AJvYcCWHp4ku2ZQbLVHk2FUW3Okeo4x5eqCvGxC4T9th6TPag7k8F/T/e/xxoGJRf9MRSbi7wWviw6QF7WSKQD+A@vger.kernel.org
X-Gm-Message-State: AOJu0YyJvRci2F6oocRX0rN6VL9PCy+gYsEUce2d/sqLx1xm88oFFhXh
	em+43b3ZN4LqQ3OSjhlHwoy6E1gVUo4dksx2yE/btFNrFJ1+B1TPs0zS39/NoWhMdlFuTcHuDMh
	sAMkSORLz/GnCqHnS0cK0Yf6k0Hc2HA==
X-Gm-Gg: ASbGncuKELAZbTelZm8ukxE6dywDy6q/5ZGiQ8PR49zMoQ/nPECCyPjurC5FkyFcmTP
	zmTUtyBNrZwBHhLI9fGyZx7UJ5a1txfqmL5kt87H5kl9gqy/bwGnu8ypiALM0VCi9LIPWlJlBbm
	93GEhYynWd9d9GF95h2xCaXVd/7Bcmps2a/1V2Rw14qKLg+kUiSMoju50z2o1DiGBoh2107OSi9
	lVF60arNwdl0ZnWVQLCQVHO7DwJIxJG7uM351Y=
X-Google-Smtp-Source: AGHT+IHJ0UrphscN3ZQ6MjbsfF09sNSf+YfHJeVDahoSygCKdgSFJpnKOrntHpiY1NQ/G9FOEePT6PqTIu3mZzcGNhU=
X-Received: by 2002:a05:6402:3787:b0:607:35d:9fb4 with SMTP id
 4fb4d7f45d1cf-61282c93cb7mr699146a12.15.1752620011188; Tue, 15 Jul 2025
 15:53:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714173554.14223-1-daleyo@gmail.com> <20250714173554.14223-7-daleyo@gmail.com>
 <CACSVV00-DDnQYp-65Pi-XwpEKT1_jYik2=zH_bK_oJiGLxX48A@mail.gmail.com>
In-Reply-To: <CACSVV00-DDnQYp-65Pi-XwpEKT1_jYik2=zH_bK_oJiGLxX48A@mail.gmail.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Wed, 16 Jul 2025 00:52:54 +0200
X-Gm-Features: Ac12FXwFj68pn6YB4znyT4ywvUmV_BN2k_YiCalM6sBLs5LcPLsqZL0a65VkVi8
Message-ID: <CA+kEDGF96VbjGPBW0hWSji2eQtQU-bXjsZAaZjjUo0cvpwhBQg@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: rob.clark@oss.qualcomm.com
Cc: Dale Whinham <daleyo@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 21:51, Rob Clark <rob.clark@oss.qualcomm.com> wrote=
:
>
> On Mon, Jul 14, 2025 at 10:36=E2=80=AFAM Dale Whinham <daleyo@gmail.com> =
wrote:
> >
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
> >  drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp=
/dp_panel.c
> > index 4e8ab75c771b..b2e65b987c05 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > @@ -11,6 +11,8 @@
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_print.h>
> >
> > +#include <linux/dmi.h>
> > +
> >  #define DP_MAX_NUM_DP_LANES    4
> >  #define DP_LINK_RATE_HBR2      540000 /* kbytes */
> >
> > @@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_pane=
l *msm_dp_panel)
> >         if (rc)
> >                 return rc;
> >
> > +       /*
> > +        * for some reason the ATNA30DW01-1 OLED panel in the Surface P=
ro 11
> > +        * reports a max link rate of 0 in the DPCD. Fix it to match th=
e
> > +        * EDPOverrideDPCDCaps string found in the ACPI DSDT
> > +        */
> > +       if (dpcd[DP_MAX_LINK_RATE] =3D=3D 0 &&
> > +           dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
> > +           dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Ed=
ition")) {
> > +               dpcd[1] =3D DP_LINK_BW_8_1;
> > +       }
>
> Not a dp expert myself, but..
>
> In drm_dp_helpers.c there is dpcd_quirk_list[].. which applies quirks
> based on the oui ("Organizational Unique ID") of the dp sink.  I think
> this would be the correct way to handle this.  Although I guess you'll
> need to add a new quirk for this.
>
> Idk if the surface pro 11 has multiple different panel options.  If so
> you defn wouldn't want to match on the DMI.
>
> BR,
> -R

Thanks Rob for the feedback, I have a working implementation
based on your suggestion with a new quirk, we will switch to it in V2.

Best,
J=C3=A9r=C3=B4me

> > +
> >         msm_dp_panel->vsc_sdp_supported =3D drm_dp_vsc_sdp_supported(pa=
nel->aux, dpcd);
> >         link_info =3D &msm_dp_panel->link_info;
> >         link_info->revision =3D dpcd[DP_DPCD_REV];
> > --
> > 2.50.1
> >

