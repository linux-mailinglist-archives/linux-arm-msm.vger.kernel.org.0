Return-Path: <linux-arm-msm+bounces-11085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3257855360
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 20:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11E5F1C20DDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D60913B7A5;
	Wed, 14 Feb 2024 19:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="beLg4/W0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EDD13B799
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 19:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707939809; cv=none; b=sJRuX+E+OSyXkZu5AJ9E4P+dAZ29U+S84xy81KreC3w6t6B69V8VxCVwRLmhfZyX2PEhYjhSA/Uu+avoQ/MghfZYf/NDgi2c7CuHIFHDk/xZfNxCLMXMJGbYNjLhGkVUapNkDzOddsu+zhXtcGY32xMEDCbW7qO3t3kruoUkIFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707939809; c=relaxed/simple;
	bh=ODDhCa7VcyKRlmjjRgSedNHpJ6Ae8gN8Lp2Kio/zqmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgfmIVBPsjpqDzUuZL4ybkaqZ0jTwJU1w1Q3W39ek8qDzDVNDHYlWqpzlxjdEPCZV3yhfuzDNoGE1KcfYZZIslOT02VtMnCPEL4GNRU+foFSX0MoirmfZOv84MySXL+5m+grC7Rd0kjYcVa7hCdwFmGuNQKCPJb4Ka5VL59Vn18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=beLg4/W0; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so1059509276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 11:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707939806; x=1708544606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODDhCa7VcyKRlmjjRgSedNHpJ6Ae8gN8Lp2Kio/zqmw=;
        b=beLg4/W0onKKAZa4xv6aql2VgJvA288ZW238sVLTp8F0bNmeEBzKshwwuwkfH+K6e6
         Ytz12OEWRVXa8J8a//w0m6qX3o/8eMnqFwWeuMYxUDO2pp1B15Rp1kX6Yy+izpXjov3D
         8u3RZAw5f0ShZS+pldhvTOT+JIHFB016jIwL9ro8uf21BkbagK1iCE48b1xG6hcu/iHB
         RknPQydTVZtecaFdjL0NWjKOSIS/gK5BLLqhr/5WLKPvMUi/YRs2+earRLsY8i5mLZ6b
         PQELyT8Wxxrv9TMUGMCizwXyzUiXtfArGg9muY76g4L2AO8Wb2ErdXj1LyYLleV/fRNv
         Mdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707939806; x=1708544606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODDhCa7VcyKRlmjjRgSedNHpJ6Ae8gN8Lp2Kio/zqmw=;
        b=gJdVWjHLbDhLKRBf6lq3989AVPCdRdsyrO0bCaHFJXce2CLxUolCueiY0ZOITqQnJq
         Qm2rC6T4CnRfe7xR0SL2FSmSPTNKKrBWgR6PDQorqyuJDRcu7lHe19ocgAlFm1z6yulv
         yiJiebhSx9ZaY3mqWQOP4kZ7PsGB3ELTXfjGk3T7T520ybjc0FSAE7K7h7BmIRqEZ+w7
         VVTim7+5lMNmNHffwcwaD/zWYf91YSVK7BPoYdCQZalkAByYN31UOSkig80EJoIGsC5U
         EjcxLLNHKOBUui8TZxbUyRH30DSQinJ9GAw1Be6GyWoqxj3swfATlpLaCWMg6JYGhrxN
         l1zA==
X-Forwarded-Encrypted: i=1; AJvYcCXfqXpEZcOM8pKPvaZFlKTev9ziKVuTePNe4XmzxmCnpcGErLwNQU4tYcp93ITTgMhNM95y0LfG9J1eJScXFvwEgFtEDYk29A96RtCOyQ==
X-Gm-Message-State: AOJu0Yzioa/sJF1MQGiCi5TlA/h1y5a6VeM0apoDGzq1xY9eKWr+SQem
	6fRIlE8ufjCgynQEN4KghTUTNgAkDvf6cD+GmfdTpuQAD19WW/OnY0RLCkC9LvbXeeprWLKn0zR
	vaWneek+HeUHlTi1ucLJHUc+V19iAGWg5YEdbUQ==
X-Google-Smtp-Source: AGHT+IElv5wWE7Xn3AEqNXm0zLRlvAMweHJ1LUYu8e+PJ1JVGxQyeoIvtcVBRj15d7/Vnr7teXLLdeOkot8I/xKrA5E=
X-Received: by 2002:a05:6902:1547:b0:dcc:6894:4ac0 with SMTP id
 r7-20020a056902154700b00dcc68944ac0mr2727250ybu.20.1707939806385; Wed, 14 Feb
 2024 11:43:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
 <20230914050706.1058620-2-dmitry.baryshkov@linaro.org> <Zc0ITrmhQ8CWMXMq@intel.com>
 <Zc0KsfrI57XL7Efk@intel.com> <CAA8EJppv9xW1S6=eYr41Z0KG3AnsNs7+rLXWWCZ5TNetuqXuUw@mail.gmail.com>
 <Zc0W8TjigrryOPil@intel.com>
In-Reply-To: <Zc0W8TjigrryOPil@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 14 Feb 2024 21:43:15 +0200
Message-ID: <CAA8EJpp0Mgwj8bp3c=+ggeC7JO=NmkwxTjkTdZ9hFwBo7--w8A@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] drm/atomic-helper: split not-scaling part of drm_atomic_helper_check_plane_state
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org, 
	Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Feb 2024 at 21:39, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Feb 14, 2024 at 09:17:06PM +0200, Dmitry Baryshkov wrote:
> > On Wed, 14 Feb 2024 at 20:47, Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Wed, Feb 14, 2024 at 08:37:02PM +0200, Ville Syrj=C3=A4l=C3=A4 wro=
te:
> > > > On Thu, Sep 14, 2023 at 08:06:55AM +0300, Dmitry Baryshkov wrote:
> > > > > The helper drm_atomic_helper_check_plane_state() runs several che=
cks on
> > > > > plane src and dst rectangles, including the check whether require=
d
> > > > > scaling fits into the required margins. The msm driver would bene=
fit
> > > > > from having a function that does all these checks except the scal=
ing
> > > > > one. Split them into a new helper called
> > > > > drm_atomic_helper_check_plane_noscale().
> > > >
> > > > What's the point in eliminating a nop scaling check?
> > >
> > > Actually, what are you even doing in there? Are you saying that
> > > the hardware has absolutely no limits on how much it can scale
> > > in either direction?
> >
> > No, I'm just saying that the scaling ability depends on the rotation
> > and other plane properties. So I had to separate the basic plane
> > checks and the scaling check.
> > Basic (noscale) plane check source and destination rectangles, etc.
> > After that the driver identifies possible hardware pipe usage and
> > after that it can perform a scaling check.
>
> Hmm. We have sport of similar situation in i915 where we pick a scaler
> much later and so don't know the exact scaling limits at the time when
> we do this check. But we opted to pass the lower/upper bounds of the
> scaling limits instead. That will guarantee that at least completely
> illegal values are rejected as early as possible, and so we don't have
> to worry about running into them later on.

Ack, I'll follow this approach then.

--=20
With best wishes
Dmitry

