Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A02A3B3B41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 05:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbhFYDls (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 23:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232996AbhFYDlq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 23:41:46 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A46C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 20:39:25 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so7991560otl.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 20:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NgBcYRoIlctACD+L2YYbad3iw3ek5NyZ4dgv7eQ3Lxs=;
        b=d5Z7R72WbYSoShvKXvQHAJXVwL9hbpA/qb5R/LJlrIh+pVPidB5zbsT9XIsS2eBFAt
         UJ47Eqc334KXUncOythdccWWcpLa66oC85s02pMEYC9A54iPhc3Mhix+k6aEAP+K9W2R
         nxQhXV4ZJJ4+gf11TL6cIq92u+Cc0itFy6GYLedkbkJpC9JU32x6vKXlKxK/HsF+iL0o
         Spw5qiiteoNzA7/ruwNUEyNFWsZOnWjDCh7F/JIiLGmvk8bRAmXhOBcMvC6vOPwi5WbT
         SnJzGZ1JwYqdDihOS3zBQevpoQ+h9uJPXUg3PpaYmnpR+LohY+sA6d0IvlDkWMkGYOpc
         vxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NgBcYRoIlctACD+L2YYbad3iw3ek5NyZ4dgv7eQ3Lxs=;
        b=noqYWCDPPa6rh/J5JXpYKAUSKmlnNQi12buqwnAApy30Hof+wI7iiPEL/tt7KFlbv1
         ywpt68/om/5fYThcnu6kVgWf46K8Wvv9jkAtuSZPNulbVGpXg90JaVJEisSHI61Xdp01
         VkhfN/DhsibVgrha9pE/dGgFeuIXsleXnpxt2ctnGTUrg2pQt9Xruke2ABIfdnU7lr+R
         jQ1CucO8CJIY1MwxUs4MsWgb6bBMgp0B8dLaEyEogQavjLyAyvzlONRwYeqLgECJPiKN
         kJ4HWgTjrpt/1V26ulOT1Ul3iC1TrR0r/Rsy5uMBrYBd8voGOku3qfKvWFe904Pr3pyi
         UDGg==
X-Gm-Message-State: AOAM532omuaAfIR+hvHTFQO2fVhqDAVMHCj/4qZlK4TdoYaITnhEcvU5
        IshdqugNn1ERyH3RXghiqR+3kw==
X-Google-Smtp-Source: ABdhPJxICvy4DH/gmlYi4aOPrUOcJ+WDYuzwO6ESj2tt39upXIdEx5yfKOxDmtDKbeC3lx3i+SQnUg==
X-Received: by 2002:a9d:1e5:: with SMTP id e92mr5472028ote.353.1624592365276;
        Thu, 24 Jun 2021 20:39:25 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t21sm1140288otd.35.2021.06.24.20.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 20:39:24 -0700 (PDT)
Date:   Thu, 24 Jun 2021 22:39:22 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        freedreno@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/5] drm/msm: Improve the a6xx page fault handler
Message-ID: <YNVP6rfQ699BejsI@yoga>
References: <20210610214431.539029-1-robdclark@gmail.com>
 <20210610214431.539029-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610214431.539029-4-robdclark@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 10 Jun 16:44 CDT 2021, Rob Clark wrote:
[..]
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 50d881794758..6975b95c3c29 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -211,8 +211,17 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>  		unsigned long iova, int flags, void *arg)
>  {
>  	struct msm_iommu *iommu = arg;
> +	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
> +	struct adreno_smmu_fault_info info, *ptr = NULL;
> +
> +	if (adreno_smmu->get_fault_info) {

This seemed reasonable when I read it last time, but I didn't realize
that the msm_fault_handler() is installed for all msm_iommu instances.

So while we're trying to recover from the boot splash and setup the new
framebuffer we end up here with iommu->base.dev being the mdss device.
Naturally drvdata of mdss is not a struct adreno_smmu_priv.

> +		adreno_smmu->get_fault_info(adreno_smmu->cookie, &info);

So here we just jump straight out into hyperspace, never to return.

Not sure how to wire this up to avoid the problem, but right now I don't
think we can boot any device with a boot splash.

Regards,
Bjorn

> +		ptr = &info;
> +	}
> +
>  	if (iommu->base.handler)
> -		return iommu->base.handler(iommu->base.arg, iova, flags);
> +		return iommu->base.handler(iommu->base.arg, iova, flags, ptr);
> +
>  	pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
>  	return 0;
>  }
