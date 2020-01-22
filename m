Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3C1A144902
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 01:39:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgAVAjk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 19:39:40 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38652 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728665AbgAVAjg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 19:39:36 -0500
Received: by mail-pg1-f193.google.com with SMTP id a33so2459237pgm.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 16:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SZpsgyfgTg+rpsMj6itxLgYi2Mi1dgKH1+oFAHOSpN0=;
        b=NB2RKMZ732XQsFQzHnptmiW/oQQJiXyVAjkEF036D2HE3q2YoBbmXEgYZzaGw+929X
         2G3IGNXCqyCJSaKhFRl6T1hSSMtaMMR92nET1Q+81VUvLfg5cocDznowLKLoCv1ccSYa
         /G/1JLcEfeEmMFFXVyWT1i/qUs/jjo1/nUE8EFldsZAltWDW7NZKjW5RgtWGDQ2WBS6F
         28Qu7gE6FEgGwPmZRbTuA3i1Kh9KzpFZVc8E2DqP/+rWFNozXZ1K3GxLu5izOQItNkBY
         PpGn4PSUL4xDq6Do9KPt/QAPC2G/7+aLE35bi9+lGyTwVZTS8lfdakpulElBh3L8GLM9
         d2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SZpsgyfgTg+rpsMj6itxLgYi2Mi1dgKH1+oFAHOSpN0=;
        b=PJ4usDbDXRidw8je1ZHE0s1NZdG+q/k0Uk+7vhK33/TZYIoj8lN00TGGkqpCqpQoiH
         OPFiOeeXAd9S79UsuZYLoYlZxz3UWp7Fzy9qkvJ57HsK4uO7+UW/WbgVCaoU+uoF+lqd
         HHTNtnUs4Sf/fTPmvunRWh8/1toB9GaicYlE0u6svvGncOyUIk/UzlcA0aSeWORXTl+F
         tu/D1kM3jAl0ZBDR71Lac+ut6gpCvt5OOAV+eLMtlWTCulzkI5+FTU93uUuNwxC168Uo
         lzPU9uJxA81xGTSMOo7dBwK1neKmQz/9Kv11JEKU9w3LOw3lyZe3+eb7+sJxrvR4tGCW
         X+fg==
X-Gm-Message-State: APjAAAWwdc5vxs3+4khrzy7E4APGWB6YFgwKfZV3uJv7FRMTpDVhlwwK
        nUufBdFdE2CnaeQ4LdwyGaQR7A==
X-Google-Smtp-Source: APXvYqwkN7biw9CpP0gW6qNJiifMwMv8JHW7EU+oQ5nGJ68k+VE9SDpQSxt9ZMLwqEZrqnOdhWikiQ==
X-Received: by 2002:a65:48cb:: with SMTP id o11mr8418173pgs.313.1579653575886;
        Tue, 21 Jan 2020 16:39:35 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o19sm736501pjr.2.2020.01.21.16.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 16:39:35 -0800 (PST)
Date:   Tue, 21 Jan 2020 16:39:32 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Chen Zhou <chenzhou10@huawei.com>
Cc:     agross@kernel.org, lee.jones@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, kgunda@codeaurora.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] backlight: qcom-wled: fix unsigned comparison to
 zero
Message-ID: <20200122003932.GA3948@builder>
References: <20200120130143.35363-1-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120130143.35363-1-chenzhou10@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 20 Jan 05:01 PST 2020, Chen Zhou wrote:

> Fixes coccicheck warning:
> ./drivers/video/backlight/qcom-wled.c:1104:5-15:
> 	WARNING: Unsigned expression compared with zero: string_len > 0
> 
> The unsigned variable string_len is assigned a return value from the call
> to wled_configure, which may return negative error code.
> 

Afaict string_len is the return value of
of_property_count_elems_of_size(), rather than wled_configure(). (And
please append () to function names to make it even more obvious)

Except for that your patch looks good, so please update the commit
message and add my Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
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
