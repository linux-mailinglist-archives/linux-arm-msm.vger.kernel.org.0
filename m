Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69F8D28BC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 22:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387647AbfEWUrT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 16:47:19 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46524 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387394AbfEWUrT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 16:47:19 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DC7F760CF1; Thu, 23 May 2019 20:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558644438;
        bh=2EOjThIW8SBz24GgHp3wmH9WnNSCbrrRd8s2VkktnTM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CZ3GnIH+YlW8LwT0Rn+pJPwxHMQOjhH235bEz1lWOowKFqTlEkInY01cCaiNhZiPA
         MOaCufl/nnQ3aniz4/37nOMyAHLOqsb7DyH547lAqHHxHmKZVJvKd5po3FDGDdWOKf
         /s4fx97tsyUKz9JSxA2auxrGm45TQ365e72yWlBs=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E712160C8B;
        Thu, 23 May 2019 20:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558644438;
        bh=2EOjThIW8SBz24GgHp3wmH9WnNSCbrrRd8s2VkktnTM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CZ3GnIH+YlW8LwT0Rn+pJPwxHMQOjhH235bEz1lWOowKFqTlEkInY01cCaiNhZiPA
         MOaCufl/nnQ3aniz4/37nOMyAHLOqsb7DyH547lAqHHxHmKZVJvKd5po3FDGDdWOKf
         /s4fx97tsyUKz9JSxA2auxrGm45TQ365e72yWlBs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E712160C8B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 23 May 2019 14:47:16 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/6] drm/msm/a6xx: Remove duplicate irq disable from
 remove
Message-ID: <20190523204715.GC18360@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        linux-arm-msm@vger.kernel.org
References: <20190523171653.138678-1-sean@poorly.run>
 <20190523171653.138678-2-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523171653.138678-2-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 23, 2019 at 01:16:41PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> a6xx_gmu_stop() already calls this function via shutdown or force_stop,
> so it's not necessary to call it twice. Previously this would have
> knocked the irq refcount out of sync, but now with the irqs_enabled flag
> it's just housekeeping.
> 
> Changes in v2:
> - None
> 
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index aa84edb25d91..742c8ff9a61c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1239,7 +1239,6 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>  		dev_pm_domain_detach(gmu->gxpd, false);
>  	}
>  
> -	a6xx_gmu_irq_disable(gmu);
>  	a6xx_gmu_memory_free(gmu, gmu->hfi);
>  
>  	iommu_detach_device(gmu->domain, gmu->dev);
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
