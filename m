Return-Path: <linux-arm-msm+bounces-108935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAb/LbK5DmrBBgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:52:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C175A061B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BBBC73019055
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA50341AC7;
	Thu, 21 May 2026 07:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnVHFdnu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCE833AD9D;
	Thu, 21 May 2026 07:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349654; cv=none; b=uSQedzPZLql+UK2Fc31IH4Md9PnbGQRLFVSiujLl02n66Bk2rpmm0O2kKgY4X+HdQ0S5OjHsXLNNI6McUKw9r4Lk33dTYKLZk3ZlBX8VBi23QiMgoNCT52EVqJVIzZ9eGkpiu6uW36HVGjlBio4/rAL03nWevD071LL69Wkl7zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349654; c=relaxed/simple;
	bh=uF97CAtH11NgQX2cMKMa/FkrzejTk64QapAv+7JBuig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4RNJm9M9jhq2VGke9HnziKQ6cQdo2krh3H5CeqIXsuUpYeIHovh1FP0UkQmwCuUGbrJIrDLP1X99bVc7KQYXq5D1eeDyxEyTt5j3SuuFFd/6HeLgjzvCuVidJe6giHaCH2oeGittRRKJacmkiUHf1tqeKEVH0IQGrYsddz45NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnVHFdnu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D8C1F00A3B;
	Thu, 21 May 2026 07:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779349652;
	bh=UczfSrk2FCod7H4rifpa1n/f+nsCfH/NDhquQgw9qmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lnVHFdnu4MxoKkNgwK7y8HGU3d4DYUs+ji4ZleQUFnc7lWrFEDHl1CvxyDjdXpvgT
	 HlnlNlFw1CQJGU4CFlK9lKXlg2BKtXCogvJzTjYP7G3AAFoqpOzNAKV5fMtUdbFfBX
	 nhAmOBBIl9WhjiX3HqlhL1J0mtoa1LPqB1stBsH9a1oNOXiK09uHryvqmCGyaZHGUp
	 HxYt8eE2J1iTPLWK8onPq+B79CD00dCDAvTCQEsUzlmt28kAk9Tk82+RogLNXDjd1s
	 BdKNotWIoG5SDfjfSx8/ZcBPmf/kArJ294dCiuHk4Z9UdDQdIRaH/dsTGUrYdG1RLG
	 +ccFkeS4sY5Rg==
Date: Thu, 21 May 2026 09:47:29 +0200
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
Message-ID: <20260521-funny-astonishing-mackerel-cc5a01@penduick>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
 <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="uipgpe3pv2bnp7vq"
Content-Disposition: inline
In-Reply-To: <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108935-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 56C175A061B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--uipgpe3pv2bnp7vq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
MIME-Version: 1.0

On Wed, May 13, 2026 at 09:23:21PM +0300, Dmitry Baryshkov wrote:
> The DisplayPort standard defines a special kind of events called IRQ.
> These events are used to notify DP Source about the events on the Sink
> side. It is extremely important for DP MST handling, where the MST
> events are reported through this IRQ.
>=20
> In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> events are ported through the bits in the AltMode VDOs.
>=20
> Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> events to the DisplayPort Sink drivers.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_connector.c          |  5 ++++-
>  drivers/usb/typec/altmodes/displayport.c | 15 +++++++++++----
>  include/drm/drm_connector.h              | 19 ++++++++++++++++++-
>  3 files changed, 33 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 47dc53c4a738..edee9daccd51 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -3510,6 +3510,8 @@ struct drm_connector *drm_connector_find_by_fwnode(=
struct fwnode_handle *fwnode)
>   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to=
 connector
>   * @connector_fwnode: fwnode_handle to report the event on
>   * @status: hot plug detect logical state
> + * @extra_status: additional information provided by the sink without ch=
anging
> + * the HPD state (or in addition to such a change).
>   *
>   * On some hardware a hotplug event notification may come from outside t=
he display
>   * driver / device. An example of this is some USB Type-C setups where t=
he hardware
> @@ -3520,7 +3522,8 @@ struct drm_connector *drm_connector_find_by_fwnode(=
struct fwnode_handle *fwnode)
>   * a drm_connector reference through calling drm_connector_find_by_fwnod=
e().
>   */
>  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwn=
ode,
> -				     enum drm_connector_status status)
> +				     enum drm_connector_status status,
> +				     enum drm_connector_status_extra extra_status)
>  {
>  	struct drm_connector *connector;
> =20
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec=
/altmodes/displayport.c
> index 35d9c3086990..7182a8e2e710 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -189,7 +189,9 @@ static int dp_altmode_status_update(struct dp_altmode=
 *dp)
>  	} else {
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>  						hpd ? connector_status_connected :
> -						      connector_status_disconnected);
> +						      connector_status_disconnected,
> +						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
> +								   DRM_CONNECTOR_NO_EXTRA_STATUS);

Since the extra status itself, and what the options mean, are DP specific, =
do we really want to
extend drm_connector_oob_hotplug_event()? I think I'd prefer to have a DP s=
pecific variant, with its
own set of parameters.

Maxime

--uipgpe3pv2bnp7vq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCag64iQAKCRAnX84Zoj2+
dhJzAYClCMH5nftN7lNJDSZByXRPwo/xO31PTF3adTcKyfMtvVmon8CIoheOgyRx
VwxpLvMBf0dr9uwFTrG2lPtQTFNmHOzXDF1ujEGuM3hWzigGtwt7xylrgcMlpE1b
f9c6Uo1BbQ==
=SGa3
-----END PGP SIGNATURE-----

--uipgpe3pv2bnp7vq--

