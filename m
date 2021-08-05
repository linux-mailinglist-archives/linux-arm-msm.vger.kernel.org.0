Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0750B3E10C4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 11:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238882AbhHEJFU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 05:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231865AbhHEJFS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 05:05:18 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA7AC061765
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Aug 2021 02:05:04 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id b6so9645426lff.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Aug 2021 02:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5PRfgYn/vuEbpxsqmKFuKF8ZxLKRXFL1Tv9NQB4Z3Gc=;
        b=ht4mgpRBFefq81TSXz4DiomH256ilky1UstTt6UK84dug3aVT3ydz2dYHnqevk/Poa
         hrcwxxIdwtl8KuRulxeslIcjkdFHyEEYCDOqR6B0ZW0lPMPBZlq6yQaBmLFsqUILu8pu
         vzjxY1V5ZZKMX2avicgU/5CMaLw5cgpnO8vJLdO3qcmbIynlMYIOfvu4K4m6e3GEnnRr
         HdjuYb4+sbS8y+vXMy5ib5yL3gusGak3KtGO0EplZVMIMNhVoyloWqxG4N+L7QcPzBKf
         SPsl/CVI5/PQ/qYDwk1aGtohc3B2v3kDoZuyhSkAmW8ctoBi/p8TfC7/pqXqf42ithkD
         siHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5PRfgYn/vuEbpxsqmKFuKF8ZxLKRXFL1Tv9NQB4Z3Gc=;
        b=oO4Vh1qv4fRW9aBscL8uVIvLN/Gb+tfD25VjpFZreLx0wPV7HJ5booW8A0lX7I0wNP
         Hal2v2t8DxdvXwCYdrE4P1whK5YugNcmP61JQn0nxsJeVgMdCdrMI0N355cayZ9SjFsF
         cMaOO/gipbC0i/fFImWBFeiZx7LqIj5ORp8hH/My0qTqngsKPuBC68XWH/ecFhbdmRz1
         Y5pT3wszEEzOCj54nrO6vv0YOK4rzmdKaSy9NDDoNK4c6SDUPY8Ri5qTp9Ho2OW29BtT
         HzQtb8VkYAgG6rN9sE6KmEO7i10TZQBUkV8+GjKURZYNWAmC4pOVSR+Xb/XNWc2RFsR9
         BXfw==
X-Gm-Message-State: AOAM531+fym+akV1nx/uCw/PO48xB6+89sUSlwn2GXty5PQh6Z/dr+jV
        GJCbJZzcNGachDKu0DoXRsXur3hzB7QYvQ==
X-Google-Smtp-Source: ABdhPJxfSjt2wJRM+9CpldJ1w4MmICthHJ1/0XuDQy9EY3TKrsyWr8DYTe4jaM76DbjD5T7Axt+iLw==
X-Received: by 2002:ac2:5d45:: with SMTP id w5mr2837482lfd.642.1628154300859;
        Thu, 05 Aug 2021 02:05:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r20sm374334ljp.126.2021.08.05.02.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 02:05:00 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/msm/mdp4: refactor HW revision detection into
 read_mdp_hw_revision
To:     David Heidelberg <david@ixit.cz>,
        Jonathan Marek <jonathan@marek.ca>,
        robdclark <robdclark@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
References: <20210705231641.315804-1-david@ixit.cz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <270d29a8-484f-3580-edc8-37402d029cd2@linaro.org>
Date:   Thu, 5 Aug 2021 12:04:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210705231641.315804-1-david@ixit.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/07/2021 02:16, David Heidelberg wrote:
> Inspired by MDP5 code.
> Also use DRM_DEV_INFO for MDP version as MDP5 does.
> 
> Cosmetic change: uint32_t -> u32 - checkpatch suggestion.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 ++++++++++++++++--------
>   1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 4a5b518288b0..3a7a01d801aa 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -19,20 +19,13 @@ static int mdp4_hw_init(struct msm_kms *kms)
>   {
>   	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
>   	struct drm_device *dev = mdp4_kms->dev;
> -	uint32_t version, major, minor, dmap_cfg, vg_cfg;
> +	u32 major, minor, dmap_cfg, vg_cfg;
>   	unsigned long clk;
>   	int ret = 0;
>   
>   	pm_runtime_get_sync(dev->dev);
>   
> -	mdp4_enable(mdp4_kms);
> -	version = mdp4_read(mdp4_kms, REG_MDP4_VERSION);
> -	mdp4_disable(mdp4_kms);
> -
> -	major = FIELD(version, MDP4_VERSION_MAJOR);
> -	minor = FIELD(version, MDP4_VERSION_MINOR);
> -
> -	DBG("found MDP4 version v%d.%d", major, minor);
> +	read_mdp_hw_revision(mdp4_kms, &major, &minor);
>   
>   	if (major != 4) {
>   		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
> @@ -411,6 +404,22 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
>   	return ret;
>   }
>   
> +static void read_mdp_hw_revision(struct mdp4_kms *mdp4_kms,
> +				 u32 *major, u32 *minor)
> +{
> +	struct drm_device *dev = mdp4_kms->dev;
> +	u32 version;
> +
> +	mdp4_enable(mdp4_kms);
> +	version = mdp4_read(mdp4_kms, REG_MDP4_VERSION);
> +	mdp4_disable(mdp4_kms);
> +
> +	*major = FIELD(version, MDP4_VERSION_MAJOR);
> +	*minor = FIELD(version, MDP4_VERSION_MINOR);
> +
> +	DRM_DEV_INFO(dev->dev, "MDP4 version v%d.%d", *major, *minor);
> +}
> +
>   struct msm_kms *mdp4_kms_init(struct drm_device *dev)
>   {
>   	struct platform_device *pdev = to_platform_device(dev->dev);
> 


-- 
With best wishes
Dmitry
