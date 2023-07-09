Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B62C74C802
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 22:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjGIULx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Jul 2023 16:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbjGIULw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Jul 2023 16:11:52 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13523B1
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 Jul 2023 13:11:50 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fbaef9871cso5494550e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Jul 2023 13:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688933508; x=1691525508;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bbwLl6y6nZA6hK/FJCRM5D3c0JWwg2nfi/Us9C7LxFw=;
        b=v29t9HE89LijeM9kao9WFec0a69D36e4JXrL5NbSF0JkVWk3H+xUIIaaV/1Wpf8RaK
         yp1N8+joOPCsNXy57GFZzsn/cPhudkRyzExhMPUjbWWx4CDgoswZuGYOYQRMcNhVJPB5
         Xpr+gpnKc9dDA/yViYzLj+zbQQdrI11qCCRkdljvvGC4DsEWFADUXsqUVFxPTC6tiNbf
         Qd2/PGfFUzXvIW6wHyd2X98xVZC87HX1jJ5j9LG3a5DZE964hVLQ8ji5jwIu7FdzQ/VQ
         uqdG8z5FvwT9IFKTtSaiciD7NL/VSKckol9MD7lZe+abL2JDvhvlyOnofDTnkgd/2yPB
         Nelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688933508; x=1691525508;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bbwLl6y6nZA6hK/FJCRM5D3c0JWwg2nfi/Us9C7LxFw=;
        b=QuDtWYlBOVPUQcmrmE0sVODXAUo9x1lxX7MVKFjJ1Uz/qNcjVWlLm6K5v271LJnWgd
         pAVQE+Y/FhXAX/HDUWO4tTJfx/+VR6FX2OKMRDSOA81QcAUil21xS0SW690lL8ZOdXHQ
         pPgdq6Cqb9CS6FvaNzhw9fABdmuLhdj2vNI3bYUhG+p/gYAOGMzoH92M3FXUpaaS/4AM
         hJksYd2MrIJ8oAOHyfh/BeBTzTk3Pu9ScQCgrmT7JO3DbMI1ouCnwd34TLe5g06LMgRn
         8PgMVfYqSZqrQtaR2cac0zVZsllLzPmsGmleatWYXxbV6yvJkh0ZoxvVm2ZKxGRZF59A
         HVUA==
X-Gm-Message-State: ABy/qLZHZOQT0XW1myYNCguPAhBM5/JGpRcPSKJAVmTQ6couDWXhx/zL
        3DbdX3qlEWaRuW2X2x91YmYrHw==
X-Google-Smtp-Source: APBJJlGmmQcU+IY6QBw46vxHoW5b2oAYM1f7/pRDQANVUOvgNIXCE5smEYXmHM6kgtsIcS+6pojrRQ==
X-Received: by 2002:a05:6512:324a:b0:4f9:5c04:af07 with SMTP id c10-20020a056512324a00b004f95c04af07mr7697650lfr.26.1688933508168;
        Sun, 09 Jul 2023 13:11:48 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id h7-20020ac25d67000000b004fb76abbc7asm1423665lft.89.2023.07.09.13.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jul 2023 13:11:47 -0700 (PDT)
Message-ID: <d66c8268-24ee-e548-7a40-02f827c7c403@linaro.org>
Date:   Sun, 9 Jul 2023 23:11:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] usb: typec: qcom-pmic-typec: register drm_bridge
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230709034808.4049383-1-dmitry.baryshkov@linaro.org>
 <20230709034808.4049383-3-dmitry.baryshkov@linaro.org>
 <d86f33ab-fc41-1a09-f358-c8917625c282@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d86f33ab-fc41-1a09-f358-c8917625c282@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/07/2023 14:25, Bryan O'Donoghue wrote:
> On 09/07/2023 04:48, Dmitry Baryshkov wrote:
>> The current approach to handling DP on bridge-enabled platforms requires
>> a chain of DP bridges up to the USB-C connector. Register a last DRM
>> bridge for such chain.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 25 +++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c 
>> b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
>> index a905160dd860..ca832a28176e 100644
>> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
>> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
>> @@ -17,6 +17,9 @@
>>   #include <linux/usb/role.h>
>>   #include <linux/usb/tcpm.h>
>>   #include <linux/usb/typec_mux.h>
>> +
>> +#include <drm/drm_bridge.h>
>> +
>>   #include "qcom_pmic_typec_pdphy.h"
>>   #include "qcom_pmic_typec_port.h"
>> @@ -33,6 +36,7 @@ struct pmic_typec {
>>       struct pmic_typec_port    *pmic_typec_port;
>>       bool            vbus_enabled;
>>       struct mutex        lock;        /* VBUS state serialization */
>> +    struct drm_bridge    bridge;
>>   };
>>   #define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_typec, 
>> tcpc)
>> @@ -146,6 +150,16 @@ static int qcom_pmic_typec_init(struct tcpc_dev 
>> *tcpc)
>>       return 0;
>>   }
>> +static int qcom_pmic_typec_attach(struct drm_bridge *bridge,
>> +                     enum drm_bridge_attach_flags flags)
>> +{
>> +    return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
>> +}
> 
> Should that be -ENODEV instead ?

No. This bridge doesn't implement older bridge API, where the bridge had 
to create drm_connector itself. This implementation requires 
DRM_BRIDGE_ATTACH_NO_CONNECTOR and it is invalid to call it without this 
flag. Other bridges which have been converted to 
DRM_BRIDGE_ATTACH_NO_CONNECTOR implement the same semantics.

> 
>> +
>> +static const struct drm_bridge_funcs qcom_pmic_typec_bridge_funcs = {
>> +    .attach = qcom_pmic_typec_attach,
>> +};
>> +
>>   static int qcom_pmic_typec_probe(struct platform_device *pdev)
>>   {
>>       struct pmic_typec *tcpm;
>> @@ -208,6 +222,17 @@ static int qcom_pmic_typec_probe(struct 
>> platform_device *pdev)
>>       mutex_init(&tcpm->lock);
>>       platform_set_drvdata(pdev, tcpm);
>> +    tcpm->bridge.funcs = &qcom_pmic_typec_bridge_funcs;
>> +#if CONFIG_OF
>> +    tcpm->bridge.of_node = of_get_child_by_name(dev->of_node, 
>> "connector");
>> +#endif
>> +    tcpm->bridge.ops = DRM_BRIDGE_OP_HPD;
>> +    tcpm->bridge.type = DRM_MODE_CONNECTOR_USB;
>> +
>> +    ret = devm_drm_bridge_add(dev, &tcpm->bridge);
> 
> I think you need to either
> 
> Kconfig + depends on DRM
> 
> or
> 
> #if CONFIG_DRM

I guess I'm too used to always having DRM. This will need both Kconfig 
and source code parts. Will fix it in v2.

> 
> https://www.spinics.net/lists/kernel/msg4773470.html
> 
> Kconfig for preference
> 
> ---
> bod

-- 
With best wishes
Dmitry

