Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA2DC73A864
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 20:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjFVSmc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 14:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjFVSmb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 14:42:31 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E731FF5
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 11:42:29 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b46cfde592so86411541fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 11:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687459347; x=1690051347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sjj3Boe/HdR5zbtRo/fyylNooQOkgRfrOTZ9rBEe6Bw=;
        b=Omoq/Psf65h/J0Xnd36qTxSaAMzihoVX/9b2fJWYcum0UPoYymXDz9mk2wwEn3JoeH
         npYR9qKvLoLqWY+v04GFXG6qQpqSSqsXjaNNn30xs72VpDbWu7zfPgmDXz5IQ3PK43Hj
         uJp2yFqObG1CTXIMjfBAERVKUiv7s0BA65tuRw0YHtwAPaFYEp8TXUyUNWnaXVMNKHzH
         GehQdO/5+9qOCBbHQVn3r/l8WmH5mA3OfbRL84GMJYZBkAsHW058IO+TZiZwIjC0tak0
         IKA/ioe6NICNoL9aFuVYJeCoreNHdQkopgWShydzeuGxOqXf6EloNkLRTi8tI2pIPzz4
         U78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687459347; x=1690051347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sjj3Boe/HdR5zbtRo/fyylNooQOkgRfrOTZ9rBEe6Bw=;
        b=gzQqt7pEQKxIP37ZyVWo4olBm87MQGqm56hK1T0v70Irotj5PW6q05hOpvE7NnUjGB
         oI5e5Z4eU7gs88fP0R+2rVrbdVgCVvRTuexPRix4y3hnuhVLlMDf1tkeRhWRXlxvVjwu
         PETkzAmB65RjIja+2dtqIkYzaU3HXWNUecuQGRZ+8BzUjS6JJKXg7Cx69+7KGhVJBR6r
         l/VdTRkHqhxLLwjqgtPleUBHCCJFafWht2lJWeWbFF6Ip+l8p8gvqBzw0XFgcwf+xrAx
         45bbDAjtdEVypevoOZmY93ws0z04eZeFyIaMz+N68fXgZrkTYbIChHDcWCpgidLPAWV8
         NZ1A==
X-Gm-Message-State: AC+VfDyUXMPPpSeOwLfRdQr8ll3PFXZkGTaE5fy7c0hDE3HIGNcprv22
        S1UcTvxyTPGhg8HF0TixX4vwpQ==
X-Google-Smtp-Source: ACHHUZ45fBGVA7hhjEz9ruDoM5N1Xdmlgj5bRXIJecI+q+YtDZCQzJGfn3VzZPrqrZJ/dHgobkjzTg==
X-Received: by 2002:a2e:9f56:0:b0:2b4:45bd:fd7 with SMTP id v22-20020a2e9f56000000b002b445bd0fd7mr11840621ljk.50.1687459347539;
        Thu, 22 Jun 2023 11:42:27 -0700 (PDT)
Received: from [10.2.145.31] ([193.65.47.217])
        by smtp.gmail.com with ESMTPSA id e17-20020a2e9851000000b002b331e241edsm1427299ljj.133.2023.06.22.11.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 11:42:26 -0700 (PDT)
Message-ID: <8f69cb15-6c70-031c-7632-15daddaddce2@linaro.org>
Date:   Thu, 22 Jun 2023 21:42:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] drm/msm/dsi: Enable runtime PM
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
 <20230620-topic-dsiphy_rpm-v2-2-a11a751f34f0@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230620-topic-dsiphy_rpm-v2-2-a11a751f34f0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2023 14:43, Konrad Dybcio wrote:
> Some devices power the DSI PHY/PLL through a power rail that we model
> as a GENPD. Enable runtime PM to make it suspendable.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

So, we were calling pm_runtime_get/put, but we didn't have runtime PM 
enabled for this device? It might be a nice place for dev_warn() in the 
driver core.

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 2f319e0eb74f..22431e106529 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -689,6 +689,10 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, PTR_ERR(phy->ahb_clk),
>   				     "Unable to get ahb clk\n");
>   
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
>   	/* PLL init will call into clk_register which requires
>   	 * register access, so we need to enable power and ahb clock.
>   	 */
> 

-- 
With best wishes
Dmitry

