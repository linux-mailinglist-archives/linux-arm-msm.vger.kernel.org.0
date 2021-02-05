Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A079310507
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 07:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbhBEGmM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 01:42:12 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:49260 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231126AbhBEGmJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 01:42:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612507311; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Pq6SFpYB7bZzneOPuiPx50qEYnSet0KQsUNB8GY6yTU=; b=pAN46sm4PDamKcfsw9fe85MN+lA4P0rGpqQhngYobznM0g8GVBuIpZXdRc2Vrf6UK1zOZrxH
 EhrQbMENEs7ptqCQLyqAkhuODXgcCWo3XdYWkjFaNRzBRSn2zqtKrtCg4YKehohs7+Zhv02j
 V31mJfXBdn8ItCme79+3ehLbtQ8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 601ce8900bb8f50fb9918825 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Feb 2021 06:41:20
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 551BAC43462; Fri,  5 Feb 2021 06:41:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.105] (unknown [61.1.238.129])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 59B2AC433CA;
        Fri,  5 Feb 2021 06:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 59B2AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH] drm/msm: Fix legacy relocs path
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Sean Paul <sean@poorly.run>,
        Emil Velikov <emil.velikov@collabora.com>
References: <20210204225650.1284384-1-robdclark@gmail.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <dc2fb87e-67f0-4fa9-c920-515a6609a04d@codeaurora.org>
Date:   Fri, 5 Feb 2021 12:11:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204225650.1284384-1-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/5/2021 4:26 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In moving code around, we ended up using the same pointer to
> copy_from_user() the relocs tables as we used for the cmd table
> entry, which is clearly not right.  This went unnoticed because
> modern mesa on non-ancent kernels does not actually use relocs.
> But this broke ancient mesa on modern kernels.
> 
> Reported-by: Emil Velikov <emil.velikov@collabora.com>
> Fixes: 20224d715a88 ("drm/msm/submit: Move copy_from_user ahead of locking bos")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index d04c349d8112..5480852bdeda 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -198,6 +198,8 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
>   		submit->cmd[i].idx  = submit_cmd.submit_idx;
>   		submit->cmd[i].nr_relocs = submit_cmd.nr_relocs;
>   
> +		userptr = u64_to_user_ptr(submit_cmd.relocs);
> +
>   		sz = array_size(submit_cmd.nr_relocs,
>   				sizeof(struct drm_msm_gem_submit_reloc));
>   		/* check for overflow: */
> 

Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>

-Akhil.
