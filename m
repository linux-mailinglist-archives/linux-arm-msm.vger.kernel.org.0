Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E931139939
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 19:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbgAMSpy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 13:45:54 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:39745 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728641AbgAMSpy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 13:45:54 -0500
Received: by mail-pj1-f68.google.com with SMTP id e11so3106082pjt.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 10:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TRPXa/X1Mc7UsbFtxb3zNyLDA7j12ID+Zjq7lbcmmkk=;
        b=oGUwSjjsO4Vl87AgYtTvHpWWrbUyrWHbiD9ePlNH7Ulh4V1z95rtqNvDPUVJhG1RoE
         rzpNKMiYj/oabZuPdZLbpVW4zISIAGyzY4YI0s6a1LPm1ZSojYpLjS0pBLiLBequ3p2A
         DQ4pgyjVXzyTHvSosqJBdtdlXGytXdt1P8L7GPygwnkbsYq5D6MxJMllKuS7aAo336IZ
         ZZzwGocvwdYMI18zCm29pX/afEz7En6nq4SSaHEtbRHeiFW1oNuX3Flo8zJ5kSQ/rgHm
         XS/XbbdRddwCnQKQrwC4i2S9Pz1FcNp3ttTy8sRwIx8cCC0zoIRRCC8xCGTfzHfgQzdb
         P+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TRPXa/X1Mc7UsbFtxb3zNyLDA7j12ID+Zjq7lbcmmkk=;
        b=lqiaBASDpCG1qH4nQQRHr1fHnrTDMPeF/0XxdAar0sHkUMfXH/YOdbG/FU/k2zZG4R
         xcFHDvuYeMKWA3j7oj/9mS8xglYcjbr8feT5NXyI72MXFuidqhBNXLNh/dDuT7I14CRC
         tjcFEPWNVfi6pVLCiFiKduecdak9qykYzIyKjtHa84mp+VzHVqU20vjtoS5uFxl+ct/G
         1BWiqxdPKVf2K35z2fCVJkurDoST9P3qNLuuwrBVa67c8hls7s3f4fny4qsd+2Vi1V0O
         qMRP08fzfWqiPfKS1Bb1me59NrDiMxNesmJKtpVIhQCNK+pcAEiDolST5W0re1p9u0kx
         wZsw==
X-Gm-Message-State: APjAAAWlg+i9nf4ota5o/Dvh5q55C6Y9Bz62/G5WY10Gy087cLFDZALd
        xSKnyH89Yo11vGULHgp/tlguTw==
X-Google-Smtp-Source: APXvYqxBBleDnBHycO1RtJCKMDtjbqTGZuiZXIov6MJMxK2XiiFFVzBdNS0dPqd4OtvpBNqLhBrY7g==
X-Received: by 2002:a17:90a:950b:: with SMTP id t11mr9450982pjo.79.1578941153872;
        Mon, 13 Jan 2020 10:45:53 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m3sm14191638pgp.32.2020.01.13.10.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 10:45:53 -0800 (PST)
Date:   Mon, 13 Jan 2020 10:45:50 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Brian Masney <masneyb@onstation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Fabio Estevam <festevam@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] drm/msm: support firmware-name for zap fw (v2)
Message-ID: <20200113184550.GC1511@yoga>
References: <20200112195405.1132288-1-robdclark@gmail.com>
 <20200112195405.1132288-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200112195405.1132288-2-robdclark@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 12 Jan 11:53 PST 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> Since zap firmware can be device specific, allow for a firmware-name
> property in the zap node to specify which firmware to load, similarly to
> the scheme used for dsp/wifi/etc.
> 
> v2: only need a single error msg when we can't load from firmware-name
>     specified path, and fix comment [Bjorn A.]
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 30 ++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 112e8b8a261e..456bb5af1717 100644
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
> @@ -58,8 +59,31 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
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
> +		ret = request_firmware_direct(&fw, fwname, gpu->dev->dev);
> +		if (ret)
> +			fw = ERR_PTR(ret);
> +	} else {
> +		/* Request the MDT file from the default location: */
> +		fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> +	}
> +
>  	if (IS_ERR(fw)) {
>  		DRM_DEV_ERROR(dev, "Unable to load %s\n", fwname);
>  		return PTR_ERR(fw);
> @@ -95,7 +119,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
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
