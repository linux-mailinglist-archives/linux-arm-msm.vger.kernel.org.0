Return-Path: <linux-arm-msm+bounces-110563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEFTEU9oHWrqaAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:09:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CA561E187
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFC9130053F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 10:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212C339A4BA;
	Mon,  1 Jun 2026 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViGaO25U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45CF347515;
	Mon,  1 Jun 2026 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780311468; cv=none; b=CpPFfuRSj97SyyBLDUH9fk2bDCBkGpAJ0nbOjhPXWJPvK4HG/Y3HCCmZtV61ohqSfYl4Gw7MLsRsqTf8iVTZrVlw5L4OT5rueghmqlL7bb50to6+xe/oi4f8ZaUYrCCOR8Ncqvv2WXiDsEF+nO1PRYjnvAqjMQJ0lX+fvUZtVyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780311468; c=relaxed/simple;
	bh=SENj6mQt3J3p63B2Cfwtu91pY2xE/PRwC/9bAfUJe94=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=haaP9fA3oxqs/R4ZKYrKKgAzsYKOSk7aIx8URBSRJ+BIHgriLyvY/ThJPpZAig007OjiIkK3sp72hlzVWQe5bzclV5qijntyq6qw7t/CvAUfw/qFLuRSdgGhKKNk9UL8XJqOKTytWnwImJxvV9YktDZ5oe7Uh1bip/gkmkxJpDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViGaO25U; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780311467; x=1811847467;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=SENj6mQt3J3p63B2Cfwtu91pY2xE/PRwC/9bAfUJe94=;
  b=ViGaO25U2/FdYG3o1ry3Ehas6TFuYDYp2Cie8A9xRBkOhunnFRrCgsZ9
   8oCI4wBP/EOAbcSNQhgQmmUvlZPcecgA/A6Bl9rrkeiEwS6PXV1rMBkIh
   puzWTvNOGS7klXUua/KpBOk+5wIBonk0FpzZeoWwd9yqi4RhduBw20/gy
   hpqRYmjnFK6bE3iyhzXSqBZrlAyXj7m800EVIaqh0XMe6PDA1NBW0u3NK
   ZKkKqypt1PD/4Bi4k+UP+73ymRF8Hs5bbBtcpE8YYtA4M0gaw+jI6z38X
   6KJG7q4+VBU3W3YFwK5JM3BxEXe4Vpr2YkXVf7vT0xpUziXyUKnYMo4si
   g==;
X-CSE-ConnectionGUID: nbfblyi/Tr+R8ViSudpfWw==
X-CSE-MsgGUID: JpR3m260QDaBoqEcldw0Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="91376558"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="91376558"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:57:47 -0700
X-CSE-ConnectionGUID: gezfP2+aT/WzG+HhXomp7g==
X-CSE-MsgGUID: QUrIEYc3Svyh39Wbd/WxmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="247510567"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.121])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:57:42 -0700
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
Date: Mon, 01 Jun 2026 13:57:39 +0300
Message-ID: <d50293fab9e6292220b1817a8e85bbd89743b708@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110563-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oldschoolsolutions.biz:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 92CA561E187
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 31 May 2026, Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> drm_edid_read_ddc() can return a structurally valid EDID from which
> drm_edid_connector_add_modes() still returns zero modes. This triggers
> the error:
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

Did you actually bisect to this commit? It's a bit of a surprise.

Side note, the Fixes: trailer has a strict format. Please look at git
logs for what it should be like.

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

