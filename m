Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F123F7FC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 03:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235809AbhHZBWj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 21:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235172AbhHZBWj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 21:22:39 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E50C061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 18:21:52 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id o185so2050368oih.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 18:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=6nXlei/Gzl2kgJrjUypJPJMbLWWtXj8x5vv2RmtYCFk=;
        b=Fl2zoS01SxGzy75oar1XNbzccL+NIMw8VXIazGxrv9mtTk3t4A/gX5nocJDAK3e4ym
         2pJb0fRgXs3r/GgRnsO6IFoFzOoWgEeImeTfwI2gd+1179p6Qf16ndE5pC9YsWH29gW2
         /n2x2Y+ste2OcTlK787bUn/Hyv9BIubrPaq7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=6nXlei/Gzl2kgJrjUypJPJMbLWWtXj8x5vv2RmtYCFk=;
        b=M+qNBrm87haLh8lQLeGHrWpFpj0/4CC8nCup21Y5cv5zx5WNTZtuIVkSBj7DOb3Y+C
         3tNEdc8MA+wpVzdIquEgUNJEGQVtarK35jLFceeoSfLbyH+0tb2wkKCQA8GFxDBcWkJ1
         5H4xKattkPIvksTpZpSlOmXEHTTxmXhLqV112umJHRgf4zfY2u9g+VYJZHPA4OFstrY/
         yiTS2orKXza+fCM+WnCDFUx6R9lSBawlpFAG3ZQ7z1rWYDQwe7hGFluKWDmgxraSz9B1
         CCRvTH6BMEs0viT+eMwomWB2x8lPjblxri1CIKanW0gGqbTnC20PpvMY2gzx067o+Lvh
         mLjg==
X-Gm-Message-State: AOAM531v15RjVeF5f8kWpInCHuTU4kw+mcWa5SKnMXNGGeqT3ze3VxGY
        alHBEGc1yj2R5fQ9qzUoRajkI7d14yathVLh7ajjJg==
X-Google-Smtp-Source: ABdhPJz1PrTQ46AFZgnsHo3RwaOgObBPJwNmVa81VCkWSx1FhF7a08m5xnynvSJw6aQm8FOE9v9zVAEx6nn1AokhkX4=
X-Received: by 2002:a05:6808:181a:: with SMTP id bh26mr9465358oib.166.1629940912164;
 Wed, 25 Aug 2021 18:21:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 01:21:51 +0000
MIME-Version: 1.0
In-Reply-To: <20210825222557.1499104-5-bjorn.andersson@linaro.org>
References: <20210825222557.1499104-1-bjorn.andersson@linaro.org> <20210825222557.1499104-5-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 26 Aug 2021 01:21:51 +0000
Message-ID: <CAE-0n53EySs6UbKrcE1x1n0S22CtzneRm4fx328UzMDy5eHADA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/msm/dp: Store each subblock in the io region
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-08-25 15:25:56)
> Not all platforms has DP_P0 at offset 0x1000 from the beginning of the
> DP block. So split the dss_io_data memory region into a set of
> sub-regions, to make it possible in the next patch to specify each of
> the sub-regions individually.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

One nit below:

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index dc62e70b1640..a95b05dbb11c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -25,9 +25,16 @@ enum dp_pm_type {
>         DP_MAX_PM
>  };
>
> -struct dss_io_data {
> -       size_t len;
> +struct dss_io_region {
>         void __iomem *base;
> +       size_t len;

It flip flops here. Would be nice to the diff if len was where it really
wanted to be.

> +};
> +
> +struct dss_io_data {
> +       struct dss_io_region ahb;
> +       struct dss_io_region aux;
> +       struct dss_io_region link;
> +       struct dss_io_region p0;
>  };
