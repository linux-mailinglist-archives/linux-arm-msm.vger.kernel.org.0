Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9932B1EB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 16:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgKMPaP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 10:30:15 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:37288 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgKMPaP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 10:30:15 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605281414; h=In-Reply-To: Content-Transfer-Encoding:
 Content-Type: MIME-Version: References: Message-ID: Subject: Cc: To:
 From: Date: Sender; bh=nDk50TXEgsLL4aVwI48GMSE/ZkJsBvYxBRxqXrym8CI=; b=apKnv5L6S4G7zCf1vWykNrBio226m91euSpOiAys4owv+OVdTPn4XciCLbYrmwiS43EDC6L0
 C9iS3u3C0EZij6MyuQhduywmfHoETr4VhAzcDBbQy5nPHko9WAVTE+NP4kV63LTq5DinsDfP
 n2i44Jcqh9H39L9f8Lw6F5/GCIY=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5faea683e9dd187f5372f1a3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Nov 2020 15:30:11
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9C86CC433CB; Fri, 13 Nov 2020 15:30:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CF8A5C433CB;
        Fri, 13 Nov 2020 15:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CF8A5C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Fri, 13 Nov 2020 08:30:06 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 06/40] drm/msm/adreno/a6xx_gpu: Staticise
 local function 'a6xx_idle'
Message-ID: <20201113153006.GD2661@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
        freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-7-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201113134938.4004947-7-lee.jones@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 13, 2020 at 01:49:04PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c:33:6: warning: no previous prototype for ‘a6xx_idle’ [-Wmissing-prototypes]
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index fcb0aabbc9852..03c2f7e0c9497 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -30,7 +30,7 @@ static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
>  		A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT);
>  }
>  
> -bool a6xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> +static bool a6xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  {
>  	/* wait for CP to drain ringbuffer: */
>  	if (!adreno_idle(gpu, ring))
> -- 
> 2.25.1
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
