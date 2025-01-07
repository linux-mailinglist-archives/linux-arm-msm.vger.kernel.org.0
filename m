Return-Path: <linux-arm-msm+bounces-44087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4325A03B1D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCD223A15DF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 09:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869711E3DCC;
	Tue,  7 Jan 2025 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sQIB3sMw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2975C1DE4F1;
	Tue,  7 Jan 2025 09:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736242233; cv=none; b=nPl9PMZ6eava/gsaynaFLEsKBcUkd/2scgOzLx6lDnJPLlAACy6un6Z0PvAepO7Pvv4YUyQ2n8hxlZBcE4Hbshh/FzTgRxm2KFtOmYK+NxCM9crm1r+uC6haivrwRvBRvPnwXFUwCRxSIdVejekK7DFPeQp9IdNtrUAimRgqTtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736242233; c=relaxed/simple;
	bh=faHcSgdF3E9ljSXlRVOQi+PPa9Gd2RrArQ5HFzl15S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBgaFOC/gjbnlQBOCPBpZ7U+fa6f+SJQtY/MRlNLGsBekfDYxK2fYdOe9VWXjA3YSJ2MhYXE3/DDpG6ppx6u0ZavTCuvCnm8OPHE1shUT/p4TB6CxsxiNY0uGPNmZIlgWC1062eLQE8cfNxz6+apeguPdsCGCOcjPmzH9c69VlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sQIB3sMw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B85FC4CED6;
	Tue,  7 Jan 2025 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736242232;
	bh=faHcSgdF3E9ljSXlRVOQi+PPa9Gd2RrArQ5HFzl15S4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQIB3sMw4gmVXtgD+5YdawMKFcDfJQVad1wMKc39QsPkKJ0w8LVl6+ToWwqpZ3D8i
	 wSNFNWwzNBrkx4vfNK/xL/y8JgZBvym4lF1OVs3GwkOU7eDnipCzJR4/M9RdIHKYH5
	 8s2OfJOE01m/31DOaaWHdvgKkN1PkrZWsMd/i6I8jdD6H5XdzqWu40lJV20vVrCuxA
	 PIeOwWft41rEhREQEvmOKfp50+xrvnjvYcqHJpYhiYn/XVNVCvtNSpHtS6SKgH0mzD
	 VJkbuxzF1cQuZu5mG3+tSVPYkM0XupewkMn/wybdO8AhxjR9HqFoakeN0kcHysOBFQ
	 QPiF1ADxK2kJA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tV5uv-000000006q9-3HKE;
	Tue, 07 Jan 2025 10:30:29 +0100
Date: Tue, 7 Jan 2025 10:30:29 +0100
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
	freedreno@lists.freedesktop.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z3z0NcDhmwOoQhlG@hovoldconsulting.com>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>

On Fri, Jan 03, 2025 at 02:58:15PM +0200, Abel Vesa wrote:
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>  - non-transparent - it replies to DPCD LTTPR field specific AUX
>    requests, while passes through all other AUX requests
>  - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> Add a generic helper that allows switching between these modes.
> 
> Also add a generic wrapper for the helper that handles the explicit
> disabling of non-transparent mode and its disable->enable sequence
> mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> to move this handling out of the vendor specific driver implementation
> into the generic framework.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

> +/**
> + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> + *
> + * @aux: DisplayPort AUX channel
> + * @lttpr_count: Number of LTTPRs. Between 0 and 8, according to DP standard.
> + *               Negative error code for any non-valid number.
> + *               See drm_dp_lttpr_count().
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> +{
> +	int ret;
> +
> +	if (!lttpr_count)
> +		return 0;
> +
> +	/*
> +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> +	 * non-transparent mode and the disable->enable non-transparent mode
> +	 * sequence.
> +	 */
> +	ret = drm_dp_lttpr_set_transparent_mode(aux, true);
> +	if (ret)
> +		return ret;
> +
> +	if (lttpr_count < 0)
> +		return -ENODEV;
> +
> +	/*
> +	 * Roll-back to tranparent mode if setting non-tranparent mode failed

typo: transparent (2x)

> +	 */

I think this comment now needs to go inside the conditional, if you want
to keep it at all.

> +	if (drm_dp_lttpr_set_transparent_mode(aux, false)) {
> +		drm_dp_lttpr_set_transparent_mode(aux, true);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_lttpr_init);

This looks much better to me now, so with the above addressed: 

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

