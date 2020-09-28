Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A980327B1CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 18:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgI1Q0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 12:26:01 -0400
Received: from z5.mailgun.us ([104.130.96.5]:43911 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726344AbgI1Q0B (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 12:26:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601310361; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=oUdEYLO/LBcwhMGcfeLJRSq6/QgcQ4bl42FimYBDM60=; b=BGY8LyqQczGkiF/yZO4Phf8JAGJMzqoobdl02DaFQgS29J9kZGzmk58cTCcnswAGFl76hO1A
 XD3JY8TSCtXVfBwEZu0UlfnvZcKqDmhGRpbki9Hpr/VrXvFj6nC1T3Vt60msSGQhH+T2nPGz
 MFyHsynTi7aGz2qErf3Maiiif+8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f720e987e9d6827ec7cf11f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 16:26:00
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9AF86C433F1; Mon, 28 Sep 2020 16:26:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 22B0FC433CA;
        Mon, 28 Sep 2020 16:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 22B0FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 28 Sep 2020 10:25:56 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     kholk11@gmail.com
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, konradybcio@gmail.com, marijns95@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] drm/msm/a5xx: Reset VBIF before PC only on A510 and
 A530
Message-ID: <20200928162555.GF29832@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: kholk11@gmail.com, robdclark@gmail.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, konradybcio@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200926125146.12859-1-kholk11@gmail.com>
 <20200926125146.12859-5-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926125146.12859-5-kholk11@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 26, 2020 at 02:51:43PM +0200, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Resetting the VBIF before power collapse is done to avoid getting
> bogus FIFO entries during the suspend sequence or subsequent resume,
> but this is doable only on Adreno 510 and Adreno 530, as the other
> units will tendentially lock up.
> Especially on Adreno 508, the GPU will show lockups and very bad
> slownesses after processing the first frame.
> 
> Avoiding to execute the RBBM SW Reset before suspend will stop the
> lockup issue from happening on at least Adreno 508/509/512.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 9bcbf6cd5a28..00df5de3c8e3 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1306,10 +1306,12 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
>  
>  	/*
>  	 * Reset the VBIF before power collapse to avoid issue with FIFO
> -	 * entries
> +	 * entries on Adreno A510 and A530 (the others will tend to lock up)
>  	 */
> -	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003C0000);
> -	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
> +	if (adreno_is_a510(adreno_gpu) || adreno_is_a530(adreno_gpu)) {
> +		gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003C0000);
> +		gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
> +	}
>  
>  	return msm_gpu_pm_suspend(gpu);
>  }
> -- 
> 2.28.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
