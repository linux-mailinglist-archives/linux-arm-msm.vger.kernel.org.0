Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23D12F6E25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 23:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730565AbhANWYy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 17:24:54 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:49798 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729846AbhANWYy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 17:24:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610663068; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=FZgFCzgmq7rdQxKcmeYNYnl48o3AMxZVO3hSa/M7cEw=; b=mKgdRJ9IokIY8S24veAzK6rdbxXCW+O9rvJ5R1YCqky//rnUed9W6+SqYqVtYXczFhRY0use
 wMehKjbFU7nD70fi1a8+D9kpgHk26DzFMiKDIcBY9z/BGM4IYREt2WYTDqYf8bMDDh0SSKwl
 8iBarW2DpHpuzUF4AsKOJqwhsZg=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6000c47646a6c7cde7de4225 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 22:23:50
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0FBA8C43464; Thu, 14 Jan 2021 22:23:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F2864C433C6;
        Thu, 14 Jan 2021 22:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F2864C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 14 Jan 2021 15:23:43 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
Subject: Re: [PATCH v3 5/7] drm/msm/a5xx: Fix VPC protect value in gpu_write()
Message-ID: <20210114222343.GD29638@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
References: <20210113183339.446239-1-angelogioacchino.delregno@somainline.org>
 <20210113183339.446239-6-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113183339.446239-6-angelogioacchino.delregno@somainline.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 13, 2021 at 07:33:37PM +0100, AngeloGioacchino Del Regno wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> The upstream API for some reason uses logbase2 instead of
> just passing the argument as-is, whereas downstream CAF
> kernel does the latter.
> 
> Hence, a mistake has been made when porting:
> 4 is the value that's supposed to be passed, but
> log2(4) = 2. Changing the value to 16 (= 2^4) fixes
> the issue.

I like keeping it in human readable values because its easier to visually
identify how many registers are saved without doing math.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 66980f4cd93e..24ab51bb5a01 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -821,7 +821,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  
>  	/* VPC */
>  	gpu_write(gpu, REG_A5XX_CP_PROTECT(14), ADRENO_PROTECT_RW(0xE68, 8));
> -	gpu_write(gpu, REG_A5XX_CP_PROTECT(15), ADRENO_PROTECT_RW(0xE70, 4));
> +	gpu_write(gpu, REG_A5XX_CP_PROTECT(15), ADRENO_PROTECT_RW(0xE70, 16));
>  
>  	/* UCHE */
>  	gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
> -- 
> 2.29.2
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
