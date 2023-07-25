Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3A3761B48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 16:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232637AbjGYOU7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 10:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232115AbjGYOUv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 10:20:51 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00F426A3;
        Tue, 25 Jul 2023 07:19:28 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-785d738d3feso132845039f.0;
        Tue, 25 Jul 2023 07:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690294721; x=1690899521;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Cj2Cq+uL8mVsrJ/sUcEtifVEHHpJx+j7mtIPpnYM9SM=;
        b=sbn4mGANvbyYvVE8iCU2rZN9UBzfX51tKUeg9D3ZUfeERGYrGrGOx1um8Bo/KxPfBh
         66c41dzsHnebfyrkrD8eY27fi5+kX1IdHYhN4V9g0b88ldvR1P8hFHdwTVgS6/SMj5/j
         PH/uoCipuelT5eo1JjwmGmRx0uT+so2Vz9vTgAIMK+blHYb3NWUgoyt8GAZQd0Jo6jHj
         eYf97sYYRGZfFxBplMBtLzVeZhnBop0oPlRo1xakcLWLEYAEJikV2qazGacpmXDQXDXe
         RyDdy54PI04pKPQul+qKhjvEPr3XS2or7l731aDjoOrBAK8XjP++KWdWyKgQ+IIShEEv
         0n2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690294721; x=1690899521;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cj2Cq+uL8mVsrJ/sUcEtifVEHHpJx+j7mtIPpnYM9SM=;
        b=EXDBzmpaA/+WviTyfQ9XeCnKN88sq1+4RqSNtsDutSSza9TX+sENE+sECvo999APx7
         AV70HdFG9bxLXk4h9Qo4oKodyxJtZjrB0pDW1hojTzaKhH0Zp75K6BiSRZzPWp/stImr
         ph/GVQce1uDsvyJhRzIYQyRnYBetaTT6jUMw7oan5QjiC668br6ObN6hystcc+dCXY+5
         xvx2xkxpLw8b6Kl+dciPpP2tcCC/mZ0DyV3NNJ1KczqMMl0gYjWZzRJW1CnI8GpgwPkv
         w0+brwB3/Fr7gzBBWVUy9DtfDv3+l+QXOkKq5a2qNUtZZyoUkAhhma0dfDceBBn+7t9D
         XxrQ==
X-Gm-Message-State: ABy/qLbtlRC2UjxSm6G4FKUCjb5PmGXHiwempZRMcTX0wvT0QrLF+MP2
        zeLyBIt3rWMda4+NDb34K6qwS0eXc4c=
X-Google-Smtp-Source: APBJJlFbc/ev5i8ov20AgltwfpLhxzhUZx1vpHU6wQPzMzO9SGEKnIcfi2zCbBChky731D3Z9QvMrQ==
X-Received: by 2002:a05:6602:168a:b0:788:521c:a9aa with SMTP id s10-20020a056602168a00b00788521ca9aamr1657258iow.4.1690294721465;
        Tue, 25 Jul 2023 07:18:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h21-20020a056638063500b0042bb296863asm3557049jar.56.2023.07.25.07.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 07:18:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8df6ac5b-46ab-bea2-4062-6bf5ce00f3ee@roeck-us.net>
Date:   Tue, 25 Jul 2023 07:18:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] usb: typec: qcom: fix return value check in
 qcom_pmic_typec_probe()
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, heikki.krogerus@linux.intel.com,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        gregkh@linuxfoundation.org, caleb.connolly@linaro.org
References: <20230725125319.565733-1-yangyingliang@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230725125319.565733-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/25/23 05:53, Yang Yingliang wrote:
> device_get_named_child_node() returns NULL, if it fails, replace
> IS_ERR() with NULL pointer check.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index a905160dd860..9b467a346114 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -209,8 +209,8 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, tcpm);
>   
>   	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
> -	if (IS_ERR(tcpm->tcpc.fwnode))
> -		return PTR_ERR(tcpm->tcpc.fwnode);
> +	if (!tcpm->tcpc.fwnode)
> +		return -EINVAL;
>   
>   	tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
>   	if (IS_ERR(tcpm->tcpm_port)) {

