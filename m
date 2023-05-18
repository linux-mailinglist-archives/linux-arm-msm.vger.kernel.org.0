Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 008A0707D6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 11:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbjERJ5p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 05:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbjERJ5n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 05:57:43 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA05D10CA
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 02:57:40 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2af1c884b08so1345481fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684403859; x=1686995859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NG81Hvhp9Jezbz57sI5ty/V2MncOzknsBAnNjODvXNA=;
        b=QYRU1OuSfJALtMZbzZJcWOzE/EUpPp5XHN32GeUBGSqA0qFvrN8OEjIvlnn8ZdZc0w
         hf6CvAEGrssbe0tpBeeFgKLnRvB+7d/Kl+45c3FHENhJmp1KgWLxDcwgAR5cQayXjs+Z
         FSvrXb6Ulg1vVUkXilSIMtK95cDtN4UDtz+5Pw7gwTrKOBXbRtNnp0Yc6jAkuDmRhtPC
         46grWegzyv8+5zDjTHWnjhx2uzZMA3lRgTDA80RA7OHCH9Exw+vC91NJSeER33S2SVLn
         gd1cAEAEsNSD2RU4ZREFNcmKKPPsCl9e4eCCQQtZ/wxbw3pkRelCiISmqV59iYI8OpJu
         PZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684403859; x=1686995859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NG81Hvhp9Jezbz57sI5ty/V2MncOzknsBAnNjODvXNA=;
        b=NnAZyj8VYJJ1luMiOALuP6/5e5zHy6pXmDGd6eR4pZwSlRkHhdPnbf+WR5RGpAWd1o
         KH76lLICM/7eRkP9JQ8whxGT7yn/bBPE/APczBLb1qMZD0r5lErc85vQmbtYfJcBdZOe
         STo7d6+tDAhbu4PBGKBZlG4Wuhn/zDw92R+XhOeQSYgKFUMEGXB1FzIaMr2Rpb6tbju6
         M0V5P3KdTt9bIp4TjctvGOWFXdSs4bs/LfPERTZA7b806uZvh67/+wOKmLZd3v20w9JE
         ZVTy/kIDiYdhEAyTJq/1vIBKHVBHRqzfeUID8eaD4waAB9M1XWBjZK5GA3r/p9Ir1N9o
         W22A==
X-Gm-Message-State: AC+VfDzIEHJoFKzaW91r4cl22Zs3TtRuVPJOfz9lCfiLk1QroJno5T8G
        k6+LBgJAW5ObSJ0y0f2lM/TpsA==
X-Google-Smtp-Source: ACHHUZ4lC3/7Pro9CW/fHIqUqGj2sbVcmgowiYOEovSX41gP8cjF3fT5zknO5kTxsircC8umKQTVNg==
X-Received: by 2002:a2e:a4a6:0:b0:2a8:ea26:5c72 with SMTP id g6-20020a2ea4a6000000b002a8ea265c72mr2138143ljm.8.1684403858977;
        Thu, 18 May 2023 02:57:38 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id y7-20020a2e9d47000000b002a8d01905f7sm201013ljj.101.2023.05.18.02.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 02:57:38 -0700 (PDT)
Message-ID: <c811fe35-0930-ea38-5afa-0fceb8ee1837@linaro.org>
Date:   Thu, 18 May 2023 11:57:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 86/97] usb: misc: eud: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-87-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230517230239.187727-87-u.kleine-koenig@pengutronix.de>
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
>  drivers/usb/misc/qcom_eud.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index b7f13df00764..0dc414463759 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -217,7 +217,7 @@ static int eud_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int eud_remove(struct platform_device *pdev)
> +static void eud_remove(struct platform_device *pdev)
>  {
>  	struct eud_chip *chip = platform_get_drvdata(pdev);
>  
> @@ -226,8 +226,6 @@ static int eud_remove(struct platform_device *pdev)
>  
>  	device_init_wakeup(&pdev->dev, false);
>  	disable_irq_wake(chip->irq);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id eud_dt_match[] = {
> @@ -238,7 +236,7 @@ MODULE_DEVICE_TABLE(of, eud_dt_match);
>  
>  static struct platform_driver eud_driver = {
>  	.probe	= eud_probe,
> -	.remove	= eud_remove,
> +	.remove_new = eud_remove,
>  	.driver	= {
>  		.name = "qcom_eud",
>  		.dev_groups = eud_groups,
