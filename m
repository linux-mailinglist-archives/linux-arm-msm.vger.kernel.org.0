Return-Path: <linux-arm-msm+bounces-88080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AFCD03CF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F89F302EAFC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113F94C041F;
	Thu,  8 Jan 2026 12:02:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C3B4AD6B6
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 12:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767873739; cv=none; b=fZd5y3oZFepRFb1yLfXTxADymDci2uixGQm70OS6ixT2mME65amprr9ClM1l/KFkDcYTuur/P+XQeb3ZyPZgSa3XmmT0GZ6jF7uQpcgbCmikhqAE1tSCbl5odOzileK9lo160zxmwNIYxL/LG5l7i7b0+cYTo0l0qlESEnEtNsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767873739; c=relaxed/simple;
	bh=JEBv/LFavLWvuZ+RD6HpZxezctAK2EQR6JS+/TfDwrI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PN2oEFbXhIKlnNNNnNJ4LdM0Z5y5nFYJ99+ZiUBytO23qIaSnyILxc71HFAMmFKHoxPDEtoCmW6hRav2MmkyCGF4EgAD3Bm0vG0Qq/rpoDq/4fSUiv50NLAtpZRtjyJn4qG6klAwbWDYiJz1oEhJNc+BhQtMZqlAGFwvedJ8z20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdoiQ-0003KQ-6e; Thu, 08 Jan 2026 13:02:10 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdoiP-009fc8-2U;
	Thu, 08 Jan 2026 13:02:09 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdoiP-000000006UN-2wZK;
	Thu, 08 Jan 2026 13:02:09 +0100
Message-ID: <f203856efd3deedce56cc39dda13d563636c5f7e.camel@pengutronix.de>
Subject: Re: [PATCH] reset: gpio: add the "compatible" property
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bartosz
 Golaszewski	 <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>
Date: Thu, 08 Jan 2026 13:02:09 +0100
In-Reply-To: <CAMRc=Mcp8b81XX0AcBEpPNZQxDcPtHXQrKatw7k+fN7u5tYuGw@mail.gmail.com>
References: <20251121135739.66528-1-brgl@bgdev.pl>
	 <cc1c6f0020b60e3a8e90ec1d55973e15c88ee884.camel@pengutronix.de>
	 <CAMRc=Mcp8b81XX0AcBEpPNZQxDcPtHXQrKatw7k+fN7u5tYuGw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org

Hi Bartosz,

On Mo, 2025-12-08 at 23:57 -0800, Bartosz Golaszewski wrote:
> On Tue, 25 Nov 2025 11:43:01 +0100, Philipp Zabel <p.zabel@pengutronix.de=
> said:
> > On Fr, 2025-11-21 at 14:57 +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >=20
> > > In order to correctly handle the interaction between the reset-gpio
> > > devices and shared GPIOs managed by GPIOLIB, we need to be able to
> > > identify the former. Add the "compatible" property to allow us to use
> > > the device_is_compatible() helper.
> > >=20
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > > Philipp: this can go directly into your branch, I will fix the GPIO p=
art
> > > in the next cycle. For now it just parses the device name.
> >=20
> > Applied to reset/next, thanks!
> >=20
> > [1/1] reset: gpio: add the "compatible" property
> >       https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Da0d57f7504=
b6
> >=20
> > regards
> > Philipp
> >=20
>=20
> Hi Phillipp!
>=20
> I realized this didn't make your v6.19-rc1 PR. Any chance you could make =
it
> into an immutable branch or maybe you could back it out from your branch =
and
> allow me to take it with your Ack? I have a WiP patch that fixes one rema=
ining
> issue in the interaction between reset-gpios and shared GPIOs. I want to =
send
> it for rc1 or rc2 but I would prefer to use device_is_compatible() in it.

Sorry for the delay, I didn't get to this before hibernating. I've now
rebased the patch onto v6.19-rc1 now and made an immutable branch for
you to fetch:

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8=
:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git reset/gpio-compatible

for you to fetch changes up to b3d8508351af7f6366a0a18068c194b399ead2c3:

  reset: gpio: add the "compatible" property (2026-01-08 12:25:20 +0100)

----------------------------------------------------------------
Bartosz Golaszewski (1):
      reset: gpio: add the "compatible" property

 drivers/reset/core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

regards
Philipp

