Return-Path: <linux-arm-msm+bounces-71690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CABC5B41068
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 00:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81EF75E613C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 22:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCAA279359;
	Tue,  2 Sep 2025 22:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQFgBCF/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952A721CA14;
	Tue,  2 Sep 2025 22:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756853912; cv=none; b=l6xckb0T1TuhbPMoZ8MDid52nxM0g+WvdE0yRLMA7eYF+CErxmLHX9TaOxMijswMCaHfn+dzthxXHf39OvOtxYfzkO6wLDOXtV6Qt8O+GUOzLujBh6QcyziwjWOB6DzZgpTQ2Jcp2KT/OgQyvAnleYu1fxIPH7P0idGYAUxZbvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756853912; c=relaxed/simple;
	bh=HZ+4oNUpiGLCoLpGRHJFkB1WlvwYbjQhQz4lqmkFw/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJL79A9HgJRAd5Ojdb42lQFY4cppV3xi8VJf2103FSMIVR/l59gCn8E/1RXfZehBB5Ek98X5msppGhGR96yNQUJVjILP0q4+kmlmP1R65qiW+f7qmczNTH4UGbJuwTfkIzBjbCUAZrj0mLn0Hp3rF79Lgw839jk/YN+We0kghfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQFgBCF/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99C9C4CEED;
	Tue,  2 Sep 2025 22:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756853912;
	bh=HZ+4oNUpiGLCoLpGRHJFkB1WlvwYbjQhQz4lqmkFw/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kQFgBCF/U0FWMcovgYqXIpwcyRnDjA/7XQk1bEubZdyiWI+e9Wn11+SihIr+l6b6Z
	 q2XZrXUo1QxCNgq9LjOplryFDSDfxo/+fqWi4co49s4sBZHBGlw380sexc8rT2LQls
	 qflb8OCgcxR+at9Ngrwx/JDhMtVVZzAo4VH4fjcUzNOI/LSS2kRdFLl9kKCObbyGyK
	 EOvj5NgmMIWJT+fhien43lekl8ZKWt1pbVDPLZX5kGZWanOoXQ15coQHSuS6K623oY
	 58DpSB0QorwrEPU3Scll52edl+uMRAijY8ITe72QztrzWz1ysUErQHAgemtA190wNL
	 wEClwjnQR7HeA==
Received: by venus (Postfix, from userid 1000)
	id BC367180C64; Wed, 03 Sep 2025 00:58:29 +0200 (CEST)
Date: Wed, 3 Sep 2025 00:58:29 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, "Derek J . Clark" <derekjohn.clark@gmail.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] platform: arm64: thinkpad-t14s-ec: new driver
Message-ID: <5qtornbvoc7soqud5o3e3uwvtifuy5vocmjsdwggydl6jrvmmm@5nc5ob4cj6ec>
References: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
 <20250831-thinkpad-t14s-ec-v1-2-6e06a07afe0f@collabora.com>
 <ea0b329e-ab3e-4655-8f27-e7a74784302a@app.fastmail.com>
 <pslvca6j5fpr5dgvciwlaz3fubnkjq5olfontaaytt56xs4bvk@5typdoosbreo>
 <c0ca6ca1-ffee-4b12-bf96-ee9efb93c4d2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qi5ko5qyws4ixtkn"
Content-Disposition: inline
In-Reply-To: <c0ca6ca1-ffee-4b12-bf96-ee9efb93c4d2@kernel.org>


--qi5ko5qyws4ixtkn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] platform: arm64: thinkpad-t14s-ec: new driver
MIME-Version: 1.0

Hi,

On Tue, Sep 02, 2025 at 12:27:24PM +0200, Konrad Dybcio wrote:
> On 9/1/25 6:10 PM, Sebastian Reichel wrote:
> > Hello Mark,
> >=20
> > On Mon, Sep 01, 2025 at 09:48:39AM -0400, Mark Pearson wrote:
> >> On Sun, Aug 31, 2025, at 5:28 PM, Sebastian Reichel wrote:
> >>> Introduce EC driver for the ThinkPad T14s Gen6 Snapdragon, which
> >>> is in theory compatible with ThinkPad ACPI. On Linux the system
> >>> is booted with device tree, which is not supported by the ThinkPad
> >>> ACPI driver. Also most of the hardware compatibility is handled
> >>> via ACPI tables, which are obviously not used when booting via
> >>> device tree. Thus adding DT compatibility to the existing driver
> >>> is not worth it (almost no code sharing).
> >>>
> >>> The driver currently exposes features, which are not available
> >>> via other means:
> >>>
> >>>  * Extra Keys
> >>>  * System LEDs
> >>>  * Keyboard Backlight Control
> >>>
> >>> The driver has been developed by reading the ACPI DSDT. There
> >>> are some more features around thermal control, which are not
> >>> yet supported by the driver.
> >>>
> >>
> >> Thanks for working on this - it's great.
> >=20
> > It's a personal scratch your own itch project, as I daily drive the
> > machine.
> >=20
> >> I'll see if I can get the EC spec so I can do some checking on the
> >> values (I thought I had it already, but I can't find it). If this
> >> file can be used for other platforms then it might be good to
> >> rename the file to not be specific to the t14s? I'm curious if it
> >> can be used on the X13s or the Yoga platform.
> >=20
> > Maybe. I only have the T14s (apart of my older Intel/AMD ThinkPads,
> > which use the ACPI driver). The ACPI DSDT functions completley
> > abstract the lowlevel I2C interface, so in theory every ThinkPad
> > could have a completley different EC and still use the same ACPI
> > driver. So this needs to be checked per-device. Hopefully the low
> > level interface is similar in those, so that we don't need to spam
> > the kernel tree with multiple different EC drivers :)
> >=20
> >> Couple of notes
> >>  - I do agree it doesn't make sense to add this to thinkpad_acpi.
> >>    That file is too big anyway.
> >>  - If there are other pieces like this where some detail of the
> >>    platform is needed, please do let me know. I never got enough
> >>    time to work on this platform directly, and it wasn't in our
> >>    Linux program, but I do have access and support from the
> >>    platform team for getting details on it. If I can help, so not
> >>    too much reverse engineering is needed, I'm happy to.
> >=20
> > Thanks for the offer.
> >=20
> > I would be interested in bits around system suspend. Right now
> > support on X1E is limited to sending the CPU into suspend. Much of
> > the machine seems to be still powered. Right now the keyboard
> > backlight and all the status LEDs stay on and the LID + power led
> > does not go into the typical breathing pattern. Additionally I had
> > to disable wakeup capabilities for the EC interrupt, as closing the
> > LID generates an event and thus an interrupt, which wakes the
> > system. Obviousy that is undesired from user's perspective. My guess
> > is, that there might be some register to mask events, but I haven't
> > found it so far. Alternatively the EC might mask them automatically
> > when the system is send into suspend, which I also have not yet
> > figured out :) The only bit I know is, that EC register 0xE0 is
> > involved in modern standby.
> >=20
> > Apart from that and (probably) unrelated to the EC: I noticed that
> > accessing the built-in webcam (with the X1E camera patches from
> > Bryan O'Donoghue) does not enable the status LED. It would be
> > nice if you can check how that is wired, so that it can be enabled
> > when a camera stream is started.
>=20
> FWIW a couple years ago I tried to do something similar for the X13s
> EC, and the software interface looks somewhat familiar..
>=20
> This never ended up becoming anything big, but just in case this is
> useful for anyone:
>=20
> https://github.com/SoMainline/linux/commit/c0cc2c60177a33597c33586bfe27b5=
f440e36745

I had a quick look and I would say that looks quite different:

 * The EC read/write/event function uses the same command bytes, but does
   not have 0x00 0x01 between the register and the value, so
   different functions would be needed for T14s and X13s
 * Almost all event codes are different
 * The register numbers are also different

So my fears, that the ACPI functions allow more or less completely
changing the low level interface were true :(

Greetings,

-- Sebastian

--qi5ko5qyws4ixtkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmi3dpEACgkQ2O7X88g7
+pqgIxAAnNJ6g2A4b9AJC9DHzSkhP+4QkQx4L88tugHkGwF38hMDRXwkTattrnt2
ZVwffm/tX+Lj/Ot97URcOmAKqVS8Ti56iDYWE41lLz2F98x+rFEP1yiGEs3l19St
PsyxAQIbVdE6FKXfB/DMls1ydD4bGiidQ7w0TSU4QWkxZEm79uFrM3N82L8xpEVZ
hTVxdG7TQMcDnKbzgyAd4u6oC+9xMeq30YllaN0GLvFJHf+0s1icq2NHGhb/r9pG
UnL5jxKgate0zfqRIY2KILrDBAuSqYR9y6hl5y7RpxpNFyRtBSgMSZ0Tq1aj9L8y
ilCbTpUJLQ8CUbXNYV0yM2sngdZD+NIvwoIFzVnEbFe96HZYo+gMPpWpV5dwuOpN
H0JS5CODz6Fw9VDbBBtzGquLvRGU5kEdQB/2pk5CJk2ps6J3J3limNQ7ncLR8Kzb
iZxstncS//AXgoLe+Ylpw9kE/PgUOYPL6729SqdkmYM9+v1zYxudz6POJHIf6yr+
yK6prEyqK+JDY7kg/2PGzB7yI+Z4bt+ST4YsITwMhu3MoZgAWfl+Cj1MKhuUH6lW
bgruP4LUx3Gvw3QUBTb551IWFJlVplq8CILfXJiHWNG45xIDzcQPGIZf+f6ah2z9
Kwtg+l/G8ee+NkDa1TKy78BEMNeJKLT3TBSvP1oMLGshVGwXj8M=
=jva8
-----END PGP SIGNATURE-----

--qi5ko5qyws4ixtkn--

