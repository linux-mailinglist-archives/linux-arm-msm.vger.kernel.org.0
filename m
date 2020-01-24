Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88850148DC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 19:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387907AbgAXS1E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 13:27:04 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:42021 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387557AbgAXS1E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 13:27:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579890423; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=vIZY+m9EMe+TETKYgTmMIG1//fE/Z8Pwfi9rqiJvXtM=; b=mgzWwWgzcHeWzXmoy79e+amL4vjdiMQutH6ok6U6o2y8lhLBcWKfv3X75aHoqzE17NUnnl0u
 5yG2rMWGAsb7Ek3DMDygJfjoCk/X0UEuHeYX7RRUc282A1Forx3w7QR2yTyJJrKM+NXXx1l0
 3fWbj5D+6UnoXfx0HwUrSkJlX7w=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2b36f2.7fe52fedf148-smtp-out-n03;
 Fri, 24 Jan 2020 18:26:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5D5C4C4479C; Fri, 24 Jan 2020 18:26:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 54D3AC433CB;
        Fri, 24 Jan 2020 18:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 54D3AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Fri, 24 Jan 2020 11:26:54 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        smasetty@codeaurora.org
Subject: Re: [PATCH] drm/msm/a6xx: Correct the highestbank configuration
Message-ID: <20200124182654.GA17149@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        smasetty@codeaurora.org
References: <1579868411-20837-1-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579868411-20837-1-git-send-email-akhilpo@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 24, 2020 at 05:50:11PM +0530, Akhil P Oommen wrote:
> Highest bank bit configuration is different for a618 gpu. Update
> it with the correct configuration which is the reset value incidentally.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index daf0780..536d196 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -470,10 +470,12 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>  	/* Select CP0 to always count cycles */
>  	gpu_write(gpu, REG_A6XX_CP_PERFCTR_CP_SEL_0, PERF_CP_ALWAYS_COUNT);
>  
> -	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
> -	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
> -	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
> -	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
> +	if (adreno_is_a630(adreno_gpu)) {
> +		gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
> +		gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
> +		gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
> +		gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
> +	}

it shouldn't come as a surprise that everything in the a6xx family is going to
have a highest bank bit setting. Even though the a618 uses the reset value, I
think it would be less confusing to future folks if we explicitly program it:

if (adreno_is_a630(adreno_dev))
  hbb = 2;
else
  hbb = 0;

....

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
