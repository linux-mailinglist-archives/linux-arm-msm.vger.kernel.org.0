Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3327333B26D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 13:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhCOMWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 08:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbhCOMWC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 08:22:02 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C20C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 05:22:02 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id ci14so65662159ejc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 05:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=68jlXxwTfNA20UssG/iOwv7H5x/KNjvMb7lpLxpsr3I=;
        b=yPJ9K0uCd7YGDEC+SW1zRnYgaV/ijooR+XEo2KF+DFUyskFZKPUPdupNDM1Bzmc5rQ
         TtZpoymKCPamfltgDPQxthzkNZAE2qzehzZ2i2V6Cd9dM2ZKH6NqCN3hiM6tljCNl1fU
         gkXSxSKbYCbmdKCB/RXQVP8VxFWWip56KDiq+t8B2hH0/3k/jqHAarwhuAH5DG4UQSZN
         t0YhY5h0cPCKBmQe9zy/rs6Poz+lMk8wKyhOpjT5mA8T6kYuPCUMkyUrqLiwd588bsR6
         9E58gCUZoI+2Nd78ZYNpRPgTV58Zi/zC/J863ffmLXeqQYu1FDchlegQf4BE4R1t+OAj
         e+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=68jlXxwTfNA20UssG/iOwv7H5x/KNjvMb7lpLxpsr3I=;
        b=QdxcTP83Z4Sh6Prw8iaMMlH0iv0+lzqlaGgx9gG13lIt0RhZzUdZhTM6JX0SoAmqcJ
         d/tNlHNT6lWvnOEd4KHLmstFQof8CxkE5EEeKWMtgpC3PtzJAMbmnD/CQ5MpALsrL+dI
         u17cyI8mHYkCZ64lQ5TmVKtRci1a1PC9zsbRl7q0CABXGSWjJGPqi3J3c5MrpEzD+FSs
         UUK5L9OANkOozf8fkS1LT3stOj7ptEFeyWLa2pAZTr2YhvhtAhmaTG/PvN2s0LKNERAK
         BiV+WmLysmYosdw14MvdfHG37yzBydrzBiR3rA9DIYFejZm/mOpywwlxvJ3gNx/A7AJF
         mnAg==
X-Gm-Message-State: AOAM530s3bIZOcfkLlMsEkTT8VBpXinTNnAy9PGBogiGG1MjX3JEMq7S
        X9RlBUhAtYa40mBKyeB8VIZgLQ==
X-Google-Smtp-Source: ABdhPJyOEJdU7zKKbglgyC3DnGahjOi0AdhGWWGjA6h4Bp8+9nk2Nlz0nQcAh6QvJyPGbwi3KZ/SCA==
X-Received: by 2002:a17:906:789:: with SMTP id l9mr22968222ejc.161.1615810920902;
        Mon, 15 Mar 2021 05:22:00 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id z17sm7270134eju.27.2021.03.15.05.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 05:22:00 -0700 (PDT)
Date:   Mon, 15 Mar 2021 12:21:58 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Obeida Shamoun <oshmoun100@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: qcom-wled: Use sink_addr for sync toggle
Message-ID: <20210315122158.ptqi6xvngf6ihjum@maple.lan>
References: <20210314101110.48024-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210314101110.48024-1-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Mar 14, 2021 at 11:11:10AM +0100, Marijn Suijten wrote:
> From: Obeida Shamoun <oshmoun100@googlemail.com>
> 
> WLED3_SINK_REG_SYNC is, as the name implies, a sink register offset.
> Therefore, use the sink address as base instead of the ctrl address.
> 
> This fixes the sync toggle on wled4, which can be observed by the fact
> that adjusting brightness now works.
> 
> It has no effect on wled3 because sink and ctrl base addresses are the
> same.  This allows adjusting the brightness without having to disable
> then reenable the module.
> 
> Signed-off-by: Obeida Shamoun <oshmoun100@googlemail.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

LGTM, although an acked-by from Kiran would be nice to have:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  drivers/video/backlight/qcom-wled.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 091f07e7c145..fc8b443d10fd 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -336,13 +336,13 @@ static int wled3_sync_toggle(struct wled *wled)
>  	unsigned int mask = GENMASK(wled->max_string_count - 1, 0);
>  
>  	rc = regmap_update_bits(wled->regmap,
> -				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
> +				wled->sink_addr + WLED3_SINK_REG_SYNC,
>  				mask, mask);
>  	if (rc < 0)
>  		return rc;
>  
>  	rc = regmap_update_bits(wled->regmap,
> -				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
> +				wled->sink_addr + WLED3_SINK_REG_SYNC,
>  				mask, WLED3_SINK_REG_SYNC_CLEAR);
>  
>  	return rc;
> -- 
> 2.30.2
> 
