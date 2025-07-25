Return-Path: <linux-arm-msm+bounces-66737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F408B125DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 22:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 462DA5A5FCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 20:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741AA25B2E7;
	Fri, 25 Jul 2025 20:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gxejuH+3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E68223716
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 20:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753476787; cv=none; b=Wr0tezX7e2Z0I1iMaxkR6EnNZoyx6FZU6QjrogW1f/c3pc2y3bPTMXzUWmPeAnr6baWgzB7Hb1dLagqo6ptWGLuLWRy25675dUs5XOMh0g2YBzH5QYH0xOPT/vG/8KS9xC/RMFfjYNMPVNg3tjAA7FWiVRKaCdId2hRM/n1wPL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753476787; c=relaxed/simple;
	bh=4xvXaVpHFyGpTUK0nPs1QabdpiGcctfRTdpk7NVY8zM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gb/MkqaIHiw8K5W/7kUOfQnD6jEt3ltt7y/HHaGzjF54CAdjUVNbWq/icxXJo8MIcE1N9KLZgUaN53FYFiK/gICFebGNizZRdODUxxh/t9wzkmYc/wSHGYAFpWK1Tu7PZFAqaUIqQeKKgMEj5h0D2YdKK5E5nDyac2PCfm1kmPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gxejuH+3; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2349f096605so30417085ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 13:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753476785; x=1754081585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GGLclRMhnKPBnE2c1s1qMNnbNcocHFvf+xLZSPlILVs=;
        b=gxejuH+3Fj9iOYHF3IWVrsZ0I1PoIUuu4+lZhsRjNuBqelEg2Y8HBnMkFXtAej/UzB
         fpOeDA5WNtsIROyHs0nn5PAjhMPU1LzK9CRgbSpErG65Ub6F0HFdIofXivIliVyAkngd
         49a3z+KSRbuBcMCMeBhBDDqXEvEmCetF6wXBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753476785; x=1754081585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGLclRMhnKPBnE2c1s1qMNnbNcocHFvf+xLZSPlILVs=;
        b=bZr75MnyEHn4L/sk4OE+tAXmjj/d1e31Mp88lktoslxF2Lk/Y1OnktrATZGJMSAXjX
         MoFg75T2gPphyuimFQoWCmulfOF0soqBPcblzpbQQgzuIYu5oN/aPqTbw9hA/7ORqMAQ
         rZTA5KgJBfeBqu8RcRbLtfNu4LNHkRkMOgH64bZ5/0pufy6Szflx0B+jnTKzHtUO8AfT
         BsUMnVmLcpghuMpVO60M2oaZzlxoBQQ1Qspi+t8zmZ+iOSxeJIaMtopLUsssX2W065Df
         21WBGzL4fdjFAIg5Uzzn/ttSqLBChLTNHY/becoNCA+848Uf/vVBrGQQCoQbEa6LICw2
         3t7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoDh0x9jxAR2cP11T+XqWcHa8dOaztt0i4er+RiYpR1gjNKn4cu1RnOETEVMDNK9Rwy3HwPtPnF+XIBQBv@vger.kernel.org
X-Gm-Message-State: AOJu0YymCWAxLS5jwo6uTlg1wMy5i2u9KDxouv2V74bRYlDK0+pwfgKj
	fQg+qgYIYuk08NKTf3jUlZ47p1JWCBXy2IoOUov0XFJ+KiXii05GJrOZn9D7kMIVqg==
X-Gm-Gg: ASbGnctYnq4KOkNNJ/gvOufcDVgb4yhjlGS31gvR9XpE7oc0CF3aWDkZseHW60yG20Y
	jIPTu6vHRrhmQhtA6j+rlMcm3uXrgSLCGbLKT/8Fwzr2n8VVtiWY+9rAhVtKIkpdYt68v08K45s
	+h6UUC1jwV2fqIOsw3z6hW/T3m/1R4zDD+5AiKJMlA0b1DlRA39wpjH3VgnxaMrjTY2l/P3A1K7
	h90DwdbUwsiNLWQdJZNOINA4e8/jfrqsn4IKYvuWz4iFp7sbx43CWm4MLO/zc6fVc9lLys46QEZ
	4WgEVSNY4X6p2D6SzXp/MNluTbU1u3JAODjw1BsXvKx4prbL4uofP/LZDsM4b/rDuq+KM8tPZEW
	Ksk0qWB0POLYyRAACA0R8V9eBx8jIGgJcps7kZLb+ro7wfNyTzVf2ZAumVZw=
X-Google-Smtp-Source: AGHT+IGacVASkcZlDKCCN3RzNaW/5grGoST8o1yKkU+/tmCsKHybYVMhu8Q6KHD6Mf+qTSzjJKTM5w==
X-Received: by 2002:a17:903:1c2:b0:23d:dd63:2cd9 with SMTP id d9443c01a7336-23fb31d3328mr58085215ad.46.1753476785059;
        Fri, 25 Jul 2025 13:53:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:5a7:d366:b2e1:fcd1])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23fc5a9d1b9sm321905ad.94.2025.07.25.13.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 13:53:04 -0700 (PDT)
Date: Fri, 25 Jul 2025 13:53:02 -0700
From: Brian Norris <briannorris@chromium.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH RFC 3/3] PCI: qcom: Allow pwrctrl framework to control
 PERST#
Message-ID: <aIPuruD6jdpIDujD@google.com>
References: <20250707-pci-pwrctrl-perst-v1-0-c3c7e513e312@kernel.org>
 <20250707-pci-pwrctrl-perst-v1-3-c3c7e513e312@kernel.org>
 <aHGhd3LLg8Dwk1qn@google.com>
 <qolpaorpkoyr5vzuowx3ml7uzwf4xc6atikrpilvbprc2ny5no@rcune7o57fuz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qolpaorpkoyr5vzuowx3ml7uzwf4xc6atikrpilvbprc2ny5no@rcune7o57fuz>

Hi Manivannan,

Sorry for some delay. Things get busy, and I don't get the time for
proper review/reply sometimes...

On Sat, Jul 12, 2025 at 11:50:43AM +0530, Manivannan Sadhasivam wrote:
> On Fri, Jul 11, 2025 at 04:42:47PM GMT, Brian Norris wrote:
> > Hi,
> > 
> > On Mon, Jul 07, 2025 at 11:48:40PM +0530, Manivannan Sadhasivam wrote:
> > > Since the Qcom platforms rely on pwrctrl framework to control the power
> > > supplies, allow it to control PERST# also. PERST# should be toggled during
> > > the power-on and power-off scenarios.
> > > 
> > > But the controller driver still need to assert PERST# during the controller
> > > initialization. So only skip the deassert if pwrctrl usage is detected. The
> > > pwrctrl framework will deassert PERST# after turning on the supplies.
> > > 
> > > The usage of pwrctrl framework is detected based on the new DT binding
> > > i.e., with the presence of PERST# and PHY properties in the Root Port node
> > > instead of the host bridge node.
> > 
> > I just noticed what this paragraph means. IIUC, this implies that in
> > your new binding, one *must* describe one or more *-supply in the port
> > or endpoint device(s). Otherwise, no pwrctrl devices will be created,
> > and no one will deassert PERST# for you. My understanding is that
> > *-supply is optional, and so this is a poor requirement.
> > 
> 
> Your understanding is correct. But the problem is, you thought that pwrctrl
> would work across all platforms without any modifications, which unfortunately

I do not think this. Of course there's some modification needed on
occasion, especially when drivers assume they can poll for the link to
come up when power isn't ready, or if they want to get PERST# right
(i.e., $subject).

OTOH, I don't think you can claim that platforms *don't* support
pwrctrl. If a driver has a well-behaved start_link() behavior and
doesn't otherwise manage slot/endpoint *-supply properties (a la
pcie-brcmstb), it should mostly work without further involvement.

But crucially, that changes with PERST#. And I think you're making
very narrow assumptions when you do that.

> is not true and is the main source of confusion. And I never claim anywhere that
> pwrctrl is ready for all platforms. I just want platforms to start showing
> interest towards it and we will collectively solve the issues. Or I'll be happy
> to solve the issues if platform maintainers show interest towards it. This is
> what currently happening with brcmstb. I signed up for the transition to
> pwrctrl as their out-of-tree is breaking with pwrctrl.
> 
> Right now, we indeed create pwrctrl device based on the presence of power
> supplies as that's how the sole user of pwrctrl (Qcom platforms) behave. But

I don't see how this is really Qualcomm specific, unless you simply
require that all new Qcom DTs specify external *-supply. I don't see
that in your Documentation/devicetree/bindings/pci/qcom*.yaml though,
and I don't think that's reasonable.

> sure, for some other platforms we might have only 'reset-gpios'. When we have to
> support those platforms, we will extend the logic.

The thing is, you don't have 100% control over this. You sound like you
only want to support device trees that are shipped in the upstream
kernel, but that's not how they work -- it's totally valid to ship
non-upstream device trees, if you follow the DT bindings. And you've
already hit that pitfall with brcmstb.

Suppose you have a Qcom platform today, with pwrctrl support, and:

 1. it has GPIO PERST#
 2. some boards have external power controls for the endpoint. *-supply
    nodes are described for the endpoint, and pwrctrl is in use.
 3. some boards have hardwired power that is always-on / on at boot (no
    *-supply node, no pwrctrl).

As you've written it today, #3 will no longer work, since you're
deferring PERST# to pwrctrl, but pwrctrl never gets involved.

Crucially, you can't read the driver source to tell the difference
between #2 and #3, and it's not even in the binding schema. Now magnify
this across other drivers that might support this.

I have boards like #2 and #3, and I don't know how I'm supposed to
develop my driver.

> > And even if all QCOM device trees manage to have external regulators
> > described in their device trees, there are certainly other systems where
> > the driver might (optionally) use pwrctrl for some devices, but others
> > will establish power on their own (e.g., PCIe tied to some other system
> > power rail).
> > 
> > I think you either need the PCI core to tell you whether pwrctrl is in
> > use, or else you need to disconnect this PERST# support from pwrctrl.
> > 
> 
> It is not straightforward for the PCI core to tell whether pwrctrl is in use or
> not.

Yes, well this seems like a fundamental recurring problem at the root
here. This agnostic design just causes more problems, IMO.

> pwrctrl has no devicetree representation as it is not a separate hardware
> entity. It just reuses the PCI device DT node. So I used the -supply properties
> to assume that the pwrctrl device will be used. And almost none of the upstream
> DTS has -supply properties in the PCI child node (only exception is brcmstb
> where they define -supply properties in the PCI child node, but only in the DT
> binding). So that added up.

You gotta work off DT bindings and schema to make assertions. You can't
just guess based on in-tree device trees, and so you can't prove
non-existence, if it's not explicit in the bindings.

Brian

