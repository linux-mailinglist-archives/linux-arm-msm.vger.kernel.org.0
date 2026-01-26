Return-Path: <linux-arm-msm+bounces-90522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKT4IBpCd2nldgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:29:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ABB86F06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 581043002B4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A039233066B;
	Mon, 26 Jan 2026 10:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGpURvGw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E31A330330
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423371; cv=pass; b=EhODJkq+m36eDNHue/AnOF/BWlPRCDtefVVMOaImALrxs0J1Yl8EBRpTfEJgMaCYlWwZxO6YxUOi4mlyT13CM5485vc79gz+2G8LpduW0XsVji8jCS7HjS+KWZK6NsfbbQ82sgDKKiwyuLE4YHmcHazR9RJvnxSB/Ad4qKuUs9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423371; c=relaxed/simple;
	bh=D8wHCysE8LHeMFG24bZPtzAt13gzC6maYCVRG65FC2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/9j2ues+sQmd/mqOdHbg/Ezi86XdbWHaNJU/BDhAwyhoFrTnB2o/t54geJZiH57Ks1mw1gWXO+n1M07TBq46Sn73+3e3ijljvFYKqPnU+t1Pj8ZWvtZb7jV6aguLNUSzBN501Ndxw+9wFoMfUqDwVrbSPIRx6eE48yRzt1VDD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zGpURvGw; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-790ac42fd00so43156907b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:29:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769423369; cv=none;
        d=google.com; s=arc-20240605;
        b=iOF2NvzXfmpU5s2Nl366uCYxfo6cWj0ao4M9UKdqHp5TTIwRNlfIjfW4vZCZcXRDSc
         JV0qA0BaXHIiTlVYbXBZAOd8igclLOs/BYiGrtBMUuyVpbRlsvoIpWRKfbXT9oPe/iZI
         /gOhNvE9++aLI4N06Zh/y+NXngHnHahqSZayrI2h4zQ+nwjniycv6METSgfy/DA/ipQH
         CS02xGTcNxkIEdpasF61na0V4Fpw0Qp9zFzqpLMXorpKPQuiq6KZIGhWNAwk8YWNkpIz
         mMOioxDD3CUYKiNlYNinFv56AfJF4vANhKHAuzeWRYLZuh7pxwLsyxg7dy2VUw0COrz5
         gQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D8wHCysE8LHeMFG24bZPtzAt13gzC6maYCVRG65FC2k=;
        fh=UYjvRxSGUwBn0HT2+pk9vQChEZpJfz65OgIgLQzGjOw=;
        b=L2FObNTS+TSrEbj3BPPnGdEwJGr7n141Kz2dcyUBZlTTMnpWcVCPGQgzpXyG8bzYnJ
         1UiLv5oFjQs9lAzIIoq3MYoJormov9KHygvUouh47Wux6fMsHqI644qkXnw8pDr9Nlro
         obFWpmnoxJHcIYXuapRmSCqtJbpc+GGSIQ+klvA2uZEe5O8mhHTDWNKNKIq9J27YejKJ
         voSetvOXmpCG4/Suaj6wy+PlZYnabdSiwEKbnBPcmHcLUTcJbPWVvCe57rqRxCkxmhGD
         P0Mx4sBnkRkt4jE5nZdVNDt27HswGRyMLiN+eLblu7g9qD5YCwltjwAxmGrGwKvx1wdD
         CRJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769423369; x=1770028169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8wHCysE8LHeMFG24bZPtzAt13gzC6maYCVRG65FC2k=;
        b=zGpURvGwN/pWtSz+edgiKzmF4h0YE960ku3jAiDQqBLuiYhjgf9fO1O6O+BCmkqm4f
         S5MOoe59Y1dghRzWUhyQOWPLIYB5bX6zC1CSUqN8kCMQAM1p9+odYiHXI68eQqPMHWRm
         6spV0JXFZ6RWiGX0s1GzwhsPP35oe56Ixt8cBwv1+vbJM7bybXkY8KFwRWQaW2EvWNSo
         wVkYhQ+g1ubvX1uQh/CdRoIXVe5pJ7ig7miDucx0EKjXoCQ/DdAy7rdoLDi8zL7N29Bo
         bRzPbt7oE5BL2qRuenYE3X42IdNnC8scE8EHW1sC3TjnvokuU2MlKE5drSA6RdGpr5zs
         ohxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423369; x=1770028169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D8wHCysE8LHeMFG24bZPtzAt13gzC6maYCVRG65FC2k=;
        b=erviOz8Al8MNrfjJ2LmjVJtohXAuoERAOIkaqkFLQd6C3k7iu1zKo+JHuvz4Wv/4yE
         vQhtWjkhL6usuxgQnajzC0D+mrIopbOqP4aAqaAJ+y4sjteQOKOCtMZYIb6kzHhA//6T
         1I6du8hRfQt6JLNQJaYLfW9SdR9uU+LHEJD4SErA9cETzE15yYhhfUx0jEgxGw6AidbC
         pLo173Eljm3Dt8TV5esTo5tUNbPcxQC8tnVTURMPhSzEcgpiTMiW6z1QPGPv0zCZ8awS
         zNJQCdFJD251RGi6OrLWY05MbH5Iwd75HQY88/WNwOXC42AaOfoCXY+K967cNczn9DsN
         8Pxw==
X-Forwarded-Encrypted: i=1; AJvYcCWIrWfzGtn44L5VGue7vfJ+uCc6MJodCT0uMqiZd1YPgTAVJp/E250CKaOzziDxBeGxSv/Dm80Etk7gLfwb@vger.kernel.org
X-Gm-Message-State: AOJu0YxtgOgDXvzboTeBc9iSbwHos19E2B+3YpnkR4V/OdBJlf2Ze42y
	kjV5F3wzTjvpzneeGRdpSsv0Z0o075PKBs4LicViumTrbZ12hLrDrWVej+z7BUOYeU7qBfuSK9C
	8dWIAiaFUECwbQgXoukkaOMTObXiquje//CyT6+R2Icgafa/yP5/UGePe8Aq2zgg=
X-Gm-Gg: AZuq6aJSQE6OdagOucai9BQHELLCs3CAlvNNftD8j/PSipDBlb1trMDSKPR8QizuHts
	Yf5Jn3JsRDuYGBiQhCVDcMBZyDi/OgsS53tYp3zdMpfSnla+aXpMdIq9iOu0UdkS9LlVqcf/3B0
	DhmHcTjeu9B/STFtlkgkHs8dAj5JmUpnAPL+jtUNym8dy2Bt2frWEWG5JyGRAKv/OiX6xhjE/M0
	NpYZwvIrc4Js/OclWybxVWSeous7hZCJkw85hydKOSn3SVnX4r0YaUm8/w0ILfC/7ROkMW0w3Cs
	94Ljig==
X-Received: by 2002:a05:690c:81:b0:794:7a4:c847 with SMTP id
 00721157ae682-7945a9ae0f4mr67768577b3.43.1769423369077; Mon, 26 Jan 2026
 02:29:29 -0800 (PST)
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
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com> <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
In-Reply-To: <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 Jan 2026 18:29:18 +0800
X-Gm-Features: AZwV_Qidxbgft8poJJthLOL2vexuHqw3nVMNWpER_nv0oJLwqI4juuemdIOjfJA
Message-ID: <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90522-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 90ABB86F06
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:13=E5=86=99=E9=81=93=EF=BC=9A
>
> On 26/01/2026 12:06, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B 18:22=E5=86=99=E9=81=93=EF=BC=
=9A
> >>
> >> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=81=93=EF=BC=
=9A
> >>>>
> >>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> >>>>> Currently, plane splitting and SSPP allocation occur during the pla=
ne
> >>>>> check phase. Defer these operations until dpu_assign_plane_resource=
s()
> >>>>> is called from the CRTC side to ensure the topology information fro=
m
> >>>>> the CRTC check is available.
> >>>>
> >>>> Why is it important? What is broken otherwise?
> >>>
> >>> I see. Thanks! Will add below lines in next version.
> >>>
> >>> By default, the plane check occurs before the CRTC check.
> >>> Without topology information from the CRTC, plane splitting
> >>> cannot be properly executed. Consequently, the SSPP
> >>> engine starts without a valid memory address, which triggers
> >>> an IOMMU warning.
> >>
> >> What is plane splitting? Write commit message for somebody who doesn't
> >> exactly know what is going on.
> >
> > Thanks for the suggestion! Any more revise is needed?
>
> Sadly enough the text below is not a significant improvement.
>
> >
> > Currently, splitting plane into SSPP rectangles the allocation occur
> > during the plane check phase, so that a plane can be supported by
> > multiple hardware pipe.
>
> What does this mean? Without virtual planes in place, there are no
> multiple hardware pipes.
>
> > While pipe topology is decided in CRTC check.
>
> ?? What does it mean here?
>
> > By default, the plane check occurs before the CRTC check in DRM
> > framework. Without topology information from the CRTC, plane splitting
> > cannot be properly executed.
>
> What does 'properly' mean here? How is it executed? What happens?
>
> > Consequently, the SSPP engine starts
> > without a valid memory address, which triggers IOMMU warning.
>
> IOMMU faults. There are no "warnings".
>
> >
> > Defer above plane operations until dpu_assign_plane_resources()
> > is called from the CRTC side to ensure the topology information from
> > the CRTC check is available.
>
>
Thanks for the patience!


Currently, splitting plane into SSPP rectangles and allocation occur
during the plane check phase. When virtual plane is enabled to support
quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so that
a plane can be supported by 4 hardware pipes. And pipe number is
decided in CRTC check per interface number, resolution and hardware
feature.

By default, the plane check occurs before the CRTC check in DRM
framework. Without topology information from the CRTC, plane splitting
will be skipped for the first time as pipe number is 0. Consequently,
the SSPP engine starts without a valid memory address, which triggers
IOMMU fault.

Defer above plane related operations until dpu_assign_plane_resources()
is called from the CRTC side to ensure the topology information from
the CRTC check is available.

Regards,
Jun
>
> --
> With best wishes
> Dmitry

