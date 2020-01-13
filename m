Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16B9B1397CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 18:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgAMRd5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 12:33:57 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:22915 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727331AbgAMRd5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 12:33:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578936836; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=w+XPcExk+Qre2Gbc4AQCx9OnrvzBE4v0GR5D1rNcKaY=; b=HdKE8mzByxUvHiC+DakLFJbjMycuch37G80X64asynXtGBlr7iSU5YuVzeQKJbEzohiGKjRW
 3MDN5/ONSxBkVTXMGvA4xagrSW6uXI3RoG7jSq/UcMxeZ4UAB9eReB0YPONF2idK91AvQyvR
 Wg7m7a3OrRWDDpe9p72eBOzsOn8=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1caa02.7f418c44d7a0-smtp-out-n02;
 Mon, 13 Jan 2020 17:33:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 14070C43383; Mon, 13 Jan 2020 17:33:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BE2EFC433CB;
        Mon, 13 Jan 2020 17:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BE2EFC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 13 Jan 2020 10:33:50 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] drm/msm: allow zapfw to not be specified in
 gpulist
Message-ID: <20200113173349.GB26711@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20200112195405.1132288-1-robdclark@gmail.com>
 <20200112195405.1132288-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200112195405.1132288-3-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 12, 2020 at 11:53:58AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> For newer devices we want to require the path to come from the
> firmware-name property in the zap-shader dt node.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 456bb5af1717..c146c3b8f52b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -79,9 +79,21 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  		ret = request_firmware_direct(&fw, fwname, gpu->dev->dev);
>  		if (ret)
>  			fw = ERR_PTR(ret);
> -	} else {
> +	} else if (fwname) {
>  		/* Request the MDT file from the default location: */
>  		fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> +	} else {
> +		/*
> +		 * For new targets, we require the firmware-name property,
> +		 * if a zap-shader is required, rather than falling back
> +		 * to a firmware name specified in gpulist.
> +		 *
> +		 * Because the firmware is signed with a (potentially)
> +		 * device specific key, having the name come from gpulist
> +		 * was a bad idea, and is only provided for backwards
> +		 * compatibility for older targets.
> +		 */
> +		return -ENODEV;
>  	}

A possible future optimization would be to move a lot of this to the target
specific code but we can do that once we're sure that all the rest of the
fallout has bee militated.

>  
>  	if (IS_ERR(fw)) {
> @@ -170,14 +182,6 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>  		return -EPROBE_DEFER;
>  	}
>  
> -	/* Each GPU has a target specific zap shader firmware name to use */
> -	if (!adreno_gpu->info->zapfw) {
> -		zap_available = false;
> -		DRM_DEV_ERROR(&pdev->dev,
> -			"Zap shader firmware file not specified for this target\n");
> -		return -ENODEV;
> -	}
> -
>  	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>  }
>  
> -- 
> 2.24.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
