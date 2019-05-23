Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B72428BE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 22:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387660AbfEWUwa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 16:52:30 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:49742 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387652AbfEWUwa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 16:52:30 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E3EAE60DB6; Thu, 23 May 2019 20:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558644749;
        bh=/UkhJ93ZONFLE39bSDbU+e/YiFVV3dmUDhxYaiPXzSw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U42BPFA7vqS82Nn6/2voaQrRpN79EvQajEnwamQTVvn1WPeHtoaFRNNaeETP5+fEz
         GHqko3Xb2EbPgmRgLU7p4VD0HpilqYtKzKzt9HVu/brLoQPl3YXhyc0w+CHyVlyVCI
         OWReVsSzmO+wqtsoAeF1h6edDrG2RCTWJDpSzS7Q=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC2EA60C8B;
        Thu, 23 May 2019 20:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558644749;
        bh=/UkhJ93ZONFLE39bSDbU+e/YiFVV3dmUDhxYaiPXzSw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U42BPFA7vqS82Nn6/2voaQrRpN79EvQajEnwamQTVvn1WPeHtoaFRNNaeETP5+fEz
         GHqko3Xb2EbPgmRgLU7p4VD0HpilqYtKzKzt9HVu/brLoQPl3YXhyc0w+CHyVlyVCI
         OWReVsSzmO+wqtsoAeF1h6edDrG2RCTWJDpSzS7Q=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC2EA60C8B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 23 May 2019 14:52:27 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 5/6] drm/msm/a6xx: Drop the device reference in gmu
Message-ID: <20190523205226.GF18360@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        linux-arm-msm@vger.kernel.org
References: <20190523171653.138678-1-sean@poorly.run>
 <20190523171653.138678-5-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523171653.138678-5-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 23, 2019 at 01:16:44PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> of_find_device_by_node() grabs a dev reference, so make sure we clear it
> on error and remove.
> 
> Changes in v2:
> - Added to the set (Jordan)
> 
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index f7240c9e11fb..e2b839b5d3bd 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1253,6 +1253,9 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>  	free_irq(gmu->gmu_irq, gmu);
>  	free_irq(gmu->hfi_irq, gmu);
>  
> +	/* Drop reference taken in of_find_device_by_node */
> +	put_device(gmu->dev);
> +
>  	gmu->initialized = false;
>  }
>  
> @@ -1277,12 +1280,12 @@ int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	/* Get the list of clocks */
>  	ret = a6xx_gmu_clocks_probe(gmu);
>  	if (ret)
> -		return ret;
> +		goto err_put_device;
>  
>  	/* Set up the IOMMU context bank */
>  	ret = a6xx_gmu_memory_probe(gmu);
>  	if (ret)
> -		return ret;
> +		goto err_put_device;
>  
>  	/* Allocate memory for for the HFI queues */
>  	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K);
> @@ -1334,6 +1337,11 @@ int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  
>  		iommu_domain_free(gmu->domain);
>  	}
> +	ret = -ENODEV;
>  
> -	return -ENODEV;
> +err_put_device:
> +	/* Drop reference taken in of_find_device_by_node */
> +	put_device(gmu->dev);
> +
> +	return ret;
>  }
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
