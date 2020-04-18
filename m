Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1D51AF230
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2020 18:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgDRQQC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Apr 2020 12:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726069AbgDRQQB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Apr 2020 12:16:01 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4160C061A0C
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2020 09:15:59 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g6so2744322pgs.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2020 09:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ynPs9yCTFEYeEFPuAm4M1vFpAEJsfkM86gMqu119GEg=;
        b=AEV0Q8nz4bM1mFjWrAqmRb5Uk76KbAox9kQ7IFQwCyOcg4niMOPIZarlOuziLxs9sT
         8eBlbsdiLAuvQaOOsmzd6Rd1IBXUTlnsU8eU+7EPHfuc1k+5NDECbQrewH26RG6Q+rEP
         DorsroP/2q/HaX3wOR3bvW5Icj2qS8Z6O1hCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ynPs9yCTFEYeEFPuAm4M1vFpAEJsfkM86gMqu119GEg=;
        b=lo2RUxJRBJyozq48V6rnxUwmNuPKGaQfP1bif4EykiAD+9OBgbEYqYp7u2X3qwIToI
         x/JwNCys54FJ1EonNIUpbd9UKOIksIS085jXtxnVBvgZq2zZMPX9J9x4BdraLUSg1ANF
         pBV3GzYp4OQszgc5eVe0buTLHTnJ6MHKZ+jIL1E0jsKs6BrRFhwK4av8ki2YqrEPhI1+
         rY/sh3ypuoolhNo91LEche830NSr9CC/Dx63WZX/89ZFr+TRR2f2pZOZ6qrQ5PUiakph
         6ZaUJ5tV3YrJoruXknGMIRrfjkh5zTB4DIc1Z+sS0/TxaZFbPsy54u1kdifKzpWe+H6i
         r8ZQ==
X-Gm-Message-State: AGi0PuaVVMra4KoYq3ngKAr+vpRzAvhaE/OdJfvHqX6uXjbei7/zgINP
        XHhLxRhNZtaIe9vakAfBBk8Gww==
X-Google-Smtp-Source: APiQypLAxdOBnUjU+81Bxrc2gydUAnUtyWqhVEM5QLe5VrX10ZsCZcUUMHZw/dppb11GOcsoMh27YA==
X-Received: by 2002:a65:6704:: with SMTP id u4mr8689747pgf.263.1587226559547;
        Sat, 18 Apr 2020 09:15:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id s129sm9456896pfb.3.2020.04.18.09.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2020 09:15:58 -0700 (PDT)
Date:   Sat, 18 Apr 2020 09:15:57 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, swboyd@chromium.org,
        mkshah@codeaurora.org, Evan Green <evgreen@chromium.org>,
        Srinivas Rao L <lsrao@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: rpmh: Dirt can only make you dirtier, not
 cleaner
Message-ID: <20200418161557.GF199755@google.com>
References: <20200417141531.1.Ia4b74158497213eabad7c3d474c50bfccb3f342e@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200417141531.1.Ia4b74158497213eabad7c3d474c50bfccb3f342e@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 17, 2020 at 02:15:47PM -0700, Douglas Anderson wrote:
> Adding an item into the cache should never be able to make the cache
> cleaner.  Use "|=" rather than "=" to update the dirty flag.
> 
> Fixes: bb7000677a1b ("soc: qcom: rpmh: Update dirty flag only when data changes")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/soc/qcom/rpmh.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index 3abbb08cd6e1..d1626a1328d7 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -151,10 +151,10 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>  		break;
>  	}
>  
> -	ctrlr->dirty = (req->sleep_val != old_sleep_val ||
> -			req->wake_val != old_wake_val) &&
> -			req->sleep_val != UINT_MAX &&
> -			req->wake_val != UINT_MAX;
> +	ctrlr->dirty |= (req->sleep_val != old_sleep_val ||
> +			 req->wake_val != old_wake_val) &&
> +			 req->sleep_val != UINT_MAX &&
> +			 req->wake_val != UINT_MAX;
>  
>  unlock:
>  	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
