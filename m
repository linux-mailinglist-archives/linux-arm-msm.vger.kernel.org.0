Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E92968D4B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 11:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbjBGKqT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 05:46:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbjBGKqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 05:46:19 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE543AAD
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 02:46:17 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso11086114wms.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 02:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qmvz3slIJ2kg6u6RwHYgRDHfs/AJp5yf9nG98cNz5ZI=;
        b=Pgr//yViWPDay6GY6NxOgluj0HIlZl6IMOa4KYNebAaXBH1m6QURMYjeG0U9GfdKrP
         G8TnJxGyjbt9TZd4Y4WA0xbWVhKPDovAAoWccLYH+8z7xxTSi4F2Bk0kExfibjJCZZII
         ScyWyApupo7WkEioUL1zQIgDGpcvbCx6oNfKBoElvsVNwqZdWMMSCdv5/bjobBeefXGx
         bLWblhyWUKqySyHIeESMSt4loJadg0u+gNQ5YW68hueWWaULWzHuoWtzIEMFBvvR+4yU
         0hEUMPs8b7M7btXdth3438KyarG1aEUh6Se85fSsEfu/5ZdmaqokDoRUxquI/77ODkfM
         HVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qmvz3slIJ2kg6u6RwHYgRDHfs/AJp5yf9nG98cNz5ZI=;
        b=UCGhGbYNrcX6Z7HZD25GYYwKoXS5V3Px0crU8p3aYqewQZaqMyCjzf2bbcM5xTV6Ht
         iFFrpZfmKZ9ASmbu+6t8YAnaYkC/z/1qg07sybqzlkVuvKHlesQFRd3yg8p84vGRmQwC
         OpYsQRAQZQviR5gdd8aJvwVzxoXQfaTB7wqeUY52rkrNADtlrjH9ZWksijPfgrRsRkY5
         Hmi5j2Jt1xX6philb7uNUXUMsMJpC2n5GgxIaK6MxC69/0HuZW1pDmIoL5v5q261FkvK
         GfENKzuRTCk6KZfTP4xlznlzXiyNO/xzytyl/n6goLaY+F/kMUf5IepqAdGnGwCkMmQ6
         q8aA==
X-Gm-Message-State: AO0yUKVcOYE0JQxTUh133ut/QRW/TeWglaElR/ti2gQmXzlAQe/K3+VH
        wJtUlc+0RPyo9X6Vdacn2XccWQ==
X-Google-Smtp-Source: AK7set9L4Xn5kAufMDg2CMnksNd3bermpYPkhxvHtkMs3aLGAt/hKlLYfNkywXWwOLRJCfSH0DacnA==
X-Received: by 2002:a05:600c:1f14:b0:3df:e659:f9d9 with SMTP id bd20-20020a05600c1f1400b003dfe659f9d9mr2725035wmb.34.1675766776127;
        Tue, 07 Feb 2023 02:46:16 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k10-20020a7bc30a000000b003dfee43863fsm11491884wmj.26.2023.02.07.02.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:46:15 -0800 (PST)
Message-ID: <828c6ab8-6f5d-510a-05ef-7e0503323c75@linaro.org>
Date:   Tue, 7 Feb 2023 11:46:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] soc: qcom: socinfo: add support for SA8775P
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230207100730.218725-1-brgl@bgdev.pl>
 <20230207100730.218725-4-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207100730.218725-4-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/02/2023 11:07, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add SocInfo support for SA8775P.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 3b970a80f3aa..c5208aa99125 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -419,6 +419,7 @@ static const struct soc_id soc_id[] = {
>  	{ qcom_board_id(SM8350) },
>  	{ qcom_board_id(SM6115) },
>  	{ qcom_board_id(SC8280XP) },
> +	{ qcom_board_id(SA8775P) },

This does not look like correctly ordered.

Best regards,
Krzysztof

