Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F3227B8E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 02:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgI2AbK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 20:31:10 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:37722 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727048AbgI2AbK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 20:31:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601339469; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=VyZ5pmQqa7xLFxb3IAghjc47NWjJ59HQREfpQdKbl/U=;
 b=q82/RPzL3UP45x+Snel+fSyg8ON7sSaoCzgJSm9ueAm4BWCl/lnttkLkz5ZPZz8v1/i4y/B6
 Fxuw7Equw5La2sN56fCvwl7ZF2rtw/Nch7QkbbrwIRYZ6RD1buIm5Sdvspz9ASlEcgxd3G8V
 Z/MjO5Cz+gj1g5MNN1FiK8OOVnM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f72804d1fdd3a1390731781 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Sep 2020 00:31:09
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C65E0C433CB; Tue, 29 Sep 2020 00:31:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A7AB1C433FE;
        Tue, 29 Sep 2020 00:31:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 28 Sep 2020 17:31:06 -0700
From:   abhinavk@codeaurora.org
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: fix 32b build warns
In-Reply-To: <20200929001925.2916984-1-robdclark@gmail.com>
References: <20200929001925.2916984-1-robdclark@gmail.com>
Message-ID: <99486d8eae2223bc5131c56accca1444@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-28 17:19, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Neither of these code-paths apply to older 32b devices, but it is rude
> to introduce warnings.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 2 +-
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index fd8f491f2e48..458b5b26d3c2 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -209,7 +209,7 @@ adreno_iommu_create_address_space(struct msm_gpu 
> *gpu,
>  	size = iommu->geometry.aperture_end - start + 1;
> 
>  	aspace = msm_gem_address_space_create(mmu, "gpu",
> -		start & GENMASK(48, 0), size);
> +		start & GENMASK_ULL(48, 0), size);
> 
>  	if (IS_ERR(aspace) && !IS_ERR(mmu))
>  		mmu->funcs->destroy(mmu);
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> index 029cc8bf5a04..de0dfb815125 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> @@ -879,7 +879,7 @@ struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct
> platform_device *pdev, int id)
>  	pll->max_rate = 3500000000UL;
>  	if (pll->type == MSM_DSI_PHY_7NM_V4_1) {
>  		pll->min_rate = 600000000UL;
> -		pll->max_rate = 5000000000UL;
> +		pll->max_rate = (unsigned long)5000000000ULL;
>  		/* workaround for max rate overflowing on 32-bit builds: */
>  		pll->max_rate = max(pll->max_rate, 0xffffffffUL);
>  	}
