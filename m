Return-Path: <linux-arm-msm+bounces-110804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKaHDjG0Hmr7JAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 12:45:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 425C462CD01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 12:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CBE3E30028CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 10:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EA83D6476;
	Tue,  2 Jun 2026 10:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kFYm0yAq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CC633D6F7
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780396467; cv=none; b=nFIaddQ8yvo5AQWKXw3DpwPPzS4CQPuMPRlbWJkx8FOAq/6iy5aXZM6riqgSW5ZZb9SGDyOWaClpfEep87VKio4sfMCSxMt/14dstFUUNPCUdI51GiJ6lCh5mxEEmeFkM1Rt5CHfN4GUfuanai/IcJPD/tYw/xuvQYe3pxfYBug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780396467; c=relaxed/simple;
	bh=sSLG3wXzMGkuchBhOWXlkifyhi6ZS+mT6rRQfEDVsGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLugZj7e9to7sfeOBDr4NaHjd8dPPQlvQvnldDkz+S1W8d4CpUNwpkEyP3VfX3fJWVSsX5/0Tugq996TvbhEKRnz1dwi4VeAJVwIFUD6WTLa/sAUbkv+Atzlwgzxm3yobj6HH82hsAxGp5fFbBslK86tfnuI2hVfSPtf+TGa8kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kFYm0yAq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54ED4353D
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 03:34:20 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1440D3F632
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 03:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780396465; bh=sSLG3wXzMGkuchBhOWXlkifyhi6ZS+mT6rRQfEDVsGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kFYm0yAqMe72KIAAwUBvvsw/ID7etQEFx6JM6Z014ms2VHE7FJM97sfnkJVmc6zvx
	 LYhju8o0hvFxJoDAN1jB5orrIS3lRfVdRNUsxr+eyAJY+Dnx395m99AL0ako9Yzvvc
	 hl7TqvsQMhbul6LCLTW7IjCu1/cLxhN9EjA5TQQ8=
Date: Tue, 2 Jun 2026 11:33:49 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	"Kandpal, Suraj" <suraj.kandpal@intel.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 4/8] drm/mali: use drmm_writeback_connector_init()
Message-ID: <ah6xjR_vHhsXqvyI@e142607>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
 <20260505-wb-drop-encoder-v5-4-42567b7c7af2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505-wb-drop-encoder-v5-4-42567b7c7af2@oss.qualcomm.com>
X-Rspamd-Queue-Id: 425C462CD01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110804-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liviu.dudau@arm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,bootlin.com:email,qualcomm.com:email,arm.com:dkim,arm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, May 05, 2026 at 03:25:01AM +0300, Dmitry Baryshkov wrote:
> The driver uses drm_writeback_connector_init() instead of its drmm
> counterpart, but it doesn't perform the job queue cleanup (neither
> manually nor by calling drm_writeback_connector_cleanup()). On the
> contrary, the drmm_writeback_connector_init() function ensures the
> proper cleanup of the job queue.
> 
> Use drmm_plain_encoder_alloc() to allocate simple encoder and
> drmm_writeback_connector_init() in order to initialize writeback
> connector instance.
> 
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/malidp_mw.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
> index fad343842038..6e0c78e998aa 100644
> --- a/drivers/gpu/drm/arm/malidp_mw.c
> +++ b/drivers/gpu/drm/arm/malidp_mw.c
> @@ -84,11 +84,6 @@ malidp_mw_connector_detect(struct drm_connector *connector, bool force)
>  	return connector_status_connected;
>  }
>  
> -static void malidp_mw_connector_destroy(struct drm_connector *connector)
> -{
> -	drm_connector_cleanup(connector);
> -}
> -
>  static struct drm_connector_state *
>  malidp_mw_connector_duplicate_state(struct drm_connector *connector)
>  {
> @@ -114,7 +109,6 @@ static const struct drm_connector_funcs malidp_mw_connector_funcs = {
>  	.reset = malidp_mw_connector_reset,
>  	.detect = malidp_mw_connector_detect,
>  	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = malidp_mw_connector_destroy,
>  	.atomic_duplicate_state = malidp_mw_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
> @@ -211,6 +205,7 @@ static u32 *get_writeback_formats(struct malidp_drm *malidp, int *n_formats)
>  int malidp_mw_connector_init(struct drm_device *drm)
>  {
>  	struct malidp_drm *malidp = drm_to_malidp(drm);
> +	struct drm_encoder *encoder;
>  	u32 *formats;
>  	int ret, n_formats;
>  
> @@ -224,11 +219,19 @@ int malidp_mw_connector_init(struct drm_device *drm)
>  	if (!formats)
>  		return -ENOMEM;
>  
> -	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
> -					   &malidp_mw_connector_funcs,
> -					   &malidp_mw_encoder_helper_funcs,
> -					   formats, n_formats,
> -					   1 << drm_crtc_index(&malidp->crtc));
> +	encoder = drmm_plain_encoder_alloc(drm, NULL, DRM_MODE_ENCODER_VIRTUAL,
> +					   NULL);
> +	if (IS_ERR(encoder))
> +		return PTR_ERR(encoder);
> +
> +	drm_encoder_helper_add(encoder, &malidp_mw_encoder_helper_funcs);
> +
> +	encoder->possible_crtcs = drm_crtc_mask(&malidp->crtc);
> +
> +	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector,
> +					    &malidp_mw_connector_funcs,
> +					    encoder,
> +					    formats, n_formats);
>  	kfree(formats);
>  	if (ret)
>  		return ret;
> 
> -- 
> 2.47.3
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

