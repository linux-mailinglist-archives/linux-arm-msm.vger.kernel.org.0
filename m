Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2D736D0A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 04:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237111AbhD1Csp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 22:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235839AbhD1Cso (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 22:48:44 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9ADBC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Apr 2021 19:48:00 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id i20-20020a4a8d940000b02901bc71746525so13528598ook.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Apr 2021 19:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OmH6bqqM9Umuziq/ASGMVuY66RM06TYhOzF6GFYglyE=;
        b=hsiFE+d3VwiSdA4Fpn5p9aAjePnWVILHTooTxE9/ag0yiLWn1uGXIfCc77N4U5ozhM
         QRqIYR6TmGbz1AZCM222ECbkDxoUoA2O0o7j7qhldt0GQ6Hl6rEMSnJPTnnXsElcSw6/
         e5JWuBo2aK3u/MYl5fkZdaOpbbAQn+Iy0s0+knVCOWj2kbIhOj/V/weM5X0OByI/YS/T
         H4h8G5ljkdeLW1coWI1SsxeiXh6E9MQP+KXtHOOrucFi0rfSRauCpLjy/mItshkdd4tk
         7oRBLUPL03HAXXmxHFPKJyI6MIHmeoTfREsMEZKA8KrdJs3nkJnAgZBEPjrgajz2zkEQ
         rSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OmH6bqqM9Umuziq/ASGMVuY66RM06TYhOzF6GFYglyE=;
        b=Wi1Ya3KqnerAZxhEJFplPhv68oJaRr3kzRLSDOqRsgE0X3varfoZUYCUVCi2iRZCz3
         bhGZe2WLw9UFqTKvfYPHZ8r8V/l1YcbDYhCG3kMWUzJtn647ezPMg9pH8JuyVu0EErHa
         8Vz5Bk9Xa5B4vuGDuX31enjvl+ZPuNT0Em7ADuTy/7Omhc8SRKtSUOWF+dD2HHx1aysP
         3d5pvuy+PenhqWnYUmPtl9bma9AKvfr+vPzlx/9o2U47KHZhBQSwW4NQGcu8d5GzvFlD
         MG0gpm9YPrF2heHWZTEEBRNiUJNaZgWZysTdCo5drb3pM5N5WX1HF0qx3v0heN3pPzTC
         0CVQ==
X-Gm-Message-State: AOAM533UKtUGJlIECgqB/wQQbEhnOG+W8sUhDeuG2sHyW3QJ0cwsOpFO
        vbZxm76F1yuCFjVOJbuZUxeVCg==
X-Google-Smtp-Source: ABdhPJw+BDAPF5Ijg4kePS4aeXTm2iPsm7UphTIEXAEh45YVZHv1ZCNpir+NJS07PNWd1uZVngGUJg==
X-Received: by 2002:a4a:960c:: with SMTP id q12mr20568629ooi.83.1619578078655;
        Tue, 27 Apr 2021 19:47:58 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u1sm431110otj.43.2021.04.27.19.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 19:47:58 -0700 (PDT)
Date:   Tue, 27 Apr 2021 21:47:55 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 3/4] drm/msm: get rid of msm_iomap_size
Message-ID: <20210428024755.GJ1908499@yoga>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 26 Apr 19:18 CDT 2021, Dmitry Baryshkov wrote:
[..]
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 92fe844b517b..be578fc4e54f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -124,7 +124,7 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
>  }
>  
>  static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
> -				  const char *dbgname, bool quiet)
> +				  const char *dbgname, bool quiet, phys_addr_t *psize)

size_t sounds like a better fit for psize...

Regards,
Bjorn
