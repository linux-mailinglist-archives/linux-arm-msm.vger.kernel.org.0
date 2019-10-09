Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 118B6D132D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 17:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731386AbfJIPoN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 11:44:13 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33850 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731145AbfJIPoN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 11:44:13 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 048D16070D; Wed,  9 Oct 2019 15:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570635852;
        bh=H77E6QRpj902y5ZjTMISRgJie95q1ZRTaFiWuLsQ4nA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=atcYYeORRrXNix+K29y+j6BTlu+GbjSjfv9zINWQV1L43uuqLuobRXyJkBTaTaLpJ
         noK0WLvsJHdNJhwZS4zPPb4IKJISFupDxraAeVxuMddLRE+Rf6AVlOtQNn8VqiSFxl
         yqBg/sa0qEZdEj8C283qh8cwIRAsMhAFgBqJ/PaE=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C2188602F2;
        Wed,  9 Oct 2019 15:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570635849;
        bh=H77E6QRpj902y5ZjTMISRgJie95q1ZRTaFiWuLsQ4nA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f7nmvh3GhgeBppz79Sb9yZbcgBGkjcIxha0vZ8VqEMhZW1wM8O3vRZT4AlScCRBI2
         E2w1vLzUwLXr88DnlmYfyH1UMEE/e1Nrt13okQADr0lpZPJF20xGYiMjC7mYkrj4Q0
         ySQ3lj4rhkVKlHNvBIkGbjjlA0d8ULpIFR7xlUeg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C2188602F2
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 9 Oct 2019 09:44:06 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-kernel@lists.codethink.co.uk,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: make a5xx_show and a5xx_gpu_state_put static
Message-ID: <20191009154406.GB13386@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Ben Dooks <ben.dooks@codethink.co.uk>,
        linux-kernel@lists.codethink.co.uk, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20191009114607.701-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009114607.701-1-ben.dooks@codethink.co.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 09, 2019 at 12:46:07PM +0100, Ben Dooks wrote:
> The a5xx_show and a5xx_gpu_state_put objects are not exported
> outside of the file, so make them static to avoid the following
> warnings from sparse:
> 
> drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1292:5: warning: symbol 'a5xx_gpu_state_put' was not declared. Should it be static?
> drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1302:6: warning: symbol 'a5xx_show' was not declared. Should it be static?

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index e9c55d1d6c04..7fdc9e2bcaac 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1289,7 +1289,7 @@ static void a5xx_gpu_state_destroy(struct kref *kref)
>  	kfree(a5xx_state);
>  }
>  
> -int a5xx_gpu_state_put(struct msm_gpu_state *state)
> +static int a5xx_gpu_state_put(struct msm_gpu_state *state)
>  {
>  	if (IS_ERR_OR_NULL(state))
>  		return 1;
> @@ -1299,8 +1299,8 @@ int a5xx_gpu_state_put(struct msm_gpu_state *state)
>  
>  
>  #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
> -void a5xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
> -		struct drm_printer *p)
> +static void a5xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
> +		      struct drm_printer *p)
>  {
>  	int i, j;
>  	u32 pos = 0;
> -- 
> 2.23.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
