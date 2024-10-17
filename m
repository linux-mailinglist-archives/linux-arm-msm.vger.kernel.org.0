Return-Path: <linux-arm-msm+bounces-34694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AA49A1A51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 08:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A5341C22C95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 06:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F8B1422A8;
	Thu, 17 Oct 2024 06:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hL74wgQT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD23417580;
	Thu, 17 Oct 2024 06:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729144838; cv=none; b=Rel9g0zgrkAxkCZFkToaY0QgXPf4dmrUM1RpW6MeACnmQoaEPuU4l9vfDxp+LR0TzTLpC9jf49oj26lsp+SSl1lYm0J05HnoOVK7IMiQrXKlGUD8aJVgozBT8Ra0AaEk5xeTOKkHOJkg82W2BflWIyhd84zb2VeBBNYvHcJMIwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729144838; c=relaxed/simple;
	bh=eH0roS1khsA70ziZR99hznP8FF+8FEjV5oNAOCAzT38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEwEiXgwgj+Px3cIVgOhkq9UztswIuVWEJtbH+vNFgZVVfmNwjDxGp7np6166XATUTsrvFOze6f4hZf5n5bKgO/r1wvedHqHH0lO687vUrKTcshwZr3PoYr16CSE0sSKYfqaU/iengjKDXaijztjyDpg9vpbxM1iujikxM0BxJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hL74wgQT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B2DC4CEC3;
	Thu, 17 Oct 2024 06:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729144838;
	bh=eH0roS1khsA70ziZR99hznP8FF+8FEjV5oNAOCAzT38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hL74wgQTkQges5hIhvMoqJ4Qe3rtwJUNZ38d2EkO4dIZxeJpAmNH9C/gaQU4Uek7h
	 kRxStacZuRKMSOTpND4iA4d7Lp3e7MNrgTi7kuJCyL+plSgt9P1d+grDkDXReRxjjA
	 7kR9W1YgQQUwsfrFTV4c0NqK32p0WTgaeTm7IZxNgPT2dbm2Oe+o9LyELU+iUABQ7E
	 9G7MBarw/OKmWLMyFe01YlDr915H1b4D6vCDyE8X0jQxCMQGmUB+Bdlc8VKYZ/3NM7
	 GqmExqgcgNyuXclNSIgVRFC4hw7D9yrZ2fPxjmgagXK9INs+AJ0lzvLgZz8ULQZaC7
	 jlcSjbxdsfBRg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t1JYy-000000002SE-2l3r;
	Thu, 17 Oct 2024 08:00:45 +0200
Date: Thu, 17 Oct 2024 08:00:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] usb: typec: Add new driver for Parade PS8830
 Type-C Retimer
Message-ID: <ZxCoDHq871x_0Nbm@hovoldconsulting.com>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <Zw5i9dcSMOG4n3PW@hovoldconsulting.com>
 <Zw5oOUeN/v+tz+SY@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw5oOUeN/v+tz+SY@linaro.org>

On Tue, Oct 15, 2024 at 04:03:53PM +0300, Abel Vesa wrote:
> On 24-10-15 14:41:25, Johan Hovold wrote:
> > On Fri, Oct 04, 2024 at 04:57:36PM +0300, Abel Vesa wrote:
> > > The Parade PS8830 is a Type-C multi-protocol retimer that is controlled
> > > via I2C. It provides altmode and orientation handling and usually sits
> > > between the Type-C port and the PHY.

> > > This retimer is a LTTPR (Link-Training Tunable PHY Repeater) which means
> > > it can support link training from source to itself. This means that the
> > > DP driver needs to be aware of the repeater presence and to handle
> > > the link training accordingly. This is currently missing from msm dp
> > > driver, but there is already effort going on to add it. Once done,
> > > full external DP will be working on all X1E laptops that make use of
> > > this retimer.
> > 
> > I was gonna ask you to include the devicetree changes that enables the
> > retimers as part of this series (to facilitate review and testing), but
> > perhaps you should indeed not post them again until LTTPR support is in
> > place.
> 
> I was thinking maybe we should not wait for LTTPR support as this series
> brings orientation support as is. I still need to figure out how to
> strip out the DP parts of it in such a way that orientation should still
> be working but DP should not (until LTTPR is in).

Yeah, possible, or you can at least include the DT patches here but mark
them as do-not-merge-yet or similar.

> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > > Changes in v2:

> > > - Fixed coldplug (on boot) orientation detection.
> > 
> > Coldplug orientation detection still does not work here with this series
> > applied.
> > 
> > I'm not entirely sure this whether worked better with v1, but with v2
> > my SuperSpeed ethernet device shows up as a HighSpeed device in one
> > orientation. It is also not disconnected an re-enumerated as SS as is
> > the case on the X13s (and possibly with v1):
> > 
> > 	usb 1-1: new high-speed USB device number 2 using xhci-hcd
> 
> For coldplug, this series does the right thing as it leaves the retimer
> initialized if it was left enabled at boot. There is a second part
> needed for the coldplug to work. That is the regulator-boot-on property
> in retimer's vregs nodes. That will ensure that the regulator is not
> disabled until retimer driver probes and will keep the retimer initialized
> until USB device is enumerated.

I can confirm that marking the regulators as having been left on by the
bootloader so that they are not disabled temporarily during boot indeed
fixes the coldplug issue here.

That however makes me wonder whether something is missing in the driver
so that it still relies on setup having been done by the boot firmware.

Have you tried actually asserting reset during probe to verify that
driver can configure the retimers itself without relying on the boot
firmware?

Johan

