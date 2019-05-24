Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F1229FAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2019 22:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403785AbfEXUSS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 May 2019 16:18:18 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42766 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403773AbfEXUSS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 May 2019 16:18:18 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AD5BC60907; Fri, 24 May 2019 20:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558729097;
        bh=nXPciAhWumJxn8iXyonu0dWDccJ+9SfgHSe1wd3MTyY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=H7luySoAkb5M6VH3+IXcn1QRi6gvP73vVrKZO+M7cSdSvk6N+md+fGbLnnK80cj5Y
         pLsT1OG3dDkUUsrhiVc3rUXxKp6mZlQ4Pyv+9UIbj6vO+oCF/QjgmRbTcBP+s02tPV
         NPv54za0+026YDGVwjBujDZlKnklUwTHPdwO0blA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id EECE960388;
        Fri, 24 May 2019 20:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558729097;
        bh=nXPciAhWumJxn8iXyonu0dWDccJ+9SfgHSe1wd3MTyY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=H7luySoAkb5M6VH3+IXcn1QRi6gvP73vVrKZO+M7cSdSvk6N+md+fGbLnnK80cj5Y
         pLsT1OG3dDkUUsrhiVc3rUXxKp6mZlQ4Pyv+9UIbj6vO+oCF/QjgmRbTcBP+s02tPV
         NPv54za0+026YDGVwjBujDZlKnklUwTHPdwO0blA=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 24 May 2019 13:18:16 -0700
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dpu: Remove _dpu_debugfs_init
In-Reply-To: <20190524173231.5040-2-sean@poorly.run>
References: <20190524173231.5040-1-sean@poorly.run>
 <20190524173231.5040-2-sean@poorly.run>
Message-ID: <8d0b87d94fd3fa4468965753e7c325c1@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-05-24 10:32, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Fold it into dpu_debugfs_init.
> 
> Cc: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index d77071965431..0a8c334c3a9f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -231,8 +231,9 @@ void *dpu_debugfs_create_regset32(const char
> *name, umode_t mode,
>  			regset, &dpu_fops_regset32);
>  }
> 
> -static int _dpu_debugfs_init(struct dpu_kms *dpu_kms, struct drm_minor 
> *minor)
> +static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor 
> *minor)
>  {
> +	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>  	void *p = dpu_hw_util_get_log_mask_ptr();
>  	struct dentry *entry;
> 
> @@ -578,13 +579,6 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms 
> *dpu_kms)
>  	return ret;
>  }
> 
> -#ifdef CONFIG_DEBUG_FS
> -static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor 
> *minor)
> -{
> -	return _dpu_debugfs_init(to_dpu_kms(kms), minor);
> -}
> -#endif
> -
>  static long dpu_kms_round_pixclk(struct msm_kms *kms, unsigned long 
> rate,
>  		struct drm_encoder *encoder)
>  {
