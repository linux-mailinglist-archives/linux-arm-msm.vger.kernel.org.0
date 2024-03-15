Return-Path: <linux-arm-msm+bounces-14268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF39787D285
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 18:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CA961C20A5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 17:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED8145034;
	Fri, 15 Mar 2024 17:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UYrkcpq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8320F4596F
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 17:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710522754; cv=none; b=dQF9KAqIZ/0ZDYlfl+Q/H5zOQ2OMx810nd3RXNtjj+pKbzEpR1x7A9tPugJJI7ereQ25DgdlUtiMr9nD1yS5aoPDeONDKFLlWufhK1LoM7bBUXskBE5iF3OEfD5fweauGaQ/Jq4pAxZ1SsgSywbx+fYUufNqghTwP933FyjFBiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710522754; c=relaxed/simple;
	bh=kWzlo4AaZeWtEkzCy8TJZmtsYDqVVCm/XwSPAebW3DI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkimfYYr79nfiwweiPIWgnLoCC832UhYIcAelt721KzyOO072bsJd1tNxQbOAVxWUTfmOP4ix0zWfRdV0eiEIEzcBD+7rLXiXkK85UJIpTTnxMeySQoThfUt8xKDJFzFQyOZTrIyI9EWMlVM863YSmMBbQWHOdAQ70HIHht09SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UYrkcpq0; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-430b72a0033so2941731cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 10:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710522749; x=1711127549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBgzsheMyMt2wDXPPT0VYLjrPGEmgjQ97XLNs9yUYLg=;
        b=UYrkcpq0VM8HGji3C4iHBLJv21E63ItbM0s3Ps427+e2CevGvaf7hw8BHwggdmFLwQ
         /F/M6f/mJAOIstrCnc3/gZpXxdlWc9yVFOmYV2JyEVogzFk5emX0whAAk3Ut0J3qtnEO
         efEVWyLfOYKtPjPsK3pBgrrztOXGktv5PPz34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710522749; x=1711127549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBgzsheMyMt2wDXPPT0VYLjrPGEmgjQ97XLNs9yUYLg=;
        b=OjPrRxYXufGb9wBIw6N4h1tv2voXc0tH0hQBVp4dxAnsVUpdUhKZvRlZd1igCm5js7
         NKHb6vY5llQGNB1U1Z18O4FhirG4yvtdIaZieus4cD1wJIve4gHdHIGrRCZImzAnkJ1n
         2sYtF0q2fN7VZJrJ5bSsUAceDIDDhp0KszoApukMp9ZMoBf5v7dI2I96IYNJ3VPzONuH
         WWusxjHwZlTqVrCCOYOui5C0ku8iHKpvYV5JyeOPLzDPBZK1sEM3w6x5zpyQbznNcNXI
         aGOjvz5zeMurfcGHtacJYkNAzyEsAoPl2roAONtSzvaMp0TEpOUO+jKvPfMPIhPyPWpc
         +itg==
X-Forwarded-Encrypted: i=1; AJvYcCXG8DuujL8q0fL+o2LCmaKqcGNQp//oCLW10lYm66NV2Em7Wmn39XMYDIdN1wkVnKxTBxtn5xsgO6jYFOyv7cy8xmJl7x2/3+1acgNrGg==
X-Gm-Message-State: AOJu0Yz1mPBFgqorDB1IIwBSiDr/topupEWdSaBlObqyQgsPHJiizKX5
	sXBd+tHvRleNPtCbXL4pC0CgoAmQvcMUuCTRQg+nJUdYOwEa58m5Gaj51gC3m7K/aoThGc1uCaY
	=
X-Google-Smtp-Source: AGHT+IGZX9gbZW56x+TaBFR8MCyBk5gyOW3Er0OR4bbxjGq2oWFQwb+fKv+iC6FtXrPWuAQ706Drow==
X-Received: by 2002:a05:622a:164b:b0:42e:e12f:ee30 with SMTP id y11-20020a05622a164b00b0042ee12fee30mr5543837qtj.33.1710522749505;
        Fri, 15 Mar 2024 10:12:29 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id hf21-20020a05622a609500b00430b74c1661sm412262qtb.97.2024.03.15.10.12.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 10:12:28 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-42ee0c326e8so9531cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 10:12:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgX3lbTUjCt/XSe5B3AlyBk8AI9bk8P8o/7CT92fY+DnUJTbH6XbjS49GWqxL+PVkCuncb564L5boDw1i+zFs34eVy/PQD0htYemUmiA==
X-Received: by 2002:a05:622a:1706:b0:42f:a3c:2d53 with SMTP id
 h6-20020a05622a170600b0042f0a3c2d53mr822108qtk.20.1710522747755; Fri, 15 Mar
 2024 10:12:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230703085555.30285-1-quic_mkshah@quicinc.com>
 <20230703085555.30285-4-quic_mkshah@quicinc.com> <CAD=FV=XWH+Eoa9XjDns--NSDTZHeUwTdrX_r_QZhSPpbZNwz+w@mail.gmail.com>
 <20240315152431.sckqhc6ri63blf2g@bogus>
In-Reply-To: <20240315152431.sckqhc6ri63blf2g@bogus>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 Mar 2024 10:12:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UD1nuxryvWH=Mi7E+QzMoa7xCHebY0DtZCAVmEW3ZeAg@mail.gmail.com>
Message-ID: <CAD=FV=UD1nuxryvWH=Mi7E+QzMoa7xCHebY0DtZCAVmEW3ZeAg@mail.gmail.com>
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

On Fri, Mar 15, 2024 at 8:24=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com>=
 wrote:
>
> On Thu, Mar 14, 2024 at 04:20:59PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Jul 3, 2023 at 1:56=E2=80=AFAM Maulik Shah <quic_mkshah@quicinc=
.com> wrote:
> > >
> > > Add power-domains for cpuidle states to use psci os-initiated idle st=
ates.
> > >
> > > Cc: devicetree@vger.kernel.org
> > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 98 +++++++++++++++++++++-----=
--
> > >  1 file changed, 73 insertions(+), 25 deletions(-)
> >
> > FWIW, I dug up an old sc7280-herobrine board to test some other change
> > and found it no longer booted. :( I bisected it and this is the change
> > that breaks it. Specifically, I can make mainline boot with:
> >
> > git revert --no-edit db5d137e81bc # arm64: dts: qcom: sc7280: Update
> > domain-idle-states for cluster sleep
> > git revert --no-edit 7925ca85e956 # arm64: dts: qcom: sc7280: Add
> > power-domains for cpuidle states
> >
>
> IIRC, this could be issue with psci firmware. There were some known
> issues which were discussed few years back but I am not aware of the
> details and if/how it is applicable here.
>
> Not sure if you are getting any logs during the boot, if you do have
> worth look at logs related to PSCI/OSI/Idle/...

Given that the new firmware fixes it I'm going to say it's not worth
looking into any longer.

-Doug

