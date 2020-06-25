Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48C1A209C36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 11:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390584AbgFYJqR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 05:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389692AbgFYJqQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 05:46:16 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013B9C0613ED
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 02:46:16 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 22so4908235wmg.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 02:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vxl/tdv9kpWIOuN2YYNY6bKce9KEtpxUCz4B4fhlwMs=;
        b=E0CHlPpOfBqGZD74u+uo1w2hr2b1CGencolNHf1PknVTcOxLfkAyK0NwwnxeXTXuU0
         erbhuiFNXLPZwf1SAvTRASh2mqXkZ6aTB0SJCg80WaNjT0ezOSXNsgviYZTjcM8OEWmi
         sZi2QRcp/wO3FZSK3XqSW0FOB/fkmUZFzoG1824UAes7Ig//VM0qw6HVxGoqQNFcX3iS
         jd+jf4R1MrEAS00a7umB5+6Hy5isDM2yy7brQkbH8HIect9U6iorDx0D1413r8gJC0+n
         m+MUBrJP00jUMujNhu4sivLcL4lh/QUbL+cj4zhkfaAN0qF93X6bLZzJZmR7ZsS154gf
         Ov9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vxl/tdv9kpWIOuN2YYNY6bKce9KEtpxUCz4B4fhlwMs=;
        b=X0HDmcnd7jI83yiyhHL3TStF0eSJy3VdE35eKocLEGUYCqp4ZPMF7LECu7TVLsLHMj
         e+iBWAsCkCPVLaDQeTKpMnir3azuyqIeHkUBUxPbyyQ9OD4N6xnCl4NM0ZPu14IyTNlz
         VV02Cs7KQnlVYn8mVU86xErTRENlfX5VS7HpRY2ZCN5+GUhGZk5FUN/L4bM1x4eU7bAA
         ub/g2c6rHPjFx4jbaOcyXGr6cEuJ+s5FTAPO2GN/lE0zJiESlR36FeROdswLa/lvN2XL
         Xny6IDAK7WZ1n4S4n1Vo/i7N+CEDNYAVUm8NqkShEMHwuQZKakM513oOKkaqX8RssC4n
         j01g==
X-Gm-Message-State: AOAM533dILUu0q6FlRxQEA1agvs9KIsKbfDWlap1kJhgSEfhG/t9bYc0
        r/7bqGHCwASAcbdRVChaDHtmeg==
X-Google-Smtp-Source: ABdhPJyJPSUnMWkYym/l/M3quKvkj6eev/Am+p1MkAozrU5ybki4gZEqiO8/NowLH+fVWnbtW2vWew==
X-Received: by 2002:a1c:a557:: with SMTP id o84mr2445278wme.42.1593078374694;
        Thu, 25 Jun 2020 02:46:14 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id w2sm19962496wrs.77.2020.06.25.02.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 02:46:14 -0700 (PDT)
Date:   Thu, 25 Jun 2020 10:46:12 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 8/8] backlight: qcom-wled: Remove unused configs for LED3
 and LED4
Message-ID: <20200625094612.fn3o5bd37t7vadsc@holly.lan>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-9-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200624145721.2590327-9-lee.jones@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 24, 2020 at 03:57:21PM +0100, Lee Jones wrote:
> Fixes W=1 warnings:
> 
>  drivers/video/backlight/qcom-wled.c:1294:34: warning: ‘wled4_string_cfg’ defined but not used [-Wunused-const-variable=]
>  1294 | static const struct wled_var_cfg wled4_string_cfg = {
>  | ^~~~~~~~~~~~~~~~
>  drivers/video/backlight/qcom-wled.c:1290:34: warning: ‘wled3_string_cfg’ defined but not used [-Wunused-const-variable=]
>  1290 | static const struct wled_var_cfg wled3_string_cfg = {
>  | ^~~~~~~~~~~~~~~~
> 
> Cc: <stable@vger.kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/qcom-wled.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 4c8c34b994414..c25c31199952c 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1287,14 +1287,6 @@ static const struct wled_var_cfg wled4_string_i_limit_cfg = {
>  	.size = ARRAY_SIZE(wled4_string_i_limit_values),
>  };
>  
> -static const struct wled_var_cfg wled3_string_cfg = {
> -	.size = 8,
> -};
> -
> -static const struct wled_var_cfg wled4_string_cfg = {
> -	.size = 16,
> -};
> -
>  static const struct wled_var_cfg wled5_mod_sel_cfg = {
>  	.size = 2,
>  };
> -- 
> 2.25.1
> 
