Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E561B60A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 18:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729419AbgDWQVy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 12:21:54 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:52600 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729501AbgDWQVx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 12:21:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587658913; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=/ec5W44u9De0++LHrjQhntfIZazSbxcz9iOGmXSVsp0=; b=MF9JW/AQ2NHLtmZpdTdrDVW8Cwh+cgHHtvdsAFLdF3dnadxHOtRO4uDIiLgj2z6H2X3VeyVK
 fo8AxVqggv0BGAzOXlivXzngbxHIC5EYgHM50c6th4j0MWvaqTYEMAJ5b4bbQ8duquNffyPN
 tVKpH+DPloLYTMyJrM39+RgNWFE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea1c08f.7f92d0109650-smtp-out-n01;
 Thu, 23 Apr 2020 16:21:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4E982C44788; Thu, 23 Apr 2020 16:21:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48D2DC433BA;
        Thu, 23 Apr 2020 16:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48D2DC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 23 Apr 2020 10:21:30 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 8/9] drm/msm/a6xx: enable GMU log
Message-ID: <20200423162130.GA23271@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200421234127.27965-1-jonathan@marek.ca>
 <20200421234127.27965-9-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421234127.27965-9-jonathan@marek.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 21, 2020 at 07:41:26PM -0400, Jonathan Marek wrote:
> This is required for a650 to work.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 15 +++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |  4 ++++
>  3 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 60ed5360fd8a..f24e436daafe 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -201,6 +201,12 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
>  	u32 val;
>  
>  	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
> +
> +	/* Set the log wptr index
> +	 * note: downstream saves the value in poweroff and restores it here
> +	 */
> +	gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP, 0);
> +
>  	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 0);
>  
>  	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, val,
> @@ -740,6 +746,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>  
>  	gmu_write(gmu, REG_A6XX_GMU_HFI_SFR_ADDR, chipid);
>  
> +	gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG,
> +		  gmu->log.iova | (gmu->log.size / SZ_4K - 1));
> +
>  	/* Set up the lowest idle level on the GMU */
>  	a6xx_gmu_power_config(gmu);
>  
> @@ -1046,6 +1055,7 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
>  	msm_gem_kernel_put(gmu->icache.obj, gmu->aspace, false);
>  	msm_gem_kernel_put(gmu->dcache.obj, gmu->aspace, false);
>  	msm_gem_kernel_put(gmu->dummy.obj, gmu->aspace, false);
> +	msm_gem_kernel_put(gmu->log.obj, gmu->aspace, false);
>  
>  	gmu->aspace->mmu->funcs->detach(gmu->aspace->mmu);
>  	msm_gem_address_space_put(gmu->aspace);
> @@ -1450,6 +1460,11 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	if (ret)
>  		goto err_memory;
>  
> +	/* Allocate memory for the GMU log region */
> +	ret = a6xx_gmu_memory_alloc(gmu, &gmu->log, SZ_4K, 0);
> +	if (ret)
> +		goto err_memory;
> +
>  	/* Map the GMU registers */
>  	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
>  	if (IS_ERR(gmu->mmio)) {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index aed02b2b7659..be65720f32cf 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -61,6 +61,7 @@ struct a6xx_gmu {
>  	struct a6xx_gmu_bo icache;
>  	struct a6xx_gmu_bo dcache;
>  	struct a6xx_gmu_bo dummy;
> +	struct a6xx_gmu_bo log;
>  
>  	int nr_clocks;
>  	struct clk_bulk_data *clocks;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> index b4357ea550ec..176ae94d9fe6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> @@ -205,6 +205,10 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
>  
>  #define REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF			0x000050f0
>  
> +#define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG			0x00005100
> +
> +#define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP			0x00005101
> +
>  #define REG_A6XX_GMU_BOOT_KMD_LM_HANDSHAKE			0x000051f0
>  
>  #define REG_A6XX_GMU_LLM_GLM_SLEEP_CTRL				0x00005157
> -- 
> 2.26.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
