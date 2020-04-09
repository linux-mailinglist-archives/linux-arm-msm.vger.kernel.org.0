Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 732B51A3C1C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 23:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgDIVrg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 17:47:36 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35610 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgDIVrf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 17:47:35 -0400
Received: by mail-pl1-f194.google.com with SMTP id c12so4335322plz.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2020 14:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lPCa+kwYaSTiQed9UmMr59x22XsKDt6YMkuWg/hzKmw=;
        b=eOnlc6tiiPSQvYszeyVQ4n4SzBfHcYu40t0qYtRtDrBWYFlUZg6bbIAYR/nQkPMaYK
         MSQ8kj1bixUBOJMQH92dTYMfKBBQkHlBEKI4pSbEMGXWjcLfeIiS/5m0y/t4fKzl0n69
         1Wwe4LAlIXVamGBdfe4LeI0IlNRhEx1XLjdDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lPCa+kwYaSTiQed9UmMr59x22XsKDt6YMkuWg/hzKmw=;
        b=H/GAZl0TbdCTHPK10dM3r1n1omq0LmMPGV6jPgMmpnzgQmy8MYGta13gjIkU0L94l1
         3NIol9eI979tMV9idavWZmFwlLTQsQV3dSqbzCL+PsVfcqzfLlahUw9Tu/2fDx9fFdJC
         cfn5CSpHyDO30C+fO7Nfo6JbGqTdWpnZn0onIrsMLx86A6lnc2ZYP3cNKeMwGmvma1NF
         Q8sysgeDtLLlBiOVn+5ZH9sJPefIdmHFivpYLFFt9Z59RgeTO9x8GiOvwKVIT4VlF6Qv
         hWPmcJ6U82tSGAzSs/CYo90PMi2OZZ+66W3Lt5+iUe44JrUKJuaFiEVZ7r9HyljtKU3a
         qbpQ==
X-Gm-Message-State: AGi0PuaqpDdy8h8b7rozoUwTyeplWMA3KmBjoXoU5UQGTl6dyFUkyReH
        kKMbVjhgJOfsqqWKRKvIfE491A==
X-Google-Smtp-Source: APiQypLlzrkprPFi5xjYKzsE8uROImMIRdIrgjfjkMD9eE0dGcKdBuaRZ1ScOKTSsUVHyNQD+ecxPQ==
X-Received: by 2002:a17:90a:9742:: with SMTP id i2mr1744697pjw.194.1586468855475;
        Thu, 09 Apr 2020 14:47:35 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id a1sm46284pfl.188.2020.04.09.14.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 14:47:34 -0700 (PDT)
Date:   Thu, 9 Apr 2020 14:47:34 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>
Subject: Re: [PATCH 1/7] venus: core: Add missing mutex destroy
Message-ID: <20200409214734.GV199755@google.com>
References: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
 <20200408213330.27665-2-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200408213330.27665-2-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stanimir,

On Thu, Apr 09, 2020 at 12:33:24AM +0300, Stanimir Varbanov wrote:
> This adds missing mutex_destroy in remove method of venus core driver.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 4395cb96fb04..f8b9a732bc65 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -335,6 +335,7 @@ static int venus_remove(struct platform_device *pdev)
>  
>  	v4l2_device_unregister(&core->v4l2_dev);
>  	mutex_destroy(&core->pm_lock);
> +	mutex_destroy(&core->lock);
>  
>  	return ret;
>  }

On which tree is this series based? From the context it seems that the
tree includes the patch "venus: vdec: Use pmruntime autosuspend"
(https://lore.kernel.org/patchwork/patch/1187829/), however I can not
find this patch in any of the branches of your git tree
(https://git.linuxtv.org/svarbanov/media_tree.git/)

Am I looking in the wrong place?
