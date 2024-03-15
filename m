Return-Path: <linux-arm-msm+bounces-14272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351B287D2D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 18:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A1021C22232
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 17:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90274C600;
	Fri, 15 Mar 2024 17:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f8bSTqO9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087FE487AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 17:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710523938; cv=none; b=DxRT7AD83LPk1gJ9/dQ99w5lmfdTnUF1I1rT7d+x8UK+MR5mDR4pi9E8MWagoHnYNhaMFnT0zqobAdvg7atxfejoXiKVFSTYWx0zVbDiuRs7FVWwoQQXDYFvByfLEp/QjvwmTAtQPnXxocKn9OZorQJAjWJBmTLYsqiVb1zCm6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710523938; c=relaxed/simple;
	bh=0LTEsN2O/FgSWhZk5KJW+7bWr7jqaVlwguZyG5cUT4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U9C8a/pAnnHfKEX4kUK2q0x0W1v6SuPd3S9vr8lXLF3Rb/Wvk+y2eMdbh+fmEiluHlzW6popfgZjiwwBAGAgdgxVtVi4P4+/b7506FTuF3tbOjs7o+Mb7RzNbdWa+MabMQyLzmNz1/oAL5aDA6RgCM1JdnnKDXMXqmJK7seQlPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f8bSTqO9; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c19dd9ade5so1232709b6e.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 10:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710523933; x=1711128733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35pY7i/gjcm69pUN8AAJZNQoGf0jouiTU8qeW6pOlqY=;
        b=f8bSTqO97dV4NRJXwZOl8YCt1H6UwzdG2nE4ckdX1+3D8he/Z50iGd5+odKUcGv0QN
         wQlU5fCVL2DFGlklRH7dTu8rGNkw01oIdqgOpCWBBPol8FebO0CfWdT/THoa7Np1tKC6
         GesErz+qFnXqYhMXkAz7+5usnRQ7+gtJpuvGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710523933; x=1711128733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35pY7i/gjcm69pUN8AAJZNQoGf0jouiTU8qeW6pOlqY=;
        b=e17D7ARJr1kN7rNvF5FzqtgcVTe5xi5SSbpLQhL7fXKFO8S9as2r/6sGrnf/rjEQur
         TBZm0bckcgmL+LJrr1C6HfGvlYqYHxOAFr94rL3H4UWZfgSw4GckSaCZv/CzS7bPWxji
         ru76iKPNvaUvelY7T80CtPCpFNaHX5k9yTrWeuuBylUTmt/b1VXqoVKhLgwmtE/bMtxl
         5+FTGSBVW8uu6XdO+DwncbAOOj17YhfI5pPleikM4O8tXurEhC96EvrYGY5HhRp9wJxm
         0+se4vfD3qB7lXnfvFEvydBFqLeEBa2jDZWblpl2F3Bq7c4It3kY2fA1Nfq51XrIjnub
         cSKw==
X-Forwarded-Encrypted: i=1; AJvYcCUhurphizQ1mujGPs64s/k0Xh5wCm7fvBmh8QBYjd6gi0tNo0vH2g/QCbe0PsyrxmZwO+njI3nPmNCiIls3x7gY9PGZkOJtBLw0gwrWpg==
X-Gm-Message-State: AOJu0YyRbrtKCdXe4GxAoQWr7Ta51025C6Lkb+xRh7aKpmC7fHrhNztI
	mTd1wfPNDlxbVBPiXH3Vpwne9ZLtlUBOaqAvvfJwAFQK1DmrSdASasRbRjYm7KHIFQwN2cFzOEw
	=
X-Google-Smtp-Source: AGHT+IFr5SGdgWhtVPGX+swPPAjoGfWUOxXKZjucIravo+SQLDxXdMqgCo8THS2RMTkSr59BP8slYQ==
X-Received: by 2002:aca:1114:0:b0:3c1:f2fd:78c3 with SMTP id 20-20020aca1114000000b003c1f2fd78c3mr4280494oir.15.1710523933382;
        Fri, 15 Mar 2024 10:32:13 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id cn19-20020a056808351300b003c37c016afesm88105oib.41.2024.03.15.10.32.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 10:32:12 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-43095dcbee6so17811cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 10:32:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9CKD/JyRuMgw134ePhPGgekF8BBlW3NmPeSalAtJMJde2cTD9Nc1EWMt8Y6lFxO5VutBJ6F783zG2SA1cI1r3m2i4bvUujO2b8sYprg==
X-Received: by 2002:ac8:470b:0:b0:42e:e40f:fca4 with SMTP id
 f11-20020ac8470b000000b0042ee40ffca4mr311095qtp.13.1710523931775; Fri, 15 Mar
 2024 10:32:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230703085555.30285-1-quic_mkshah@quicinc.com>
 <20230703085555.30285-4-quic_mkshah@quicinc.com> <CAD=FV=XWH+Eoa9XjDns--NSDTZHeUwTdrX_r_QZhSPpbZNwz+w@mail.gmail.com>
 <20240315152431.sckqhc6ri63blf2g@bogus> <CAD=FV=UD1nuxryvWH=Mi7E+QzMoa7xCHebY0DtZCAVmEW3ZeAg@mail.gmail.com>
 <20240315172632.6zxwj4enq4tddbb3@bogus>
In-Reply-To: <20240315172632.6zxwj4enq4tddbb3@bogus>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 Mar 2024 10:31:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+d8E67fxk0FiLqp3bpR4ZCEB1+bN21V3Lw_XA5JNQag@mail.gmail.com>
Message-ID: <CAD=FV=X+d8E67fxk0FiLqp3bpR4ZCEB1+bN21V3Lw_XA5JNQag@mail.gmail.com>
Subject: Re: [RESEND v4 3/3] arm64: dts: qcom: sc7280: Add power-domains for
 cpuidle states
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Maulik Shah <quic_mkshah@quicinc.com>, andersson@kernel.org, ulf.hansson@linaro.org, 
	swboyd@chromium.org, wingers@google.com, daniel.lezcano@linaro.org, 
	rafael@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, jwerner@chromium.org, 
	quic_lsrao@quicinc.com, quic_rjendra@quicinc.com, devicetree@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 15, 2024 at 10:26=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com=
> wrote:
>
> On Fri, Mar 15, 2024 at 10:12:12AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Mar 15, 2024 at 8:24=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.=
com> wrote:
> > >
> > > On Thu, Mar 14, 2024 at 04:20:59PM -0700, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Mon, Jul 3, 2023 at 1:56=E2=80=AFAM Maulik Shah <quic_mkshah@qui=
cinc.com> wrote:
> > > > >
> > > > > Add power-domains for cpuidle states to use psci os-initiated idl=
e states.
> > > > >
> > > > > Cc: devicetree@vger.kernel.org
> > > > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 98 +++++++++++++++++++++-=
------
> > > > >  1 file changed, 73 insertions(+), 25 deletions(-)
> > > >
> > > > FWIW, I dug up an old sc7280-herobrine board to test some other cha=
nge
> > > > and found it no longer booted. :( I bisected it and this is the cha=
nge
> > > > that breaks it. Specifically, I can make mainline boot with:
> > > >
> > > > git revert --no-edit db5d137e81bc # arm64: dts: qcom: sc7280: Updat=
e
> > > > domain-idle-states for cluster sleep
> > > > git revert --no-edit 7925ca85e956 # arm64: dts: qcom: sc7280: Add
> > > > power-domains for cpuidle states
> > > >
> > >
> > > IIRC, this could be issue with psci firmware. There were some known
> > > issues which were discussed few years back but I am not aware of the
> > > details and if/how it is applicable here.
> > >
> > > Not sure if you are getting any logs during the boot, if you do have
> > > worth look at logs related to PSCI/OSI/Idle/...
> >
> > Given that the new firmware fixes it I'm going to say it's not worth
> > looking into any longer.
> >
>
> But it would be good to know if that is the exact reason, see if it can
> be upgraded, or else we can disable them by default. The bootloader or
> something else can detect the f/w version and enable them so that the
> board with old f/w(if can't be upgraded) can still be used.
>
> Otherwise it is a regression IMO.

I think it only would really matter if the problematic firmware
actually made it out into the real world. In this case the only people
who run into this are developers at Google and Qualcomm who had early
versions of hardware and had old firmware sitting around on them. I
can count the number of folks affected on one hand, and that's even if
one of my fingers gets cut off. All of those folks can just upgrade
their firmware since there is no downside in doing so.

-Doug

