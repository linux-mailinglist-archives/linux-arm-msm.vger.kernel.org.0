Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD27E1FB08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2019 21:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbfEOTjO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 15:39:14 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46712 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727725AbfEOTjO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 15:39:14 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5315E609CD; Wed, 15 May 2019 19:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557949153;
        bh=IGrrCPh/FK/sDRXRKl9rNDJmBDTVZkTFJEPRx68pwrY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I3zH6CZZqggTdYP6VEfhWmTpkIO+SYZm96HpQhbgeLIiSlO+uI2P3pSwaYYDDRFPL
         mBm4Q3YRByTy3B/X1GSVEyF8BuhGjuGOlOTGq7z236uBfClSEJ7S9Tg40EJalXp+ZD
         yKxcS+Gt+9RVKJz0hlDhndmnIQKhwQ2KPedIQu4M=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 70BFF6076A;
        Wed, 15 May 2019 19:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557949147;
        bh=IGrrCPh/FK/sDRXRKl9rNDJmBDTVZkTFJEPRx68pwrY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fA409/S1vze2xiXW86p/7PVrMFTRS24/YVpi/us8Dt33o+vrs2EBd3s2SgeduQVTQ
         WsXiYCE2eTf9eYTEM4URbWKmkfTekQUS6WGvDbGbYEWaV58MoHdPX5Dw18cXvcsHYq
         1HsSr4N2sdbBB9+y1LJ/r+cgn7BbXU3n9T2JCthM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70BFF6076A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 15 May 2019 13:39:04 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Upgrade gxpd checks to IS_ERR_OR_NULL
Message-ID: <20190515193904.GE24137@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
        linux-arm-msm@vger.kernel.org
References: <20190515170104.155525-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190515170104.155525-1-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 15, 2019 at 01:00:52PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> dev_pm_domain_attach_by_name() can return NULL, so we should check for
> that case when we're about to dereference gxpd.
> 
> Fixes: 9325d4266afd ("drm/msm/gpu: Attach to the GPU GX power domain")
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Reviewed-by: Jordan Crouse <jcrouse@codeauorora.org>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 9155dafae2a90..38e2cfa9cec79 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -747,7 +747,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>  	 * will make sure that the refcounting is correct in case we need to
>  	 * bring down the GX after a GMU failure
>  	 */
> -	if (!IS_ERR(gmu->gxpd))
> +	if (!IS_ERR_OR_NULL(gmu->gxpd))
>  		pm_runtime_get(gmu->gxpd);
>  
>  out:
> @@ -863,7 +863,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
>  	 * domain. Usually the GMU does this but only if the shutdown sequence
>  	 * was successful
>  	 */
> -	if (!IS_ERR(gmu->gxpd))
> +	if (!IS_ERR_OR_NULL(gmu->gxpd))
>  		pm_runtime_put_sync(gmu->gxpd);
>  
>  	clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
> @@ -1234,7 +1234,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>  
>  	pm_runtime_disable(gmu->dev);
>  
> -	if (!IS_ERR(gmu->gxpd)) {
> +	if (!IS_ERR_OR_NULL(gmu->gxpd)) {
>  		pm_runtime_disable(gmu->gxpd);
>  		dev_pm_domain_detach(gmu->gxpd, false);
>  	}
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
