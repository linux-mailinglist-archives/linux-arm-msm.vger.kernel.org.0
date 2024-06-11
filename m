Return-Path: <linux-arm-msm+bounces-22281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B317F903735
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 10:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CADBD1C21B2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 08:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70ED1176222;
	Tue, 11 Jun 2024 08:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2VxRtDe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480F917556B;
	Tue, 11 Jun 2024 08:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718096056; cv=none; b=UOGOK3UodhEP60KbPsPTf49o39mQjxSvAc38AwWGwJI0tlpAthaiqYFFOmEtF2cW4SCUlGOEYb2vaIauNcI0n/JYQa47OFnWbITpxCjh5EOqwrOMl/GIb1Ygr0XExb7NbfDIm1a7hr1fvflz2GLY6E6x0sZqk95mY7ewRjN87fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718096056; c=relaxed/simple;
	bh=2ukzE5jSByrfkU0EBD6JgAzltjAX1WVjV+wRmSqE2Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwuQpaGUh64qhDQyaAmXR/11In55/5pKPInfkv0+o4M40xz41HjnBGFkLss3mpn2kJ9dvoZrqEqCTUOvweT3iN875Y+EHlgJ3cUcZmZwwkG5J1Okqo9ytXqTs2mYLiVMjctQRnsK8UXJEDyH8Rue9Va1Lx/FCmDY3I/0Awee/Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2VxRtDe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF15C2BD10;
	Tue, 11 Jun 2024 08:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718096055;
	bh=2ukzE5jSByrfkU0EBD6JgAzltjAX1WVjV+wRmSqE2Kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2VxRtDeYMlPg+12tPprCTkNAGaTrxlhfGvjZ+WlQMIx/7TGa2pX3sQPp6TQV+WYf
	 mv7ii94fVbr8QuJmnvkEYOhLoBvyeo4lahrcRYS2Ablufh5BnJgbcDlQYF13eCI/ZP
	 9qVnWlZU9KupHrMcPB+QTdSYxeYDZ/ccT75YYaYDTNF+v9mo4LGjn8Uui+hHSjMuMU
	 DnScucgx/dcXir7hjEHrBp5Xlsz2VFHBnNR2h4A4uLjNvfNGAzqx1eEN3Lb9KcEWxh
	 9l5/qbuc6uT+VYFRUi5xbHfvVq2/eGDuW2D9dy6+ng3sFLGNEgGpOWazHjfPuGkMvz
	 qjkqGaG49zHhg==
Date: Tue, 11 Jun 2024 10:54:12 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/9] drm/bridge-connector: switch to using drmm
 allocations
Message-ID: <20240611-zippy-pragmatic-catfish-cceee5@houat>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
 <20240607-bridge-hdmi-connector-v5-2-ab384e6021af@linaro.org>
 <20240610-secret-rottweiler-from-asgard-132f75@houat>
 <CAA8EJpogi2qm0bhCwumY4zj-xMUkF4zbK-NAPqCeDbLcybFciw@mail.gmail.com>
 <20240610-smooth-liberal-guan-59853e@houat>
 <t5pav3up5r6ezs4q37lc7jqlv55ftta7fnntp75b4pjboycwsm@uvs7q6frrzf5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l7blei7rzdrnpggn"
Content-Disposition: inline
In-Reply-To: <t5pav3up5r6ezs4q37lc7jqlv55ftta7fnntp75b4pjboycwsm@uvs7q6frrzf5>


--l7blei7rzdrnpggn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 08:54:09PM GMT, Dmitry Baryshkov wrote:
> On Mon, Jun 10, 2024 at 02:07:06PM +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > +Hans
> >=20
> > On Mon, Jun 10, 2024 at 02:46:03PM GMT, Dmitry Baryshkov wrote:
> > > On Mon, 10 Jun 2024 at 11:04, Maxime Ripard <mripard@kernel.org> wrot=
e:
> > > >
> > > > Hi,
> > > >
> > > > On Fri, Jun 07, 2024 at 04:22:59PM GMT, Dmitry Baryshkov wrote:
> > > > > Turn drm_bridge_connector to using drmm_kzalloc() and
> > > > > drmm_connector_init() and drop the custom destroy function. The
> > > > > drm_connector_unregister() and fwnode_handle_put() are already ha=
ndled
> > > > > by the drm_connector_cleanup() and so are safe to be dropped.
> > > > >
> > > > > Acked-by: Maxime Ripard <mripard@kernel.org>
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_bridge_connector.c | 23 +++++---------------=
---
> > > > >  1 file changed, 5 insertions(+), 18 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu=
/drm/drm_bridge_connector.c
> > > > > index 982552c9f92c..e093fc8928dc 100644
> > > > > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > > > > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > > > > @@ -15,6 +15,7 @@
> > > > >  #include <drm/drm_connector.h>
> > > > >  #include <drm/drm_device.h>
> > > > >  #include <drm/drm_edid.h>
> > > > > +#include <drm/drm_managed.h>
> > > > >  #include <drm/drm_modeset_helper_vtables.h>
> > > > >  #include <drm/drm_probe_helper.h>
> > > > >
> > > > > @@ -193,19 +194,6 @@ drm_bridge_connector_detect(struct drm_conne=
ctor *connector, bool force)
> > > > >       return status;
> > > > >  }
> > > > >
> > > > > -static void drm_bridge_connector_destroy(struct drm_connector *c=
onnector)
> > > > > -{
> > > > > -     struct drm_bridge_connector *bridge_connector =3D
> > > > > -             to_drm_bridge_connector(connector);
> > > > > -
> > > > > -     drm_connector_unregister(connector);
> > > > > -     drm_connector_cleanup(connector);
> > > > > -
> > > > > -     fwnode_handle_put(connector->fwnode);
> > > > > -
> > > > > -     kfree(bridge_connector);
> > > > > -}
> > > > > -
> > > > >  static void drm_bridge_connector_debugfs_init(struct drm_connect=
or *connector,
> > > > >                                             struct dentry *root)
> > > > >  {
> > > > > @@ -224,7 +212,6 @@ static const struct drm_connector_funcs drm_b=
ridge_connector_funcs =3D {
> > > > >       .reset =3D drm_atomic_helper_connector_reset,
> > > > >       .detect =3D drm_bridge_connector_detect,
> > > > >       .fill_modes =3D drm_helper_probe_single_connector_modes,
> > > > > -     .destroy =3D drm_bridge_connector_destroy,
> > > > >       .atomic_duplicate_state =3D drm_atomic_helper_connector_dup=
licate_state,
> > > > >       .atomic_destroy_state =3D drm_atomic_helper_connector_destr=
oy_state,
> > > > >       .debugfs_init =3D drm_bridge_connector_debugfs_init,
> > > > > @@ -328,7 +315,7 @@ struct drm_connector *drm_bridge_connector_in=
it(struct drm_device *drm,
> > > > >       int connector_type;
> > > > >       int ret;
> > > > >
> > > > > -     bridge_connector =3D kzalloc(sizeof(*bridge_connector), GFP=
_KERNEL);
> > > > > +     bridge_connector =3D drmm_kzalloc(drm, sizeof(*bridge_conne=
ctor), GFP_KERNEL);
> > > >
> > > > So you make destroy's kfree call unnecessary here ...
> > > >
> > > > >       if (!bridge_connector)
> > > > >               return ERR_PTR(-ENOMEM);
> > > > >
> > > > > @@ -383,9 +370,9 @@ struct drm_connector *drm_bridge_connector_in=
it(struct drm_device *drm,
> > > > >               return ERR_PTR(-EINVAL);
> > > > >       }
> > > > >
> > > > > -     ret =3D drm_connector_init_with_ddc(drm, connector,
> > > > > -                                       &drm_bridge_connector_fun=
cs,
> > > > > -                                       connector_type, ddc);
> > > > > +     ret =3D drmm_connector_init(drm, connector,
> > > > > +                               &drm_bridge_connector_funcs,
> > > > > +                               connector_type, ddc);
> > > >
> > > > ... and here of drm_connector_cleanup.
> > > >
> > > > drm_connector_unregister wasn't needed, so can ignore it, but you l=
eak a reference to
> > > > connector->fwnode since you don't call fwnode_handle_put anymore.
> > > >
> > > > We should register a drmm action right below the call to fwnode_han=
dle_get too.
> > >=20
> > > But drm_connector_cleanup() already contains
> > > fwnode_handle_put(connector->fwnode). Isn't that enough?
> >=20
> > It does, but now I'm confused.
> >=20
> > drm_bridge_connector_init takes a reference, drm_connector_init doesn't.
> > It will call drm_bridge_connector_destroy() that gives back its
> > reference (which makes sense to me), but then why do
> > drm_connector_cleanup() does? None of the drm_connector code even took
> > that reference, and we end up with a double-put.
> >=20
> > It looks like it was introduced by commit 48c429c6d18d ("drm/connector:
> > Add a fwnode pointer to drm_connector and register with ACPI (v2)") from
> > Hans, which does call put, but never gets that reference.
>=20
> The mentioned patch documents that pretty clearly:
>=20
> * Drivers can set this to associate a fwnode with a connector, drivers
> * are expected to get a reference on the fwnode when setting this.
> * drm_connector_cleanup() will call fwnode_handle_put() on this.
>=20
> This is logical. Whoever sets the drm_connector::fwnode pointer, should
> get reference. This way drm_connector_init() doesn't need to play with
> the reference counting. The cleanup code drops the reference (so the
> driver doesn't need to), because cleanup might be assynchronous..

Right, but it's the cleanup part that isn't logical. It makes total
sense to have the connector that sets connector->fwnode get the
reference itself. It doesn't make sense to have the core give that
reference instead of the driver.

It's confusing, because if the driver is supposed to handle its
reference itself, then it should handle all of it itself. This bug is
the testament for that: the natural approach is buggy.

> The drm_bridge_connector follows this approach: it sets
> drm_connector->fwnode, so it gets the reference. It uses
> drm_connector_cleanup(), so it doesn't need to put it.

Yet, it calls fwnode_handle_put in its destroy path, because it grabbed
a reference before.

Maxime

--l7blei7rzdrnpggn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZmgQtAAKCRDj7w1vZxhR
xS5PAP0ecACIdyHVUANOEstpBHZYkKuDtBGi51NuDHKzgPZIVQEAteId7U0SLYEG
XjvB4MdtarwH+H3AyHBZF+xD0iHC/Qs=
=xPY7
-----END PGP SIGNATURE-----

--l7blei7rzdrnpggn--

