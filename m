Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A14991B5F1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 17:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728990AbgDWP0L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 11:26:11 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:58180 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729008AbgDWP0K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 11:26:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587655570; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=9wQ2DyfHn0zQSPKWH0MRTyykuPGkgNXnO6TKfK9XPEc=; b=S2vAGNHMbQUF3sMOEG1k461pFmIVJesMHM8v1LLP57t9An1W3ko+VJpPLDPvEkJIxfDnDqmp
 fRQZUxLEG66WnQya6hmyxr5QX3nBJWhbOHl3bsAy+57VkazeUecinwSSDim3nOtgoZTC7ugF
 Ugwtq38utNJWOuE/HaTciYAUvTc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea1b388.7f79f553e810-smtp-out-n01;
 Thu, 23 Apr 2020 15:26:00 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5C528C432C2; Thu, 23 Apr 2020 15:25:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 04D96C433F2;
        Thu, 23 Apr 2020 15:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 04D96C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 23 Apr 2020 09:25:55 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH v2 2/9] drm/msm: add internal MSM_BO_MAP_PRIV
 flag
Message-ID: <20200423152555.GA32401@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
        freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Sean Paul <sean@poorly.run>
References: <20200421234127.27965-1-jonathan@marek.ca>
 <20200421234127.27965-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421234127.27965-3-jonathan@marek.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 21, 2020 at 07:41:20PM -0400, Jonathan Marek wrote:
> This flag sets IOMMU_PRIV, which is required for some a6xx GMU objects.

The GMU doesn't _need_  privileged surfaces, but it sure is a good idea.
As a bonus with the APRIV bit on some a6xx targets we can set all of the
global buffers as privileged so people can't go out and overwrite the memstore
any more.

Reviewed-by: Jordan Crouse <jcrouse@codeauorora.org>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 3 +++
>  drivers/gpu/drm/msm/msm_gem.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index d8f56a34c117..6277fde13df9 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -428,6 +428,9 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
>  	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
>  		prot |= IOMMU_WRITE;
>  
> +	if (msm_obj->flags & MSM_BO_MAP_PRIV)
> +		prot |= IOMMU_PRIV;
> +
>  	WARN_ON(!mutex_is_locked(&msm_obj->lock));
>  
>  	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 30584eaf8cc8..972490b14ba5 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -13,6 +13,7 @@
>  
>  /* Additional internal-use only BO flags: */
>  #define MSM_BO_STOLEN        0x10000000    /* try to use stolen/splash memory */
> +#define MSM_BO_MAP_PRIV      0x20000000    /* use IOMMU_PRIV when mapping */
>  
>  struct msm_gem_address_space {
>  	const char *name;
> -- 
> 2.26.1
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
