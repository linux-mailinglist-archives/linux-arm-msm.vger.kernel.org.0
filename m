Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC632466AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 14:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728452AbgHQMwm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 08:52:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:23992 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728489AbgHQMwi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 08:52:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597668757; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=JGVe9PW+tTDsQAAqGjQ8ritTdegK9mneovtsPPAvGdU=; b=UxU2UvzVt1SJPgS/uhJgEmfdK0TTKEs2AulQbk92RIK0tppdnVMrkmprvHFe3BxTk2CHuAdY
 2FyuzTxDl/qTAzopLBZ5RUT7bfbKtrXKz0WeBb6DlrVVpcIwrkq5zgBs7lmjgJ1ovLKuw7Px
 ow87vyCGmnXnShqaNnelEYCKfz4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5f3a7d6eba4c2cd36711cb34 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 12:51:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DAD9BC43387; Mon, 17 Aug 2020 12:51:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.7] (unknown [117.217.239.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3ABC4C433CA;
        Mon, 17 Aug 2020 12:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3ABC4C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [RESEND PATCH] drm/msm/a6xx: fix frequency not always being
 restored on GMU resume
To:     Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
Cc:     David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Sean Paul <sean@poorly.run>,
        open list <linux-kernel@vger.kernel.org>
References: <20200813185450.19387-1-jonathan@marek.ca>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <270c4efd-8524-c389-3347-2f9c4e246b6d@codeaurora.org>
Date:   Mon, 17 Aug 2020 18:21:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813185450.19387-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Why don't we move the early return in a6xx_gmu_set_freq() to 
msm_devfreq_target() instead?

-Akhil.

On 8/14/2020 12:24 AM, Jonathan Marek wrote:
> The patch reorganizing the set_freq function made it so the gmu resume
> doesn't always set the frequency, because a6xx_gmu_set_freq() exits early
> when the frequency hasn't been changed. Note this always happens when
> resuming GMU after recovering from a hang.
> 
> Use a simple workaround to prevent this from happening.
> 
> Fixes: 1f60d11423db ("drm: msm: a6xx: send opp instead of a frequency")
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index b67b38c8fadf..bbbd00020f92 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -845,6 +845,7 @@ static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
>   	if (IS_ERR_OR_NULL(gpu_opp))
>   		return;
>   
> +	gmu->freq = 0; /* so a6xx_gmu_set_freq() doesn't exit early */
>   	a6xx_gmu_set_freq(gpu, gpu_opp);
>   	dev_pm_opp_put(gpu_opp);
>   }
> 

