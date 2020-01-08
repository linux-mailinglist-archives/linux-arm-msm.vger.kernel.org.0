Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA0F133AA9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 06:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgAHFA7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 00:00:59 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46108 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgAHFA7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 00:00:59 -0500
Received: by mail-pg1-f193.google.com with SMTP id z124so925103pgb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 21:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X37F/PBhiA4LwJm08uRB6YNKHdDjwop2i2GIlG0JFWg=;
        b=NUiVu62v3HRo0eFiWC89LLpUuaBgLMcU8567eZd8RGwJUXIP+hwUtxWw8qdZtAROrx
         2GyZJNn4cYwyKjXe6VBoV/hrPM33WX1ytgGf4qSj2tLY22f2BIJMKVQ6dOkxd6PTQ8Pq
         eJ/pyeosrxmzpzdK3TaGdcozwHQqbOUG8giwUJSV+gRo3mPTVZD3qOTIKRC6uz/fFeTT
         lIlDuMbPhceLob0Z0hDXw4JwJUXA3JE/mlKM1bMBsAlcrjBj2oZjcV+G4b1oEDcNZ0Il
         okqbzPeowrV9S2F+/bJ+fBL3Dpz4FPNBz7i9pxMizR9CAhIKo4IL3gRIAAfuV/TjYhbm
         Ic6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X37F/PBhiA4LwJm08uRB6YNKHdDjwop2i2GIlG0JFWg=;
        b=O76o0qyTEE+aiNnSkRfvCTq3Vpsfjxo83WD/kqBFrR+B68pDvj8vRO7OlgUemb10bO
         TMom+bJZnJ/8P80JqQyRXotYdsUg/teOCAJB2kGpd/cnKNB+2YDu2L4pnUzaRrlaucyg
         L2C8VnRtcLbJAmEmPZrzJkyXd8bnMI/w4K6jQsYwVotCIBs1lng5Q9U/mQVRoFEiSrmn
         4A7B/uojcvqZOKH85qoxw3YT46ziqudf/pkwbvbEfsq/DI3IoHppezD9xn4wuLcFuiTb
         N2xloG666DfhQh7I4Z5BjpWrnACyne9x80fZ1ki8h3uPDZzaqP9uZNE0A6FOFEVicrtb
         qmdQ==
X-Gm-Message-State: APjAAAWdLQAyjIy6Uc1hvk6ltR8Sqq5xNM3IiyCxim3QkPxk1QdDL1Da
        5IC22pntHRhHE5XkpifKkTQSPg==
X-Google-Smtp-Source: APXvYqwjTVtnryOd1gkgsIYiny/IO42W3vQYflxFzhsS6U/6YKIfqzOoivrrcRW9DWuo9N0ausldWA==
X-Received: by 2002:a62:1c88:: with SMTP id c130mr3132646pfc.195.1578459658738;
        Tue, 07 Jan 2020 21:00:58 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n14sm1349243pff.188.2020.01.07.21.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 21:00:58 -0800 (PST)
Date:   Tue, 7 Jan 2020 21:00:55 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brian Masney <masneyb@onstation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm/msm: support firmware-name for zap fw
Message-ID: <20200108050055.GJ738324@yoga>
References: <20200108013847.899170-1-robdclark@gmail.com>
 <20200108013847.899170-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108013847.899170-2-robdclark@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 07 Jan 17:38 PST 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> Since zap firmware can be device specific, allow for a firmware-name
> property in the zap node to specify which firmware to load, similarly to
> the scheme used for dsp/wifi/etc.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 32 ++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 112e8b8a261e..aa8737bd58db 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -26,6 +26,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  {
>  	struct device *dev = &gpu->pdev->dev;
>  	const struct firmware *fw;
> +	const char *signed_fwname = NULL;
>  	struct device_node *np, *mem_np;
>  	struct resource r;
>  	phys_addr_t mem_phys;
> @@ -58,8 +59,33 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  
>  	mem_phys = r.start;
>  
> -	/* Request the MDT file for the firmware */
> -	fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> +	/*
> +	 * Check for a firmware-name property.  This is the new scheme
> +	 * to handle firmware that may be signed with device specific
> +	 * keys, allowing us to have a different zap fw path for different
> +	 * devices.
> +	 *
> +	 * If the firmware-name property is found, we bypass the
> +	 * adreno_request_fw() mechanism, because we don't need to handle
> +	 * the /lib/firmware/qcom/* vs /lib/firmware/* case.
> +	 *
> +	 * If the firmware-name property is not found, for backwards
> +	 * compatibility we fall back to the fwname from the gpulist
> +	 * table.
> +	 */
> +	of_property_read_string_index(np, "firmware-name", 0, &signed_fwname);
> +	if (signed_fwname) {
> +		fwname = signed_fwname;
> +		ret = request_firmware_direct(&fw, signed_fwname, gpu->dev->dev);
> +		if (ret) {
> +			DRM_DEV_ERROR(dev, "could not load signed zap firmware: %d\n", ret);
> +			fw = ERR_PTR(ret);

Perhaps just return ret; here, or omit the error print here any rely
solely on the one below?

> +		}
> +	} else {
> +		/* Request the MDT file for the firmware */

How about changing this to "Request the MDT file from the default
location" or something like that?

Rest looks good.

Regards,
Bjorn

> +		fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> +	}
> +
>  	if (IS_ERR(fw)) {
>  		DRM_DEV_ERROR(dev, "Unable to load %s\n", fwname);
>  		return PTR_ERR(fw);
> @@ -95,7 +121,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  	 * not.  But since we've already gotten through adreno_request_fw()
>  	 * we know which of the two cases it is:
>  	 */
> -	if (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY) {
> +	if (signed_fwname || (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY)) {
>  		ret = qcom_mdt_load(dev, fw, fwname, pasid,
>  				mem_region, mem_phys, mem_size, NULL);
>  	} else {
> -- 
> 2.24.1
> 
