Return-Path: <linux-arm-msm+bounces-65710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF15BB0AA1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 20:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB97C7B307B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 18:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFD52E6D2E;
	Fri, 18 Jul 2025 18:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCWUh5St"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3639B2DECAA;
	Fri, 18 Jul 2025 18:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752863199; cv=none; b=fhFn6NkKF9e5XF0gTpNCPFSgIjEE2bnq3XmKpDPqKQk3X7wv+4mpF90o7xWHi3z6723Qncf+218Z9NRhBjdTFJPpTxS0MgpTzpI1gIgZznrjY4YI+Q8NiCXjqc/gv5xsSL1i/DSbfN/nmIOlPV1CYIaIVTGxHhqhtZDgMM9XKz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752863199; c=relaxed/simple;
	bh=dgRbxkQ0coHr2iFITUehDhnrldRwgaTTUMWtfVL/amc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jc3cmPT8pznAT3zKeYV1i659cyHY5bUA5jlBWBSHdOZxJdNNYQ5HjoOQ2lUzNIKAmmbpyroPXgxVFiJdJpfCCRib0aw6uF9A55fNn3nBbCjmSUn/11iBNRJeOnfDmHVUbCOulbhmht/eYsFUyotijNtQ2eKIX/SUP2SZyrCHgv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCWUh5St; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so3963738a12.2;
        Fri, 18 Jul 2025 11:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752863196; x=1753467996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdHUOW5vj3zq8m63yOQTUFaQxpwM82ALHsQENfQNICI=;
        b=HCWUh5StimmLKbXF7GLCPnVpHb+yuLo+Oumf27aXrY9Tc6s2qLax3dluhVAym9MTpk
         Mw0rW3rcJZ4+lr4JRQfmpquxvlOlsY4ts/oP8e2SFOV3KJMxYaP4cJ0O4FTwNIj7w/SN
         77u0HcVj/nZEnSBllIuMzBnF4x/5ElTM0NGNALtG30E4TQgLDl13hxJRWv3Tz4bfaVzE
         4f97yBxvc5IhnWfRp9mRwOJZTECCPWUc85KjBK0KZsgekCJyLmCWw/Yvj0H75zKkn2Cz
         1gTDYZk0Uku+PGO93CCWToelrg2OFKv4MhAqUzlE0HLLdYJ+CuSgtPXGfI5VD1x96RJC
         h2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752863196; x=1753467996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdHUOW5vj3zq8m63yOQTUFaQxpwM82ALHsQENfQNICI=;
        b=Bgoh4Vhuddgh78D1miAWiyP1+Fx3uLcKL0JxxdBSGFdxrx66fk4dFqIFTV8olpYpvu
         umsyTjvngkh9AwYYjWlEoxOsBsqvDYOGZZLyqm0jHPKOec5Qbkfen04f+G45WO7mS2K9
         GKE4eQ57nPMKGpNM9j6cH+HIFYFbPbcm9H+HU16haPkiKpVI0i6Nsa0YUllar2fQKVr4
         bt13lTyooJz+4nR9mK5X+JQppl1m4gMgKlCVgfTjurblrWO4udx9WIvJQ5XLD/WcpjmM
         oVaHHlZ8m0BfblRWo42hSPTMpst9JJadntIbOLmvFNPAUgzlA0ftMZkJM2M/HVMSZGj6
         fFXA==
X-Forwarded-Encrypted: i=1; AJvYcCVIGn47UZPqmu9rMjqTN7DL7NfMS4RQQNDjKO+dxC4xh+w4ARKNXWY5cPR4LoB+pa1QIjnTXYJiAKXFF8ML@vger.kernel.org, AJvYcCXHIho8Sp8fRUtpjfqYhSMQvCNg/e1vpMnU4Bc/PFSJ2sPyHAGCYztGcKvjN/iYWUmJDgiPeXG1B/DphpEf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1AW3uwfhHuCMGcR52osQG+YdROGOmZfVB8QZBO1xoCBwxJB7z
	17zscRD0k+ogj7EQcsiPsRKk8vfgLK5rTRKC18slND40Fz9LuvKt2Is9xTqCy1qI9bnYtIfhBWG
	b5xhI1MxUgLh+zacR7MTQ449jfaJQPQ==
X-Gm-Gg: ASbGncuxb6m1phgVlhdM3u/FJ0kKHgdlOdg24jfdRiKW4MGE8uGdjVTPXuJLgKs8AKS
	hJKYSsA/bOBzqbSJwT6xgYFt0eAU+i6t/5wB2xxJkK188oUEN6XD87EPy1zzbhiSBpUQ3euRKc3
	oRexm8smqfpCVcK4TTjN1T6+4bxs3kExFBhSRHyCUdil5fGh9qpJx2L4CXSED+dijWTM8rYjmfY
	foT25Negg5ts6rblf/1TY8PQf7Nhevv3WWcRU+6PFtzimxYhA==
X-Google-Smtp-Source: AGHT+IHC3HLRJsvkFkVqSZ46AEBeJChjVPKxTA/BcSmvLs7WHhxz2lrBATceKFfQkZ14s/5J0Opa/ATwK9R+q41RVsY=
X-Received: by 2002:a05:6402:13c8:b0:612:b67f:d511 with SMTP id
 4fb4d7f45d1cf-612b67fd68amr5613405a12.0.1752863196347; Fri, 18 Jul 2025
 11:26:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714173554.14223-1-daleyo@gmail.com> <20250714173554.14223-7-daleyo@gmail.com>
 <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
 <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
 <eb0f5be5-3a6f-4969-affd-c01a6216ad0c@oss.qualcomm.com> <CA+kEDGE1kb12pW_OH1n4LmB9PVtgEsft563p9Cx_Mxev9Em3Ow@mail.gmail.com>
 <jsynzhzzt4drqcrvbuprjnvu33go4gow3l3hxgafuczdn67uhm@2eq7c5rzflr5>
In-Reply-To: <jsynzhzzt4drqcrvbuprjnvu33go4gow3l3hxgafuczdn67uhm@2eq7c5rzflr5>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Fri, 18 Jul 2025 20:26:03 +0200
X-Gm-Features: Ac12FXw0jZDgjQifi0YDj_QD-wc9Vi5La0gySlLng6GYLLcXHYW4aWUZXrUKCds
Message-ID: <CA+kEDGGVimBZDq1sa0gOXB7Vi6U8AVgD2E8mG_iTUJDce=56PA@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>, 
	Dale Whinham <daleyo@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Friday, Jul 18, 2025, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Jul 17, 2025 at 11:36:38PM +0200, J=C3=A9r=C3=B4me de Bretagne wr=
ote:
> > Le jeu. 17 juil. 2025 =C3=A0 23:10, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> a =C3=A9crit :
> > >
> > > On 7/17/25 10:27 PM, J=C3=A9r=C3=B4me de Bretagne wrote:
> > > > On 2025/7/17 04:21, Xilin Wu <sophon@radxa.com> wrote :
> > > >>
> > > >> On 2025/7/15 01:35:42, Dale Whinham wrote:
> > > >>> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> > > >>>
> > > >>> The OLED display in the Surface Pro 11 reports a maximum link rat=
e of
> > > >>> zero in its DPCD, causing it to fail to probe correctly.
> > > >>>
> > > >>> The Surface Pro 11's DSDT table contains some XML with an
> > > >>> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1=
E
> > > >>> (8.1Gbps/HBR3).
> > > >>>
> > > >>> Add a quirk to conditionally override the max link rate if its va=
lue
> > > >>> is zero specifically for this model.
> > > >>>
> > > >>> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gm=
ail.com>
> > > >>> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> > > >>> ---
> > > >>>   drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
> > > >>>   1 file changed, 13 insertions(+)
> > > >>>
>
> [...]
>
> >
> > > >
> > > > Is it a feature planned in the short-medium term within the MSM dri=
ver?
> > > > If not, would a quirk like [4] be acceptable upstream in the meanwh=
ile?
> > >
> > > I'm not a display guy, but this looks like yet another block of code
> > > begging to be commonized across DP drivers,
> >
> > I agree 100% in principle, but the 3 implementations are different toda=
y.
> >
> > > so I wouldn't expect it to be a big blocker.
> >
> > Well, it is for me :)
> >
> > > Adding a panel quirk doesn't seem in order, as the panel is /probably=
/
> > > very much in spec, and it's the driver bit that's missing.
> >
> > I agree that a quirk shouldn't be needed. I guess we'll work on
> > upstreaming everything else and keep an out-of-tree patch for this
> > issue for the moment That's a bit sad as this will block regular
> > users from easily installing / testing via the Ubuntu Concept ISO
> > for instance.
> >
> > Or could the quirk be accepted temporarily with good comments
> > then reverted when the driver adds the missing support? I guess
> > it would depend on the time scale of this support landing.
>
> Unforutunately, there is more than that. We should also be writing the
> LINK_RATE_SET register. So, just setting the max_bw is not enough.

Maybe I've misunderstood. When you say max_bw is not enough,
are you talking about some future driver changes or about a potential
shorter-term fix?

I can confirm that this initial simple patch (and also the updated one
reusing the quirk list [4]) is enough to get the SP11 OLED display
working whereas it doesn't probe and remains off without such a fix.

Thanks,
J=C3=A9r=C3=B4me

[4] https://github.com/JeromeDeBretagne/linux-surface-pro-11/commit/d265cfb
> --
> With best wishes
> Dmitry

