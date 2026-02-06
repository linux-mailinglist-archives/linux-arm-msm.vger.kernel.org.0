Return-Path: <linux-arm-msm+bounces-92017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPs/MqzHhWnAGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:51:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B14FCD2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79E02302DF5E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 10:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C388A376BE4;
	Fri,  6 Feb 2026 10:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OjxBgK7i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A29364EB9
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 10:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770374938; cv=pass; b=uweND0poapHuedpEJx1mBzcJawfrBEcPBNZCbUtu3OaMJEosvosKDRNsBlJ3bioq5qem7jVI9EffSzgp5MosI7LW2Y0DL2B+79zrQ8qI65ywaluHMB8q9Owr/gJ8YmTDI4fJ0hDl/QItP7RB7V6shJOKMPEFM3/WnO1m5pMHLT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770374938; c=relaxed/simple;
	bh=1+CiTY6AZ1ebTrwkD13/R8N1wt6m2kUs/8iTpHFDu3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GEGJ2CIlwyG8cHXkJq10r2SZGeaE1E7koSNCO9J3KpIGbx5lTDX5X9e0BOe77Kf7aOkuhU+1NFZQO1jW9m4r9z/SL4wL8E0+8IC1nR8vEooJ0JotLCm07apPTaLsRUQxAumPq+xd1FuEXll1EcfuXz07mNWJN4yoK+HQavM+ugM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OjxBgK7i; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-649e97f1e1eso1684446d50.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 02:48:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770374937; cv=none;
        d=google.com; s=arc-20240605;
        b=ZDk13UYBTTwmkvGyr9Lh1QL58JwKLaOX0vp8KxG5VMHVdrR0P7UJ9GydDLSSkBOk/C
         9driPrwq2Mo4eLJPPc5zTwOGQUKsZshNTZ/nHYoAIAmHNRVr+D5j1p66qedcuIg3ARaV
         m9/WHIlOIWq28t38jnxB29/Q/U2sNufm1N6muEuDiBN76Hd14BaffYwnG+r7hwof9TEc
         C65VSQgyUUNboXc/OKlg6fK8x3nVaAGhqOewZ4qH4konGWaJTsaSFNMTzMGh16L8vdEr
         JdV/kddVqTmL4YZzrIpDaYK8/ICDB4i1mI2hpyNr9DU1XoAMIYg4I2lojdCwIl7EG+zA
         AQVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eAn3o0Yd4xAGutFGBDLV7iIaln3v7d2nSWfObwWoltc=;
        fh=Juk3xKYT/87xBpwZfwRSnSvHMMkzm5Bo5ck5XtJjmNQ=;
        b=iyKndIqjJQl5AYMJ9zrlOxPuWi+pMj/x9YYMdN0LIptrTKSol+03Ma5soN5YHeiZxv
         SXwLUnES9SjpM8b7GIZTbRNRSVZ4rArXONvyJ2own6uVqOviBnEN9OSXjlklnxPNRDzT
         byGfrAB9ehKjTWVip1GrznJOy7ggyVuX1vtnuy8mi+gqogZnp0T9rX9KAd3HZzH5WDb4
         GBwrAOa+X9I6mpg+G+k/MwkDoytwdUYwLQI63Uf/NT+8EazSOh7GTrJm+EjCBDtK+Rsh
         MCOfUZar2ZelO6GOWEQBiC2xSNPm/GypeoELQfNU+CszHtP0FtYDQDXrNzsygTpKaed0
         yZdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770374937; x=1770979737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAn3o0Yd4xAGutFGBDLV7iIaln3v7d2nSWfObwWoltc=;
        b=OjxBgK7ipry+XtYZLaRBp59LDCzxOJXQcktgu9YUH/QqJH4hgx7Z2up05zRCRRuhqS
         4mSL8gi/Xm8VjLjrfYOqNEdkQalGwZvzUdjFXtpDtCmh97y1+OeAv2u9xwbEbg9V3x08
         4m3hK/wpsarQszQy6jLlfXKB7lt5+EQmY81eTid5CsTGP186BXZpYK6Z965s7du/thsj
         e0mhxAWhAEO0qbF7Yck1ZhFmYzQ8IwlZQ/sbKKdmeeLl8c4X3P93E1fKjwClYUeRevkO
         Oh6DnxSNBWlWlbpRX/Sj3pYx6is1hcXdCyRGHapGjQgIr2lA0MN1EWNwMsvUNYj3W+ui
         CuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770374937; x=1770979737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eAn3o0Yd4xAGutFGBDLV7iIaln3v7d2nSWfObwWoltc=;
        b=D5MbCBGI2O08VLk7j2JG4n3khPVYQZho0XmV2eDGPdGkw3mxBoheGi1PpX3XKEQj05
         C0GJkjx10AvFOXjokTKGTHwWq9SgFJkXvnV60JiZgXVtrNKaLVn52/A7SYNHWesnk4kE
         aGjOc3OK8OQz2wfqO/GMTP7oR9lXQP1TxTszcD03iWESpXP1+yJhvTg4tllwj4/k5bgY
         7Z1WCBl6jMabkM7UppfDbp/xaxf7ZepntmXMJrSQvnMDX7CTj5syIa8kP8rCqRjxaDtN
         XASdgv0cmARz5f6aacwzHzWn0teUtiS8kXbw4u45+Az2lmdJsANZYXa/YulApBxT+NIJ
         Ds0w==
X-Forwarded-Encrypted: i=1; AJvYcCUfo9t7jcWoJYxoHBWjVz4QUiOAiPJlrL8ovMRkCDd0LCN5ufEwfICAptLz2QjDuYwZwOSp1ir8NZmcFrjK@vger.kernel.org
X-Gm-Message-State: AOJu0YzDPBswztz0Aq4SF4REKbvU6wWCrlY2Tzl6yirvLOOvYSBadyAw
	5zTZ5A8mht1KNd9s2cfXmH/Bae8HnjRnGuUg/76dJOGsKN7GC14M82Came/539v+m2TJWzJYMeT
	7t5OqdGzQHffIX03e9WT4tTe+2yZ+OtQeNDVREMrIdA==
X-Gm-Gg: AZuq6aJFoU5CdaN9eUffU4hbB9/kl3lc15I/czkkbVLt8vU3WnGghWx1Gd2YAFWaKxD
	ojynLVu4zm+7AEx6mMDYsO3t/M5Ye0drUjysdHl1S6sCYbrj8LhkGO5SrxJq3p8cTowDnjDPsfy
	lr+BmFFkJL8VrLwGhc+v7Y/1lHJR0sNCnFrRSGzTPOBWDcFy07/+4rn0Zwdwx3dpqb2jn+UhMJZ
	bKRKAoXdRDssj40oQLPrTA/57w8mwLGCHnI+jBzrMH5nDSSLBee2NNJEKrNCRVbvHAiJ8ZucyER
	tYZDOw==
X-Received: by 2002:a05:690e:12c1:b0:649:c7dd:d2ea with SMTP id
 956f58d0204a3-649f1f16109mr1967700d50.39.1770374937050; Fri, 06 Feb 2026
 02:48:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com> <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
 <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com> <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
 <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
 <CABymUCMeS7cWgEProyWnMUJ1fF1rfba3dy4VB0mwTmPbpTvanA@mail.gmail.com>
 <g2kzzrfmcsmzs6wz7alzjjycytpuebxwbehkco7yimdg2jam5a@uqsrt7mov7la>
 <CABymUCOmq_FVOQRVQSz97wjF_gtdji4dXz0CucChvFyqmyw06w@mail.gmail.com> <5gninhmgt3udo3nxeo46lpydv24v7zy6ahuibshohd7flbw5nl@gwf2fujuzo4u>
In-Reply-To: <5gninhmgt3udo3nxeo46lpydv24v7zy6ahuibshohd7flbw5nl@gwf2fujuzo4u>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 6 Feb 2026 18:48:45 +0800
X-Gm-Features: AZwV_QhWbsureIrXGFM54d6J0U2P02RhZgYjmGBh3CSw3jwL-VMVq1Tq4XKBgV4
Message-ID: <CABymUCO7jUbTt_R4q2btdR1-iQzTOvj+z=A1x0Y=CEntkE=9Zw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92017-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 28B14FCD2E
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
2=E6=9C=884=E6=97=A5=E5=91=A8=E4=B8=89 10:44=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Feb 02, 2026 at 03:15:14PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8827=E6=97=A5=E5=91=A8=E4=BA=8C 03:06=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Mon, Jan 26, 2026 at 09:29:44PM +0800, Jun Nie wrote:
> > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=
=E5=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 20:31=E5=86=99=E9=81=93=EF=
=BC=9A
> > > > >
> > > > > On Mon, Jan 26, 2026 at 08:01:00PM +0800, Jun Nie wrote:
> > > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2=
026=E5=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:49=E5=86=99=E9=81=93=
=EF=BC=9A
> > > > > > >
> > > > > > > On 26/01/2026 12:29, Jun Nie wrote:
> > > > > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=
=8E2026=E5=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:13=E5=86=99=E9=
=81=93=EF=BC=9A
> > > > > > > >>
> > > > > > > >> On 26/01/2026 12:06, Jun Nie wrote:
> > > > > > > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=
=BA=8E2026=E5=B9=B41=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B 18:22=E5=86=99=
=E9=81=93=EF=BC=9A
> > > > > > > >>>>
> > > > > > > >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > > > > > > >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =
=E4=BA=8E2026=E5=B9=B41=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=
=99=E9=81=93=EF=BC=9A
> > > > > > > >>>>>>
> > > > > > > >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrot=
e:
> > > > > > > >>>>>>> Currently, plane splitting and SSPP allocation occur =
during the plane
> > > > > > > >>>>>>> check phase. Defer these operations until dpu_assign_=
plane_resources()
> > > > > > > >>>>>>> is called from the CRTC side to ensure the topology i=
nformation from
> > > > > > > >>>>>>> the CRTC check is available.
> > > > > > > >>>>>>
> > > > > > > >>>>>> Why is it important? What is broken otherwise?
> > > > > > > >>>>>
> > > > > > > >>>>> I see. Thanks! Will add below lines in next version.
> > > > > > > >>>>>
> > > > > > > >>>>> By default, the plane check occurs before the CRTC chec=
k.
> > > > > > > >>>>> Without topology information from the CRTC, plane split=
ting
> > > > > > > >>>>> cannot be properly executed. Consequently, the SSPP
> > > > > > > >>>>> engine starts without a valid memory address, which tri=
ggers
> > > > > > > >>>>> an IOMMU warning.
> > > > > > > >>>>
> > > > > > > >>>> What is plane splitting? Write commit message for somebo=
dy who doesn't
> > > > > > > >>>> exactly know what is going on.
> > > > > > > >>>
> > > > > > > >>> Thanks for the suggestion! Any more revise is needed?
> > > > > > > >>
> > > > > > > >> Sadly enough the text below is not a significant improveme=
nt.
> > > > > > > >>
> > > > > > > >>>
> > > > > > > >>> Currently, splitting plane into SSPP rectangles the alloc=
ation occur
> > > > > > > >>> during the plane check phase, so that a plane can be supp=
orted by
> > > > > > > >>> multiple hardware pipe.
> > > > > > > >>
> > > > > > > >> What does this mean? Without virtual planes in place, ther=
e are no
> > > > > > > >> multiple hardware pipes.
> > > > > > > >>
> > > > > > > >>> While pipe topology is decided in CRTC check.
> > > > > > > >>
> > > > > > > >> ?? What does it mean here?
> > > > > > > >>
> > > > > > > >>> By default, the plane check occurs before the CRTC check =
in DRM
> > > > > > > >>> framework. Without topology information from the CRTC, pl=
ane splitting
> > > > > > > >>> cannot be properly executed.
> > > > > > > >>
> > > > > > > >> What does 'properly' mean here? How is it executed? What h=
appens?
> > > > > > > >>
> > > > > > > >>> Consequently, the SSPP engine starts
> > > > > > > >>> without a valid memory address, which triggers IOMMU warn=
ing.
> > > > > > > >>
> > > > > > > >> IOMMU faults. There are no "warnings".
> > > > > > > >>
> > > > > > > >>>
> > > > > > > >>> Defer above plane operations until dpu_assign_plane_resou=
rces()
> > > > > > > >>> is called from the CRTC side to ensure the topology infor=
mation from
> > > > > > > >>> the CRTC check is available.
> > > > > > > >>
> > > > > > > >>
> > > > > > > > Thanks for the patience!
> > > > > > > >
> > > > > > > >
> > > > > > > > Currently, splitting plane into SSPP rectangles and allocat=
ion occur
> > > > > > > > during the plane check phase. When virtual plane is enabled=
 to support
> > > > > > > > quad-pipe topology later, 2 SSPPs with 4 rect will be neede=
d, so that
> > > > > > > > a plane can be supported by 4 hardware pipes. And pipe numb=
er is
> > > > > > >
> > > > > > > number of pipes
> > > > > > >
> > > > > > > > decided in CRTC check per interface number, resolution and =
hardware
> > > > > > > > feature.
> > > > > > >
> > > > > > > Okay, but IOMMU errors were reported with virtual planes bein=
g disabled.
> > > > > > > So how is it relevant?
> > > > > >
> > > > > > After revise of splitting plane into pipes, the number of pipes=
 will be decided
> > > > > > by CRTC check for both virtual plane and non-virtual plane case=
 to unify the
> > > > > > plane handling,  instead of assumption of 2 pipes at most.
> > > > >
> > > > > This needs to be explicitly written.
> > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > By default, the plane check occurs before the CRTC check in=
 DRM
> > > > > > > > framework. Without topology information from the CRTC, plan=
e splitting
> > > > > > >
> > > > > > > WHat is plane splitting?
> > > > > >
> > > > > > How about: s/plane splitting/splitting plane into pipes ?
> > > > >
> > > > > This plane is not being split into anything. It's being mapped on=
to hw
> > > > > pipes. But before that, the number of necessary hw pipes is being=
 determined
> > > > > based on foo, bar an baz,
> > > >
> > > > Thanks for the correction!
> > > >
> > > > Currently, plane is mapped onto at most 2 hardware pipes and 1 SSPP
> > > > allocation occur during the plane check phase. When virtual plane i=
s
> > > > enabled to support quad-pipe topology later, 2 SSPPs with 4 rect wi=
ll
> > > > be needed, so that a plane can be supported by 4 hardware pipes.
> > > >
> > > > After revise of quad-pipe, the number of pipes is decided in CRTC
> > > > check per number of interfaces, resolution, clock rate constrain,
> > >
> > > Where?
> >
> > The pipe is decided in dpu_crtc_get_topology(). Change to quad-pipe
> >  is made in later patch. So I drop this in this patch message below.
>
> The pipe isn't decides in that function.

Sorry for the inaccurate word. I mean the number of pipes is decided in
dpu_crtc_get_topology(), is it correct? Of course, the number of pipe may
be increased from 1 to 2 with filling  r_pipe_cfg in
dpu_plane_atomic_check_nosspp()
due to width or clock rate constrain in non-virtual-plane case. So the code
logic allows 2 mixers co-work with 1 SSPP rect, mixer number is decided in
topology and pipe is decided in plane side, though it is not very reasonabl=
e.
Does DPU support such topology? If not, the number of pipe shall be aliged
with the number of mixers info from topology side. Please help teach me
on the relation number of mixers and SSPP rectangles. Thanks!

>
> > >
> > > > hardware feature and virtual plane enablement. The decidsion of
> > >
> > > decision
> > >
> > > > number of pipes will happen in CRTC check for both virtual plane an=
d
> > > > non-virtual plane case to unify the plane handling. Before that, th=
e
> > >
> > > will? Do you mean, after this patch? If so, please use imperative
> > > language. See Documentation/process/submitting-patches.rst
> >
> > Yes, it is in later patch. So drop it in this patch message.
> >
> > It is possible to keep plane check unchanged, and rely on re-allocation
> > in later stage to support quad-pipe, if quad-pipe use case is detected.
> > But to unify the allocation logic for both non-virtual and virtual plan=
e
> > use cases, and to centralize resource management, we'd better defer
> > the allocation.
>
> Which allocation? The non-virtual-planes case is more or less static.

You are right. The SSPP is assigned to plane in non-virtual-planes case
statically. The plane may be re-mapped to other SSPP only in virtual-plane
case. Just got your point here. I will try to keep the SSPP assignment
unchanged for non-virtual-plane case, avoiding mixing assignment with
allocation.

>
> >
> >
> > >
> > > > the number of necessary hw pipes is being determined based on
> > > > resolution and clock rate constrain.
> > > >
> > > > By default, the plane check occurs before the CRTC check in DRM
> > > > framework. Without topology information from the CRTC, plane mappin=
g
> > > > will be skipped for the first time as number of pipe is 0.
> > > > Consequently, the SSPP engine starts without a valid memory address=
,
> > > > which triggers IOMMU fault.
> > > >
> > > > Defer above plane related operations until dpu_assign_plane_resourc=
es()
> > > > is called from the CRTC side to ensure the topology information fro=
m
> > > > the CRTC check is available.
> > > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > will be skipped for the first time as pipe number is 0. Con=
sequently,
> > > > > > > > the SSPP engine starts without a valid memory address, whic=
h triggers
> > > > > > > > IOMMU fault.
> > > > > > > >
> > > > > > > > Defer above plane related operations until dpu_assign_plane=
_resources()
> > > > > > > > is called from the CRTC side to ensure the topology informa=
tion from
> > > > > > > > the CRTC check is available.
> > >
> > How about this commit message? It is more coherent with the change
> > in this patch.
> >
> >
> > Currently, a plane maps to at most two hardware pipes, and SSPP
> > allocation occurs during the plane check phase. However, when virtual
> > planes are enabled, SSPP re-allocation can occur within
> > dpu_assign_plane_resources() during the CRTC check.
>
> There is no _allocation_ for non-virtual-plane case. The SSPP are
> statically assigned to the planes.
>
> >
> > To support future quad-pipe topologies, which require allocating two
> > SSPPs with four rectangles by default, it is more efficient to perform
> > the primary allocation in a single pass rather than relying on later
> > re-allocations. So defer the allocation to CRTC check phase by default.
> > Allocation logic for both non-virtual and virtual plane use cases is
> > unified in this way.
> >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry

