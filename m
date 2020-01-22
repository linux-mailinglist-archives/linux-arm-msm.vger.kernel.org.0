Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8151314532B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 11:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgAVKzr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 05:55:47 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36331 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729108AbgAVKzo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 05:55:44 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so6674423wma.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 02:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yy5Pm6Chzs3nZ800EbMSsW7jSH1HwjtkYzsQKIFnm8w=;
        b=rocHCsiCeMC1gpXVMEd5t5GK6MZu9gxeI/GUSwU8+8FCQI16R2LHI3G4MWOh1lr3g3
         i1wiLGTmuLwe05mlGIErWGWzGoqLVAABV3NaILq2JqpGu7mjVMG0VWhHTkzHQYAGnHNW
         w5UKpjmG4Gd1NbGZRzJrNdIP/C0xnSuRunOmteVNAKpUcHu5mklqKMhQn+wY5GlzLYaj
         zeQwQ2vkEOUjwaMVA0Tjz2cECH5crF8FweVqeBt52Eur64fEAaeJKGW7XhCjUe0/IUTI
         B/X/CNzrO1eWv0TSaH0s7OQ+Zv9Ob8TeRHde5yOBtBPlR1dWivNW/PIeEIc/nhgezLE8
         ju5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yy5Pm6Chzs3nZ800EbMSsW7jSH1HwjtkYzsQKIFnm8w=;
        b=pD9uTkvKmLKCmd602XWjUW2isHBigV/JIoMGaNnwTwkPH8bIyHC5XXgR9QtEE4nNJ8
         jNUEnuGRIaT8i7gN9GPVz8d02rc7J1qqRNQYg7uCPJm4BCJi5XVn5pBz1e0ag2lN1nzw
         4YSzW/YhBy72JZUeKL24fPq8Hbu8q+CZvRMiryBWyAliLPVkGj+ALNzkKdxyVeCTFYin
         V6UQJl++026/NWTrcbiOQ3vDkgtUTlVpaQfApb7fNG6nTP4g0uQcazh4WVGFMkJICKdl
         m4K7iHPLmLxpqsrnIwptsW4OnJB09p9vNb3KDV25orvhMubqIN72QbTbfkheuldOFLcb
         /Bvw==
X-Gm-Message-State: APjAAAWnx8hVDjpi4/t+Cx4hkLPv9sBae9gWFF4ubNHYMMxmX974erHw
        8KoJnl3ZOl/kK5XM2FN1rZ6EQQ==
X-Google-Smtp-Source: APXvYqzNbQ3MeYMpzTRW08neyXYjeyY3mAyF76V58Qsal/cqNuXZMYb5EXT6tBXSUfJrJImtvdHofw==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr2227038wmi.146.1579690542801;
        Wed, 22 Jan 2020 02:55:42 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id z133sm1370588wmb.7.2020.01.22.02.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 02:55:42 -0800 (PST)
Date:   Wed, 22 Jan 2020 10:55:40 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Chen Zhou <chenzhou10@huawei.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        lee.jones@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, kgunda@codeaurora.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v2] backlight: qcom-wled: fix unsigned comparison
 to zero
Message-ID: <20200122105540.w5vrvs34zxmhkjae@holly.lan>
References: <20200122013240.132861-1-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122013240.132861-1-chenzhou10@huawei.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 22, 2020 at 09:32:40AM +0800, Chen Zhou wrote:
> Fixes coccicheck warning:
> ./drivers/video/backlight/qcom-wled.c:1104:5-15:
> 	WARNING: Unsigned expression compared with zero: string_len > 0
> 
> The unsigned variable string_len is assigned a return value from the call
> to of_property_count_elems_of_size(), which may return negative error code.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
> 
> changes in v2:
> - fix commit message description.
> 
> ---
>  drivers/video/backlight/qcom-wled.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index d46052d..3d276b3 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -956,8 +956,8 @@ static int wled_configure(struct wled *wled, int version)
>  	struct wled_config *cfg = &wled->cfg;
>  	struct device *dev = wled->dev;
>  	const __be32 *prop_addr;
> -	u32 size, val, c, string_len;
> -	int rc, i, j;
> +	u32 size, val, c;
> +	int rc, i, j, string_len;
>  
>  	const struct wled_u32_opts *u32_opts = NULL;
>  	const struct wled_u32_opts wled3_opts[] = {
> -- 
> 2.7.4
> 
