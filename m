Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F96C66501C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 00:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235300AbjAJX5N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 18:57:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235192AbjAJX5M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 18:57:12 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8ABFE
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 15:57:10 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id y25so20957479lfa.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 15:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IkTOuzrzX6KwlgMjt2sPQWSPFLHsLIuRAugm3KiZhdQ=;
        b=fbvbaRwRXvgjXAdD5bkv43z4u2CyFCahI0+D+LKLgT1AFAefgLUmTfDtYQeokf0uuP
         vmnk/5X1k53hpZxhquMQiPrDnNUQfQEE8iBZ14YmIX3JH6WoSyvBkvlep+KFawq4TcUH
         0KKcMt+ZyO8P/f6/AFUreLVc24oJBm9aHSSXBAEB+BzMmVn9iKrZWFu+iIxz7McbFALo
         dzURtRh6eIwOBgoscLEtlE6jlWhDD4iLqepokoYmwgxJKMJu4Bi9xoougJ7rilhWaW2M
         ubbN5VZL/HnnGo2sm3eIDEhPkUpWLQy/yPYHCMW1Gzc2GYm/0tu89ZukiHHsClOjoLVM
         4OcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkTOuzrzX6KwlgMjt2sPQWSPFLHsLIuRAugm3KiZhdQ=;
        b=I0tQf09cHkWC7OofJppSccvbLNh8Qww728YyzqFVqzZwVn2c6b/blTNRRTwrNe53FC
         komQ/wysk+hNlhowGPWGQrhA1YcYlcQUop26yC/PiOxmKxDfB6Pvdb2uqvUH5XC1Qr/Q
         UZiWMEAcCBNg66cLI+igbpTsRg5WIpDyh6Ur1BGuLEZktuljE6/sHr8b8CVG1p9ABi7u
         8orNeNPlf4ISwhjnOFYf4lrgsPO/gT+oc9mSSA7EnHxbHDjUw9NBgNaMuC1kT6tGRVoS
         FqknskLirWCU5BcLajgMTyUn2qxC7l6O7Rk5SJep+GPZTnfXKAYR6mB6M2ICTvZamtK4
         qIYA==
X-Gm-Message-State: AFqh2kq8M0OTnfx9TKiInV3qdfym6jw9m9oSknjiWfIDrZ1pUgtnjsXu
        gEKGvbdiHZPdyX1sFUv6v81T0A==
X-Google-Smtp-Source: AMrXdXsIeaG8B3rt97xF1l+QuLOENzWEnJCNuiCDWrac82PSXsBwU2ZebqJazF8pM/gK3dyRPOYx1A==
X-Received: by 2002:ac2:5edc:0:b0:4cc:74ac:9b6d with SMTP id d28-20020ac25edc000000b004cc74ac9b6dmr3544306lfq.12.1673395028389;
        Tue, 10 Jan 2023 15:57:08 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id n27-20020a05651203fb00b004cb21eaf6e6sm2430361lfq.0.2023.01.10.15.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 15:57:07 -0800 (PST)
Message-ID: <d90fe8dd-fc9d-fe2c-4b5e-cd7f32d747c9@linaro.org>
Date:   Wed, 11 Jan 2023 00:57:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] arm64: defconfig: enable SM8550 DISPCC clock driver
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230110-topic-sm8550-upstream-display-defconfig-v1-0-9941c8083f10@linaro.org>
 <20230110-topic-sm8550-upstream-display-defconfig-v1-1-9941c8083f10@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230110-topic-sm8550-upstream-display-defconfig-v1-1-9941c8083f10@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10.01.2023 20:34, Neil Armstrong wrote:
> Build the Qualcomm SM8550 Display Clock Controller driver
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 851e8f9be06d..004c379eced7 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1107,6 +1107,7 @@ CONFIG_SDM_GPUCC_845=y
>  CONFIG_SDM_VIDEOCC_845=y
>  CONFIG_SDM_DISPCC_845=y
>  CONFIG_SM_DISPCC_8250=y
> +CONFIG_SM_DISPCC_8550=y
>  CONFIG_SM_GCC_6115=y
>  CONFIG_SM_GCC_8350=y
>  CONFIG_SM_GCC_8450=y
> 
