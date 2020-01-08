Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE34134664
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 16:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727542AbgAHPiS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 10:38:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44124 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726254AbgAHPiR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 10:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578497897;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1eGeIWiwUf1mluye9R+kVxpOKPsNVjl3zOy6Wq1gu+k=;
        b=HIWqvjWtqPUKjjHa4DVnVG8BYlXg/obFZ6lTD6570V1tkX6Y4u9+ai2eLcghtOoWahc0cL
        caLWvJw8Dvs9xl62uOOJEY9eQcvycJQ0L9w3WwX5V521iEFo6+QOZRjceD2d8YMs9baysy
        MYLfeaaKlq3dJSGxiv5egJWXop18+3Y=
Received: from mail-yw1-f69.google.com (mail-yw1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-xx9RyroMN9250L-EoK7JYQ-1; Wed, 08 Jan 2020 10:38:16 -0500
X-MC-Unique: xx9RyroMN9250L-EoK7JYQ-1
Received: by mail-yw1-f69.google.com with SMTP id e128so2503297ywc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2020 07:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1eGeIWiwUf1mluye9R+kVxpOKPsNVjl3zOy6Wq1gu+k=;
        b=KM3WoG3jscrBQPT0TaBwmSEIXp9P6h3iaMKFyG2AzTp2P7eoh3vHBcpfIMIeep4hR3
         Hi1CKHCjqVromW15CPG8gfnffV+puFzmbzC6M2/O5X2IHjNwRUR0IMRHTSf1UplXyULe
         fw5Trh+6Av0Pt5Y++1XU+xf6lnUbPLwUVHNa50CLTZtfAN0IwWjQub6ZUcuBA4IxKpIV
         tUgfnTABB0Oq0ZlvcJPuKYNEBMCxmbZ2aJAw4DPiAsQD8N2pR7ekgj1mEQNPGnCQOMkE
         FMGZHO+pLcGyn9NcKIDXxaI3awEi5yjKy+zfV/8nluMiKzQk8QtET5UmtFWyLgNsmeE8
         oZIg==
X-Gm-Message-State: APjAAAXrQrty6Zg1aZUDvbMtmZN1OfHOQduqPwgby2Qr8g5m3I4SYMNg
        aZUirfKCVTmJxsfSVg0KBW+jMr/QKz9JVzsRHn3lJ+FwE7UEzxmb24MtHCtT6c9IQZ79OVF4R4l
        vwtuxzRjvthhojVURCgtR4CdyrQ==
X-Received: by 2002:a81:1b45:: with SMTP id b66mr3776946ywb.435.1578497895738;
        Wed, 08 Jan 2020 07:38:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQZmJI4VQh+Cl1LLv1EgTRLeZDIIYl7gaRjBgl5k3h96bkDfJduVd+FgdSyHJqPABucCPzYg==
X-Received: by 2002:a81:1b45:: with SMTP id b66mr3776918ywb.435.1578497895426;
        Wed, 08 Jan 2020 07:38:15 -0800 (PST)
Received: from trix.remote.csb ([75.142.250.213])
        by smtp.gmail.com with ESMTPSA id n8sm1583723ywh.75.2020.01.08.07.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 07:38:15 -0800 (PST)
Subject: Re: [PATCH 1/3] drm/msm: support firmware-name for zap fw
To:     Rob Clark <robdclark@gmail.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
References: <20200108013847.899170-1-robdclark@gmail.com>
 <20200108013847.899170-2-robdclark@gmail.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <37d0baaa-3f94-9414-88e7-7e849b0c5de5@redhat.com>
Date:   Wed, 8 Jan 2020 07:38:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200108013847.899170-2-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 1/7/20 5:38 PM, Rob Clark wrote:
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
Could adreno_request_fw be called with fwname if request_firmware_direct fails ?
> +			fw = ERR_PTR(ret);
> +		}
> +	} else {
> +		/* Request the MDT file for the firmware */
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

