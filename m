Return-Path: <linux-arm-msm+bounces-40512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 467F19E577D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 14:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 219F9162536
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 13:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DD4218AD1;
	Thu,  5 Dec 2024 13:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pSeNvS1F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CC820D51C;
	Thu,  5 Dec 2024 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406273; cv=none; b=VLb6t9Ji8OMUAjhv3EvSE1YeqJvgCqW2cY6CCeGRMe+EDB5xHjfB+61cnUCx02kdsfIaEpIv+MjPBxjVk0m4rZ6fGBHzmaFibSKMlQ8StejnXjQB9YlqBfD/tA3+GAZfJMlnWDfpI1uPyzVeq3KmUsW/uMKQCYBJJLcNgHT+l9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406273; c=relaxed/simple;
	bh=7qd9ukMCfLX+3kIyTtuM6RCc1gUTy6aBIeGgFPUmZM0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AL/wdvFtUawH28VwBVeFv3UIutRhmp3EPcq+QQybf7e7o64ZSieItiBXbTnvoOnSddKYUJ35yzxpE6xljkk08UP0QBAOCs4YYi3YdZZUg87q49y0rlvbVyBH4Ht855lf0zYLoZDIgJnmXsIF0OoELgOulhj4zIHZ+fIUrQCcNO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pSeNvS1F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549C1C4CED1;
	Thu,  5 Dec 2024 13:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733406273;
	bh=7qd9ukMCfLX+3kIyTtuM6RCc1gUTy6aBIeGgFPUmZM0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pSeNvS1FGTNF5y+od7mzfK7pk/9WxWuXPQzi5NTurX7TbotP1nEyp4F5v7XRqrxPR
	 mbvo8QpaSWo6Hv2U2yVX62Y3jZ08zySNZCnsm6MZJjpzYxcQSpVJ1Waax48jqmKk7G
	 KYEyoRgvQL6th3hJXwVQfUALAF6GvNHF0m1ifjOos0D4/0cIgPhJdEIPhK878NiF70
	 IrmC4lmAogYFGHxJoVQEIIkj3XZjXN5zZRowgyyTij6G/GNKJhgg7zVTznDNuGSnYR
	 46xfspmrtQtnhxJalP4uu5iAR8qjVpnsJFI2uj9f9joXux+jFlO1HXdUk+IiX0e+vf
	 mS/YiKUQV1I6w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tJC9f-000pdd-5a;
	Thu, 05 Dec 2024 13:44:31 +0000
Date: Thu, 05 Dec 2024 13:44:30 +0000
Message-ID: <86frn2tfb5.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>,
	<sudeep.holla@arm.com>,
	<cristian.marussi@arm.com>,
	<andersson@kernel.org>,
	<konrad.dybcio@linaro.org>,
	<robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>,
	<dmitry.baryshkov@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<quic_rgottimu@quicinc.com>,
	<quic_kshivnan@quicinc.com>,
	<conor+dt@kernel.org>,
	<quic_nkela@quicinc.com>,
	<quic_psodagud@quicinc.com>,
	<abel.vesa@linaro.org>
Subject: Re: [PATCH V7 0/2] qcom: x1e80100: Enable CPUFreq
In-Reply-To: <0fd14fb1-736d-cf7f-128f-658bda0de583@quicinc.com>
References: <20241030130840.2890904-1-quic_sibis@quicinc.com>
	<ZyTQ9QD1tEkhQ9eu@hovoldconsulting.com>
	<86plnf11yf.wl-maz@kernel.org>
	<ZyTjiiGc2ApoID9Y@hovoldconsulting.com>
	<86o72z10b6.wl-maz@kernel.org>
	<ZypOY-NCDN9fdMAR@hovoldconsulting.com>
	<86ed3p1rdq.wl-maz@kernel.org>
	<0fd14fb1-736d-cf7f-128f-658bda0de583@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: quic_sibis@quicinc.com, johan@kernel.org, sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org, quic_nkela@quicinc.com, quic_psodagud@quicinc.com, abel.vesa@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Thu, 05 Dec 2024 11:23:05 +0000,
Sibi Sankar <quic_sibis@quicinc.com> wrote:
> 
> 
> 
> On 11/5/24 23:42, Marc Zyngier wrote:
> > On Tue, 05 Nov 2024 16:57:07 +0000,
> > Johan Hovold <johan@kernel.org> wrote:
> >> 
> >> On Fri, Nov 01, 2024 at 02:43:57PM +0000, Marc Zyngier wrote:
> >>> On Fri, 01 Nov 2024 14:19:54 +0000,
> >>> Johan Hovold <johan@kernel.org> wrote:
> >> 
> >>>> The side-effects and these remaining warnings are addressed by this
> >>>> series:
> >>>> 
> >>>> 	https://lore.kernel.org/all/20241030125512.2884761-1-quic_sibis@quicinc.com/
> >>>> 
> >>>> but I think we should try to make the warnings a bit more informative
> >>>> (and less scary) by printing something along the lines of:
> >>>> 
> >>>> 	arm-scmi arm-scmi.0.auto: [Firmware Bug]: Ignoring duplicate OPP 3417600 for NCC
> >>>> 
> >>>> instead.
> >>> 
> >>> Indeed. Seeing [Firmware Bug] has a comforting feeling of
> >>> familiarity... :)
> >>> 
> >>> I wonder whether the same sort of reset happen on more "commercial"
> >>> systems (such as some of the laptops). You expect that people look at
> >>> the cpufreq stuff closely, and don't see things exploding like we are.
> >> 
> >> I finally got around to getting my Lenovo ThinkPad T14s to boot (it
> >> refuses to start the kernel when using GRUB, and it's not due to the
> >> known 64 GB memory issue as it only has 32 GB)
> > 
> > <cry>
> > I know the feeling. My devkit can't use GRUB either, so I added a
> > hook to the GRUB config to generate EFI scripts that directly execute
> > the kernel with initrd, dtb, and command line.
> > 
> > This is probably the worse firmware I've seen in a very long while.
> 
> The PERF_LEVEL_GET implementation in the SCP firmware side
> is the reason for the crash :|, currently there is a bug
> in the kernel that picks up index that we set with LEVEL_SET
> with fast channel and that masks the crash. I was told the
> crash happens when idle states are enabled and a regular
> LEVEL_GET message is triggered from the kernel. This was
> fixed a while back but it will take a while to flow back
> to all the devices. It should already be out CRD's.

But this fix will never reach some platforms, such as the devkit, and
we cannot mandate that people update to the latest anyway. How do we
distinguish between good and bad firmware versions?

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

