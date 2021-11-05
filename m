Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5291A446AA7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 22:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233919AbhKEVh0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 17:37:26 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:57809 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233890AbhKEVhZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 17:37:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636148086; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=0Jewg2AqBl+1plU7YqOcP1P8dFzpqrVSpl6IXbliAcY=; b=u/Qw2gLPmLVkFezZnTVDEnmBXA5xAfUVdkh9mnBkpVRLT8zbRA70JckaAMxpIt8bP/lV4aSQ
 F97F0F76Fif/P9M2a++LqDbeILe1Rt9hpTclnh3VnOCvL1QS607dWE4QOCP2x5JZZUMgIZOv
 qqx9KkywbfMU/AVDquyiZWGU+rg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6185a35f7d93184cc7410934 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Nov 2021 21:34:23
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4D3BFC4360C; Fri,  5 Nov 2021 21:34:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [192.168.1.16] (unknown [59.88.239.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B2B78C43460;
        Fri,  5 Nov 2021 21:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B2B78C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <f19176a2-5e98-9772-f686-0be9ea861c1a@codeaurora.org>
Date:   Sat, 6 Nov 2021 03:04:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2] drm/msm/devfreq: Fix OPP refcnt leak
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        open list <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
References: <20211105202021.181092-1-robdclark@gmail.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
In-Reply-To: <20211105202021.181092-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/6/2021 1:50 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index d32b729b4616..07f1169df89b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -20,6 +20,10 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>   	struct msm_gpu *gpu = dev_to_gpu(dev);
>   	struct dev_pm_opp *opp;
>   
> +	/*
> +	 * Note that devfreq_recommended_opp() can modify the freq
> +	 * to something that actually is in the opp table:
> +	 */
>   	opp = devfreq_recommended_opp(dev, freq, flags);
>   
>   	/*
> @@ -28,6 +32,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>   	 */
>   	if (gpu->devfreq.idle_freq) {
>   		gpu->devfreq.idle_freq = *freq;
> +		dev_pm_opp_put(opp);
>   		return 0;
>   	}
>   
> 

Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>

-Akhil
