Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B22B917D50
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 17:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbfEHP3e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 11:29:34 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35338 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbfEHP3e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 11:29:34 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7F06D6087D; Wed,  8 May 2019 15:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557329373;
        bh=7s2pzhCNZ9x0/hSSdDjvRYrf+MYMnUeTbIypuArEr8A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T0ZJTlKTD7V34mxz7FhDYPOAP+XlTr/gqTHttgwzn83YaZXZfmF78XmQ/LNvECPpO
         7j2qG208hoyoF3r8fEmIU/pMthtOIvB2OgRRXyKgRWhkgdrQ3QbT76x4r3g1nLW/U1
         p5t6aZzi79ej8P4GqCpAq09qkbxJdHxY/HSW/JlQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CFD8C60128;
        Wed,  8 May 2019 15:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557329372;
        bh=7s2pzhCNZ9x0/hSSdDjvRYrf+MYMnUeTbIypuArEr8A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VPH/1rlvg4lvwko2hcz0Z5CHc5Tq8VyoRiS6YLTcBbPf6OZhzxY3nA8Q1viWRruel
         39jPtQFwHKiARq4RD6p/d/GmSqt94R3w+YEgiVDQoB7hxJkhr2DUHByITBXxOhG4/v
         4ey+jUCqwB5yq/IrI5iEGD1cJRJ7hdJEX0iCg1Ww=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CFD8C60128
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 8 May 2019 09:29:30 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: No zap shader is not an error
Message-ID: <20190508152929.GB24137@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20190508130726.27557-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508130726.27557-1-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 08, 2019 at 06:06:52AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Depending on platform firmware, a zap shader may not be required to take
> the GPU out of secure mode on boot, in which case we can just write
> RBBM_SECVID_TRUST_CNTL directly.  Which we *mostly* handled, but missed
> clearing 'ret' resulting that hw_init() returned an error on these
> devices.
> 
> Fixes: abccb9fe3267 drm/msm/a6xx: Add zap shader load
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Woo, I'm glad we finally got a chance to verify this on both types of systems.

Acked-by: Jordan Crouse <jcrouse@codeaurora.org>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index ec24508b9d68..e74dce474250 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -527,6 +527,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>  		dev_warn_once(gpu->dev->dev,
>  			"Zap shader not enabled - using SECVID_TRUST_CNTL instead\n");
>  		gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> +		ret = 0;
>  	}
>  
>  out:
> -- 
> 2.20.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
