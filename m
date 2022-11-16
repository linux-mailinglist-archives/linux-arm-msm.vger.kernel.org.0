Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B70362B7F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiKPKY7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:24:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238860AbiKPKYT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:24:19 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A892FC25
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:22:52 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id c1so28759065lfi.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NS4gwSDhOkL+YOO4Yac7+z3Uk669hHhGemqfXEb/Y0=;
        b=jTbk8uFW2qmr1yT1BvBLGimsjD+aEpDxNsaqK/IQha0TKn0vcdGY2u2017LXBweFXu
         3p4wKI8lYJczJYjXvAZe5zX+wSUjK37n9m2LjBq9KMSApUDLU4PMIL3OHHhugm9YmeF0
         GBcvIVkJcHoQfG3eLb63atIDSmdiOrSFoW92WeKyUQhyI35GUChHpleEpQ5vKGXwZ/lC
         zvxhqO+pWxp0DXfNm2PRYCbEgbbA6OyVyApwv6glBrdrT2+eSTuANCOkufOB+ZN/nA+W
         BUdle2xExMow8i3gEwizRt/4OMUzfTgEs1uniWjQmvHf5ikg+VvdNtKJ9FD0aFktLS2+
         fETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9NS4gwSDhOkL+YOO4Yac7+z3Uk669hHhGemqfXEb/Y0=;
        b=VqM/57GtTsj/Y8dTF/Wxr5v4W9xXu3eerM23p64bYNit/fyPyg47gHKPrVycWtG49N
         MmEANb/YOZmi2IBW/bDjtRSwjnyHVQ63qzqCXxRssrDMBgK0EchTMg/P8ESlKK9fTWpy
         Gubp26CZhP9zIZPOhXHZ6Rszw61r/8G0fzKPprI4ZGWuo40rrlc5EBKR6+RRmBGl1g84
         songfApAsD5H1oDrzf6VC2696WlBmhiywQNbkdFc7aFEgDS8M9MzneSOgeS0bxqQE2sW
         f8HS0tYQb8BEKjcTAzA5Vk17B39uMY2Am58WBsS7UCIY9ebrP51eghek8rYOej7SMUef
         hjpg==
X-Gm-Message-State: ANoB5plwqWw1YTwCvyMtC+vypWUH+CMPy7jr9A0qpD1gu8cRTY2PlMqi
        7RFlLSSwhuFi46wUniZR0dpA7g==
X-Google-Smtp-Source: AA0mqf7ZTYi3hn/J0wxTVBbrKDY7/qh61IahmRtldN7M9nItS/ze2scTM///yC5joq7+fUIhnJowMA==
X-Received: by 2002:ac2:4bca:0:b0:4a9:f2e3:3cf0 with SMTP id o10-20020ac24bca000000b004a9f2e33cf0mr6782672lfq.545.1668594170926;
        Wed, 16 Nov 2022 02:22:50 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id b21-20020a05651c033500b0027722e99323sm2934578ljp.5.2022.11.16.02.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 02:22:50 -0800 (PST)
Message-ID: <16de0a02-e7d7-87d1-c877-e32de46bfc28@linaro.org>
Date:   Wed, 16 Nov 2022 11:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 7/7] pinctrl: qcom: spmi-gpio: add support for pmr735d
 gpio control
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org>
 <20221114-narmstrong-sm8550-upstream-spmi-v1-7-6338a2b4b241@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-spmi-v1-7-6338a2b4b241@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16/11/2022 11:11, Neil Armstrong wrote:
> Add support for the pmr735d gpio controller providing GPIO control over SPMI.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Any particular reason this could not be a part of the previous patch?

For the addition itself:
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index f758522d035e..66d6d7ffbd43 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1242,6 +1242,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>   	{ .compatible = "qcom,pmp8074-gpio", .data = (void *) 12 },
>   	{ .compatible = "qcom,pmr735a-gpio", .data = (void *) 4 },
>   	{ .compatible = "qcom,pmr735b-gpio", .data = (void *) 4 },
> +	{ .compatible = "qcom,pmr735d-gpio", .data = (void *) 2 },
>   	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
>   	{ .compatible = "qcom,pms405-gpio", .data = (void *) 12 },
>   	/* pmx55 has 11 GPIOs with holes on 3, 7, 10, 11 */
> 
