Return-Path: <linux-arm-msm+bounces-115190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WwvpNsyOQmrn9gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:27:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A096DCA57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:27:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=qez9R4fi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115190-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115190-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08AED305154A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FD24279FC;
	Mon, 29 Jun 2026 15:23:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CED13BB12D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 15:23:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746616; cv=none; b=L7Nfsi0dpu7IMdO3Wcfu/QqyqRwl6suT9HmPNdJELjmzidm7EJgL5lb44iFRjB9VEIHVX9/CnMpgjdMQfk833fFaSFgV5RboeP4ni40onGwtJTbWXK8tiKzpRhRg1HJEGEah58Aj/HvM9kZk0GQYPlXoPgUswjHIa3pjijxOblA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746616; c=relaxed/simple;
	bh=Kwv+lEW1l7OOXNGScK+aOMJb41HWj3Ip9JKH2JBcvBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cz8O6qQCUmqXhP+oNPlQhUpN2Z/yPn7+qu9QMYEv+8XdoXF14oH7nWIcdX31M8NvC2IoVGrK4QtQsBRtEiJCtw6H91jbNMHwWdhf1gDO/EIlJ+BDtEO2UCWzV/WrqD9GNEG56HUSNNzSjFw8UxZFD4u2ss9z6PEB03zGh1SDvsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qez9R4fi; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-46cbe01d4b6so2029808f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782746613; x=1783351413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PR93AUCuHx4BvFFne4zA1X1VhGPQ7Re4xvHDc2Jr1Is=;
        b=qez9R4fipZ0lDx7as4HtCkdfrPww9r+hrdamLgUZnCd1skcokKHslgfQRmqU3HNJ65
         TRLdZR2Q+YSHOPlhCpUF57xM6uP4U3tuoR8JErBmd0TvW38w8vOBgcNbv7dcKgniRZwO
         XE03qQRWZVrBXr0lsr+64WgI5+rZHyM+mahQD634dQAebC5ZL4ywSWaDKMhmIN7+AzRW
         ThHfQxUBwGgJGtj4R1HihsXu0GXlsJm3zZdgNJDofw4RZmHBy6qwFeCDKIFuR+68h/Td
         l4NDuQM8opunWcEG1XdI+sQ/GQWaRLritwk1aRIxx75wMjBmYhEXdFv41UQxcD6R9I1b
         iyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746613; x=1783351413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PR93AUCuHx4BvFFne4zA1X1VhGPQ7Re4xvHDc2Jr1Is=;
        b=NPTVTCayCDXWqmdxjAc7pZCoqBTZhFxpY8EnmCnt5ToAHaU/DmDDX23brgPfBHZcKp
         ER50HcEaB/MeZ7Ugw6cvN6ADvrG9Xm/1N1XghezeNJ2rx7/da9h71F4axO4+5LP5VqpX
         6YbKTBTP+Odu6Gdz5X1fuyXDBExGWZ/BrfqlMCkXcXSS3txUB6d1jVl50I1qdEWavrjY
         /+gteeS/5UKVb2ztLQaNLqjLc82gGQs/mETr4Tx7FuNcuLS3XHjbfWc9y0zJ5eNLeeZe
         Ug2fEuzym6Bj1Nh5i/VsuizEMC/+DkR61PlBauSpUiTKjJ9K1pent3UbwbFoTK2Nj69h
         7QVg==
X-Forwarded-Encrypted: i=1; AHgh+RoJgyoJZroIroqfR5V4Zskwy/C0fxCxeiXY//KcknA4crXKBxZxL1beYCFmIQtyjp4J/Jpll0CqPQVCRjZw@vger.kernel.org
X-Gm-Message-State: AOJu0YzXNZMqqDj8zxXi3IZQT6DKhLyiMYLMTNJtjMngT1aWKx25a62g
	xFcvyPm6ObLIWon3AKY0+GxCYM/6qO4iXh6QQCfKluN+DBHNskipAdgCvMKZHXB/UyU=
X-Gm-Gg: AfdE7ckxIFBdwuW9f6zDjhCLi4MW+/dDWYm85B8uadPg9zDwmvWIgO3C5bkr5qVS9Je
	Cd2sy4tVfLcxUgCbrZKj+bmx24qMi8GpaSSm7f/sTxN+4nHFUlDqfwWnU76SruNlT0neCQ2dDN2
	Dz4HQteuFRwbfXWlvJO6hqhgPvsmvbX8tZCFe93tpAryGGnLt7aYbwmL0DZmbA8BKa6ZBh1ivte
	qUVEolYxCCQV6bVc9dizsh2QJ4u7BNbMocZGeGltTMOK7le49yg/mALrxkc/xlLn90gBQ6EmftF
	+n6LD8Yfnxe708pQR1wJunH8hBwCxceWyKwHy84+EvhUHOwjNTGYs5PKI3qUJTsA7Ao/0y7JyIt
	5Bua7a4V8AzY/lu/cd7v5ikl0Yo7qjCPk4ITMs3tCbMovWnJmOJGNKw/+Zmx7Rm0yMk9iT2+P7Y
	NGG5hBZfCDrQ258w+7/C7q1xQ=
X-Received: by 2002:adf:ff89:0:b0:473:1706:7f01 with SMTP id ffacd0b85a97d-475017f6871mr1213528f8f.43.1782746613293;
        Mon, 29 Jun 2026 08:23:33 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:5f1:38dc:c145:9ce3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee018e8sm56854684f8f.11.2026.06.29.08.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:23:32 -0700 (PDT)
Date: Mon, 29 Jun 2026 17:23:28 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Jack Matthews <jack@jackmatthe.ws>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] clocksource/drivers/arm_arch_timer_mmio: Restore
 support for early init
Message-ID: <akKN8EKAOT7GTzdV@linaro.org>
References: <20260610-arm-arch-timer-mmio-early-v1-0-ac17218ec8b4@linaro.org>
 <87se6t8q3s.wl-maz@kernel.org>
 <aip2Pnmi-LJPKwW7@linaro.org>
 <87qzmd89ih.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzmd89ih.wl-maz@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-115190-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:mark.rutland@arm.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:sudeep.holla@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jack@jackmatthe.ws,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73A096DCA57

On Thu, Jun 11, 2026 at 02:57:42PM +0100, Marc Zyngier wrote:
> On Thu, 11 Jun 2026 09:47:58 +0100,
> Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> > 
> > On Thu, Jun 11, 2026 at 08:59:19AM +0100, Marc Zyngier wrote:
> > > On Wed, 10 Jun 2026 18:53:09 +0100,
> > > Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> > > > 
> > > > Jack reported a regression for some single-core Qualcomm platforms (e.g.
> > > > MDM9625, MDM9607) that no longer boot because no timers can be found during
> > > > early boot [1].
> > > 
> > > Again, this is *not* a regression. These machines were *never*
> > > supported upstream.
> > > 
> > 
> > Sorry, I'll reword this next time. MDM9607 does have all required
> > drivers and compatibles upstream already and is just missing the actual
> > DT so it does feel somewhat supported to me, but I'm fine treating this
> > as a feature extension without stable backporting etc.
> 
> "Supported" has a different definition for me. Cortex-A5 without the
> A9-style TWD was so far never seen in the wild. The Generic MMIO timer
> was introduced way after Cortex-A5 shipped, and was designed to work
> with the CPU timers, making this QCOM contraption a franken-hack.
> 
> So calling this supported is very much pushing the boundaries of what
> was supposed to be put together.
> 

Got it.

> >
> > > > These platforms rely on an obscure timer setup where the
> > > > global Arm MMIO timer (arm,armv7-timer-mem) is used as the only available
> > > > timer for the CPU. This setup used to work fine until commit 0f67b56d84b4
> > > > ("clocksource/drivers/arm_arch_timer_mmio: Switch over to standalone
> > > > driver") when the early timer initialization using TIMER_OF_DECLARE() was
> > > > removed when moving to the standalone MMIO driver.
> > > > 
> > > > There doesn't seem to be any other usable CPU timer on those platforms, so
> > > > this series restores the early timer support using TIMER_OF_DECLARE()
> > > > inside the new standalone arm_arch_timer_mmio driver. This is pretty ugly,
> > > > but I could not think of a better solution so far. I tried to keep the
> > > > ugliness for the two probe paths as limited as possible. :-)
> > > > 
> > > > If someone has a better idea how to solve this, I would be happy to try it.
> > > 
> > > I would suggest finding out what is the latest point in the init
> > > sequence where the timer can be probed without preventing boot.
> > > 
> > 
> > It doesn't get far without having any timer:
> > 
> > [    0.000000] timer_probe: no matching timers found
> > [    0.000000] entering initcall level: console
> > [    0.000000] calling  con_init+0x0/0x354 @ 0
> > [    0.000000] Console: colour dummy device 80x30
> > [    0.000000] initcall con_init+0x0/0x354 returned 0 after 0 usecs
> > [    0.000000] sched_clock: 32 bits at 300 Hz, resolution 3333333ns, wraps every 7158278824300949ns
> > [    0.000000] Calibrating delay loop... 
> > <board hangs>
> >
> 
> This is nothing that "lpj=[some value]" on the command line can't help
> getting past.
> 
> > If you look at start_kernel() in init/main.c it's basically time_init()
> > that would normally probe the TIMER_OF_DECLARE() timers and
> > calibrate_delay() that needs some timer to finish. There is also
> > random_init() that comes directly after time_init(), which already wants
> > to have access to timestamp counters. I don't see any other suitable
> > place to hook into. :-/
> 
> None of that should be a problem. I can boot a hacked arm64 kernel
> without any timer all the way to the point where it is waiting for a
> tick to enter the scheduler and run userspace. There's no reason why
> 32bit can't do something similar. Heck, 32bit doesn't even have a
> standard timer to rely on, so that's very much possible to do.
> 
> Can you at least give it a try?
> 

Thanks for the suggestion and sorry for the delay! I started testing
this, but then ran out of time before my vacation when trying to get the
CP15 timer working on the Cortex-A7.

With lpj=2658304, it proceeds until raid6_select_algo for me with my
current kernel config. I probably don't need the raid6 stuff on this
platform. Also, raid6_select_algo is subsys_initcall() so if I move
arm_arch_timer_mmio to core_initcall() instead of
builtin_platform_driver() (device_initcall()) it does indeed boot
successfully to the userspace login with the lpi= parameter. Nice!

> > 
> > I also don't see any other timer we could use, at least for MDM9625.
> > It's a single-core Cortex-A5 and the downstream kernel defines only the
> > arm,armv7-timer-mem, which seems to be used for everything... (The
> > situation for MDM9607 is a bit different, but not any less messy,
> > unfortunately.)
> 
> MDM9607 appears to be a Cortex-A7, so it *definitely* has all the
> bells and whistles that we need. The DT I found doesn't make describe
> the timer, but it is absolutely part of the CPU.
> 

The CP15 timer is indeed *definitely* there for the Cortex-A7 in
MDM9607, but it's also *definitely* not working for me ... :(

As you saw, it's not documented anywhere for MDM9607. I tried to enable
it a few years ago already, but I couldn't get it working. I tried again
and it's still unusable. The CP15 timer is certainly there and it does
tick just fine. It also signals interrupts (ISTATUS gets set).
But I can't find the interrupts in the GIC:

 - I tried some common options (PPI 13+14+11+10, 2+3+4+1), but it hangs
   in raid6_select_algo like above (no timer interrupts).

 - I created some brute force probing code that fires the timer and then
   scans literally all GIC IRQs using GICD_ISPENDR. Nothing.
   (It finds the correct PPIs on other platforms...)

 - I asked Konrad if he can find something helpful in the chip
   documentation, but apparently there is no clear mention of the CP15
   interrupts there either ....

In other words, it looks like whoever designed this hardware didn't
think it would be useful to hook up the CPU interrupt lines to the GIC.
Or something like that ... Unfortunately, this means that we probably
need the MMIO timer even for the Cortex-A7 in MDM9607. :(


Since you mentioned that we don't need a timer early, I played a bit
with using the CP15 timer only as clocksource (without interrupt). That
seems works quite well actually to bypass the delay calibration problem.
In fact, then it skips the calibration entirely and uses (presumably
more accurate?) timer-based delay loops instead:

[    0.000000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[    0.000000] arch_timer: No interrupt available, NOT giving up
[    0.000000] arch_timer: cp15 timer running at 19.20MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000002] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
[    0.010688] Switching to timer-based delay loop, resolution 52ns
[    0.019028] Console: colour dummy device 80x30
[    0.024932] Calibrating delay loop (skipped), value calculated using timer frequency.. 38.00 BogoMIPS (lpj=64000)
...

Still need the core_initcall() change, since it looks like that
raid6_select_algo code really wants to have some timer interrupts.

Aside from that it's just a couple of if conditions in the
arm_arch_timer driver to bypass the interrupt handling, but I imagine
you wouldn't be very happy about that kind of butchering either ...? :/

> As for the A5, if we can't get this machine to use the driver as is
> without butchering it and going 15 years back in time, then I'd rather
> hack together a minimal driver that only this contraption will make
> use of, and be done with it.

To be fair, if you look at PATCH 2/2 in this series, the actual MMIO
handling is completely unchanged. It's just some reshuffling of the
init/parsing code. The primary annoyance is probably use of pr_*()
rather than dev_*() logging and some minor manual resource management.
We could duplicate the parsing functions to avoid this reshuffling, but
the actual MMIO code would be still exactly the same. I'm not sure if
we should duplicate that.

Thanks,
Stephan

