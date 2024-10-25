Return-Path: <linux-arm-msm+bounces-35857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 901609B0171
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 13:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E450283EC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 11:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8742003BC;
	Fri, 25 Oct 2024 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qo853Jkt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B4D1E2602
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729856277; cv=none; b=FaIn7dz1Yi7dq3PEorIspg+xeYhK7c/MtvgJipysS1BpNghHIXzmQjGGhTWS4RFDpFL0G8OIXmOr4tXddRCfh/BkfBBEWOcpKGpyfIb+vVn7Iq7xDn/LHFRaSg59Sz8AVKIXMBXlQw7/LTyczWWS/1BNEEnQqh892X+tvSU2wj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729856277; c=relaxed/simple;
	bh=JBPlVg6/v6xkLhr502ea/jDXXq8F1N17DPmNfwDEhpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pPdyBaFaMVzm0lsDzK8LLKeqCA5mJSWE3b6OF4UPl22rMnv8R6W+5Me933zX6/mWhsl0ix9mCb5bgmoEBlC8AQwBlaUy0qA0PTliyGsUUPLOlcIYH/Pe13gZckZ85j6YZa2PVdBxsl7gLcKHJjAjLjvx1huti/gwZ2L447Dsn+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qo853Jkt; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so19099877b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 04:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729856274; x=1730461074; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0pj9tzR92Ou3K3UATrngQxHQphalhdLPCHq3UGtO/E=;
        b=Qo853Jkth6Akaaga1PorJMmHjiMhl/g6rThlGOLI4mF3mRacS8itmWlCGweX5Uid58
         4X75YTCyKxcimI2WUdVv+OpeFySkqf2ImkICbFnGA/EbC2B+mPe/OxiEZ+q9sZaEVD5Q
         4vQCqoRZCtxuiAaiMownF1vbofYJnlNNhkmofQChfLw66+HdEh47MmIObsNUyacNLQPF
         vOooRV54V3ARgVvjs/ibK48Ag7JWS+uTZv7G2+OapNFZv0RXA41DyLYN+fgjlBzUf3rt
         izl3+N6PVs/0FQzBMAGB28sl4hiYEQWtEBu7V0Dkbqxtz35Avolpi+yB2gYTa4xDLUn+
         UAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729856274; x=1730461074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0pj9tzR92Ou3K3UATrngQxHQphalhdLPCHq3UGtO/E=;
        b=qxBXoxcmWSQYYRb125R39bPQ1nTXtuEMXckN2YlAZGMmtbr45+kuJJidoxtOubg0pO
         YFkvbw9jcAWQfX+X6SjYA3sG+K6yrEyE6gNTYplHN6OheN8ylEabgmle5SsXzcKsgte6
         HLEUlLNoOHHYsyOqsBYxeGYB6MnTuqOMNihshXvFygN5cNkGM3gvd2PtDg5QLuYRxtFv
         pDj4L1cnphuPdazaBQZR5sP9ls2ukzcxSfuR0XbD/X3xSZlehIm0JfbcrqmvudzkMoQZ
         b5AMqCy67Qi2bHfx2+Yq9tnihwZ7rBIuvXZJ7QfLr/iKIcBaP2u5iHWOqQV7hGpY7Jfm
         jgsg==
X-Forwarded-Encrypted: i=1; AJvYcCWEcQV+XuHYck53STmHZhgSVMLz7IkjU4bENg0XDqJGxuOO5J0nkhy0jqWoFOPzNGV+4xfSEaq0Yxwl5pVl@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+424XIwSbYGAonsXYav6UDeHkwtyQYN8I38KYKPwfjhLGz10
	doZhhvesjjgm6GQfHitkL1DspNMeOOcfe/raXNRpXCRts44wQGNjYwYr/rj+IMrcHD/SGgYMfTT
	JwaksfSIY7z32AJDE8DZJ4KVXrO4kZMlc65oh8A==
X-Google-Smtp-Source: AGHT+IFD7BTwdcuI9robY2MpZ2IUhz+lf5Zd1wfHJA/mGIwmXrFvkZLAnH4rQ6mJPWdfJLOdnu4/9FdSj1zt0edPMB0=
X-Received: by 2002:a05:690c:4b0a:b0:6e7:d974:8d05 with SMTP id
 00721157ae682-6e858152039mr66322057b3.4.1729856274035; Fri, 25 Oct 2024
 04:37:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007060642.1978049-1-quic_sibis@quicinc.com>
 <ZwfsmqInJlqkQD_3@hovoldconsulting.com> <ae5eaef9-301f-7d3f-c973-faa22ae780ee@quicinc.com>
 <ZxkjqEmkBAsC6UkL@hovoldconsulting.com> <c8e7420b-a7b4-89cd-1b6e-c1f6693c062d@quicinc.com>
 <ik4dyfbphm7lkeipm2dbr7cmdfxewxd4jtuz2jfnscfwcyo2r4@lrin5hnsqvyd>
 <83b635a7-fc69-7522-d985-810262500cb3@quicinc.com> <CAA8EJppx1OmYnfSsMDebRRTbNb3dfAE_MM55T1SpLccP=s_K1A@mail.gmail.com>
 <Zxty8VaMPrU3fJAN@pluto>
In-Reply-To: <Zxty8VaMPrU3fJAN@pluto>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 14:37:42 +0300
Message-ID: <CAA8EJpp-2UhcGSZwVmggVcqtM8acrHKX3WijdfiY_bJo2v+LfA@mail.gmail.com>
Subject: Re: [PATCH V3 0/4] firmware: arm_scmi: Misc Fixes
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, sudeep.holla@arm.com, 
	ulf.hansson@linaro.org, jassisinghbrar@gmail.com, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	konradybcio@kernel.org, linux-pm@vger.kernel.org, tstrudel@google.com, 
	rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Oct 2024 at 13:29, Cristian Marussi <cristian.marussi@arm.com> wrote:
>
> On Fri, Oct 25, 2024 at 01:11:37PM +0300, Dmitry Baryshkov wrote:
> > On Fri, 25 Oct 2024 at 09:46, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > >
> > >
> > >
> > > On 10/25/24 11:44, Dmitry Baryshkov wrote:
> > > > On Fri, Oct 25, 2024 at 11:38:36AM +0530, Sibi Sankar wrote:
> > > >>
> > > >>
> > > >> On 10/23/24 21:56, Johan Hovold wrote:
> > > >>> On Wed, Oct 23, 2024 at 01:16:47PM +0530, Sibi Sankar wrote:
> > > >>>> On 10/10/24 20:32, Johan Hovold wrote:
> > > >>>>> On Mon, Oct 07, 2024 at 11:36:38AM +0530, Sibi Sankar wrote:
> > > >>>>>> The series addresses the kernel warnings reported by Johan at [1] and are
> > > >>>>>> are required to X1E cpufreq device tree changes [2] to land.
> > > >>>>>>
> > > >>>>>> [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> > > >>>>>> [2] - https://lore.kernel.org/lkml/20240612124056.39230-1-quic_sibis@quicinc.com/
> > > >>>>>>
> > > >>>>>> The following warnings remain unadressed:
> > > >>>>>> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > >>>>>> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > >>>>>
> > > >>>>> Are there any plans for how to address these?
> > > >>>
> > > >>>> Sorry missed replying to this. The error implies that duplicate
> > > >>>> opps are reported by the SCP firmware and appear once during probe.
> > > >>>
> > > >>> I only see it at boot, but it shows up four times here with the CRD:
> > > >>
> > > >> https://lore.kernel.org/lkml/d54f6851-d479-a136-f747-4c0180904a5e@quicinc.com/
> > > >>
> > > >> As explained ^^, we see duplicates for max sustainable performance twice
> > > >> for each domain.
> > > >
> > > > If existing products were shipped with the firmware that lists single
> > > > freq twice, please filter the frequencies like qcom-cpufreq-hw does.
> > >
> > > That was a qualcomm specific driver and hence we could do such
> > > kind of filtering. This however is the generic scmi perf protocol
> > > and it's not something we should ever consider introducing :/
> >
> > This depends on the maintainer's discretion.
> >
> > >
> > > >
> > > >>
> > > >>>
> > > >>> [    8.098452] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > >>> [    8.109647] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > >>> [    8.128970] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > >>> [    8.142455] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > >>>
> > > >>>> This particular error can be fixed only by a firmware update and you
> > > >>>> should be able to test it out soon on the CRD first.
> > > >>>
> > > >>> Can you explain why this can only be fixed by a firmware update? Why
> > > >>> can't we suppress these warnings as well, like we did for the other
> > > >>> warnings related to the duplicate entries?
> > > >>>
> > > >>> IIUC the firmware is not really broken, but rather describes a feature
> > > >>> that Linux does not (yet) support, right?
> > > >>
> > > >> We keep saying it's a buggy firmware because the SCP firmware reports
> > > >> identical perf and power levels for the additional two opps and the
> > > >> kernel has no way of treating it otherwise and we shouldn't suppress
> > > >> them. Out of the two duplicate opps reported one is a artifact from how
> > > >> Qualcomm usually show a transition to boost frequencies. The second opp
> > > >> which you say is a feature should be treated as a boost opp i.e. one
> > > >> core can run at max at a lower power when other cores are at idle but
> > > >> we can start marking them as such once they start advertising their
> > > >> correct power requirements. So I maintain that this is the best we
> > > >> can do and need a firmware update for us to address anything more.
> > > >
> > > > Will existing shipping products get these firmware updates?
> > >
> > > They are sure to trickle out but I guess it's upto the oem
> > > to decide if they do want to pick these up like some of the
> > > other firmware updates being tested only on CRD. Not sure why
> > > warnings duplicates should block cpufreq from landing for x1e
> > > but if that's what the community wants I can drop reposting
> > > this series!
> >
> > No, the community definitely wants to have cpufreq for X1E.
> > But at the same time some reviewers prefer to have a warning-free boot
> > if those warnings can't be really fixed. I don't have such a strict
> > position, but I'd prefer to see those messages at dev_info or dev_dbg
> > level.
>
> I think dev_info could be an option from the SCMI perspective (as per my
> other mail), the important thing in these regards is to NOT go
> completely silent against fw anomalies...to avoid the the risk of being
> silently ignored .... I'll see what Sudeep thinks about...

Absolutely. SCMI layer knows that such a problem might exist and knows
how to handle it, so it should bug the user in a polite way.

-- 
With best wishes
Dmitry

