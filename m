Return-Path: <linux-arm-msm+bounces-83443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BD863C89566
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 11:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6714834802A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FE730DEC7;
	Wed, 26 Nov 2025 10:38:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B3C309EEA
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 10:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764153498; cv=none; b=gOcbjSXtFNWfb3zBhmU0CXR72FZJp7UTeX46Mlg2duL+zYyrI3nArizH+rubV2ZpGOw8RuvjhBAUtjNuqoR/lgL9G84Ys+rukPDg2uSV5KVP3Rr85FFtnFTOjC1jD4Mn+jqSkRXc0pSxzqndFYsTfMJ3Bz7dM16On7Fg/8ZJAtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764153498; c=relaxed/simple;
	bh=6lUXB4WUkMbMkMiXWtvxdLeWJCZ2DFVvUdb53R6LE+U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l+Qm+p0QcJzidYh3ElLIJ8dG0YfNpQLX8iwVoLSqRJ1pzbDbvfsy9JAGtaaeBE5xgrSJJBrZwiyC7ggWcX05kzBilHAwKxpnrMXU5bSpNfBR4grOYyXaF7gJFIv+rZavRf/OUUb1iN8tUatUM0yDaBxz2cW57y4/TxP1wYUk8PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vOCua-0003hY-Ks; Wed, 26 Nov 2025 11:38:12 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vOCuZ-002aaW-24;
	Wed, 26 Nov 2025 11:38:11 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vOCuZ-000000009GE-2OWJ;
	Wed, 26 Nov 2025 11:38:11 +0100
Message-ID: <ac9132249e594001801c2bbbc4245ff2e40c7a62.camel@pengutronix.de>
Subject: Re: [PATCH] reset: gpio: add a devlink between reset-gpio and its
 consumer
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Val Packett <val@packett.cool>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz
 Golaszewski	 <bartosz.golaszewski@linaro.org>
Date: Wed, 26 Nov 2025 11:38:11 +0100
In-Reply-To: <CAMRc=Mf7CMeZSUJLnteC9Xk5WvG_EKn3vx+jzcWNaWAvpvT00Q@mail.gmail.com>
References: <20251125-reset-gpio-add-devlink-v1-1-a1909fef227b@linaro.org>
	 <c478f7a0f3b91585618ec8e5ee57c5c4efd59f32.camel@pengutronix.de>
	 <CAMRc=Mf7CMeZSUJLnteC9Xk5WvG_EKn3vx+jzcWNaWAvpvT00Q@mail.gmail.com>
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

On Mi, 2025-11-26 at 09:56 +0100, Bartosz Golaszewski wrote:

[...]
> > > -static int reset_add_gpio_aux_device(struct device *parent,
> > > -                                  struct fwnode_handle *swnode,
> > > -                                  int id, void *pdata)
> > > +static struct auxiliary_device *
> > > +reset_add_gpio_aux_device(struct device *parent, struct fwnode_handl=
e *swnode,
> > > +                       int id, void *pdata)
> >=20
> > This function grows ever more similar to auxiliary_device_create().
> >=20
>=20
> I could have used it if not for the fact that it calls
> device_set_of_node_from_dev() and we don't want it.
>=20
> > s/add/create/?
>=20
> I don't mind but would prefer to not overload this patch.

Ok.

[...]
> > > +     consumer =3D get_dev_from_fwnode(of_fwnode_handle(np));
> >=20
> > If called via __reset_control_get(), this just reconstructs the device
> > from dev->of_node. I think it would be better to move the linking into
> > __reset_control_get() and use the passed in consumer device directly.
> >=20
>=20
> That would affect all users, do we want this? In most cases they will
> already have a link with different flags. I don't think this is
> correct.

Right. We could also pass an optional dev into __of_reset_control_get()
and then just go

	if (gpio_fallback)
		device_link_add(dev, rcdev->dev, DL_FLAG_STATELESS);

at the end.

> > > +     if (consumer) {
> > > +             if (!device_link_add(consumer, &rgpio_dev->adev->dev, D=
L_FLAG_STATELESS))
> >=20
> > Who removes this link when the consumer puts the reset control, or if
> > we error out later?
> >=20
>=20
> Nobody. Here's why: the reset-gpio device never gets removed. If we're
> here, this means it's already registered. If the consumer is unbound,
> the devlink stays in place. When we rebind, device_link_add() will do
> nothing. If the consumer device is released, we purge all links
> anyway. Let me know if I'm wrong, but seems to me, it's fine to leave
> it and make it stateless.

I think you are right. Still, the device_link_add() documentation says
that the caller is expected to call device_link_del/remove() and we
don't, so warrants a comment.

regards
Philipp

