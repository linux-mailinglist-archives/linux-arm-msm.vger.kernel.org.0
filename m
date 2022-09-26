Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 530C15E9B99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 10:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233442AbiIZIG3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 04:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232965AbiIZIGH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 04:06:07 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8698913F4D
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:03:32 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id iv17so3899978wmb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=5UaykwoP7cmogwMP8kseVUVB3uiK678gg0lc2Ydeyrk=;
        b=F9awJydw3vyGcgCTSxEz2odMcAZPYdGkTWaZVddTZr0Xg9lQbZEmw/5dwBK7j5n0lX
         9hQJcVwBBrTcpxIcbYfRQJEw9X7f0ADa1vX4OxwFWS0EwMn50rykwrRPzFXj8lT3ZIlw
         g0cluujqT4tXXpEchMom/hFHNwcGN40EafWEaXllwdJLNLuG1xUFd75ZUmhbDM3Mb2Nk
         HBlvlfyhYsa0Zv9IoxF4aSPwZBJ5eRwuO8pLAWaqGA9/WBpRQ+1FaaiaiiDxZUToReN3
         QctVytCBAh9IvyncGRcEYVrb1Kmm/IQMN7DeEDYBDGComQW+toPHYLb23v65X6eroF4R
         fkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=5UaykwoP7cmogwMP8kseVUVB3uiK678gg0lc2Ydeyrk=;
        b=afFYQXIXs+qTOglXqHIosITSro5C/b+5ym7A/qEQ2xlKYMa30pzJsRNQ7WaUSosJ6V
         UsUAoE/uerv1XpP5c1iZcm2YqLHfxooFJRDmdaXxZMU1zcMLqWKYADkej9uGLm4LJwQR
         OIIs9YPH7LNSDVXnt/v3J41o7WozXLRj4ADDAu2dUq3y+IhkU0r55zVAkpUPtBxd5L90
         cui286CqctMwVB8/IjqA+Ew8XlwIyXgVMUZZRGf3+FOIHncCkT8us0lJp8+Sz85QoSc8
         QDCd88A1OluJ1X4s0acnlkXbymWHTLcZOR92umcQPbTnJXhJ5/yYLJEgeQ7TYZnsuHBq
         QXsQ==
X-Gm-Message-State: ACrzQf1t2TAa1kfTGqhAsVry9U0nwc3a2mLPMIBxYqJt/xrc3m43Rpu6
        qu+nOFFmadzfGNL48Ox3+xgk8Q==
X-Google-Smtp-Source: AMsMyM7IUWbb4Nk+DUBPCqoWuZ+HeKfogZtrQdBj3R2xtlvjd3vmuNxC6S1dochOh7yFvmwixb29zQ==
X-Received: by 2002:a7b:ce08:0:b0:3b4:ff9b:3d89 with SMTP id m8-20020a7bce08000000b003b4ff9b3d89mr14441119wmc.31.1664179410596;
        Mon, 26 Sep 2022 01:03:30 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id n11-20020adfe34b000000b002252ec781f7sm13710611wrj.8.2022.09.26.01.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:03:30 -0700 (PDT)
Message-ID: <f6e9e9ce-2c87-145d-80cc-a52c0bc9fa45@linaro.org>
Date:   Mon, 26 Sep 2022 10:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] slimbus: qcom-ctrl: drop unneeded qcom,apq8064-slim
 compatible
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
References: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
 <20220923155740.422411-2-krzysztof.kozlowski@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220923155740.422411-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/09/2022 17:57, Krzysztof Kozlowski wrote:
> Bindings require usage of fallback "qcom,slim" compatible, so
> "qcom,apq8064-slim" is redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/slimbus/qcom-ctrl.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
> index c0c4f895d76e..bb106eab8ae2 100644
> --- a/drivers/slimbus/qcom-ctrl.c
> +++ b/drivers/slimbus/qcom-ctrl.c
> @@ -718,7 +718,6 @@ static const struct dev_pm_ops qcom_slim_dev_pm_ops = {
>   
>   static const struct of_device_id qcom_slim_dt_match[] = {
>   	{ .compatible = "qcom,slim", },
> -	{ .compatible = "qcom,apq8064-slim", },
>   	{}
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
