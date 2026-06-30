Return-Path: <linux-arm-msm+bounces-115420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hnQkGxu6Q2qffwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:44:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFC96E4553
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:44:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=okYOPVw2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115420-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115420-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D51430305F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9059F40BCD6;
	Tue, 30 Jun 2026 12:40:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20E240BCDB
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:40:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823250; cv=pass; b=PKOYj8nQVQfwXv4LO/d5gS6+hsEp5CeBekb4JEcP1OW6djUI7Sf+0F6xpmEbivQtE5Z5vs7xM8s8159t9fBVeZ6hXxeW8Hn9eUu6JKeVi+h3Ea4IXvTQqltj3SpbwHiMYWyJgDtR2N81PGnYDq3+dQl+5UxG2Z83BKNpaVdPGlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823250; c=relaxed/simple;
	bh=uOJKz5W+d2p6Y6G+mO8v3mk6G4LRD5Z3XtmSK7BGQy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBaixGFfGtHUx0++v3mvvTYUtmn7V3UL76INliYkdyETdSadxMK1Jy1dw0oGVP6siPCYnq4vNMnYTTj9Lk9Fm861WfEOFzOZHNTvq+I8T/5HomPHHKLU6qbkeKEOzCWX0iLMFElgMmc7Pmcq51o/gOXioSDnmB2Xu2o+oY22MWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okYOPVw2; arc=pass smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so4596745e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782823247; cv=none;
        d=google.com; s=arc-20260327;
        b=dlXuZ6r8yME0lCP09M13m+PnPhpL3hoNnSjSt8IK54enrbfWocN/P3nzXNNqdGl/7f
         B7z+MwflCHQgiwFhi+pZSDoji+NR1X/eF6VSIrmGfkGhDJNjZieG4iJWb+RRmtkPXcwQ
         WqRAxVZDN1bCuVjOiuB3GiB5IQ86QhHS6IAE8eFVIwFk27eWGJ/HOUN/GxKoLJdldWjS
         gJ8JPKbFMlctmnD20cV4IiWGH/ZZSrsO9+fm+7/4j3rI+28SnO9dWP4g8qSlhhs8h5SQ
         383BZqA7wC1+2PQ0ebvQoSooSMJcWrkZ0QwoosPw2zSmXBYBlF0UGMur74qnk5cdSBkq
         q9sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eV5IRKi1OeoMkxNq2d6si+B8SDj/PuxpdPHNUkls7HM=;
        fh=AATKeEF/6bgfKH5zRuCX+8LQMoq9o/ng2PJB4t2xdyU=;
        b=MYtgx8W7cE80N6Ojj4iBKc1foLy1NwDTkbgB6wuISBd/RvYjgXibig4c/NBSHq4TD2
         N/bNjE+sdlAYLy8jmlEbCf7dLnZuJ7a61eDx2toYD85I2WaUYjqda70vUKNshndxlfYs
         5fXajMWyISGDmRLfFqfMQ0Hw3mT8StqXVGg+lyWUvg7ym6kZ7ixEaX7NimO2QHKKRCe5
         EjNZsrd9p6KjkTbAyd+V6FPjp1xsGUcYO/DgGaJDOUliMARr45KcMCD+dMAyhXPMc2IQ
         40ofLm+J8omjS0dc3lPSF7jCQUqo1o558swK4X5W0KxTYbsIpHCtPHhLb9++8Nm0dl24
         Qrnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782823247; x=1783428047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eV5IRKi1OeoMkxNq2d6si+B8SDj/PuxpdPHNUkls7HM=;
        b=okYOPVw2Q+8a0DjlK1NeXzgumgVYTGzXd73n6RNIzvvxcwTJ5XophTMRfU8cSS2mI+
         bixAvDqaYTTKPYqQ5xK40UAVg5Ig4yTaqqaJgyNW71xx1FrfxpbpgJG3u9+3RUY5DNZf
         gk741C9HIvNObnKUKTy10T2YUBluO0u+1B4JPnR4LevWTO4MlmyWmtIFwXhLlCtXEmVN
         FjZdEQqflShRPY4XlutZXqyQP6HbC4+phfRsszXH2cL+pGGot5vWpsABD/T6BP7XZqbt
         KqJ4JiPKSdOYwKflJSJa6RQ14d8NbsfNdhpCRC6BiYTkpTER911Bhbzd1l5fEt2AEukF
         FjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823247; x=1783428047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eV5IRKi1OeoMkxNq2d6si+B8SDj/PuxpdPHNUkls7HM=;
        b=buyL99racJmdi80MgVGPLcDzlfgip8gmV99eg84FBHbDXU6Cd7DaeAMnvCTpUWdwU7
         NPf0G9aD3RW8buXfiFsCFnRT7GDgNxul+yhKXxS+PZLxfU1XGeaHgSE9SgCGptjIVjKp
         dJguAVTtzEDDKxxVMqm1nIJz9B15rXKQLLBTdcDzbb5XzIql3OH8uPgume0uEyzKyjsQ
         8Tw7WHuWa8dPuvVoytH7MedgyIO4/Z74sOMUkl0Bygh5d+AXYB2GRgvhcI3uAMjhXJk8
         4Y3Niq/l8u4MmqHYRs3yyZHvLz5q1iv/ityoet7ux1y06Z5LELhqFAGd+iDo7H4OZdTG
         2ItQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Jy3Y1M5Ub8TO5hkUEhrbhRxGx+4/m6zWGcoL2OKNY1fIVQVpRkSh9ChY9RIzVkKzk5CWeEZi6dSIkeAbl@vger.kernel.org
X-Gm-Message-State: AOJu0YwP/7Iz9mX1WyLoU6k2nVAf1MD3GvHZuDCJbYxYHXlwSt24LtU7
	81XyppeYVzOfCXbwBd/R/iTWaGSlmCJk4+XXU3JrghqEElSzmWB3SKtyvW9z3R4ExWacjpcft8E
	6WKldoGbVfLyZfeXseb4XiaBvQR7Br94=
X-Gm-Gg: AfdE7cmhsz/P8DwL7vG8tN9rbFFgK05z6+PcJbj2Nr66c1J9meAVxn8abcwlOLFiPx9
	uld292LkmIt5H2TMbzv+cjIpb2bwdfi1iQIJp38IDBAZ4sL+qxgjaqLqYoyiBUEd+oGVXlbXBCe
	f1ALLzZvhJZBbfq688MNKmjaO+USrB0oUtmfv7vroApuK33kAMeM+MSF/4e0uApBg10zWuEp86F
	7LPEMG0ab8G4BDaK49xn3C6aXPlCzYlETd9JUT6eXFFKNxhWS96G9gD0LJIn9+1PAontZYknSA/
	3PzxQG1GO4yL27Fkamk/DnnIc/An7SVTTpjprxQ=
X-Received: by 2002:a05:600c:1383:b0:492:58d6:2565 with SMTP id
 5b1f17b1804b1-493b82b62b1mr51680335e9.25.1782823247134; Tue, 30 Jun 2026
 05:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com> <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com> <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
 <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com> <CAH2e8h6aWW_=pD6JAuFB-VqEZDj9x8gZVh9TdvTCRQakKzm3pA@mail.gmail.com>
 <df03a3dc-1f6a-4725-a565-939838d3b1ba@oss.qualcomm.com>
In-Reply-To: <df03a3dc-1f6a-4725-a565-939838d3b1ba@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 30 Jun 2026 20:39:14 +0800
X-Gm-Features: AVVi8CfouiOAAEzdLUS5LEph1kSz7ajqtxX1IEObzFKZMd694YMeQZPjfxjVDBU
Message-ID: <CAH2e8h7XmhwWPfDmPf8SVpu6syP2E=BriC0=x3BT=XNPzJDzMg@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115420-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCFC96E4553

On Tue, Jun 30, 2026 at 8:28=E2=80=AFPM Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> wrote:
>
>
>
> On 6/30/2026 3:36 PM, Pengyu Luo wrote:
> > On Tue, Jun 30, 2026 at 5:52=E2=80=AFPM Mukesh Savaliya
> > <mukesh.savaliya@oss.qualcomm.com> wrote:
> >>
> >>
> >>
> >> On 6/29/2026 1:33 PM, Pengyu Luo wrote:
> >>> On Mon, Jun 29, 2026 at 1:36=E2=80=AFPM Mukesh Savaliya
> >>> <mukesh.savaliya@oss.qualcomm.com> wrote:
> >>>>
> >>>> Hi Pengyu,
> >>>>
> >>>> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
> >>>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
> >>>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing t=
he
> >>>>>> driver to fallback to FIFO mode by default. However, these platfor=
ms
> >>>>>> also support GSI mode, which is highly preferred for certain
> >>>>>> peripherals like SPI touchscreens to improve performance.
> >>>>>>
> >>>>>> Introduce the "qcom,force-gsi-mode" device property to hint and fo=
rce
> >>>>>> the controller into GSI mode during initialization.
> >>>> Why to force ? You can directly configure in GSI mode. Note there ar=
e
> >>>> some configuration done prior to Linux bootup too.
> >>>
> >>> Sorry, I don't get it. how? I know there may be a qupfw, but it is
> >>> impossible for a normal user like me to generate one with GSI
> >>> preferred.
> >>>
> >> If firmware doesn't program in GSI, you can't have this working in GSI
> >> mode, its going to fail (and work with fallback). if it's programmed i=
n
> >> GSI, anyway this will run in GSI mode. So why to add extra things
> >> without any usage ?
> >>
> >
> > What I can confirm is that fifo is not disabled on my device, and gsi
> > is definitely enabled (under windows, check the register
> > SE_GENI_DMA_MODE_EN), forcing the device to enable GSI mode on linux
> > works well.
> >
> Thanks  ! if GSI is already enabled, then why do you need forced gsi ?

I meant it is enabled on windows, not linux, and I think it is enabled
in the driver, geni_se_select_dma_mode() does it. On windows,
GENI_DMA_MODE_EN bit is set, but not on linux.

Yes, I have no doubt about below(as I drop DT part in V2), but the
GENI_IF_DISABLE_RO register only determines if fifo is disabled, if
not, why can't we use GSI?

> My point here - SW should only decide mode based on register read, not
> enforce by DT flag. As such it's not a SOC exposed, can't be overridden
> by user.

Best wishes,
Pengyu

> >>>
> >>>>>
> >>>>> Ideally, this should be decided by the SPI controller based on the
> >>>>> requirements. Another option would be to prefer GSI for all transfe=
rs if
> >>>>> it is available, ignoring the FIFO even if it is not disabled.
> >>>>>
> >>>> Yes, it should be decided in advance and configured accordingly for =
GSI
> >>>> vs non GSI mode. Because there would be limited set of GSI pipes, wh=
ich
> >>>> will actually make must have GSI mode device run with FIFO mode.
> >>>>
> >>>> Why don't you decide prior and configure for GSI mode ? We don't nee=
d to
> >>>> change the current logic of deciding FIFO vs GSI.
> >>>>>>
> >>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>>>>> ---
> >>>>>>     drivers/spi/spi-geni-qcom.c | 7 +++++++
> >>>>>>     1 file changed, 7 insertions(+)
> >>>>>>
> >>>>>
> >>>>
> >>
>

