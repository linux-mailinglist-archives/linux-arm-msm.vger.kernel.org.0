Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9384627B1C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 18:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgI1QWq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 12:22:46 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:49737 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726613AbgI1QWn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 12:22:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601310163; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=7wc+udAnlObk7sQtgo19cUIvXMdE8f3c8WFWBuqci+A=; b=i6efFKgaeeCALjPBtRVSzQThbBe8+qtYmoUruvM4DMDLl34DL+MFklzgylm59z/AopKwrC7z
 /7AFYkAb84hLOAo0oElu4n+AwbjM3lo13qAVGQJ8w3XtsYhraq20g4HUIFYgPXp+6dB1vqhM
 HckSg9LNVQOHHyHhz86XwqOh89I=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f720dbcbebf546dbb734983 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 16:22:20
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9404FC433CA; Mon, 28 Sep 2020 16:22:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C3552C433C8;
        Mon, 28 Sep 2020 16:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C3552C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 28 Sep 2020 10:22:15 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     kholk11@gmail.com
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, konradybcio@gmail.com, marijns95@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] drm/msm/a5xx: Separate A5XX_PC_DBG_ECO_CNTL write
 from main branch
Message-ID: <20200928162215.GD29832@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: kholk11@gmail.com, robdclark@gmail.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, konradybcio@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200926125146.12859-1-kholk11@gmail.com>
 <20200926125146.12859-3-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926125146.12859-3-kholk11@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 26, 2020 at 02:51:41PM +0200, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> The "main" if branch where we program the other regsiters for the

Nit - regsiters -> registers

> Adreno 5xx family of GPUs should not contain the PC_DBG_ECO_CNTL
> register programming because this has logical similarity
> differences from all the others.
> 
> A later commit will show the entire sense of this.

With that
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 6262603e6e2e..f98f0844838c 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -577,8 +577,6 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  		gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x20);
>  		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x40000030);
>  		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x20100D0A);
> -		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
> -			  (0x200 << 11 | 0x200 << 22));
>  	} else {
>  		gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x40);
>  		if (adreno_is_a530(adreno_gpu))
> @@ -587,9 +585,14 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
>  		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x80000060);
>  		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
> +	}
> +
> +	if (adreno_is_a510(adreno_gpu))
> +		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
> +			  (0x200 << 11 | 0x200 << 22));
> +	else
>  		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
>  			  (0x400 << 11 | 0x300 << 22));
> -	}
>  
>  	if (adreno_gpu->info->quirks & ADRENO_QUIRK_TWO_PASS_USE_WFI)
>  		gpu_rmw(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0, (1 << 8));
> -- 
> 2.28.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
