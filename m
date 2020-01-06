Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D92A4131872
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 20:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgAFTPC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 14:15:02 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44099 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgAFTPC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 14:15:02 -0500
Received: by mail-pl1-f195.google.com with SMTP id az3so22180163plb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 11:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GFwzTDfVSEsQlAMMcJbbQMcZerRfZ61wXIEvCkNUZdQ=;
        b=s9VOlBQnwNsApUHOQQ2PUWXHKhgrwqrmhv8WBjlrxXSF27zy+XeWF/hA6zXnaatq0l
         EVDNxLaF77qE9ebp+sEHfaS2d3stCllbQouOS8kipKrzF+/8iS2kFvsNodIiujx7Y3aC
         yZK5gq0y5gtU5NA6PdJ6IM4YDylADfIzFCNmjPU8IGzyzndZhP1OBF+Sk5Vsm50KHwfz
         Yjv9yIKAUl3tsnTB5FPV9EmFZR7cYeoZZhChIWReipv8C5/c3Ido6yZKa1xH3q+Y1fqM
         Ewao0SzZ3Iy1XQw+t7y+5UlkZLf9dB8ZamsB+eh4To0t1SbVWIwVS4REjkxXbwO01/Hc
         fGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GFwzTDfVSEsQlAMMcJbbQMcZerRfZ61wXIEvCkNUZdQ=;
        b=RubasqWaTUTT2ACd+59CFeLs3wgMTcbwX2zT3pgn6ToRk3wMznZAe/LnekmMK3RDe3
         VHCEmHR17civBNJA33lyM+yWEsg0Aa4k4B7Q2gKcuLSRTM6k1X8W+E/DDGJHqTT4KtOx
         tqa0lv/wpum9+/ERuhRzluXzwBJq/F0LOjQYLUkHoM9oAiOkMPXNB9dVX/qXFlCxLWk2
         uniO5gVQ9IuPjHyKYUqf4239DodO/kXKaBoznaq5G1AT1xAyQP6qoZSFtB2/gN5/49uL
         J/vTfaYd8FZkjqUfBH60nuNs+Y6XnhX4yFECQ9xR48xvdcb7M45KlP1uhlJlhwosUhiH
         egRA==
X-Gm-Message-State: APjAAAWiRlscTrGUZ2iiuEBNUUTzsG8AtJY3Ck6AUMQuSRFHIvHSYQkT
        DYdxwbB5/xkwln5Bnrt1yEJsxw==
X-Google-Smtp-Source: APXvYqxa4AUZrWKk56M6JY/TJLxdtIqbX+Uo+ysj7McsHKpTpJ2onOc3GwFjpLOQcKAu1t9I6vxC0Q==
X-Received: by 2002:a17:902:b788:: with SMTP id e8mr109469537pls.1.1578338101538;
        Mon, 06 Jan 2020 11:15:01 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i2sm71718552pgi.94.2020.01.06.11.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 11:15:00 -0800 (PST)
Date:   Mon, 6 Jan 2020 11:14:58 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Andy Gross <agross@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Kevin Hilman <khilman@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] power: avs: fix uninitialized error return on
 failed cpr_read_fuse_uV call
Message-ID: <20200106191458.GV3755841@builder>
References: <20200106120558.37758-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106120558.37758-1-colin.king@canonical.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 06 Jan 04:05 PST 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when the call cpr_read_fuse_uV returns an error the value in the
> uninitialized variable ret is returned. Fix this by instread returning the
> error value in the variable uV.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: bf6910abf548 ("power: avs: Add support for CPR (Core Power Reduction)")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/power/avs/qcom-cpr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/power/avs/qcom-cpr.c b/drivers/power/avs/qcom-cpr.c
> index 9247f53550b3..0321729431a5 100644
> --- a/drivers/power/avs/qcom-cpr.c
> +++ b/drivers/power/avs/qcom-cpr.c
> @@ -922,7 +922,7 @@ static int cpr_fuse_corner_init(struct cpr_drv *drv)
>  		uV = cpr_read_fuse_uV(desc, fdata, fuses->init_voltage,
>  				      step_volt, drv);
>  		if (uV < 0)
> -			return ret;
> +			return uV;
>  
>  		fuse->min_uV = fdata->min_uV;
>  		fuse->max_uV = fdata->max_uV;
> -- 
> 2.24.0
> 
