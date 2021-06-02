Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6903991BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 19:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbhFBReb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 13:34:31 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:45845 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230054AbhFBReb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 13:34:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622655168; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=SVmiorm7TWSt+v+Z1z7VsA4S6rb07Awl149tXn0sKqE=;
 b=lfmIOORxJIwCQhy0t798RYAYTQWi4B2yadFY6GKLZGuxpqqTmPUcxIWp5WHWeICe+m+Ngdtc
 RQTuqHyfhxt/VLD9h43JOiMT8ExSMlU8kid1bhR+K1Uoqc6jx6sZHSgyqRSpnGDH6fcJe+1x
 TK02bDTg22bnSt3EbBTT0FMkTJs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60b7c0afe27c0cc77f6cda1a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Jun 2021 17:32:31
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8218FC4338A; Wed,  2 Jun 2021 17:32:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5267CC433F1;
        Wed,  2 Jun 2021 17:32:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 02 Jun 2021 10:32:24 -0700
From:   abhinavk@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [Freedreno] [RESEND 13/26] drm/msm/dp/dp_catalog: Correctly
 document param 'dp_catalog'
In-Reply-To: <20210602143300.2330146-14-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-14-lee.jones@linaro.org>
Message-ID: <fc09554ced22b0603d7f2e32b6c424f4@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-02 07:32, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Function parameter
> or member 'dp_catalog' not described in 'dp_catalog_aux_reset'
>  drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Excess function
> parameter 'aux' description in 'dp_catalog_aux_reset'
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index f4f53f23e331e..9ba75b994595d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -193,7 +193,7 @@ int dp_catalog_aux_clear_hw_interrupts(struct
> dp_catalog *dp_catalog)
>  /**
>   * dp_catalog_aux_reset() - reset AUX controller
>   *
> - * @aux: DP catalog structure
> + * @dp_catalog: DP catalog structure
>   *
>   * return: void
>   *
