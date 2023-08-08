Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC6A4773E97
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 18:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbjHHQcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 12:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232887AbjHHQbz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 12:31:55 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3FFE1397A
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 08:51:49 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso811953766b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 08:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509896; x=1692114696;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AV7pYGODgs/vswsM71s7yBSPT97U68gXTdayAu9iSYw=;
        b=JIzfauuege6SscwAu+ORFUX/WPuDO5lgrv7RHxceZy6WCbnAA7Yf0ff5rZAfC7ybps
         Kh0SJ1+jQhdafp1XqPSaGqaQ5oZ2u0naF7jRuYZB37M+bWNlA2OymecewgYPLwxYmIVO
         VuESNJNg8xkWGOYhTOvyNVuG87Y3WqH5AOCCWVeA7PkFzzoMvQW4seynvx1x5kYn/rti
         zMBVHNJWcZkGxfcJoqRJ+oDgkDags7rVFVeAn1uqsx7LPG/di9m24TeHZNgJnTZvyHer
         XO2bWEaTkQ3m0ZqjYeojD9q24qrcQKIBZJtBTqAugFDK9vSKGxB8HWEZXVA3DRvZ6WP8
         4bCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509896; x=1692114696;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AV7pYGODgs/vswsM71s7yBSPT97U68gXTdayAu9iSYw=;
        b=Zz5+d6JSCB1XDopBy4CpdPOAJaUEthOXL5rSpQn2UtbHIPk2UK0+6+zYL2Ps4Aj8T1
         rUSKu0IEXA9ABjOqj7J0lopOqTncMHglsJrTRg0f6ZgfCgtPoF3j4JaqpTPA8R+boi6M
         ICHEqvadjHz8QHGL0Pn0iPIDMFP2j+MHYLTMdnXQ97OF+ZjzHvBscjDHX5eVWWS7kvPF
         SoE9udHNrztRq7KBMd2/NYtHgt6+Qx4AP1m4vK+RmnLEqAKxZ0Mb1/M5nFbhAPE1UB8T
         c1d38ZMV0bSU3FpcACDHpZhZ47TkLzN6YmpxxmpUrY7NhpxBcYT3CO8lmgizBsTHJG3q
         gdpw==
X-Gm-Message-State: AOJu0YyhxfbHYRO3Xv97IM4NjVIrCxaZ1cPWllXIs5MHfHLADowVcjRu
        fjZSdEZfaoiFykqmvtsOjT7qotdd5+we66NUWss=
X-Google-Smtp-Source: AGHT+IHi6Yp+yRsRwvN5aEzHBHFgm8hd5a3fbcIKHC1dwK0+H3FWM+RobNVM6FnNwNpUNH5BDqly7w==
X-Received: by 2002:a17:906:e:b0:99c:7134:ab6d with SMTP id 14-20020a170906000e00b0099c7134ab6dmr10266806eja.41.1691483828332;
        Tue, 08 Aug 2023 01:37:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id l17-20020a1709060e1100b009944e955e19sm6302110eji.30.2023.08.08.01.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 01:37:07 -0700 (PDT)
Message-ID: <c589a82d-3011-d437-7343-b52308cbc185@linaro.org>
Date:   Tue, 8 Aug 2023 10:37:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 8/9] i2c: imx-lpi2c: Use dev_err_probe in probe
 function
Content-Language: en-US
To:     Liao Chang <liaochang1@huawei.com>, andi.shyti@kernel.org,
        florian.fainelli@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        yangyicong@hisilicon.com, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, kblaiech@nvidia.com,
        asmaa@nvidia.com, loic.poulain@linaro.org, rfoss@kernel.org,
        ardb@kernel.org, gcherian@marvell.com
Cc:     linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230808012954.1643834-1-liaochang1@huawei.com>
 <20230808012954.1643834-9-liaochang1@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808012954.1643834-9-liaochang1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/08/2023 03:29, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
> 

>  	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0,
>  			       pdev->name, lpi2c_imx);
> -	if (ret) {
> -		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", irq);
>  

I don't think this is needed:
https://lore.kernel.org/all/20230721094641.77189-1-frank.li@vivo.com/

Best regards,
Krzysztof

