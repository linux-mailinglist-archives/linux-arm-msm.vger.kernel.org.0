Return-Path: <linux-arm-msm+bounces-54448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C602A8A6C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 20:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD5A23AABB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 18:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0FD225A3C;
	Tue, 15 Apr 2025 18:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PWcx0gwR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A1B224243
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 18:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744741487; cv=none; b=tieszS7TY8J10CEIb+FUA5XrhCJbV/ugH1O5u2HskE0rxkKL4lrcjwZXWp3Y2MH+k6ViQPg/uiXJZpc/o6Vyxty/01h19NCmU9vv7hIdbskiPGByjtbmvj8Ug7mASIUycE4F6/Fpo+z9YxCX+aHYVv01W0bI2NEztRoFw8/zvn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744741487; c=relaxed/simple;
	bh=/GFGDbNuXymklDWRO5AzwTj12PzmIH6SguJDQlMud4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRePh5eJjkOO1GA0k5uTyPaawcSSuOmVyjsudqSUiXYy8LN0FAslK/snFRc3Lr8a26v8aw1ihvMUz2bIFZKtPv5YIWQ6LYQDBoboB2CfBI/00QLVnrt1+7uJnr7vfOiN1vOVgwHHLqFB5Mk60oC9jsd3sEm/Iv5fTQDLEewqwN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PWcx0gwR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-225df540edcso68906335ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 11:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744741483; x=1745346283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UvsYDfCkdMlDli3tvTkkt2mwrny9x0nA/xkSFS51KcI=;
        b=PWcx0gwRkORM+Dwcupjvg2bbcG5ZZtI8rjxhHPPS5gvxov51MAKgTGjjCH/7CYfKbe
         dMQTnPeKNuGZbj14jfVsy0VmNSeJe5j2V+DOidTDtWwrrYTBKeJRQSVcEQXHyqes9J6x
         ntDHt+eZKXXnsUKGzp1eWGXFJTue1otdT2eVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744741483; x=1745346283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvsYDfCkdMlDli3tvTkkt2mwrny9x0nA/xkSFS51KcI=;
        b=jeNFSCLbO+N8D8Gsup1tqV7VojP6D3e8gslkQKdycYZ8RFdvGd5evXWCyMlhhvspLX
         BqKf2WMOSJvOYVw7yR5ka+8vtmaEqAWieydGQ+hT+HLAkp91+ZrfAJKNOhMxrdTLxlWw
         20vAifCdTld4uvEvFeuibHgRbehqNfGTJKVj/U94cmCQjZT+udfHRCcK6i/pduEXYSsw
         XAbEfV/Et1IufcAbhjQqn6I1GzUevWcPBkc6c/Nuq4WMiYsC4mApeT+7uytQ14DYxsEn
         oTX1M7CIR96L6HxiEOVPGoK/rKdU3OC+FhosZjbDLjbydQgQ7GroO73n/7Q/qHZDSbDJ
         RTNw==
X-Forwarded-Encrypted: i=1; AJvYcCUuioU2k5zRgFVDXbmYRrRtIlOgStHr3CbUUbOjYclS8FHhkMSPDEoAAZD29HXs2Il1rwZZJ+WBYSASTzDr@vger.kernel.org
X-Gm-Message-State: AOJu0YyyO3tlXYOBKKhez29n4dGYuLWe1RWu40fvVsKL9ob9Gh3+IzMI
	xkJRnojhA3W4rKIyVCNIMYPwtkurswFemYMwvJyCZHfWJw14ok9Drsr+MgSqhg==
X-Gm-Gg: ASbGncsRUWQ9bZp3tmZOqCw+Y2it9tuJgOAqg/d01ICEjwjVdIyvSu2umc9vhG03+Uj
	40Fepc18kbvVDlq/5UG3vTJY6Scl8mJ8Aqgh751az08RexlcwBDQfg+WzESfHTI/4e38RLFPvUL
	tMME3tNuPpMTdV5iwCMoKdpoyyLGHhwQiTUQ/82t86K1rn4xKnwRkGvJdG6VqIhnETKBdaVHGLE
	i0jbj+hPy2hHAHNqG3vmd5SmQJMUyC8XrJ8IEH5sdbKq+ZdqBZoFsdRxevUHiIX0s+LKHgKT5WG
	vDNJibzsEIcv+hHXLD5FLMu09qOv2HH5wJ4EtkZKGoL+SY6s88JFEZl+kKvOc0kooxJwNQb8swH
	viFE=
X-Google-Smtp-Source: AGHT+IFcpP3CIx7mOPyRZjL3OJStL4sfRHU6gXM820Ln0i6PxGtwBiFjSgwEiXkmpCOf0Dy7arSllg==
X-Received: by 2002:a17:903:1b6f:b0:216:271d:e06c with SMTP id d9443c01a7336-22c30cf9720mr6830375ad.4.1744741482761;
        Tue, 15 Apr 2025 11:24:42 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:8cf6:d796:9e6e:f7e5])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22ac7b62895sm121021895ad.5.2025.04.15.11.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 11:24:41 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:24:39 -0700
From: Brian Norris <briannorris@chromium.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	dmitry.baryshkov@linaro.org, Tsai Sung-Fu <danielsftsai@google.com>
Subject: Re: [RFC] PCI: pwrctrl and link-up dependencies
Message-ID: <Z_6kZ7x7gnoH-P7x@google.com>
References: <Z_WAKDjIeOjlghVs@google.com>
 <vfjh3xzfhwoppcaxlov5bcmkfngyf6no4zyrgexlcxpfajsw2t@o5nbfcep3auz>
 <Z_2ZNuJsDr0lDjbo@google.com>
 <4pwigzf7q6abyntt4opjv6lnvkdulyejr73efnud2cvltskgt2@tjs2k5tiwyvc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4pwigzf7q6abyntt4opjv6lnvkdulyejr73efnud2cvltskgt2@tjs2k5tiwyvc>

Hi,

On Tue, Apr 15, 2025 at 11:02:14AM +0530, Manivannan Sadhasivam wrote:
> On Mon, Apr 14, 2025 at 04:24:38PM -0700, Brian Norris wrote:
> > On Mon, Apr 14, 2025 at 04:27:35PM +0530, Manivannan Sadhasivam wrote:
> > > On Tue, Apr 08, 2025 at 12:59:36PM -0700, Brian Norris wrote:
> > > > For link startup, pcie-designware-host.c currently
> > > > (a) starts the link via platform-specific means (dw_pcie::ops::start_link()) and
> > > > (b) waits for the link training to complete.
> > > > 
> > > > However, (b) will fail if the other end of the link is not powered up --
> > > > e.g., if the appropriate pwrctrl driver has not yet loaded, or its
> > > > device hasn't finished probing. Today, this can mean the designware
> > > > driver will either fail to probe,
> > > 
> > > This is not correct.
> > 
> > That depends on the implementation of start_link(). But I suppose the
> > intention is that start_link() only "starts" and doesn't care where
> > things go from there. (IOW, my local start_link() implementation is
> > probably wrong at the moment, as it performs some poll/retry steps too.)
> > 
> 
> The callback is supposed to just start
> the link and not wait for anything else.

Ack, thanks. I've learned something.

> > > > or at least waste time for a condition
> > > > that we can't achieve (link up), depending on the HW/driver
> > > > implementation.
> > > > 
> > > 
> > > Unfortunately we cannot avoid this waiting time as we don't know if a device is
> > > attached to the bus or not. The 1s wait time predates my involvement with DWC
> > > drivers.
> > 
> > I don't really love that answer. It means that any DWC-based platform
> > that needs pwrctrl and doesn't set use_link_irq==true will waste 1
> > second per PCIe controller. While it's hard to make guarantees about old
> > and/or unloved drivers, I'd like to think I can do better on new ones.
> > 
> 
> Even I'd like to avoid the 1s delay. But the problem is how would you know if
> the device is attached to the bus or not. The delay is to account for the fact
> that the link may take up to 1s to come up post starting LTSSM. So if we do not
> wait for that period, there is a chance that we would report the false negative
> status and also the enumeration would fail.

I understand there are cases we won't know, if we don't have a
hotplug/presence-detect wiring. But for cases we know, I think it's
cop-out to say "we can't handle it." See below.

> > Consider
> > the lesser statement that was paired along with it: always wasting 1
> > second per controller polling for something that will never happen. It
> > feels backwards and wasteful.
> > 
> 
> Again, I do get your point. But tell me how can a controller reliably detect
> that there is a device attached to the bus. Only on your android setup, you for
> sure know that the device won't be there during probe. So you are considering 1s
> wait as a wast of time and it is fair. But what if the same controller is used
> in another platform which is not android or the endpoint device is powered on
> during probe itself without replying on userspace?

This has nothing to do with Android.

IMO, we have 3 main categories of setups that we should primarily care
about:

(1) hotplug is supported, and PRSNT1#/PRSNT2# are wired
(2) hotplug is not supported, but a device is present and is already
    powered.
(3) hotplug is not supported, but a device is present. the device
    requires external power (i.e., pwrctrl / "subdevice regulators" /
    etc., should be involved)

AFAICT, we don't have much of (1). But if we did, we should also be able
to avoid initial delays, as we can reliably detect presence, and only
wait for training when we know it should succeed. (Or even better,
handle it async via an interrupt.)

For (2), we're also OK. The initial polling delay is likely to be much
less than 1 second.

For (3) ... all non-pwrctrl drivers (pcie-brcmstb.c, pcie-tegra.c,
pcie-tegra194.c, pcie-rockchip-host.c, ...) power things up before they
configure ports, start LTSSM, and have any expectation of detecting a
link. If a device is there, they again should commonly find it in much
less than 1 second.

However, when *using* pwrctrl, we have the ordering all wrong (IMO), and
so we eat needless delay. We *will not* successfully bring the link up,
and we *won't* find the device. This smells like a design problem, where
we have failed to plumb the information we already have available.

I think you're too worried about a case (4): that hotplug is not
supported, and a device is not present.

IMO, (4) should mostly be handled by simply disabling the unused
controller in device tree, or living with the timeouts. If a platform
doesn't support hotplug, then you can't expect optimal behavior for
unplugged devices.

I'm not complaining about (4). I'm complaining about (3) with pwrctrl.

> > One of my key questions: if I don't have a link-up IRQ, how can I avoid
> > this waste? pcie-brcmstb avoids that waste today (for the common case
> > where there is, in fact, a device connected), and it would be a
> > regression for it to start using pwrctrl tomorrow.
> > 
> 
> Why are you tying pwrctrl with this designware driver behavior? Both are
> unrelated. Even if you don't use pwrctrl and use controller driver to bring up
> the device, the 1s delay would be applicable (if there is no device).

We might be talking past each other. Per above, I think we can do better
with (1)-(3). But you're bringing up (4). Problem (3) exists for all
drivers, although it's more acute with DWC, and I happen to be using it.
I also think it's indicative of larger design and ordering problems in
pwrctrl.

> pcie-brcmstb driver indeed wastes time. It is not 1s but just 100ms. But that
> driver is for only one vendor. In the case of DWC, the driver has to work with
> multiple vendors. But again, I do not know how this 1s delay came up. Maybe we
> could try to reduce it to 500ms or so, but for that I need confirmation from
> someone like Lorenzo who knows the history.
> 
> > (Side note: I also just noticed pcie-tegra194.c does the same.)
> > 
> > > > My guess is that (1) is the case, and specifically that the relevant folks are
> > > > using the pcie-qcom.c, with its "global" IRQ used for link-up events.
> > > > 
> > > 
> > > We only recently added support for 'Link Up' event through 'global_irq' in the
> > > controller driver. And this was done to avoid waiting for link up during probe
> > 
> > You're kind of reinforcing my question: you don't like the waste, so
> > you're adding link-up IRQ support -- is that really the only way?
> > 
> 
> I don't know. But so far I haven't seen any other sensible way which is generic.
> 
> > (My initial thought: no, it's not. We know when pwrctrl has done its
> > thing -- why should we bother polling for link state before that? But
> > that's easier said than done, when pwrctrl is optional and highly
> > abstracted away from the DWC driver...)
> > 
> 
> Oh well... this is where you got it wrong. pwrctrl drivers are only probed
> before enumeration because of the design (which is way after starting the link).
> As of v6.15-rc1, before we try to enumerate any device, we check if there is any
> device defined in DT which requires power supply. If so, we create a platform
> device (or pwrctrl device) and let the pwrctrl driver to bind to it and power up
> the device. In that case, we also do not proceed to scan the bus further and
> skip the hierarchy. Because, the pwrctrl driver will rescan the bus once it has
> finished powering up the device.

It sounds like you're saying "it's the way that it is, because of the
way that it is." I understand how it is currently structured, but I'm
saying that I think pwrctrl is placed at the wrong place. It looks cute
and clean, but it has the ordering wrong.

IMO, we should allow pwrctrl to power things up earlier, so that
controller drivers have a better chance of hitting the optimal cases
(case (3) above) properly. (That's also how every pre-pwrctrl driver
does things, and I think it's for good reason.)

That would also resolve my PERST# and other timing questions, because
the controller driver would better know when pwrctrl is finished, and so
can better handle PERST# and any necessary delays.

I agree this might be more difficult to do in a "generic" way (per your
above language), depending on your definition of generic. But IMO, it's
important to prioritize doing things correctly, even if it's slightly
less cute.

As an example less-cute way of doing pwrctrl: expose a wrapped version
of pci_pwrctrl_create_device() such that drivers can call it earlier. If
there is a pwrctrl device created, that means a driver should not yet
wait for link-up -- it should defer that until the relevant pwrctrl is
marked "ready". (There are likely other problems to solve in here too,
but this is just an initial sketch. And to be clear, I suspect this
doesn't fit your notion of "generic", because it requires each driver to
adapt to it.)

> > Regarding the controller design: frankly, I don't think my controller
> > does anything all that revolutionary in this space [0]. All of my
> > questions today can be asked (from what I can tell) of existing upstream
> > controller drivers. I'm mostly trying to understand the expected driver
> > design here, and that includes teasing apart what is "stuff done in
> > 'old' drivers, but isn't recommended", and "what is currently
> > unimplemented in new stuff" (like pwrctrl [1]), and where do my
> > expectations fit in between that.
> > 
> > For instance, poking around a bit I come up with this question: when
> > using pci/pwrctrl, how does one ensure timing requirements around, e.g.,
> > power stability vs PERST# deassertion are met? When looking at a pwrctrl
> > driver like drivers/pci/pwrctrl/slot.c, the process looks too simple:
> > 
> > (0) host bridge probably already started its LTSSM, deasserted PERST#
> > (1) slot.c powers the slot
> > (2) pci_pwrctrl_device_set_ready() -> rescan_work_func() rescans the bus
> > 
> > Notably, there's no enforced delay between (1) and (2).
> > 
> > Reading the PCIe CEM, it seems we're violating some specification bits,
> > like:
> > 
> >   2.2. PERST# Signal
> >   [...] On power-up, the de-assertion of PERST# is delayed 100 ms
> >   (TPVPERL) from the power rails achieving specified operating limits.
> >   [...]
> > 
> > There are references to this in various implementations (e.g.,
> > tegra_pcie_enable_slot_regulators() and brcm_pcie_start_link() --
> > although I suspect the latter is applying the wrong ordering).
> > 
> > Additionaly, CEM also seems to suggest we have PERST# ordering wrong. It
> > should also come between (1) and (2), not at (0).
> > 
> 
> You are absolutely right! Currently, we follow the timing requirement while
> deasserting the PERST# in the controller drivers. But once we power on the slot,
> we do not touch PERST# and it just happen to work.
> 
> We may need to introduce another callback that toggles PERST# so that we can use
> it while powering up the device.
> 
> > And finally (for now), I don't understand how we have any guarantee that
> > step (2) is useful. Even if we've already started the LTSSM in (0), we
> > have no idea if the link is actually Active by the time we hit (2), and
> > so rescanning may not actually discover the device. And if that scan
> > fails ... then when do we trigger another pci_rescan_bus()? Only if the
> > implementation has a "link-up" IRQ?
> > 
> 
> As I said above, we do not enumerate the device if it has devicetree node with
> supplies. So that's why we need (2). Otherwise, the device won't be enumerated
> at all, unless userspace does the rescan (which defeats the purpose of pwrctrl).

But you haven't addressed one of the concerns in my paragraph: how do we
know the link is up by the time we hit the pwrctrl-initiated
pci_rescan_bus()? We haven't gone back to ask the host bridge if it's up
yet. We're just hoping we get lucky.

IOW, the pwrctl sequence should be something like:

 (1) power up the slot
 (1)(a) delay, per spec
 (1)(b) deassert PERST#
 (1)(c) wait for link up
 (2) rescan bus

Currently, we skip all of (1)(a)-(c). We're probably lucky that (1)(b)'s
ordering doesn't matter all the time, as long as we did it earlier. And
we're lucky that there are natural delays in software such that lack of
(1)(a) and (1)(c) aren't significant.

> > Unless I'm misunderstanding, these concerns all suggest we need some
> > host-bridge hook in between (1) and (2), and existing pwrctrl users are
> > operating somewhat outside the specification, or are relying on
> > something more subtle that I'm missing.
> > 
> 
> Yes, feel free to submit patches for toggling PERST#. Or let me know otherwise,
> I'll do it.

Per the above, I think pwrctrl has multiple ordering design problems, so
I haven't yet decided what kind of patch(es) I might submit. Feel free
to CC me if you tackle it before I do though.

Regards,
Brian

