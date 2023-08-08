Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E98A773F9B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 18:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233492AbjHHQuU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 12:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbjHHQtM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 12:49:12 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C3D4AAA4
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 08:57:23 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fe5eb84dceso16371305e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 08:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510202; x=1692115002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k2MJPyoks2T/ViX3nyRQF8CYDSyq3wamUO8HlMVdzMs=;
        b=Ge+7cg6GXVW9Gwowvc+FUkxwcapMcvGvB0SH3k8rAulWmHkej2YORefr/BWB1iCcBU
         f1is+CNaN9rGMf4RQMuhzMXkNtQDztfkAFKj1AvBkQ+kzDUjcloS7GUOy/kTeWctd/LS
         EE+w5tvwCKEXpm6zDVctBFS/r1V7XmqJLVMm2j3ExldSQmgo6zrriwoPX6BvABR833Zl
         j3U4yf3tE2SMC2HdUQnwUpKUXvjeQHtg75e7PXhJl5bZq+V0+QjPg+vaKBddAtOR1XNe
         CX+VNLVURaiBZ1ahuCNwIcb3RU+QVY8CHZghxZe9mXVp4Mb+pczBrTvMrVSbnlIgpIFP
         VyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510202; x=1692115002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k2MJPyoks2T/ViX3nyRQF8CYDSyq3wamUO8HlMVdzMs=;
        b=fx3/qAs7r3Tj3Lv2eKfsi/8poHvPsa82oJJEnyRmJRCJBb2EZONTwyMp+bj7POG/Y+
         jNvoXPs5nVwqUAIonYbuXsBoi253nWAWH3V1YJ0cfTvU4dVndmWwC1SIIsq3wLFP/hy+
         tLEu13fPBqueavmk9FXmoBcYIc8hWgNCQhoWAvnJ2A1WVHAUaaK8UWJuCRQA0lXRfFGZ
         irDTc/EvmE1giKySMaZh6QsPPh4wA7MtrP7IFwsYo/CwzjOsYo0RQUMliFIERddFkEE8
         rKVYUXeGd5HZcD1KVPoXac2zJIYL9OVplfu4U6Q/dJgvTPodfagmuKUaVjWMVEjk0Ey6
         pdVA==
X-Gm-Message-State: AOJu0YxHgq8CoEnSRu2blXgoKeIuP8lLN0f1mmZDAjwPBXiqwMV8q2PJ
        W8/du0GbowPLy4xpDbLKrx7rkx5vh0zGpxZ06NI=
X-Google-Smtp-Source: AGHT+IHVYl6k7X1HkWuOZJGrwfDyphp8mGeKHbuzBByCu7FEdYTXY1+5KAwkmhFPQxZ+9wIOIIVSOg==
X-Received: by 2002:aa7:d7c7:0:b0:523:2df6:395e with SMTP id e7-20020aa7d7c7000000b005232df6395emr5416705eds.31.1691483787005;
        Tue, 08 Aug 2023 01:36:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id n24-20020a05640204d800b0052307566ed2sm6257416edw.14.2023.08.08.01.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 01:36:26 -0700 (PDT)
Message-ID: <b32797d7-ef81-7051-85b5-cbe0cd3302ae@linaro.org>
Date:   Tue, 8 Aug 2023 10:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 3/9] i2c: xlp9xx: Use dev_err_probe in probe function
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
 <20230808012954.1643834-4-liaochang1@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808012954.1643834-4-liaochang1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  drivers/i2c/busses/i2c-xlp9xx.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
> index f59e8c544f36..08a59a920929 100644
> --- a/drivers/i2c/busses/i2c-xlp9xx.c
> +++ b/drivers/i2c/busses/i2c-xlp9xx.c
> @@ -529,10 +529,8 @@ static int xlp9xx_i2c_probe(struct platform_device *pdev)
>  
>  	err = devm_request_irq(&pdev->dev, priv->irq, xlp9xx_i2c_isr, 0,
>  			       pdev->name, priv);
> -	if (err) {
> -		dev_err(&pdev->dev, "IRQ request failed!\n");

I don't think this is needed:
https://lore.kernel.org/all/20230721094641.77189-1-frank.li@vivo.com/

Best regards,
Krzysztof

