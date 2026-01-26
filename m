Return-Path: <linux-arm-msm+bounces-90562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AqwEnNsd2nCfQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:30:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC76E88D6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4EF853008338
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBAA33987D;
	Mon, 26 Jan 2026 13:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qo9N7EYd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9894F339709
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434199; cv=pass; b=n42UhkK/bvfh+G/hf25AY0puX8ggf4I76x34oA5Jhm7hIBnbKKmXqfrMpYtzDXRvasjAIpoGFowWFVbxGW0X4GhnQUsI5Juze6x9UjYEMaQOkqJzK+vDX8juwD9Gg1fPRCwNKQ31oTuJLNmhkXOozmCaklAt2bsFGA6KiHTTCVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434199; c=relaxed/simple;
	bh=VhdpWK7kO7qkYEVQukaKkH6CQSMUVKXWtBqo51Fh59g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dMs0S1+8njknaDtVgkuTQjNkjWxHx7hXpRZTUZ3vQXzNRziJJT2qnfELJcMnMBO8wv5XeYhGaKI52IJg1Zyl8/MeCIV8NKAs5xSs0qXeD/sTaA4cNauV9g/jArHikYahPlbsPPI0akbbNhCSfiY8x70Lx8HJEImtAN7Koox786M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qo9N7EYd; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78c66bdf675so43385367b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 05:29:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769434196; cv=none;
        d=google.com; s=arc-20240605;
        b=XQGwPGOJ8pLeRUDPgh1UUG+XhKONUe+Zv9Rnm3PW4UV+j1QxfPS01KVbBny64Om4Nm
         VB32ChWd0EwFjSIdd1RRYpU3Rhigud83BGtVjTAmPlQi/4TBECKCpA1yrVhcSR11cBeX
         IjyAZngm6pNXF88OkHsYL6bdJvVBVEBeN7+7PfbThBXrDwZrBehERLr9YcjIqb/71dDK
         B9hzpS3yZ4QFfpXgJJ6/CRx40MXkJsbSJ6wspp+NVKRjfHKwkpFdc+BnRGEY8iGzYmuk
         yqlOoqbRHZEgUaIozb6A6qOYrZz7ytJHCivDAHn6wROShuT6nPYLPvZRp3u2tZhrHO4C
         lFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ajOlSiOtNMWfjsoQse/ifbqmB3q8/dPWLyWb9EMEP9E=;
        fh=NgcQk5liywIdT95I5ZD6kQ4NsfbmVVCVsO40wrEBZdg=;
        b=fja8tgihILcVWHgkP0tcs/Nsiy/lAomMtlnuCQ33/o95UBumZoXOlbojkwn3JP1wzY
         dpnIdF9ApTk752ugmpjBltN7On/SPsrd4o+hQ6ZGkq/EFCKBnnuJzn9J8vcCV154gIy9
         vx+5U/Rv1DTYFpOWsUOXaMGZi/YPuFln3qMeMRBW8XcLjxzpQur5eEerZk8LEdRyw6kg
         pTx1S2KD7g9Offzo9bdgMY26giLATP0yMjdxlz8XmWr9TGSaWD8Loh7UAaGJk7HQqG5L
         1BIvAIaO/EQgZS31WfpSJYT3E40Vq91Hiq1Rjsizzgpbo5MkmZglKplYzhNMNsQmbzCW
         zPNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769434196; x=1770038996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajOlSiOtNMWfjsoQse/ifbqmB3q8/dPWLyWb9EMEP9E=;
        b=qo9N7EYd6lFqI+p4wFc5hdZ1RE3OQMGpopoLoECq5f7C3j7/qPxM2XpCIjPfCqrpLd
         OQa6Ux3PU9xp3VNBy6S+8undOddfoN3/Vi2nURZMiAxxuSogaR1d63Y8F55VDZt2kOFz
         zJ0WIkvwey12aTmYRIzXvZSoie/lEwbFkGY2EBH32MgRo6OGU/Myyo7J6qm8jhwvGqYj
         dvHodiJ/hqaRe9MlSiyhBss4NnhRomfuTdipI3FiuOYRMfkpag10VXJ3afDsZcRLwdyD
         ZOvDb/9dwveE00/pwOb+YwCgetbYH128VmQjy9WzJmFBU2ZmA5PqAp3dqz0i1lkd6XKz
         ZQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769434196; x=1770038996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ajOlSiOtNMWfjsoQse/ifbqmB3q8/dPWLyWb9EMEP9E=;
        b=XEX/DsGNNnKvmJjg+s/0w8VELpekFweU6HJmXrYAxyo5/IUYFca6nj+UhSOHFj5w/X
         zJ6EMWF7gzdnn+detEoRHNW6VSIS7eln8opP5XGTAKUYhZFbO3UGYtz7WRaDxMIVRLAN
         267wJxSmLQOq6BdFN3LLEFssJNTDK7o9U0nSjkl0AsbE13qLbhUN/jqL4bIjjyAk20nB
         4ML9Ire2pDwhEu2a+Dg5O2AcYuLvErgW/5wmG9dJo7IKr6SuhnSTySYqOltPlqxBPuzY
         iHN+AVxX0J5bSYbTwLRISPY3zITNwCB2ArT6urfUl/kZoeMb/Ncr6Nkmg/fjmt8mMMWJ
         c4Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUM/ZhMD+TudUHEwn0xntVX5ctj+5LT3tpQvSXI5AOIWkxVQNxu2XjBmW1Ozvw18w8r05P/rV3eLaYVXoOF@vger.kernel.org
X-Gm-Message-State: AOJu0YwqckFqcsLAsPZ9S3LO1Tiom0GoLQiajfyLfkoDLZduEbUg7DGd
	b1Hqa31pS2UYFja9QE2Ip9YXOtd7J44SaVQFMVM3UXV7nsaRPLSsj6HFT/3ofMkt6MWXi2wBHzY
	18rUIbrst9WhtwSmKKuh58RcMSPVVmgV/t0TP74957g==
X-Gm-Gg: AZuq6aLJjpTbmIM36n1G7B/MsaNuDe/ZZ/IfOA8nQYom1h+e8oYGLXo10so6LXGbKu4
	aG++5azBIjlfMBl6+ZDDwfXr8rD5C7jFhd7wTbRFmPY3Y3lfi/SNFkmXJVVKh80WCFB7hLQ72ER
	gBFRjGcm9C8z/x/sUJxgPowownHzhYBF4vrpmHy7+lA4WlXCBKTv4+H6fzDFk1tFkJCR/AKhlQS
	ZDfqD/BF+ByIOZyAiWeRC0/4PuMaQ0RoIDjV+ZElt3MuTZK2z4xnky1PZ9KA/RCadTI17FEDuh5
	62lUAyPrJlcQSYzJ
X-Received: by 2002:a53:ac89:0:b0:649:6074:9d3c with SMTP id
 956f58d0204a3-64970c9fdf9mr3532659d50.54.1769434196536; Mon, 26 Jan 2026
 05:29:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com> <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
 <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com> <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
 <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
In-Reply-To: <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 Jan 2026 21:29:44 +0800
X-Gm-Features: AZwV_QhrhzX3QFcHeAIEwxeWZf4Y6oIwMBcL2-B9HiItZYabjyPzZqC41KwRdrs
Message-ID: <CABymUCMeS7cWgEProyWnMUJ1fF1rfba3dy4VB0mwTmPbpTvanA@mail.gmail.com>
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC check
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90562-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EC76E88D6F
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 20:31=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jan 26, 2026 at 08:01:00PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:49=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On 26/01/2026 12:29, Jun Nie wrote:
> > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=
=E5=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:13=E5=86=99=E9=81=93=EF=
=BC=9A
> > > >>
> > > >> On 26/01/2026 12:06, Jun Nie wrote:
> > > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E202=
6=E5=B9=B41=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B 18:22=E5=86=99=E9=81=93=
=EF=BC=9A
> > > >>>>
> > > >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > > >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2=
026=E5=B9=B41=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=81=93=
=EF=BC=9A
> > > >>>>>>
> > > >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > > >>>>>>> Currently, plane splitting and SSPP allocation occur during t=
he plane
> > > >>>>>>> check phase. Defer these operations until dpu_assign_plane_re=
sources()
> > > >>>>>>> is called from the CRTC side to ensure the topology informati=
on from
> > > >>>>>>> the CRTC check is available.
> > > >>>>>>
> > > >>>>>> Why is it important? What is broken otherwise?
> > > >>>>>
> > > >>>>> I see. Thanks! Will add below lines in next version.
> > > >>>>>
> > > >>>>> By default, the plane check occurs before the CRTC check.
> > > >>>>> Without topology information from the CRTC, plane splitting
> > > >>>>> cannot be properly executed. Consequently, the SSPP
> > > >>>>> engine starts without a valid memory address, which triggers
> > > >>>>> an IOMMU warning.
> > > >>>>
> > > >>>> What is plane splitting? Write commit message for somebody who d=
oesn't
> > > >>>> exactly know what is going on.
> > > >>>
> > > >>> Thanks for the suggestion! Any more revise is needed?
> > > >>
> > > >> Sadly enough the text below is not a significant improvement.
> > > >>
> > > >>>
> > > >>> Currently, splitting plane into SSPP rectangles the allocation oc=
cur
> > > >>> during the plane check phase, so that a plane can be supported by
> > > >>> multiple hardware pipe.
> > > >>
> > > >> What does this mean? Without virtual planes in place, there are no
> > > >> multiple hardware pipes.
> > > >>
> > > >>> While pipe topology is decided in CRTC check.
> > > >>
> > > >> ?? What does it mean here?
> > > >>
> > > >>> By default, the plane check occurs before the CRTC check in DRM
> > > >>> framework. Without topology information from the CRTC, plane spli=
tting
> > > >>> cannot be properly executed.
> > > >>
> > > >> What does 'properly' mean here? How is it executed? What happens?
> > > >>
> > > >>> Consequently, the SSPP engine starts
> > > >>> without a valid memory address, which triggers IOMMU warning.
> > > >>
> > > >> IOMMU faults. There are no "warnings".
> > > >>
> > > >>>
> > > >>> Defer above plane operations until dpu_assign_plane_resources()
> > > >>> is called from the CRTC side to ensure the topology information f=
rom
> > > >>> the CRTC check is available.
> > > >>
> > > >>
> > > > Thanks for the patience!
> > > >
> > > >
> > > > Currently, splitting plane into SSPP rectangles and allocation occu=
r
> > > > during the plane check phase. When virtual plane is enabled to supp=
ort
> > > > quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so th=
at
> > > > a plane can be supported by 4 hardware pipes. And pipe number is
> > >
> > > number of pipes
> > >
> > > > decided in CRTC check per interface number, resolution and hardware
> > > > feature.
> > >
> > > Okay, but IOMMU errors were reported with virtual planes being disabl=
ed.
> > > So how is it relevant?
> >
> > After revise of splitting plane into pipes, the number of pipes will be=
 decided
> > by CRTC check for both virtual plane and non-virtual plane case to unif=
y the
> > plane handling,  instead of assumption of 2 pipes at most.
>
> This needs to be explicitly written.
>
> > >
> > > >
> > > > By default, the plane check occurs before the CRTC check in DRM
> > > > framework. Without topology information from the CRTC, plane splitt=
ing
> > >
> > > WHat is plane splitting?
> >
> > How about: s/plane splitting/splitting plane into pipes ?
>
> This plane is not being split into anything. It's being mapped onto hw
> pipes. But before that, the number of necessary hw pipes is being determi=
ned
> based on foo, bar an baz,

Thanks for the correction!

Currently, plane is mapped onto at most 2 hardware pipes and 1 SSPP
allocation occur during the plane check phase. When virtual plane is
enabled to support quad-pipe topology later, 2 SSPPs with 4 rect will
be needed, so that a plane can be supported by 4 hardware pipes.

After revise of quad-pipe, the number of pipes is decided in CRTC
check per number of interfaces, resolution, clock rate constrain,
hardware feature and virtual plane enablement. The decidsion of
number of pipes will happen in CRTC check for both virtual plane and
non-virtual plane case to unify the plane handling. Before that, the
the number of necessary hw pipes is being determined based on
resolution and clock rate constrain.

By default, the plane check occurs before the CRTC check in DRM
framework. Without topology information from the CRTC, plane mapping
will be skipped for the first time as number of pipe is 0.
Consequently, the SSPP engine starts without a valid memory address,
which triggers IOMMU fault.

Defer above plane related operations until dpu_assign_plane_resources()
is called from the CRTC side to ensure the topology information from
the CRTC check is available.

>
> >
> > >
> > > > will be skipped for the first time as pipe number is 0. Consequentl=
y,
> > > > the SSPP engine starts without a valid memory address, which trigge=
rs
> > > > IOMMU fault.
> > > >
> > > > Defer above plane related operations until dpu_assign_plane_resourc=
es()
> > > > is called from the CRTC side to ensure the topology information fro=
m
> > > > the CRTC check is available.
> > > >
> > > > Regards,
> > > > Jun
> > > >>
> > > >> --
> > > >> With best wishes
> > > >> Dmitry
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry

