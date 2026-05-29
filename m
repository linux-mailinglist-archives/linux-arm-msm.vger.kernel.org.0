Return-Path: <linux-arm-msm+bounces-110280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IrVBgeeGWq7xwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:09:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4283F6034C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C20230000AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885D833A9EB;
	Fri, 29 May 2026 14:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzF0txoY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E133E2750;
	Fri, 29 May 2026 14:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063493; cv=none; b=nDAVC8DH5pBSCJDbN8rRSClMLJHM/GeCEAR2NvU7/xeh1VF4OkvHaQTDHLCadb7tU13CCxvg6MH8OB0d803wQi0jGwbJ0Xb/H7vPSqgu5tLy6pnM9qsS048JGmZhflrFgUaLkBqGcR0AX02khZm/s0Dd8bWS/aFujp4uw2oWaaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063493; c=relaxed/simple;
	bh=WLaZzgTwiDtEeHvJ9/BpGdnxJwJ7RhLd3s5oM73LWiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7Ck/O3RPUZwlSVFrmcSVUoJweME/GDmTIwWNUZm0GLQy/d0RLbN8zfLjhfwYUSUTeKw3ViX3yE9xrlefLYgZkWBf2souGK1u57W/KQfcILAqLNsqJklTKJyVMtiQzVRnNJP+kpt5c8oAUSgus0MIde9koarqbXcGHFMc8EKbl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PzF0txoY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97FA1F00893;
	Fri, 29 May 2026 14:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780063489;
	bh=uvb5N2t0ImORcoosIY39Tpj5MtrUeKYq4hi4uWxUSeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PzF0txoYlN14C5R/lIRWeNek2EP4bG+AH1WlPwfb072fXV3CLH6nq3c2LNyM5bl+x
	 MPE8VuJmFglQF2ykVzaI+Q3QYY1oUXPPLMMWbYFrjrGjbnvxhmYmyRWVZBFK7QTKls
	 9f1aEeJMylDnsegbfl3ejKp77Q+9FZutTFtSEIOjlyUevHQMsFJpETzJbtd98nsjMk
	 CWQ7MkxmiivOJTUgd4ddF7VmVczKW3lXfh4AQPIJI0RADND+G+uavoXDjpUpiSNoRv
	 JO76wQoVwSZR5UyLm6wnAap0vfnQfGgLjHimxMZdvzN92VqZbBfdyjElIwDI24AgyR
	 XcAyoEiKW6k1Q==
Date: Fri, 29 May 2026 16:04:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>, 
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <20260529-screeching-rugged-shellfish-4dcde3@houat>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
 <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
 <20260521-funny-astonishing-mackerel-cc5a01@penduick>
 <vpd5hyote5wspmlpad64kf5peoy5g7wv6c7xjn6ammcmjtai7r@q2tarmr5aoqn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="igbxyj2yvssgkryc"
Content-Disposition: inline
In-Reply-To: <vpd5hyote5wspmlpad64kf5peoy5g7wv6c7xjn6ammcmjtai7r@q2tarmr5aoqn>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110280-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4283F6034C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--igbxyj2yvssgkryc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
MIME-Version: 1.0

On Thu, May 21, 2026 at 03:05:11PM +0300, Dmitry Baryshkov wrote:
> On Thu, May 21, 2026 at 09:47:29AM +0200, Maxime Ripard wrote:
> > On Wed, May 13, 2026 at 09:23:21PM +0300, Dmitry Baryshkov wrote:
> > > The DisplayPort standard defines a special kind of events called IRQ.
> > > These events are used to notify DP Source about the events on the Sink
> > > side. It is extremely important for DP MST handling, where the MST
> > > events are reported through this IRQ.
> > >=20
> > > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > > events are ported through the bits in the AltMode VDOs.
> > >=20
> > > Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> > > events to the DisplayPort Sink drivers.
> > >=20
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/drm_connector.c          |  5 ++++-
> > >  drivers/usb/typec/altmodes/displayport.c | 15 +++++++++++----
> > >  include/drm/drm_connector.h              | 19 ++++++++++++++++++-
> > >  3 files changed, 33 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_co=
nnector.c
> > > index 47dc53c4a738..edee9daccd51 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -3510,6 +3510,8 @@ struct drm_connector *drm_connector_find_by_fwn=
ode(struct fwnode_handle *fwnode)
> > >   * drm_connector_oob_hotplug_event - Report out-of-band hotplug even=
t to connector
> > >   * @connector_fwnode: fwnode_handle to report the event on
> > >   * @status: hot plug detect logical state
> > > + * @extra_status: additional information provided by the sink withou=
t changing
> > > + * the HPD state (or in addition to such a change).
> > >   *
> > >   * On some hardware a hotplug event notification may come from outsi=
de the display
> > >   * driver / device. An example of this is some USB Type-C setups whe=
re the hardware
> > > @@ -3520,7 +3522,8 @@ struct drm_connector *drm_connector_find_by_fwn=
ode(struct fwnode_handle *fwnode)
> > >   * a drm_connector reference through calling drm_connector_find_by_f=
wnode().
> > >   */
> > >  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector=
_fwnode,
> > > -				     enum drm_connector_status status)
> > > +				     enum drm_connector_status status,
> > > +				     enum drm_connector_status_extra extra_status)
> > >  {
> > >  	struct drm_connector *connector;
> > > =20
> > > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/t=
ypec/altmodes/displayport.c
> > > index 35d9c3086990..7182a8e2e710 100644
> > > --- a/drivers/usb/typec/altmodes/displayport.c
> > > +++ b/drivers/usb/typec/altmodes/displayport.c
> > > @@ -189,7 +189,9 @@ static int dp_altmode_status_update(struct dp_alt=
mode *dp)
> > >  	} else {
> > >  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > >  						hpd ? connector_status_connected :
> > > -						      connector_status_disconnected);
> > > +						      connector_status_disconnected,
> > > +						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
> > > +								   DRM_CONNECTOR_NO_EXTRA_STATUS);
> >=20
> > Since the extra status itself, and what the options mean, are DP specif=
ic, do we really want to
> > extend drm_connector_oob_hotplug_event()? I think I'd prefer to have a =
DP specific variant, with its
> > own set of parameters.
>=20
> I can try arguing that drm_connector_oob_hotplug_event() is DP-specific,
> there are no other users for it, only the DP AltMode driver.
>=20
> Anyway, do you just mean new API here or new API and a new connector
> callback?

If drm_connector_oob_hotplug_event is truly only used for DP, then I
don't mind keeping it as is but we should make it more obvious and
document it, both in the function documentation, but also by having a
better name for the extra status. drm_connector_dp_oob_status maybe?

Maxime

--igbxyj2yvssgkryc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCahmc9AAKCRAnX84Zoj2+
djO+AX9GD3UDymFlG73wL8mTckVK3mCkw2t3NcDn6047apScJWb1XRrN+lO8trM6
73C+84cBfRq9ZR8HId0E6cdzLBqaHSBYmjoTlzIx0kiwM44c3apdybiB2SfFjOBv
SX2rCZoICg==
=Fbz6
-----END PGP SIGNATURE-----

--igbxyj2yvssgkryc--

