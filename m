Return-Path: <linux-arm-msm+bounces-41516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8435B9ECF2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC055280F68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D75119DF9A;
	Wed, 11 Dec 2024 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hqna+FOR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245E7189B8B;
	Wed, 11 Dec 2024 14:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733929011; cv=none; b=D/WMnfYtzbw+kAo4zY2bvJcdkfp6ZIFdn6DorRWslHZA3aZXHQK0IDPTdZvhZzDEf3RL3HPeO1BMPC+ebIMjgiY9bObzG6NvCvd04/xzn/A7PRTMXW6zsmBMVu+y46Pn0y+3SvZPnVRJq4pLOCN6l0xGKVylZN3ScT/gJcyl3KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733929011; c=relaxed/simple;
	bh=OREpjiujqd4SpEZvxAc06dWhF5wUZtZuOpJQ2zmJ8fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ioao4Cmc9pvTgV0hhRbRwWptCD6pfbg6GjyCJmLMBnoyg/TloePjjXWwrp3HiL5Ee2fqbnzfy32O0otDyKXtTBoxn8Sy1Ko7Jo0NywdG0bvYCDCMznBECdSCMsYJK/MvnREzCeBGP4K2nJsYP4ekBRDLHmw2Uy55YS4laNuOBeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hqna+FOR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AA8C4CED4;
	Wed, 11 Dec 2024 14:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733929010;
	bh=OREpjiujqd4SpEZvxAc06dWhF5wUZtZuOpJQ2zmJ8fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hqna+FORRl5s+hoVNX1PHcAkrXrpDQAzfv3NlWXzozI+wZiDZ9WBguGPAcyZkoVQ5
	 0CtxxAowC8RaEdJMSlzLkrp3IUwDW3JMLdjLrSs41emwNl+Y6yzhrDM546MppyN+Yl
	 nnw8RlLR7bspvO+J+GDQsGPpmPxzMB7JWfnwOtasrvSfgVWx91ff+nLOU0TIihH8wJ
	 nLGG/wQEzgYZ2vliQ3sVwcAHKGmrmcW356DKkU4Spduc1T7ehj0yZm5P5bkqDMHsdq
	 RwyjSvRidsZIryVplu/6/gBL92iRjHH0Jt5G7eu/eUprRLUrfMYIZXTKJePQiOOk24
	 TPuRWRdoA1Dag==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tLO8z-000000003BN-11Dy;
	Wed, 11 Dec 2024 15:56:53 +0100
Date: Wed, 11 Dec 2024 15:56:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <Z1moNToiIIB9auSl@hovoldconsulting.com>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-4-d5906ed38b28@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-4-d5906ed38b28@linaro.org>

On Wed, Dec 11, 2024 at 03:04:15PM +0200, Abel Vesa wrote:
 
> +static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
> +{
> +	int lttpr_count;
> +
> +	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
> +					  dp->lttpr_caps))
> +		return;
> +
> +	lttpr_count = drm_dp_lttpr_count(dp->lttpr_caps);

I was gonna say shouldn't you handle errors here, but that explains the
non-negative check I commented on the first patch in the series.

This looks error prone, but I think you should at least update the
kernel doc comment to drm_dp_lttpr_init() in the first patch so that
it's clear that you pass in the number of LTTPRs *or* an errno.

> +
> +	drm_dp_lttpr_init(dp->aux, lttpr_count);
> +}
> +
>  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  {
>  	struct drm_connector *connector = dp->msm_dp_display.connector;
>  	const struct drm_display_info *info = &connector->display_info;
>  	int rc = 0;
>  
> +	msm_dp_display_lttpr_init(dp);

It looks like you ignore errors on purpose so I guess that's fine.

> +
>  	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
>  	if (rc)
>  		goto end;

Either way, this is needed for external display on my x1e80100 machines,
while not breaking the X13s:

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

