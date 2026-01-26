Return-Path: <linux-arm-msm+bounces-90542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LtmD41Xd2lneQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:01:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D9F87EF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B477B30037EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E631730E854;
	Mon, 26 Jan 2026 12:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kpcH0Phf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E0730E0D5
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428873; cv=pass; b=ZmH7btUbl3sjTf0BLRsCIi10tnoXxFoppdZWiD82AREUq8XGPXSYH04TLlZBCcGyC5M5hhikran8/vYfE4/6qN6NO8p7ZEYVXPDwrmFen96R5UIZN1tNnnj0/fTmBOyTE/fXNei+Z8eV5+nZjEKdtAmNGr9CBzsLjNCJQFrx63s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428873; c=relaxed/simple;
	bh=+Ltx5xFR5vr2hiTz53OKY/RZN/uvi8YcCdTM4WuHmbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grvG9JM2UikLGCHQlWeLyatmLFKxNPIS6kd8p78l5BiLNBCGus4w9ZUdMumn1zY0+V4P8fWL6hLNN7UTuvlbtNO13f1p4EYYIPZntOjlu4yzhquDuZo/ejuZd6UouFHtvfDAYW7ju6WPeIq4ie8cyPJMS9t/IY+j2n8yS6rRAOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kpcH0Phf; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78f89501423so47788047b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 04:01:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769428871; cv=none;
        d=google.com; s=arc-20240605;
        b=KtrxmhQmmZagvcNUxkYz/euvk1FBmQy23PoMptJcapeqU9jqy5QPGBSMjNhsXBva/A
         gvJMhoJdrmeXA30aAbXn74a3RVxmnt8wUJrQ3adX11yd/siKyjzCnMH2V6AzBChNqytP
         1HzZRDfbOJ9WREzwS6tA2F9fLJPmXPMweUzlRrdx5wd4pK8V0ddnd+CSzmQeIHoYR+Ji
         LbPw4pK4RuuOx9rs6nFBxEHn3ojreJXuI7aVXrczvcihubkwTSzM2YSdNPohZ30qTAbS
         SsDDqcsObQzTaTnD/k5ol/2jHuerxp9fxYrCelqR0lamZW1GHsk5jabluLsLSzCnW78B
         QoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mw4KTn7OReF9P8qDWL30dcxwGr9P25yZho6xXb2IBG8=;
        fh=zoIKJHenqT4oL9zMvJrry/RpoIei622mjXkEdZK+2pE=;
        b=CbxyGwG0WVrqYhjzTLnsvutTwr7z9HiU1bEL+EXeG7mxGPfN5JXdXuZmxTdCEmbwPP
         SVPKSsevi/II4mhS/MomRtrIWM6uI2lGdKyy8wDaui34F/zS2BDo8yB5NV0rvHNEp4pa
         5SxDuIzpHxk3NvENo9iN1PCJRlC2vFIDOE6OHAQTOerlWDYW+WZJcvt3hTS50GnI3/od
         OPS3hbYNCMLe0IojclHWSGdThyNR6KXBvs2mnFbTUKgfNVr+F8LRWYH9BRSPkf7c/v3c
         4BZcBcDfarMNFJELGISDRxgCgphZlpow6WIejvaxmF0+YmPa2PpKKpu24s0fYFeFIaLb
         2aWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769428871; x=1770033671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mw4KTn7OReF9P8qDWL30dcxwGr9P25yZho6xXb2IBG8=;
        b=kpcH0Phfg0ycYH3Hm3/Od2DTFpOkwAVo4eRsX2Xsid/QJx2Gc6e5FTfvuWb1w21vP7
         LVsOUq9MQL72j2AEt+GnF82WRzI5rsLRPlgATRFQxCm/c0Yl/Ih1hfCPra8Msoh6/4bY
         5UVA9dL06u3NOXrmflQbknuHSvSPnD0M4xP88HBEQslSMYDgNisxG1xncAIv1akKd4Mq
         L5ZyZCnOtBe8Z5Pbf1tuXu44i+mBPZSLanRJHkJhaFC5Y3TZW70oEJ8ZFKBk6ApRX6/A
         Kta1+du8uAbiiCLUn+q+8vJgS5ZSgVrkInmoJQUyl9pSD3zP7Vt/LvGc0LEAo0Hmq+XW
         SjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769428871; x=1770033671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mw4KTn7OReF9P8qDWL30dcxwGr9P25yZho6xXb2IBG8=;
        b=mgZtqccfHdIkgambvlaxsQxLb2WBxy02nwkPtWl4QYlRASXHiP2Z8lLtNfa0J+G4lp
         pRWJFpCKywC0eoyGQISCxw03gPD1u3h66mL3LymG0S8Bsvn7AunpickBbYskTw5HN/lg
         TPRLMFB+NBAxpxNvKsBLgIbdtQscpcK1s8aQXCwi7MGTYZ841jGd8V+IrB4WpGi0UWEq
         e/N+VSwy2Q/p3kThLafwtramjfb+iob7XeUIxd1iy/t1T8moIrWCcSZ2PLBHNfvn8pIC
         0uQ7cpfNYMNNl1qR7Nh6l+qMiPpDKdhzIbA5UTPNyYCKnMChGKp1Sa9MoGnJ4+nPjBTU
         t/Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWM4Ir/CT9s2wac7xjcB0co+n9afHW+Z2zPc3X5hE504D/D/CLLnxso3xX7auxjwZc3iVJSeSvsuIU/kFyh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc1ssRbzuV3SFZur1riKCtOgxH/tbJq101GU+zPqrOpgD1CIMe
	as888gYxDXyiyIfTJTd1Du72ao1Ptg9riPe3NxXDdARiAiJ6yGhFjeJAKbM+UOcA1zG+UeRsh0p
	+PhXkVb+xrpqhlRHHd4vJk5DszJbm0kjf9f03++XONg==
X-Gm-Gg: AZuq6aL/fi8BleNWtU5zXYNDEhfw78dWLyHc2QqkOFBm0GJqsN6ddcRNv/g8x/33DvJ
	Bs42w5d+IOYUbNWtkIez7SQ9AaKonlDJtW5NB9OevWl4ArYbVK7IRjVywTiKXqW6N0d20eRns4M
	w5yFkXjNL16iWOCqWfp0fpC5O1yx86jVUrOigw40V1lyQx3zUlSWYAjK6ciu186gEtfqrT1XDeS
	Vf+VfQ2pzaxst7caKibMsCAWwDM2n0Redx60nHc2b8cuYd91cc2LA/SqS/ddzHB0smeFjybCX/T
	2o2ZVw==
X-Received: by 2002:a05:690e:d85:b0:649:60a9:bd84 with SMTP id
 956f58d0204a3-6497146c00emr2614295d50.43.1769428871187; Mon, 26 Jan 2026
 04:01:11 -0800 (PST)
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
 <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
In-Reply-To: <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 Jan 2026 20:01:00 +0800
X-Gm-Features: AZwV_Qjj_g2I7w5tIIriV_jOh7_nPwC9Miffd_hKixfAlcPtTCAzZn6knZ1J8uU
Message-ID: <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90542-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 51D9F87EF0
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On 26/01/2026 12:29, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:13=E5=86=99=E9=81=93=EF=BC=
=9A
> >>
> >> On 26/01/2026 12:06, Jun Nie wrote:
> >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B 18:22=E5=86=99=E9=81=93=EF=BC=
=9A
> >>>>
> >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=
=E5=B9=B41=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=81=93=EF=
=BC=9A
> >>>>>>
> >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> >>>>>>> Currently, plane splitting and SSPP allocation occur during the p=
lane
> >>>>>>> check phase. Defer these operations until dpu_assign_plane_resour=
ces()
> >>>>>>> is called from the CRTC side to ensure the topology information f=
rom
> >>>>>>> the CRTC check is available.
> >>>>>>
> >>>>>> Why is it important? What is broken otherwise?
> >>>>>
> >>>>> I see. Thanks! Will add below lines in next version.
> >>>>>
> >>>>> By default, the plane check occurs before the CRTC check.
> >>>>> Without topology information from the CRTC, plane splitting
> >>>>> cannot be properly executed. Consequently, the SSPP
> >>>>> engine starts without a valid memory address, which triggers
> >>>>> an IOMMU warning.
> >>>>
> >>>> What is plane splitting? Write commit message for somebody who doesn=
't
> >>>> exactly know what is going on.
> >>>
> >>> Thanks for the suggestion! Any more revise is needed?
> >>
> >> Sadly enough the text below is not a significant improvement.
> >>
> >>>
> >>> Currently, splitting plane into SSPP rectangles the allocation occur
> >>> during the plane check phase, so that a plane can be supported by
> >>> multiple hardware pipe.
> >>
> >> What does this mean? Without virtual planes in place, there are no
> >> multiple hardware pipes.
> >>
> >>> While pipe topology is decided in CRTC check.
> >>
> >> ?? What does it mean here?
> >>
> >>> By default, the plane check occurs before the CRTC check in DRM
> >>> framework. Without topology information from the CRTC, plane splittin=
g
> >>> cannot be properly executed.
> >>
> >> What does 'properly' mean here? How is it executed? What happens?
> >>
> >>> Consequently, the SSPP engine starts
> >>> without a valid memory address, which triggers IOMMU warning.
> >>
> >> IOMMU faults. There are no "warnings".
> >>
> >>>
> >>> Defer above plane operations until dpu_assign_plane_resources()
> >>> is called from the CRTC side to ensure the topology information from
> >>> the CRTC check is available.
> >>
> >>
> > Thanks for the patience!
> >
> >
> > Currently, splitting plane into SSPP rectangles and allocation occur
> > during the plane check phase. When virtual plane is enabled to support
> > quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so that
> > a plane can be supported by 4 hardware pipes. And pipe number is
>
> number of pipes
>
> > decided in CRTC check per interface number, resolution and hardware
> > feature.
>
> Okay, but IOMMU errors were reported with virtual planes being disabled.
> So how is it relevant?

After revise of splitting plane into pipes, the number of pipes will be dec=
ided
by CRTC check for both virtual plane and non-virtual plane case to unify th=
e
plane handling,  instead of assumption of 2 pipes at most.
>
> >
> > By default, the plane check occurs before the CRTC check in DRM
> > framework. Without topology information from the CRTC, plane splitting
>
> WHat is plane splitting?

How about: s/plane splitting/splitting plane into pipes ?

>
> > will be skipped for the first time as pipe number is 0. Consequently,
> > the SSPP engine starts without a valid memory address, which triggers
> > IOMMU fault.
> >
> > Defer above plane related operations until dpu_assign_plane_resources()
> > is called from the CRTC side to ensure the topology information from
> > the CRTC check is available.
> >
> > Regards,
> > Jun
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
>
> --
> With best wishes
> Dmitry

