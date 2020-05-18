Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C46E1D7B6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 16:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgEROjU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 10:39:20 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:47135 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726918AbgEROjU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 10:39:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589812759; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=lz64CY1Fnh0Du4qxvELgYretin+eMC/xk/Q42il/G+A=; b=w2KXZFdJCpUnZGfHP4lZGwWHDozetGYhoAVvu4XrmzOQw5S8n/7dPENRj1YN25KEPVTBPnnF
 RxVXVqWiJgiOU7rzK9btak61pT7GvycKGMrUQv9OnPILbfhlZl81jXhBKjUlPlIlt7RRl0Xv
 Fox732RdQV420Awxyw0rhW2LgrA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec29e14.7fe5fac43ab0-smtp-out-n05;
 Mon, 18 May 2020 14:39:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AF1D7C432C2; Mon, 18 May 2020 14:39:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 82B25C433D2;
        Mon, 18 May 2020 14:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 82B25C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 18 May 2020 08:39:09 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Brian Masney <masneyb@onstation.org>,
        Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/a4xx: add a405_registers for a405 device
Message-ID: <20200518143909.GB3915@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Shawn Guo <shawn.guo@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Brian Masney <masneyb@onstation.org>,
        Konrad Dybcio <konradybcio@gmail.com>
References: <20200509123846.27932-1-shawn.guo@linaro.org>
 <20200509123846.27932-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509123846.27932-3-shawn.guo@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, May 09, 2020 at 08:38:46PM +0800, Shawn Guo wrote:
> A405 device has a different set of registers than a4xx_registers.  It
> has no VMIDMT or XPU registers, and VBIF registers are different.  Let's
> add a405_registers for a405 device.
> 
> As adreno_is_a405() works only after adreno_gpu_init() gets called, the
> assignments get moved down after adreno_gpu_init().

Reviewed-by: Jordan Crouse <jcrouse@codeauorora.org>

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 53 +++++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index 70de59751188..9e244982974e 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -445,6 +445,52 @@ static const unsigned int a4xx_registers[] = {
>  	~0 /* sentinel */
>  };
>  
> +static const unsigned int a405_registers[] = {
> +	/* RBBM */
> +	0x0000, 0x0002, 0x0004, 0x0021, 0x0023, 0x0024, 0x0026, 0x0026,
> +	0x0028, 0x002B, 0x002E, 0x0034, 0x0037, 0x0044, 0x0047, 0x0066,
> +	0x0068, 0x0095, 0x009C, 0x0170, 0x0174, 0x01AF,
> +	/* CP */
> +	0x0200, 0x0233, 0x0240, 0x0250, 0x04C0, 0x04DD, 0x0500, 0x050B,
> +	0x0578, 0x058F,
> +	/* VSC */
> +	0x0C00, 0x0C03, 0x0C08, 0x0C41, 0x0C50, 0x0C51,
> +	/* GRAS */
> +	0x0C80, 0x0C81, 0x0C88, 0x0C8F,
> +	/* RB */
> +	0x0CC0, 0x0CC0, 0x0CC4, 0x0CD2,
> +	/* PC */
> +	0x0D00, 0x0D0C, 0x0D10, 0x0D17, 0x0D20, 0x0D23,
> +	/* VFD */
> +	0x0E40, 0x0E4A,
> +	/* VPC */
> +	0x0E60, 0x0E61, 0x0E63, 0x0E68,
> +	/* UCHE */
> +	0x0E80, 0x0E84, 0x0E88, 0x0E95,
> +	/* GRAS CTX 0 */
> +	0x2000, 0x2004, 0x2008, 0x2067, 0x2070, 0x2078, 0x207B, 0x216E,
> +	/* PC CTX 0 */
> +	0x21C0, 0x21C6, 0x21D0, 0x21D0, 0x21D9, 0x21D9, 0x21E5, 0x21E7,
> +	/* VFD CTX 0 */
> +	0x2200, 0x2204, 0x2208, 0x22A9,
> +	/* GRAS CTX 1 */
> +	0x2400, 0x2404, 0x2408, 0x2467, 0x2470, 0x2478, 0x247B, 0x256E,
> +	/* PC CTX 1 */
> +	0x25C0, 0x25C6, 0x25D0, 0x25D0, 0x25D9, 0x25D9, 0x25E5, 0x25E7,
> +	/* VFD CTX 1 */
> +	0x2600, 0x2604, 0x2608, 0x26A9,
> +	/* VBIF version 0x20050000*/
> +	0x3000, 0x3007, 0x302C, 0x302C, 0x3030, 0x3030, 0x3034, 0x3036,
> +	0x3038, 0x3038, 0x303C, 0x303D, 0x3040, 0x3040, 0x3049, 0x3049,
> +	0x3058, 0x3058, 0x305B, 0x3061, 0x3064, 0x3068, 0x306C, 0x306D,
> +	0x3080, 0x3088, 0x308B, 0x308C, 0x3090, 0x3094, 0x3098, 0x3098,
> +	0x309C, 0x309C, 0x30C0, 0x30C0, 0x30C8, 0x30C8, 0x30D0, 0x30D0,
> +	0x30D8, 0x30D8, 0x30E0, 0x30E0, 0x3100, 0x3100, 0x3108, 0x3108,
> +	0x3110, 0x3110, 0x3118, 0x3118, 0x3120, 0x3120, 0x3124, 0x3125,
> +	0x3129, 0x3129, 0x340C, 0x340C, 0x3410, 0x3410,
> +	~0 /* sentinel */
> +};
> +
>  static struct msm_gpu_state *a4xx_gpu_state_get(struct msm_gpu *gpu)
>  {
>  	struct msm_gpu_state *state = kzalloc(sizeof(*state), GFP_KERNEL);
> @@ -568,13 +614,14 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>  	gpu->perfcntrs = NULL;
>  	gpu->num_perfcntrs = 0;
>  
> -	adreno_gpu->registers = a4xx_registers;
> -	adreno_gpu->reg_offsets = a4xx_register_offsets;
> -
>  	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
>  	if (ret)
>  		goto fail;
>  
> +	adreno_gpu->registers = adreno_is_a405(adreno_gpu) ? a405_registers :
> +							     a4xx_registers;
> +	adreno_gpu->reg_offsets = a4xx_register_offsets;
> +
>  	/* if needed, allocate gmem: */
>  	if (adreno_is_a4xx(adreno_gpu)) {
>  		ret = adreno_gpu_ocmem_init(dev->dev, adreno_gpu,
> -- 
> 2.17.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
