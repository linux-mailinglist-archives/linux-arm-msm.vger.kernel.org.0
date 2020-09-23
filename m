Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 807F9275B24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 17:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgIWPGe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 11:06:34 -0400
Received: from z5.mailgun.us ([104.130.96.5]:16483 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726156AbgIWPGe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 11:06:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600873594; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=IaimSPUJbwscieRTas1qOVe4R5tD4hrlB8skTNUaUyU=; b=Sl7P/LWdddVkGjTW98/cdQlWL8zCKlJwwSNNeNOyFQeM7tuULIxjTC5HBOxum188FDwB7Wo0
 NwH2ZlN9V9WY+boZsz8+7iYLiauchjSvXh5EA/+lS9bdaNO/HMDk+ozwdnuwqpFi5TE6DuS3
 ETES+iC3F38cvT7noJBBKDgkHH8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f6b6470429250c1dd98e7fd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Sep 2020 15:06:24
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 26293C43382; Wed, 23 Sep 2020 15:06:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3AD2AC433C8;
        Wed, 23 Sep 2020 15:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3AD2AC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 23 Sep 2020 09:06:19 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Zhenzhong Duan <zhenzhong.duan@gmail.com>
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, smasetty@codeaurora.org,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Markus.Elfring@web.de
Subject: Re: [PATCH v2] drm/msm/a6xx: Fix a size determination in
 a6xx_get_indexed_registers()
Message-ID: <20200923150618.GE31425@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Zhenzhong Duan <zhenzhong.duan@gmail.com>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, smasetty@codeaurora.org,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Markus.Elfring@web.de
References: <20200914022949.129-1-zhenzhong.duan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914022949.129-1-zhenzhong.duan@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 14, 2020 at 10:29:49AM +0800, Zhenzhong Duan wrote:
> It's allocating an array of a6xx_gpu_state_obj structure rather than
> its pointers.
> 
> Fixes: d6852b4b2d01 ("drm/msm/a6xx: Track and manage a6xx state memory")
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@gmail.com>

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> v2: Update commit message per Markus, thanks
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index b12f5b4..e9ede19 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -875,7 +875,7 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
>  	int i;
>  
>  	a6xx_state->indexed_regs = state_kcalloc(a6xx_state, count,
> -		sizeof(a6xx_state->indexed_regs));
> +		sizeof(*a6xx_state->indexed_regs));
>  	if (!a6xx_state->indexed_regs)
>  		return;
>  
> -- 
> 1.8.3.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
