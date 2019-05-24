Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5F629F9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2019 22:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391738AbfEXUQH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 May 2019 16:16:07 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41130 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391817AbfEXUQH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 May 2019 16:16:07 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C6116609F3; Fri, 24 May 2019 20:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558728966;
        bh=7lAqkzss2aGJ5ffn2bYK8f++vTLf/SLZklfVXvX23tk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=g8ZYW2MUJvgg61MOc9jTAxDeA3OBqkLqq5YTCisvEqFJEJXNoa/Xs7iEG0BNqXOqt
         SeX+liPk36qjxkpC1EiVpHrD2sq9wx/vVEHVjpRO9OqqHOSr9M5xM7bHxFTbwner6w
         YA5cj60YcBH8BoJkE/PfVpBHeRaLim+JHfMH/ovw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 0A3B06087F;
        Fri, 24 May 2019 20:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558728966;
        bh=7lAqkzss2aGJ5ffn2bYK8f++vTLf/SLZklfVXvX23tk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=g8ZYW2MUJvgg61MOc9jTAxDeA3OBqkLqq5YTCisvEqFJEJXNoa/Xs7iEG0BNqXOqt
         SeX+liPk36qjxkpC1EiVpHrD2sq9wx/vVEHVjpRO9OqqHOSr9M5xM7bHxFTbwner6w
         YA5cj60YcBH8BoJkE/PfVpBHeRaLim+JHfMH/ovw=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 24 May 2019 13:16:06 -0700
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dpu: Use provided drm_minor to initialize
 debugfs
In-Reply-To: <20190524173231.5040-1-sean@poorly.run>
References: <20190524173231.5040-1-sean@poorly.run>
Message-ID: <b9e1d9e8e5e76b39c51701c77e00b1c4@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-05-24 10:32, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Instead of reaching into dev->primary for debugfs_root, use the minor
> passed into debugfs_init.
> 
> This avoids creating the debug directory under /sys/kernel/debug/ and
> instead creates the directory under the correct node in
> /sys/kernel/debug/dri/<node>/
> 
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 885bf88afa3e..d77071965431 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -231,7 +231,7 @@ void *dpu_debugfs_create_regset32(const char
> *name, umode_t mode,
>  			regset, &dpu_fops_regset32);
>  }
> 
> -static int _dpu_debugfs_init(struct dpu_kms *dpu_kms)
> +static int _dpu_debugfs_init(struct dpu_kms *dpu_kms, struct drm_minor 
> *minor)
>  {
>  	void *p = dpu_hw_util_get_log_mask_ptr();
>  	struct dentry *entry;
> @@ -239,7 +239,7 @@ static int _dpu_debugfs_init(struct dpu_kms 
> *dpu_kms)
>  	if (!p)
>  		return -EINVAL;
> 
> -	entry = debugfs_create_dir("debug", 
> dpu_kms->dev->primary->debugfs_root);
> +	entry = debugfs_create_dir("debug", minor->debugfs_root);
>  	if (IS_ERR_OR_NULL(entry))
>  		return -ENODEV;
> 
> @@ -581,7 +581,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms 
> *dpu_kms)
>  #ifdef CONFIG_DEBUG_FS
>  static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor 
> *minor)
>  {
> -	return _dpu_debugfs_init(to_dpu_kms(kms));
> +	return _dpu_debugfs_init(to_dpu_kms(kms), minor);
>  }
>  #endif
