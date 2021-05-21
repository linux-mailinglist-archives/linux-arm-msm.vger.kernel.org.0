Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBDE838C33D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 11:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236575AbhEUJgT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 05:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235458AbhEUJgS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 05:36:18 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204FAC061763
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 02:34:55 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id z137-20020a1c7e8f0000b02901774f2a7dc4so6495239wmc.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 02:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QS9C9TZP/LIhXh/A86+cA4E2zCqL/pkxZ+dcKq3mb/8=;
        b=fztd89Omuf4opCAx6o67aZ0oeo6vyXKFZdPl6G2tingNdDYrhoEFs3wlaqcHS8uxaO
         pq2mVArFa4w0Q1oJ1RF/YYasVVX/BCOwi1PVIyxxJgClzxKvLc4WPCNxjrvbHHpNTZk1
         kg77USyJYEbHd7Pel+V6NFSnjrZKNrqwcYunKzQl4+fkmfKaVROmmJ2LeZ3qel9BVhIN
         WOQ70lxA1LanxVCRdfj//1bckFAAQelE1Ucj1V2phNeSxFMPGdp0zurtSpaXv/w+lu00
         BEHhygMVoitmv3BXEvS0E7MbEj706n7zcLl7rnSOBAumCdWEjU/oCh0kGjbRyOlAaqCt
         KloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QS9C9TZP/LIhXh/A86+cA4E2zCqL/pkxZ+dcKq3mb/8=;
        b=OgEdn5w5FMQeYYYpV7U+kXahULk0m2XYOI2SObMSfTcrdCCa5aTXRT5cWMuPPAs/B8
         zQPAWCYJuMCjnwxj6wb9v7rTAvd+3sDOcRsDQ8JDviPfOVyyWzUnRTFbexiBaTH49ElW
         ekWx128Yp6C/INbm7cJr5a2G4m7qTVb8w3e9zn5KIAOIMIxkWl0thyAZOJa1aTsxTj3r
         sQIvm4R4KFmGrtsg3yejD/X2QZOoWaR2pLYoCsqwp63VV5GrAOR05waGO222Hy4cR55d
         WWksUoPEGBNhRSjieoEmd8LnnPWA1db3wCK4uGOXayx6tSrZYz9AhV9AaySYLK32hKsj
         qsrg==
X-Gm-Message-State: AOAM533zSSFwIcTCc0hVJj4FxhnuKBsCfiLkNPU4Nx7kn7xZunasZkkx
        URTmeCx+ntjQoAaWT+gOBoLpaw==
X-Google-Smtp-Source: ABdhPJxKLuDkDkJcUdWHYHwuORgC+mlRBwAFwJvqko9NwAyymbpZBtCpoLhIIaAHqoxMYzHgADSoXw==
X-Received: by 2002:a1c:f012:: with SMTP id a18mr7771186wmb.53.1621589693793;
        Fri, 21 May 2021 02:34:53 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id z131sm4993484wmb.30.2021.05.21.02.34.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 02:34:53 -0700 (PDT)
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Use optional clk APIs
To:     Stephen Boyd <swboyd@chromium.org>, Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org,
        Banajit Goswami <bgoswami@codeaurora.org>
References: <20210520014807.3749797-1-swboyd@chromium.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <96301eb2-ef2d-be7f-2a24-8723c1e39905@linaro.org>
Date:   Fri, 21 May 2021 10:34:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210520014807.3749797-1-swboyd@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Stephen for patch.

On 20/05/2021 02:48, Stephen Boyd wrote:
> This driver spits out a warning for me at boot:
> 
>   sc7180-lpass-cpu 62f00000.lpass: asoc_qcom_lpass_cpu_platform_probe() error getting optional null: -2
> 
> but it looks like it is all an optional clk. Use the optional clk APIs
> here so that we don't see this message and everything else is the same.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Banajit Goswami <bgoswami@codeaurora.org>
> Fixes: 3e53ac8230c1 ("ASoC: qcom: make osr clock optional")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini

> ---
>   sound/soc/qcom/lpass-cpu.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index c62d2612e8f5..28c7497344e3 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -835,18 +835,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   		if (dai_id == LPASS_DP_RX)
>   			continue;
>   
> -		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get(dev,
> +		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get_optional(dev,
>   					     variant->dai_osr_clk_names[i]);
> -		if (IS_ERR(drvdata->mi2s_osr_clk[dai_id])) {
> -			dev_warn(dev,
> -				"%s() error getting optional %s: %ld\n",
> -				__func__,
> -				variant->dai_osr_clk_names[i],
> -				PTR_ERR(drvdata->mi2s_osr_clk[dai_id]));
> -
> -			drvdata->mi2s_osr_clk[dai_id] = NULL;
> -		}
> -
>   		drvdata->mi2s_bit_clk[dai_id] = devm_clk_get(dev,
>   						variant->dai_bit_clk_names[i]);
>   		if (IS_ERR(drvdata->mi2s_bit_clk[dai_id])) {
> 
> base-commit: 6efb943b8616ec53a5e444193dccf1af9ad627b5
> 
