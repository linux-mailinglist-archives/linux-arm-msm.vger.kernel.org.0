Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 649DD28BCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 22:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387529AbfEWUsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 16:48:15 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46976 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387394AbfEWUsP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 16:48:15 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 87F3660DB6; Thu, 23 May 2019 20:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558644494;
        bh=4TuohgVqmQxCRsZ+7gw9HTjTy00RE3POM+u7USaPAC4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OaiW14uC9Ny8xaPfJXYO0SZqRJpLhIVgNCZWKTi2TGZzqn0GS5s3tq5G6uiHxCEtD
         5BkOLRBtCMGzkv3mUO+NnYalmMzRuEJI9U7O7yyiWuWrG9UonOf9SXVqrE51q8ROMw
         +Bp9KXCdkH41PNyPwaJe4PsdGhrcD6q7vj9GZRyI=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E70D60C8B;
        Thu, 23 May 2019 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558644493;
        bh=4TuohgVqmQxCRsZ+7gw9HTjTy00RE3POM+u7USaPAC4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eBF6uzWh3T5vvnLrXEwob4rUpB1vkYkHRODmQTnqKcYa8aoMUao9R5bEGsMD4E8gL
         ihWgs44+0u17c4v3m2Krf9WNCQShvND5Qr0WBbNj5Rdg/q8AP7I3roIC+HOcYax5uJ
         lUEUwxKzKgjTXehMDNRGWTbAQHveDekZEM6O+1Jc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5E70D60C8B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 23 May 2019 14:48:11 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/6] drm/msm/a6xx: Check for ERR or NULL before iounmap
Message-ID: <20190523204811.GD18360@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        linux-arm-msm@vger.kernel.org
References: <20190523171653.138678-1-sean@poorly.run>
 <20190523171653.138678-3-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523171653.138678-3-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 23, 2019 at 01:16:42PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> pdcptr and seqptr aren't necessarily valid, check them before trying to
> unmap them.
> 
> Changes in v2:
> - None
> 
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

It has always been sad to me that iounmap() has chosen to not check for NULL.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 742c8ff9a61c..7465423e9b71 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -504,8 +504,10 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	wmb();
>  
>  err:
> -	devm_iounmap(gmu->dev, pdcptr);
> -	devm_iounmap(gmu->dev, seqptr);
> +	if (!IS_ERR_OR_NULL(pdcptr))
> +		devm_iounmap(gmu->dev, pdcptr);
> +	if (!IS_ERR_OR_NULL(seqptr))
> +		devm_iounmap(gmu->dev, seqptr);
>  }
>  
>  /*
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
