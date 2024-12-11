Return-Path: <linux-arm-msm+bounces-41513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A4F9ECED7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9772218827A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11691187870;
	Wed, 11 Dec 2024 14:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fkdcp6d2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB58B18732B;
	Wed, 11 Dec 2024 14:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733928145; cv=none; b=PqWSETQ388jwh7zyUjXwwaTmH8rCNzdYv85rjrwU9R0jXae4rFuyUCf/O0rI+CbSWpG7xjbBvy3cFny0FwBQuzpVcBzVpDlTb84VeBu/FxfbiLfDcjSXhsWVImXPhPm7qlI3Rlyx3d2fCroOMC5EEk2sE6WpFdTl1HsDu78ubX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733928145; c=relaxed/simple;
	bh=RJoGGBFcL+sQrgvZ8+9BKYWDJWcgBpREZ6n8Z69Zl9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjHAnXM32ncSVM5Wj+ztp0mQNKPIk/I+hz8oDcAuHBNH4pw6OLIsMI0pkyPg15ljETvQJYK9OGmN9HWGvvpPo43lXWPEDJN6cjpjoxN4+KIxDwookTMtpFwhgaQeJAgPnbrLac9qJ7Ot3W0QIHWrtDJcBmgk6IbNZKiatmdgNBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fkdcp6d2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCE4C4CED2;
	Wed, 11 Dec 2024 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733928144;
	bh=RJoGGBFcL+sQrgvZ8+9BKYWDJWcgBpREZ6n8Z69Zl9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fkdcp6d25g6ET2VUFeJgANhn0OzBzTp74DQddva1BycAheDOFS1hA76M0cG8a1lco
	 GiF+wGC8KuSSiiksMidE9H02hUmQ0Ey5QdFXdPFf/dIbCFM949pMOUVI4OnnJ/KY9z
	 8ne5hNVbTCxbkBQAwhg+mUFZ37yOrf3Gohgeo83LhkXN32EFDm2ON53j5wwL4JXq6n
	 Z1stje4hyUGIKnHj5mYVbgXf6JnmM/LPNeCzyHoc6gdVQZShSJ8zniEJ4+X8TfLaXo
	 mkPA9cS0HTj/ohUY/+SOZBz5fvs2mPhGWcZ18xgISbMcx59BA7q+gkp55/d/vELH5k
	 QqclZZ/0OfjVg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tLNv1-000000002rx-1zMb;
	Wed, 11 Dec 2024 15:42:28 +0100
Date: Wed, 11 Dec 2024 15:42:27 +0100
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
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z1mk08SHEd5_vc99@hovoldconsulting.com>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>

On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
 
> +/**
> + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> + * @aux: DisplayPort AUX channel
> + * @enable: Enable or disable transparent mode
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> +{
> +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> +
> +	return ret == 1 ? 0 : ret;

This looks correct, but I had to go look at drm_dp_dpcd_writeb() to make
sure it never returns 0 (for short transfers).

> +}
> +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);

This appears to be what the driver currently uses, but why not
EXPORT_SYMBOL_GPL?

> +
> +/**
> + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> + *
> + * @aux: DisplayPort AUX channel
> + * @lttpr_count: Number of LTTPRs
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> +{
> +	if (!lttpr_count)
> +		return 0;
> +
> +	/*
> +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> +	 * non-transparent mode and the disable->enable non-transparent mode
> +	 * sequence.
> +	 */
> +	drm_dp_lttpr_set_transparent_mode(aux, true);

Error handling?

> +
> +	if (lttpr_count > 0 && !drm_dp_lttpr_set_transparent_mode(aux, false))

No need to check lttpr_count again here.

> +		return 0;

I'd check for errors instead of success here and do the rollback before
returning -EINVAL.

> +
> +	/*
> +	 * Roll-back to tranparent mode if setting non-tranparent mode failed or
> +	 * the number of LTTPRs is invalid
> +	 */
> +	drm_dp_lttpr_set_transparent_mode(aux, true);
> +
> +	return -EINVAL;

And return 0 explicitly here.

> +}
> +EXPORT_SYMBOL(drm_dp_lttpr_init);

In any case this works well and is needed for external display on the
Lenovo ThinkPad T14s, while not breaking the X13s which does not need
it:

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

