Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1BFA27B19B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 18:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgI1QP6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 12:15:58 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:28658 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726344AbgI1QP6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 12:15:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601309757; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=qlHI/nzxGlqO3ivL/08aAXl4gpk3ZpfV/C8I5k69Mz0=; b=Fw7oOknRPDv7ebDdhXrGIGMNSxpwRgVHh72aNr2+o4Bn+zlEbE9IeZQRRmaVS3KUPGQ4ruWw
 nHix5STTzQKlQIXoM6+6sA9oB8GgxdWyawaNzRtGUOqFdfIXl54aHEAysnef76Nikuor8nuB
 k/xzk6gNE2W/ImELlLS/PI1ZavQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f720c38e6be23d0df59be47 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 16:15:52
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DF307C4339C; Mon, 28 Sep 2020 16:15:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 330C4C433CB;
        Mon, 28 Sep 2020 16:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 330C4C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 28 Sep 2020 10:15:46 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     kholk11@gmail.com
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, konradybcio@gmail.com, marijns95@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] drm/msm/a5xx: Fix VPC protect value in gpu_write()
Message-ID: <20200928161546.GB29832@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: kholk11@gmail.com, robdclark@gmail.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, konradybcio@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200926125146.12859-1-kholk11@gmail.com>
 <20200926125146.12859-6-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926125146.12859-6-kholk11@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 26, 2020 at 02:51:44PM +0200, kholk11@gmail.com wrote:
> From: Konrad Dybcio <konradybcio@gmail.com>
> 
> The upstream API for some reason uses logbase2 instead of
> just passing the argument as-is, whereas downstream CAF
> kernel does the latter.
> 
> Hence, a mistake has been made when porting:
> 4 is the value that's supposed to be passed, but
> log2(4) = 2. Changing the value to 16 (= 2^4) fixes
> the issue.

FWIW I think downstream is wrong. Its a lot more intuitive to pass the number of
registers that should be protected than to force a human to do math.

Jordan

> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 00df5de3c8e3..b2670af638a3 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -789,7 +789,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  
>  	/* VPC */
>  	gpu_write(gpu, REG_A5XX_CP_PROTECT(14), ADRENO_PROTECT_RW(0xE68, 8));
> -	gpu_write(gpu, REG_A5XX_CP_PROTECT(15), ADRENO_PROTECT_RW(0xE70, 4));
> +	gpu_write(gpu, REG_A5XX_CP_PROTECT(15), ADRENO_PROTECT_RW(0xE70, 16));
>  
>  	/* UCHE */
>  	gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
> -- 
> 2.28.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
