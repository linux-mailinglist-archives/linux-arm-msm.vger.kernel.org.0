Return-Path: <linux-arm-msm+bounces-112649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JvJHJ1F2KmoEpwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:48:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 917F166FFF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:48:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=xt+a+wwd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112649-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112649-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31CEB3002B78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426DC1DDC07;
	Thu, 11 Jun 2026 08:48:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53593D76
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:48:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167692; cv=none; b=POSMZIB/5kGehKz4VOYM0zA4v4Dj0vhUe3LVK01DWCuJS8Ma9PwrXUpm3alHLGbWbP1a/qMjULsySataRw1Zw6bykXZsbZC73Ajznewt+zs/oNaVoZmHiIbbctAkm8G+7Yp0ft788uiOJPcj+nZgYPH6//iKLPypw3XHfe9OVPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167692; c=relaxed/simple;
	bh=9AUwQ3mAjaUzASkscEHhxUr9r89icZFTLgtNq1oEY04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hs0J5UMx4s6t7QFlpqZDm6u+/KFgLz2RbJfb5gI+YKvvlwSMwuRLezdOBFa7Cg7tqvQu5N4DxY9Wf/yC1V/HRbyLgYifgYLBSffDmRcpjbYajHI5lsAfW+4uEBbSGt4c9+LmgIFPPy26wvMp/BX7rVUGildXWx7jamqrHQhIOA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xt+a+wwd; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef616daf6so7191701f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 01:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781167689; x=1781772489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OArZmZCBEmYP7y3bIIzOW7qMmS8JsL1mct+2P0vjlgA=;
        b=xt+a+wwdcdMJduVdfi1s+DoYVu354HGj5gRtMjg1xba1mrCC2mE9ELHU64OmfHGZBn
         sflAjdb/4GXMNwYKRtIP3DJIpcgoKbeKm9h8bWVISTbxZapeGcPLsGecGwCG5W2mppvb
         83u8C7k+J4tF8mZacOzY/pZ7Y+Yjb2R1DxN7c/JIescbyRDLeQ+ex/8l73+cc0lP026w
         TzosDI+2N6Cf0YXnnAsvotiqJklKnJHvZD468/4JI8IsLxTXlvBhLT3jjQu8RhWRbV4E
         Jb1Xc1VaMSLVUJXATWbvYnCRbwSzI4ZXze5Ik41fq02TepkjAtelPuDcvQYfDtrkBOtP
         U60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167689; x=1781772489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OArZmZCBEmYP7y3bIIzOW7qMmS8JsL1mct+2P0vjlgA=;
        b=sPGTlSx/y8u9lB7DMwFSC9SNMjwnYpywpD7XjWxhF9gTLRT/IGrKgye6r/UfhaMghS
         5gf4OVb6EzMoQ+nyIDWppqsKTr9d86oNJkykeplHaO3SH7YwBaduMyvcdVRr6p5a2oVw
         HZFngn+EafeHgWGrqTBQIFkBgtu5V+rDjAAv4Pr/b896Bwapalur3EDep20Niwmet4Iv
         zjzofbMVSby5+2Ny4PbhpYIZkkU4yt1n18ARl+jvDXmBAPcP1pJwZO6P6QjMuGZgmMuy
         q7Li1LZPZehGSzxAWQH8veeTp4mxhlnML7aFS/HZX7GpKs8cAznWqXteFfa/0Mc3z20k
         Isjw==
X-Forwarded-Encrypted: i=1; AFNElJ/Iz+1swkTxptIs0oujAymqsAFiQkbj2V2mqGsNajk+8anhOiN9O3g1F8ehmxUnb7ZdfOUM7WN/0VpNaNcg@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJTcAnzNkj/rWsRDj8Osbd31/TRdmxiaeDhC0LhFUZNCdZAu7
	Ws8Pz5Oa9bve4+jk94mVDW8wV/sl59mcNPAbny0KGUour3/xu45pns8Ul9sFbbLu3fo=
X-Gm-Gg: Acq92OEyBJAa4vpN0yoZmCM45Pf29ILjzhgAWoonYW/Gnzs1gF8aYMBmo/6MYHhKBKJ
	xu/5CWT51ZohAkP2OG3ZWI/GL7zQlnvJxGXS6KlJQe2rQHJJwaOIGmKkgSXy5WVaSQnRgHemkNX
	mPuiagJqtPUB4IyAw0Tu1AiXfiCu9NPmCktF8sWfB15HH4JByIgng2BrLu4eG6NIVkQo7VxzKPg
	e7pl5iQrTtfgcHmoESvYKh9Fbq1nmaxzTPjcp5rb3Tt2UgrtcTMiB+DkIyTpl/gvwV5EhvvvIJ8
	xOuyg8LJjx6BL3jxEiA4DqHLbumeW3/U0O35f6kY7ymq4FyKVNwrJH0WAjqORZWoeLLri2Vk7To
	rxh0ZFF7BmvFnbvRxBxRBhfQ1sG5vK56RAZ+oO1pxl/NMXMpvMSJxe8IfwrSjQGUgfoTf17XQJ5
	ZRmUjeTM+WK50KEv+OKwnEKOyNVy9wmqzWRquPPiRZQ5UUKg==
X-Received: by 2002:a5d:5989:0:b0:460:1f32:628d with SMTP id ffacd0b85a97d-46067598f37mr2701664f8f.11.1781167689135;
        Thu, 11 Jun 2026 01:48:09 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:7bb1:6476:9114:cf39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm80809393f8f.3.2026.06.11.01.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:48:08 -0700 (PDT)
Date: Thu, 11 Jun 2026 10:47:58 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Jack Matthews <jack@jackmatthe.ws>
Subject: Re: [PATCH 0/2] clocksource/drivers/arm_arch_timer_mmio: Restore
 support for early init
Message-ID: <aip2Pnmi-LJPKwW7@linaro.org>
References: <20260610-arm-arch-timer-mmio-early-v1-0-ac17218ec8b4@linaro.org>
 <87se6t8q3s.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87se6t8q3s.wl-maz@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-112649-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:mark.rutland@arm.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:sudeep.holla@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jack@jackmatthe.ws,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 917F166FFF7

On Thu, Jun 11, 2026 at 08:59:19AM +0100, Marc Zyngier wrote:
> On Wed, 10 Jun 2026 18:53:09 +0100,
> Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> > 
> > Jack reported a regression for some single-core Qualcomm platforms (e.g.
> > MDM9625, MDM9607) that no longer boot because no timers can be found during
> > early boot [1].
> 
> Again, this is *not* a regression. These machines were *never*
> supported upstream.
> 

Sorry, I'll reword this next time. MDM9607 does have all required
drivers and compatibles upstream already and is just missing the actual
DT so it does feel somewhat supported to me, but I'm fine treating this
as a feature extension without stable backporting etc.

> > These platforms rely on an obscure timer setup where the
> > global Arm MMIO timer (arm,armv7-timer-mem) is used as the only available
> > timer for the CPU. This setup used to work fine until commit 0f67b56d84b4
> > ("clocksource/drivers/arm_arch_timer_mmio: Switch over to standalone
> > driver") when the early timer initialization using TIMER_OF_DECLARE() was
> > removed when moving to the standalone MMIO driver.
> > 
> > There doesn't seem to be any other usable CPU timer on those platforms, so
> > this series restores the early timer support using TIMER_OF_DECLARE()
> > inside the new standalone arm_arch_timer_mmio driver. This is pretty ugly,
> > but I could not think of a better solution so far. I tried to keep the
> > ugliness for the two probe paths as limited as possible. :-)
> > 
> > If someone has a better idea how to solve this, I would be happy to try it.
> 
> I would suggest finding out what is the latest point in the init
> sequence where the timer can be probed without preventing boot.
> 

It doesn't get far without having any timer:

[    0.000000] timer_probe: no matching timers found
[    0.000000] entering initcall level: console
[    0.000000] calling  con_init+0x0/0x354 @ 0
[    0.000000] Console: colour dummy device 80x30
[    0.000000] initcall con_init+0x0/0x354 returned 0 after 0 usecs
[    0.000000] sched_clock: 32 bits at 300 Hz, resolution 3333333ns, wraps every 7158278824300949ns
[    0.000000] Calibrating delay loop... 
<board hangs>

If you look at start_kernel() in init/main.c it's basically time_init()
that would normally probe the TIMER_OF_DECLARE() timers and
calibrate_delay() that needs some timer to finish. There is also
random_init() that comes directly after time_init(), which already wants
to have access to timestamp counters. I don't see any other suitable
place to hook into. :-/

I also don't see any other timer we could use, at least for MDM9625.
It's a single-core Cortex-A5 and the downstream kernel defines only the
arm,armv7-timer-mem, which seems to be used for everything... (The
situation for MDM9607 is a bit different, but not any less messy,
unfortunately.)

Thanks,
Stephan

