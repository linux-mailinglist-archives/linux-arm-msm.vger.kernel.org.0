Return-Path: <linux-arm-msm+bounces-585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A21F7EA067
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 16:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07DBE1F21957
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 15:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD5E219E1;
	Mon, 13 Nov 2023 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5DZGgGwY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF7D219EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 15:44:51 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B70210E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 07:44:49 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso698005766b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 07:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1699890288; x=1700495088; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgDXufcGApdsosmngflQhqbsh/yhalyQjn8XNJFsIHA=;
        b=5DZGgGwYzHd+4k1uFVDzcfe/9yMVbKOeoHoYou1SzypPFdMoNzQ1zWbZtp3NFxb3Af
         EjaGKPFKxBydq+2BfTDfo00TB+GWAIGBCPDqMAGhBHVJ82mprXvGXWJvW/MOH1+ZsIPy
         MRJQkIULMdDNkuV1AwGJQdXfp+t/qxZKQaJs8dXB03aQICDMlX77Qmjd7KYf4eAex/wM
         9jLG4UqH7q0NDO4ChzvgugOWC8AK/aaiko+A+MQiMGc7lohf1iIUpkmKppANO7iYGZwS
         B0YwLX03Uno3Uxtz8Zb2U8a12dfse11l/04719Pg4X7cLJduehrv335uar2kiKmbX+wl
         bPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699890288; x=1700495088;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lgDXufcGApdsosmngflQhqbsh/yhalyQjn8XNJFsIHA=;
        b=YTuqcwxCXIxcOi9DtVhJo6lNnObM/9UfPEAnxnSItJbR+jEOOYVLs0u3ssfFgNJEWM
         Q/LHS5omT6CGXFuELmAEnf7rlezNaROlkQuMjcO1J3vJ4QdopXWz/ELYpPwn9XZnUnQN
         6ZH6JIgG7e0l5lciKff8uRfSp6xvp6A+a8gFwvEFVKxvs3f4NXEpeHt4nGh3ab+xJN8Y
         w1aJ1PSIHcPszZSrK5RS0ds5S88ko01XVeIjVDhiV1itahC4PBUvSq9uJ6xps/tb42aR
         FghbkZdyYPvkj3cwmjUlWV16lrmAHQ64MMW1Q/Q56R6Mbhe3LsdwRK/wmHTodsVHG1rJ
         xT9Q==
X-Gm-Message-State: AOJu0Yy2CyHNPNzxajYHQZG//AeD203lN7+QTjkuLD83WKnjAkH3u0+j
	TjPhtS8w6fu7V33jE9O0kYCg8g==
X-Google-Smtp-Source: AGHT+IEHMAox5Iv9eGuXw016c/3TV+peteMJ1y3z67BpqXVWkBFoTMrhn9Er8E6hF2KgzrgZEHDZxA==
X-Received: by 2002:a17:906:3b16:b0:9c2:a072:78c4 with SMTP id g22-20020a1709063b1600b009c2a07278c4mr4974623ejf.25.1699890287811;
        Mon, 13 Nov 2023 07:44:47 -0800 (PST)
Received: from localhost (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id kl5-20020a170907994500b0099bc8bd9066sm4174126ejc.150.2023.11.13.07.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 07:44:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Nov 2023 16:44:47 +0100
Message-Id: <CWXSTD60OPP1.143YPQNX3QVRU@fairphone.com>
Cc: "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: Defer on rproc_get failure
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Kalle Valo" <kvalo@kernel.org>
X-Mailer: aerc 0.15.2
References: <20231027-ath11k-rproc-defer-v1-1-f6b6a812cd18@fairphone.com>
 <87lebowjyf.fsf@kernel.org> <CWJ4ZLEZCKQC.2STOBNUU06B2P@fairphone.com>
 <87a5rhu0iy.fsf@kernel.org>
In-Reply-To: <87a5rhu0iy.fsf@kernel.org>

On Mon Nov 13, 2023 at 4:37 PM CET, Kalle Valo wrote:
> "Luca Weiss" <luca.weiss@fairphone.com> writes:
>
> > On Fri Oct 27, 2023 at 10:25 AM CEST, Kalle Valo wrote:
> >
> >> Luca Weiss <luca.weiss@fairphone.com> writes:
> >>
> >> > If we already have gotten the rproc_handle (meaning the "qcom,rproc"
> >> > property is defined in the devicetree), it's a valid state that the
> >> > remoteproc module hasn't probed yet so we should defer probing inste=
ad
> >> > of just failing to probe.
> >> >
> >> > This resolves a race condition when the ath11k driver probes and fai=
ls
> >> > before the wpss remoteproc driver has probed, like the following:
> >> >
> >> >   [    6.232360] ath11k 17a10040.wifi: failed to get rproc
> >> >   [    6.232366] ath11k 17a10040.wifi: failed to get rproc: -22
> >> >   [    6.232478] ath11k: probe of 17a10040.wifi failed with error -2=
2
> >> >        ...
> >> >   [    6.252415] remoteproc remoteproc2: 8a00000.remoteproc is avail=
able
> >> >   [    6.252776] remoteproc remoteproc2: powering up 8a00000.remotep=
roc
> >> >   [    6.252781] remoteproc remoteproc2: Booting fw image qcom/qcm64=
90/fairphone5/wpss.mdt, size 7188
> >> >
> >> > So, defer the probe if we hit that so we can retry later once the wp=
ss
> >> > remoteproc is available.
> >> >
> >> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>
> >> Did you test this on a real device? If yes, what ath11k hardware and f=
irmware
> >> did you use? We use Tested-on tag to document that:
> >>
> >> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpat=
ches#tested-on_tag
> >
> > Hi,
> >
> > Yes I tested this on qcm6490-fairphone-fp5 including some extra patches
> > for wpss-pas remoteproc support (nothing special, just adding it to the
> > existing PAS driver) and wifi enablement in dts.
>
> Nice, do you have a link to the patches or a git tree which has
> everything? And how difficult would it be for me to run vanilla
> kernel.org kernel (no vendor kernels or anything like that) on Fairphone
> 5? Any documentation available for that?

I'm happy you ask ;)
Currently pure kernel.org doesn't boot much because quite a few patches
are still being upstreamed, like this one.

In terms of git tree, this here is the last tag for everything I have
working on the device, it's ~100 patches on top of v6.6, a good chunk
should be merged for v6.7-rc1 already:
https://github.com/z3ntu/linux/commits/v6.6.0-sc7280

You can flash the device with that kernel and postmarketOS using the
pmbootstrap tooling:
https://wiki.postmarketos.org/wiki/Fairphone_5_(fairphone-fp5)
https://wiki.postmarketos.org/wiki/Pmbootstrap

Let me know if you hit any issues, or if I can help somehow.

>
> I'm asking because I don't have a test setup for WCN6750 right now. It
> would be awesome if I could use Fairphone for testing :)
>
> > I built this line from info from the dmesg, hope it's okay:
> >
> > Tested-on: wcn6750 hw1.0 AHB WLAN.MSL.1.0.1-01264-QCAMSLSWPLZ-1.37886.3
>
> Thanks, I added that to the commit message.
>
> > And thinking about it, a Fixes tag would also be appropriate for this
> > patch. The code was moved to a different file in commit ba929d6fe31a
> > ("ath11k: Remove rproc references from common core layer") but I think
> > this tag should be correct.
> >
> > Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices=
")
>
> Ok, I added that as well.

Thanks!

Regards
Luca


