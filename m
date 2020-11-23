Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52FCD2C177B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 22:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729639AbgKWVOI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 16:14:08 -0500
Received: from z5.mailgun.us ([104.130.96.5]:29451 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728986AbgKWVOI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 16:14:08 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606166048; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fF8sJczCEwJml8nM5LK6JByhLs7eGPmrcAGqvBAOQEg=;
 b=Nsp456aR1ycq+1An5wuL9prkYvH1h35vLi0P0kAW2nBbHcZAHibXVVskpdrLR+xq7Y4RsoxC
 yeyHhzOayugSw543PIjfSwovi2F4foxpUCJjO6Wug9IKyrgVwCVLWkv3yB4GeI62AFYkqqR1
 lZXGJNwBqZ3Tpo+MLqWTpKJ5mvU=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fbc261fe9b7088622c40ac3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:14:07
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E4D36C43464; Mon, 23 Nov 2020 21:14:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 26EE8C43460;
        Mon, 23 Nov 2020 21:14:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 23 Nov 2020 13:14:06 -0800
From:   abhinavk@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 38/40] drm/msm/msm_drv: Make '_msm_ioremap()'
 static
In-Reply-To: <20201123111919.233376-39-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-39-lee.jones@linaro.org>
Message-ID: <7efa1e1dfd1e415d5614a0f8d266b144@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-23 03:19, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/msm_drv.c:124:15: warning: no previous prototype
> for ‘_msm_ioremap’ [-Wmissing-prototypes]
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
> b/drivers/gpu/drm/msm/msm_drv.c
> index 4d58668b80853..edc99e3b0eca7 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -121,8 +121,8 @@ struct clk *msm_clk_get(struct platform_device
> *pdev, const char *name)
>  	return clk;
>  }
> 
> -void __iomem *_msm_ioremap(struct platform_device *pdev, const char 
> *name,
> -			   const char *dbgname, bool quiet)
> +static void __iomem *_msm_ioremap(struct platform_device *pdev, const
> char *name,
> +				  const char *dbgname, bool quiet)
>  {
>  	struct resource *res;
>  	unsigned long size;
