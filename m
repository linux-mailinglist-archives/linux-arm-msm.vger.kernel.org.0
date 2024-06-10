Return-Path: <linux-arm-msm+bounces-22186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F2902141
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 14:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27BA1288DD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 12:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14AB56444;
	Mon, 10 Jun 2024 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnP4Lvxd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8A51F171;
	Mon, 10 Jun 2024 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718021229; cv=none; b=Ad+1kGu6MLmrxm7lQ0cNb5qF7qPXeAx8HTMb15h4/NDDfm95GenWtrzVz2RiyTNtVcxJHt12Tdg7Pdf0A1Zh3KkI4v1f63qclxEsVr6MRRLzfhyc6gIGIBN/R32VSHb01GcaRpDU/bMEcTDBoZwvy6lLh8hRA23ijfjb/ARxaLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718021229; c=relaxed/simple;
	bh=2U/YCPXP3h3E72ZFcJ01aDdKPYc4hTIGt/X+HdCdgmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2tUBjuyOy3qsksTl6TxQcg9Mt4qCCNUp0nOoRjFvcbijh+8srA3dof5MoCZSi8ZxfrBoFb80VmuMO26KbpSB5SG2bzzgaS4qqGO7dQ2NSCv7Lm/id4NHQseUWR5sZfLi5YHnoUARinTGknCLPZsKUT+uLQtYfe7FwrZ+cYEolw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnP4Lvxd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAC8C2BBFC;
	Mon, 10 Jun 2024 12:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718021229;
	bh=2U/YCPXP3h3E72ZFcJ01aDdKPYc4hTIGt/X+HdCdgmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cnP4LvxdzqpIgKaTph48lgdmjB352zzjOsPka3IluTevbR4zclCHkzm+QRGEMdRCN
	 vvErG+BgQmYojwfH/CPlJQyQO4qPWqUJzOn4SNjnvPaikfyHNMmeT10oBB/ZIVvaca
	 2PAozJ/JpthOpjpSPn7KrRq+he2ln/z1CmBZSFb2yR90SSm18L+sNg8e1kFr0GjV/Q
	 YBOWoW7RzJyj9gK71o+pG/JgbUeMZwoDy2DKW2SBvfrlD1AYkwPXyIYDQ/5SmVCOeH
	 Nds2rnL9e54r9dkEVB/Y9SYE2CmIbyXpxVD2gZHXTVuvAQnC5VFuLwJ6nH1A7r6yOj
	 luXv+plQD4fUg==
Date: Mon, 10 Jun 2024 14:07:06 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Hans de Goede <hdegoede@redhat.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/9] drm/bridge-connector: switch to using drmm
 allocations
Message-ID: <20240610-smooth-liberal-guan-59853e@houat>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
 <20240607-bridge-hdmi-connector-v5-2-ab384e6021af@linaro.org>
 <20240610-secret-rottweiler-from-asgard-132f75@houat>
 <CAA8EJpogi2qm0bhCwumY4zj-xMUkF4zbK-NAPqCeDbLcybFciw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="el7xxi27p7cybwwv"
Content-Disposition: inline
In-Reply-To: <CAA8EJpogi2qm0bhCwumY4zj-xMUkF4zbK-NAPqCeDbLcybFciw@mail.gmail.com>


--el7xxi27p7cybwwv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

+Hans

On Mon, Jun 10, 2024 at 02:46:03PM GMT, Dmitry Baryshkov wrote:
> On Mon, 10 Jun 2024 at 11:04, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > On Fri, Jun 07, 2024 at 04:22:59PM GMT, Dmitry Baryshkov wrote:
> > > Turn drm_bridge_connector to using drmm_kzalloc() and
> > > drmm_connector_init() and drop the custom destroy function. The
> > > drm_connector_unregister() and fwnode_handle_put() are already handled
> > > by the drm_connector_cleanup() and so are safe to be dropped.
> > >
> > > Acked-by: Maxime Ripard <mripard@kernel.org>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/drm_bridge_connector.c | 23 +++++------------------
> > >  1 file changed, 5 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm=
/drm_bridge_connector.c
> > > index 982552c9f92c..e093fc8928dc 100644
> > > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > > @@ -15,6 +15,7 @@
> > >  #include <drm/drm_connector.h>
> > >  #include <drm/drm_device.h>
> > >  #include <drm/drm_edid.h>
> > > +#include <drm/drm_managed.h>
> > >  #include <drm/drm_modeset_helper_vtables.h>
> > >  #include <drm/drm_probe_helper.h>
> > >
> > > @@ -193,19 +194,6 @@ drm_bridge_connector_detect(struct drm_connector=
 *connector, bool force)
> > >       return status;
> > >  }
> > >
> > > -static void drm_bridge_connector_destroy(struct drm_connector *conne=
ctor)
> > > -{
> > > -     struct drm_bridge_connector *bridge_connector =3D
> > > -             to_drm_bridge_connector(connector);
> > > -
> > > -     drm_connector_unregister(connector);
> > > -     drm_connector_cleanup(connector);
> > > -
> > > -     fwnode_handle_put(connector->fwnode);
> > > -
> > > -     kfree(bridge_connector);
> > > -}
> > > -
> > >  static void drm_bridge_connector_debugfs_init(struct drm_connector *=
connector,
> > >                                             struct dentry *root)
> > >  {
> > > @@ -224,7 +212,6 @@ static const struct drm_connector_funcs drm_bridg=
e_connector_funcs =3D {
> > >       .reset =3D drm_atomic_helper_connector_reset,
> > >       .detect =3D drm_bridge_connector_detect,
> > >       .fill_modes =3D drm_helper_probe_single_connector_modes,
> > > -     .destroy =3D drm_bridge_connector_destroy,
> > >       .atomic_duplicate_state =3D drm_atomic_helper_connector_duplica=
te_state,
> > >       .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_s=
tate,
> > >       .debugfs_init =3D drm_bridge_connector_debugfs_init,
> > > @@ -328,7 +315,7 @@ struct drm_connector *drm_bridge_connector_init(s=
truct drm_device *drm,
> > >       int connector_type;
> > >       int ret;
> > >
> > > -     bridge_connector =3D kzalloc(sizeof(*bridge_connector), GFP_KER=
NEL);
> > > +     bridge_connector =3D drmm_kzalloc(drm, sizeof(*bridge_connector=
), GFP_KERNEL);
> >
> > So you make destroy's kfree call unnecessary here ...
> >
> > >       if (!bridge_connector)
> > >               return ERR_PTR(-ENOMEM);
> > >
> > > @@ -383,9 +370,9 @@ struct drm_connector *drm_bridge_connector_init(s=
truct drm_device *drm,
> > >               return ERR_PTR(-EINVAL);
> > >       }
> > >
> > > -     ret =3D drm_connector_init_with_ddc(drm, connector,
> > > -                                       &drm_bridge_connector_funcs,
> > > -                                       connector_type, ddc);
> > > +     ret =3D drmm_connector_init(drm, connector,
> > > +                               &drm_bridge_connector_funcs,
> > > +                               connector_type, ddc);
> >
> > ... and here of drm_connector_cleanup.
> >
> > drm_connector_unregister wasn't needed, so can ignore it, but you leak =
a reference to
> > connector->fwnode since you don't call fwnode_handle_put anymore.
> >
> > We should register a drmm action right below the call to fwnode_handle_=
get too.
>=20
> But drm_connector_cleanup() already contains
> fwnode_handle_put(connector->fwnode). Isn't that enough?

It does, but now I'm confused.

drm_bridge_connector_init takes a reference, drm_connector_init doesn't.
It will call drm_bridge_connector_destroy() that gives back its
reference (which makes sense to me), but then why do
drm_connector_cleanup() does? None of the drm_connector code even took
that reference, and we end up with a double-put.

It looks like it was introduced by commit 48c429c6d18d ("drm/connector:
Add a fwnode pointer to drm_connector and register with ACPI (v2)") from
Hans, which does call put, but never gets that reference.

It has nothing to do with this series anymore, but that's super fishy to
me, and the source of bugs as we can see here.

Maxime

--el7xxi27p7cybwwv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZmbsagAKCRDj7w1vZxhR
xckYAQCDTJorQTcQDhmgV29rFJ2hpFj71f0lUZ0v3V35DfIUKgEAkhxEfc67iAKc
fyvwL9MHw8ZSMruyCAUXUV6rRES1tQg=
=B170
-----END PGP SIGNATURE-----

--el7xxi27p7cybwwv--

