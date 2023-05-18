Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D35F707D6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 11:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbjERJ54 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 05:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbjERJ5z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 05:57:55 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37489E4E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 02:57:51 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so2236724e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 02:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684403869; x=1686995869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+fi2K2ih8ubNNH5ts+siPsdYefNa7Updp+53R5c4EGk=;
        b=J/vAfma9k1hVBwvI1U0sxejKv2JbtGG6vzM5w4TozX/waKbatEu2l4ZHOoYQsq+rET
         bBKN/mm46IE8mJiUFA/048Ej/CxgCYxteYHYKTAPzAxwvvxH0nidBtm8Vk4ESkCKxcy1
         ZlTQ+kGkuMhlR9ELtLeuIIlBZFpvfZ6FF/vF1pBRJh3cVIg/XS0cXvU1zNZ79MycZyIm
         4hLuhVWllZEnAoH7RYg2yKiQp6qq7utgcKHe8n1F1f4DTzz0N4ivd4xWI23X4bfZMyXt
         DlxQGlvbtwvEJMyprlG8pXVtSLKrFJMcaZvN8GIJllKJ+6zr0FlxJxwpnz83beFiLre4
         KrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684403869; x=1686995869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fi2K2ih8ubNNH5ts+siPsdYefNa7Updp+53R5c4EGk=;
        b=iTz5kvyZGcqEksJCNtGBafb+4g8djiHtP6pVwTfzsbUuAVzve2zNGdjV2+HWB2Td9G
         i6j3NLBSHqiM2gs5aqKO3JrjBadzGlXfM5tdmXA0DvceUSsT1Ki9kPpN156Q7z1XqFMi
         F2O4BAVqRsdXherqz/as6i556acHYVSK7anTUGWmtUm4W6XWznpz7sPpiUqK0P7aUyyp
         nY20vBpRF69gMhMIW8caIciM6kYTV/ZzG3Jmdz9LKNssWA2ZprdQWb2vazh/E1qHSZD1
         LtmiBUp3d5501spTsBnt1gccCEY7EkpArBbuCRaSvqfQ7nhO5OHZtSasszcfCAeIS3Rf
         JSng==
X-Gm-Message-State: AC+VfDx7aKvxkwP1T3L1edxK+B1jd1SIzIFDROSZHqmUT1AKRw5YPI/y
        Zi/nyLk8B6EONbj25pJhNl1hvQ==
X-Google-Smtp-Source: ACHHUZ7EGCNw+zzJkw+MsrJrijBrAQg2OgAeyFpyRWLczaVQ70GcXbkHlNU1ozBevshl36LBSWeNqQ==
X-Received: by 2002:ac2:52b2:0:b0:4ef:ef67:65c9 with SMTP id r18-20020ac252b2000000b004efef6765c9mr1082916lfm.23.1684403869439;
        Thu, 18 May 2023 02:57:49 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id w26-20020a19c51a000000b004eb3b6da6f5sm189050lfe.228.2023.05.18.02.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 02:57:49 -0700 (PDT)
Message-ID: <17f26ff4-e71f-1469-843d-ee7a5cd566a1@linaro.org>
Date:   Thu, 18 May 2023 11:57:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 92/97] usb: typec: qcom-pmic-typec: Convert to platform
 remove callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-93-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230517230239.187727-93-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18.05.2023 01:02, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning) and this typically results in resource leaks. To improve
> here there is a quest to make the remove callback return void. In the first
> step of this quest all drivers are converted to .remove_new() which already
> returns void. Eventually after all drivers are converted, .remove_new() is
> renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/usb/typec/qcom-pmic-typec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/qcom-pmic-typec.c b/drivers/usb/typec/qcom-pmic-typec.c
> index 432ea62f1bab..924af87fb26d 100644
> --- a/drivers/usb/typec/qcom-pmic-typec.c
> +++ b/drivers/usb/typec/qcom-pmic-typec.c
> @@ -228,7 +228,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int qcom_pmic_typec_remove(struct platform_device *pdev)
> +static void qcom_pmic_typec_remove(struct platform_device *pdev)
>  {
>  	struct qcom_pmic_typec *qcom_usb = platform_get_drvdata(pdev);
>  
> @@ -237,8 +237,6 @@ static int qcom_pmic_typec_remove(struct platform_device *pdev)
>  
>  	typec_unregister_port(qcom_usb->port);
>  	usb_role_switch_put(qcom_usb->role_sw);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id qcom_pmic_typec_table[] = {
> @@ -253,7 +251,7 @@ static struct platform_driver qcom_pmic_typec = {
>  		.of_match_table = qcom_pmic_typec_table,
>  	},
>  	.probe = qcom_pmic_typec_probe,
> -	.remove = qcom_pmic_typec_remove,
> +	.remove_new = qcom_pmic_typec_remove,
>  };
>  module_platform_driver(qcom_pmic_typec);
>  
