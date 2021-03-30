Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA5534DF74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 05:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbhC3Dge (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 23:36:34 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:39434 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbhC3DgN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 23:36:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617075373; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=HnegzL6kgP1wk+tB6MY3REkS8nPIox6nxJ1CKMh4WkE=; b=h14EsbVcblt911A8t6qn6QsHSFFcO21afVZKW5zmkDJNHsAJbIivbngrmKvT7tg2t/NcJReI
 4NpCoGIrTqLQOtlZZ7az4QyFctNFrfJ2fufiNVqiT25E84T2LPnjpi/xxmeBWwsntRjf7bY0
 MCamO2kvqwtNU+VsDIzPQv3Spz8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60629cac0a4a07ffda96b196 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 03:36:12
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A4034C43464; Tue, 30 Mar 2021 03:36:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.105] (unknown [117.211.32.186])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2EFF5C433CA;
        Tue, 30 Mar 2021 03:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2EFF5C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH] drm/msm: Fix removal of valid error case when checking
 speed_bin
To:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>
References: <20210330013408.2532048-1-john.stultz@linaro.org>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <06292101-9233-83df-942d-d49a4e53fc3e@codeaurora.org>
Date:   Tue, 30 Mar 2021 09:06:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210330013408.2532048-1-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/30/2021 7:04 AM, John Stultz wrote:
> Commit 7bf168c8fe8c  ("drm/msm: Fix speed-bin support not to
> access outside valid memory"), reworked the nvmem reading of
> "speed_bin", but in doing so dropped handling of the -ENOENT
> case which was previously documented as "fine".
> 
> That change resulted in the db845c board display to fail to
> start, with the following error:
> 
> adreno 5000000.gpu: [drm:a6xx_gpu_init] *ERROR* failed to read speed-bin (-2). Some OPPs may not be supported by hardware
> 
> Thus, this patch simply re-adds the ENOENT handling so the lack
> of the speed_bin entry isn't fatal for display, and gets things
> working on db845c.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: YongQin Liu <yongqin.liu@linaro.org>
> Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> Fixes: 7bf168c8fe8c  ("drm/msm: Fix speed-bin support not to access outside valid memory")
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 690409ca8a186..cb2df8736ca85 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1406,7 +1406,13 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
>   	int ret;
>   
>   	ret = nvmem_cell_read_u16(dev, "speed_bin", &speedbin);
> -	if (ret) {
> +	/*
> +	 * -ENOENT means that the platform doesn't support speedbin which is
> +	 * fine
> +	 */
> +	if (ret == -ENOENT) {
> +		return 0;
> +	} else if (ret) {
>   		DRM_DEV_ERROR(dev,
>   			      "failed to read speed-bin (%d). Some OPPs may not be supported by hardware",
>   			      ret);
> 

Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>

This looks "fine" to me. ;)

-Akhil.
