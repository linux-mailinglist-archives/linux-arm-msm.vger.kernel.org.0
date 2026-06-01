Return-Path: <linux-arm-msm+bounces-110562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG61Mm1mHWrqaAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:01:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 338DE61E08A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0773301465C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 10:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1898339902D;
	Mon,  1 Jun 2026 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YN7LAJIQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8FD2D7814;
	Mon,  1 Jun 2026 10:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780311278; cv=none; b=bgme5k8SL2nxbj49PJWA6c1q6D22asOQatws2g92fLFv8iiAHs2FJpcBLYyiyAnJUAd48MTMmt0baxTTh2f0h4ydAsCYrdKzVBWIjBNgQB/MAeMwAZI3y+SSRjYm7wAhlrPq5c5uUPJBKxCT9zCX9VesNEMZjuodQ6kcdM4QSzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780311278; c=relaxed/simple;
	bh=vl8pAI1oik1lLhgRq6fMHBXq4BU0JIxGE8qnAnuXtKQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SlVZF0uxnBrPN6w7XWOq+yHc3EQOrtzjfToia5FzUbw5kshCWdoLodSv6dxrcFZKJgAtdfSjIz81C9nmR91K9RbiA1U4D1J8LALnplgD3a5oiIzilaYCUf64Hk/17yJpGABKt2eBuj+meBLY0CAPEIrD+6BZ0ZAhvTN30iZdW78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YN7LAJIQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780311277; x=1811847277;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=vl8pAI1oik1lLhgRq6fMHBXq4BU0JIxGE8qnAnuXtKQ=;
  b=YN7LAJIQJ3cKt4udrHZDZyj2/et0xs1DtLG5Aam5TNE1uilRvV8uv9Ac
   KRByOqchXwmX92RGvenz6pOqNUoauB+7762+/VTTnqFjWeHGXz6DliPIZ
   NUKEoPjdT3rR1Hcfex6FScKvFT3n85or2IWq7ceSQ3OVj7RC2RxcITzhs
   SLVW/MPj0yx+KJikGZlRHb/UMAz0w04Ei5c7OstINrIfPOXAg5QuzeAzA
   KgtMklHnCWGMmElFLfrQB0g53qxWAW5dukfUXn1ple7vq8SYbALvcgjh9
   t18yb1oaMRRGH2WqEdGV7S+962zfI0rmFKrRkC/X7qpHOdiP9FRrGtyqV
   A==;
X-CSE-ConnectionGUID: 0+sOt/qbSRuyd8PuiP7UDg==
X-CSE-MsgGUID: +hmm47E7SaCv7JBlPL39Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="81251483"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81251483"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:54:36 -0700
X-CSE-ConnectionGUID: LYPia3kJRLujVbnAOjaOig==
X-CSE-MsgGUID: DCBerR4HSZ2qVSztYFNrgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="242496604"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.121])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:54:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jens Glathe via B4 Relay
 <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jens Glathe
 <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH] drm/msm/dp: add EDID re-read retry in
 msm_dp_panel_get_modes()
In-Reply-To: <20260531-drm_plug_flaky_edid-v1-1-2708c16dce97@oldschoolsolutions.biz>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260531-drm_plug_flaky_edid-v1-1-2708c16dce97@oldschoolsolutions.biz>
Date: Mon, 01 Jun 2026 13:54:29 +0300
Message-ID: <9e20789b198624172bd87649370de52e26c79a70@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110562-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,jens.glathe.oldschoolsolutions.biz];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oldschoolsolutions.biz:email]
X-Rspamd-Queue-Id: 338DE61E08A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 31 May 2026, Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> drm_edid_read_ddc() can return a structurally valid EDID from which
> drm_edid_connector_add_modes() still returns zero modes. This triggers
> the error:

What are the EDID contents in that case?

Where does it originate from? A valid but "not what you wanted" EDID
doesn't show up from thin air.

Perhaps it's the hub/adapter replying with some placeholder EDID instead
of the actual sink EDID. Maybe it's the timing and/or ordering.

Feels like root causing would be in order before adding hacks like this
that are notoriously difficult to remove in the future, and will easily
block future progress.


BR,
Jani.


>
>   [drm:msm_dp_bridge_get_modes [msm]] *ERROR* failed to get DP sink
>    modes, rc=0
>
> even though the link is ready. Since the EDID is only read once, this
> error persists and the display comes up with 640x480 resolution.
>
> Add a retry of drm_edid_read_ddc() inside get_modes() when the initial
> read produces no usable modes. The bad EDID is freed before retrying
> and container_of ensures access to the DDC channel. This directly
> addresses the observed "valid but empty/garbage" EDID case on
> flaky DP plugs and adapters.
>
> I tested this on a few of my "flaky" type-c to HDMI adapters and hubs,
> getting no "retry failed" messages and the desired resolution. Without
> the patch most plugs would result in 640x480 external display.
>
> Fixes: [5bea90ad9743d2] "drm/msm/dp: switch to struct drm_edid"
>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 6bb021820d7c5..4f27c8129b0ef 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -327,11 +327,39 @@ u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
>  int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
>  	struct drm_connector *connector)
>  {
> +	int modes;
> +	int retry;
> +	struct msm_dp_panel_private *panel;
> +
>  	if (!msm_dp_panel) {
>  		DRM_ERROR("invalid input\n");
>  		return -EINVAL;
>  	}
>  
> +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> +
> +	if (msm_dp_panel->drm_edid) {
> +		modes = drm_edid_connector_add_modes(connector);
> +		if (modes > 0)
> +			return modes;
> +
> +		drm_edid_free(msm_dp_panel->drm_edid);
> +		msm_dp_panel->drm_edid = NULL;
> +	}
> +
> +	for (retry = 0; retry < 5; retry++) {
> +		usleep_range(20000, 25000);
> +		msm_dp_panel->drm_edid =
> +			drm_edid_read_ddc(connector, &panel->aux->ddc);
> +		if (msm_dp_panel->drm_edid)
> +			break;
> +
> +		drm_dbg_dp(connector->dev,
> +			   "get_modes re-read attempt %d/5 failed\n",
> +			   retry + 1);
> +	}
> +
> +	drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
>  	if (msm_dp_panel->drm_edid)
>  		return drm_edid_connector_add_modes(connector);
>  
>
> ---
> base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
> change-id: 20260531-drm_plug_flaky_edid-cc7743f6f909
>
> Best regards,

-- 
Jani Nikula, Intel

