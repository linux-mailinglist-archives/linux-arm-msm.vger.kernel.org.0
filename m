Return-Path: <linux-arm-msm+bounces-47251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EABA2D935
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 23:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08B6C16442F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 22:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C133243958;
	Sat,  8 Feb 2025 22:10:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB4243957
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 22:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739052602; cv=none; b=fujjPCrzA8WPhLRZ1Rv2cUfZll1LpPy9LhSXXFL/jca3gonwPWmOuO+rM2Tbz54eMBFeABT2H9sckTFUkDF5NxF7bNxob/FAWgR/3hEYtdVxI4mWX4yVM+qdLEKoJB/gnOTj3dGRFAhBiRVC/GcjUTmcG25cXR3U5dtl3GpaEbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739052602; c=relaxed/simple;
	bh=VNXWM7sMqhjFaxfUzdILMX5xJaOMrKxE7UKltovgIXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRbmY6CfUjfHzMoH1Z9Eb81jPL3gSua65XlZ4m6LkSt0o7+7BkFgL/RErbMco1DSEXbhN9TetOjhMJSjr6LxYRdmjrCur8xmVf4f7MvV7xp1VerkJZMVq0imyLZVjQ3QhzHB4ZKpFuNBjx5+xkJmAGVRiwtDZjVVLqGTGBackqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A43AA20268;
	Sat,  8 Feb 2025 23:09:57 +0100 (CET)
Date: Sat, 8 Feb 2025 23:09:56 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, robdclark@gmail.com, 
	quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run, jonathan@marek.ca, 
	jun.nie@linaro.org, fekz115@gmail.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
Message-ID: <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-4-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203181436.87785-4-danila@jiaxyga.com>

On 2025-02-03 21:14:26, Danila Tikhonov wrote:
> From: Eugene Lepshy <fekz115@gmail.com>
> 
> DRM DSC helper has parameters for various bpc values ​​other than 8:

Weird zero-width \u200b spaces here between "values" and "other", please delete
those.

> (8/10/12/14/16).
> 
> Remove this guard.
> 
> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Should this patch elaborate that those "DRM DSC helper" don't have any
additional guarding for the values you mention either, i.e. passing 9 or 11 or
>16 don't seem to be checked anywhere else either?

And your title might have space to spell out "Bits Per Component" entirely.

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 007311c21fda..d182af7bbb81 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1767,11 +1767,6 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>  		return -EINVAL;
>  	}
>  
> -	if (dsc->bits_per_component != 8) {
> -		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
> -		return -EOPNOTSUPP;
> -	}
> -
>  	dsc->simple_422 = 0;
>  	dsc->convert_rgb = 1;
>  	dsc->vbr_enable = 0;

This seems supicous on the dpu1 side, in the original DSC 1.1 (not 1.2) block in
dpu_hw_dsc_config(), which has:

	data |= (dsc->line_buf_depth << 3);
	data |= (dsc->simple_422 << 2);
	data |= (dsc->convert_rgb << 1);
	data |= dsc->bits_per_component;

The original value of `8` would overlap with the lowest bit of line_buf_depth
(4th bit in `data`).  Now, the 2nd bit which will take the value from
convert_rgb, which is already set to 1 above, will overlap with the 2nd bit in
your new bpc value of 10.

Can you double-check that this code in DPU1 is actually valid?  I assume you
have tested this panel at least and it is working (worthy mention in the cover
letter?), this just seems like yet another mistake in the original bindings
(though the register always had a matching value with downstream on 8 BPC panels
for me).

> @@ -1779,7 +1774,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>  	drm_dsc_set_const_params(dsc);
>  	drm_dsc_set_rc_buf_thresh(dsc);
>  
> -	/* handle only bpp = bpc = 8, pre-SCR panels */
> +	/* handle only pre-SCR panels */
>  	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);

Good catch - this comment sounds like it's documenting a limitation of
this helper function, but the function does not have such limitations...
rc_parameters_pre_scr has values for all these combinations.

- Marijn

>  	if (ret) {
>  		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
> -- 
> 2.48.1
> 

