Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D66642220E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 11:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbhJEJWd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 05:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233639AbhJEJWb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 05:22:31 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537E5C061753
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 02:20:41 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so2365454wmq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 02:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7gKDpwbZLaAcnMd5IdgFrDWDVBJ3bkgLfDyEEukPWNE=;
        b=EyEMINozBywEEeiMAn8tEaNJqnso4K/VdIluVrInmf4Z4p+RxZlX6ZeIjbefpWwAr7
         ri2MFbWfElAGCwEs03Vpbi8qMwAYOwL/DiaPID6X3fS0okD9X19kly4G7CUdpL1m3UmR
         iM9ZdkliFcBpWB4v6zDFSlg7MnGvIJGjUe3MBZCFeNPmXtZN6qnyhq+DVCTEuZlDzhhH
         5qiFZFFj6xNwdxFb++jgfGEc3Ro51h6QPZ8ynuEk8nZ15sjlyW7vwh86EZ1OS+Poc3Iw
         XjExL+D1Hn6QHeiCzPfqkoRaXG0hVFxf6U7BiVS97QBdIOjgK9cKu9jsJxClDf/b+Kh7
         elpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7gKDpwbZLaAcnMd5IdgFrDWDVBJ3bkgLfDyEEukPWNE=;
        b=dId0oCr+TKFmWFLzI/ebWoVUWGZO6838VlS3jzfZe57cU7E93C2nHe2YrS5Dqz9E+1
         n6spGL5VkAjPrr36DAyP4VIB4Vw4+llHtxtFRNsvPaMSXqzu/ELEa2PiLUP8yr25wqgv
         kIO7LJhPWhsZUm0++rRwosszL4gnznV4JFxy1m02cPVoqr+OKQc+3nrtGX24RWLN7Z6y
         axWW0QMPxERzuXtyleGM0fKuVE1wj6EAVPvxr1d8iJwFWluYy1tveA6rQTcYtnKzTkTs
         cwTWCLe8XN5/Auft4EErMxlbwacHbAx+DSBN/wVIssYQVvy1SfJN7lHxOWyeXu5uDwsZ
         pTSw==
X-Gm-Message-State: AOAM533fkerqSF51q2ckTLRBXJQ4UVey7sNCQnxEsRRvw6FWYoiqcaRV
        R6i7A7RxDSOHBgOyOINM2MEqMg==
X-Google-Smtp-Source: ABdhPJwFtqDSEPdGNe3pPku5649xK84QFeT9vQH8lgS3MjqmbxQegWN4EDIp3ZNLU69Z5Wu+9B5BIg==
X-Received: by 2002:a7b:cc14:: with SMTP id f20mr2142080wmh.137.1633425639863;
        Tue, 05 Oct 2021 02:20:39 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id d8sm18118248wrv.80.2021.10.05.02.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 02:20:39 -0700 (PDT)
Date:   Tue, 5 Oct 2021 10:20:36 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/10] backlight: qcom-wled: Remove unnecessary 4th
 default string in wled3
Message-ID: <20211005092036.yuttwrjhvnkkhyhr@maple.lan>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-7-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004192741.621870-7-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 04, 2021 at 09:27:37PM +0200, Marijn Suijten wrote:
> The previous commit improves num_strings parsing to not go over the
> maximum of 3 strings for wled3 anymore.  Likewise this default index for
> a hypothetical 4th string is invalid and could access registers that are
> not mapped to the desired purpose.
> Removing this value gets rid of undesired confusion and avoids the
> possibility of accessing registers at this offset even if the 4th array
> element is used by accident.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/qcom-wled.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 66ce77ee3099..9ec1bdd374d2 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -946,7 +946,7 @@ static const struct wled_config wled3_config_defaults = {
>  	.cs_out_en = false,
>  	.ext_gen = false,
>  	.cabc = false,
> -	.enabled_strings = {0, 1, 2, 3},
> +	.enabled_strings = {0, 1, 2},
>  };
>  
>  static int wled4_setup(struct wled *wled)
> -- 
> 2.33.0
> 
