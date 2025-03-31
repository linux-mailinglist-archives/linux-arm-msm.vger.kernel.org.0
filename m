Return-Path: <linux-arm-msm+bounces-52864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CC0A7626D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 10:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA0163A38B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 08:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F4C1D6DBC;
	Mon, 31 Mar 2025 08:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DShemQvr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F2738F80;
	Mon, 31 Mar 2025 08:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743410031; cv=none; b=Ndh2Q9J4pKmG1pay94QCxuXXJjtTT8qWUZ3NqeAr/icIUVwEgiByZExSUQHkP4O0oLHV2T46AwvCWz7R3fIMt59b/0ggzxIRNG0HivrlKYeQcutQeCdDoVKcOzpUp8Df2P/+80UN+UkQoG3y8b+xop9glgqAT2sr48SaLFA/cVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743410031; c=relaxed/simple;
	bh=DloZZIE6n19coXOX3Zta04gIhkvxcrcJ9ymuCwF7tgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlNTm+lNqiP5xXD4U95inkbrlY0KNXm5gVonX+wDepNn1q4d+DSSEiiq+jEdze6Bf5cfaNq3b6McZ/2CelNUnTv0SvXKSFpMkv+LrZIl4VwKWWTIDenFh+zxQJ3+QLfJ/xOOxamDXQRrzK18fQcZoBwxg1PcyEU2E0hbaj/Zxzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DShemQvr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E75C4CEE3;
	Mon, 31 Mar 2025 08:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743410030;
	bh=DloZZIE6n19coXOX3Zta04gIhkvxcrcJ9ymuCwF7tgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DShemQvrSa58moVUJ3a8exwKWWlOCwJOfj0u5GMTnY1rdcyK5kpc7C6YPvzVqIkoA
	 LyT9t45QlEpdEmzYmeYyeJcKNsJPtTbi26iGak0bqBHrLIlzIBELjrkfuIzSNTQcjF
	 ghoQCq3xEWxAMx6YoDyD6/yg0Q+MqHOLQ+C8esZ5n2oHTCYvK6Fdif5gN3ijzSeyT2
	 ziY08DAzYIEEvZjCi2kmwsKSsI5nNkaImPbmMSRreqt6l3a3G5SrwgxpNSOSdSn2Q1
	 HKMBSP6ByoZDz13XIp9kgWmVpdZPtPT5q1/E4vRy1XcM8+PDOiMRsvWapp56LOwpSH
	 tzTPrMqDl9wzA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tzAae-000000002tv-1hIZ;
	Mon, 31 Mar 2025 10:33:53 +0200
Date: Mon, 31 Mar 2025 10:33:52 +0200
From: Johan Hovold <johan@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Message-ID: <Z-pTcB0L33bozxjl@hovoldconsulting.com>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>

On Sun, Mar 30, 2025 at 08:31:07PM +0100, Christopher Obbard wrote:
> According to the eDP specification (VESA Embedded DisplayPort Standard
> v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> the MIN value as the effective PWM bit count.
> 
> This commit updates the logic to clamp the reported
> DP_EDP_PWMGEN_BIT_COUNT to the range defined by _CAP_MIN and _CAP_MAX.
> 
> As part of this change, the behavior is modified such that reading both
> _CAP_MIN and _CAP_MAX registers is now required to succeed, otherwise
> bl->max value could end up being not set although
> drm_edp_backlight_probe_max() returned success.
> 
> This ensures correct handling of eDP panels that report a zero PWM
> bit count but still provide valid non-zero MIN and MAX capability
> values. Without this clamping, brightness values may be interpreted
> incorrectly, leading to a dim or non-functional backlight.
> 
> For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> supports AUX backlight control and declares a valid 11-bit range.
> Clamping ensures brightness scaling works as intended on such panels.
> 
> Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>

> @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>  	}
>  
>  	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> +	if (ret < 0) {
> +		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> +			    aux->name, ret);
> +		return -ENODEV;
> +	}
> +	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> +	if (ret < 0) {
> +		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> +			    aux->name, ret);
> +		return -ENODEV;
> +	}
> +	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +	/*
> +	 * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> +	 * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> +	 * the sink must use the MIN value as the effective PWM bit count.
> +	 * Clamp the reported value to the [MIN, MAX] capability range to ensure
> +	 * correct brightness scaling on compliant eDP panels.
> +	 */
> +	pn = clamp(pn, pn_min, pn_max);

You never make sure that pn_min <= pn_max so you could end up with
pn < pn_min on broken hardware here. Not sure if it's something you need
to worry about at this point.

> +
>  	bl->max = (1 << pn) - 1;
>  	if (!driver_pwm_freq_hz)
>  		return 0;

Otherwise this looks correct to me and does not break backlight control
on the X1E reference design:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

