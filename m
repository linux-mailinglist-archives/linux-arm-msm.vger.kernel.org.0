Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05719761BDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 16:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbjGYOgN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 10:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbjGYOgM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 10:36:12 -0400
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE961E9
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 07:36:10 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-314417861b9so4330112f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 07:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690295709; x=1690900509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xfNNK+Jw74jqrCAqxAeojiuG95OBtByVK1mJKH9RnMw=;
        b=T5/5jtv9F/jWpWOT82LpZO4nTcLi+t+ir+tG32DTdSqXgkhfQuP28GdKPI16whdPPJ
         IC81DAp8VwqRqXJex6Swdwjn2z19Abfpw+R5ZHVoasb2HmgCxUgloPdQywMhJoB3RWYL
         Mg+QFkw2H/qC8F9BjVLqOz44thN6Cc/iP09xxWyE6uYqbybGslxojDgp9NSic5O7srys
         LPfc449MuH6D5leaBxwZsV/jaEPDxSrIGTXpKF//HneoCWl++HRl85i615gGD2A1BjVw
         KoFiOtq1bTq75L3/qCCGfaP0ZJ7gIuc85u3ki/MW380x+S6h+SStPT4+i5f3I8B73vuW
         11XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690295709; x=1690900509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfNNK+Jw74jqrCAqxAeojiuG95OBtByVK1mJKH9RnMw=;
        b=kvfATK8Ie/3IuT35OGD1i1WDGOr/fXjpZVYln8aW9Cdq5uEY/CbU7GRa96OUDX+6AN
         ncJC8W9VOWHqZPtQYCskDNsfPQBT01iumGIpseXyWUyEdC+ONhKE4BQAhIT421OcgpvB
         +yxtdn3tWt+QGfq/P/m1Uly/Uhe5noPVG9d84K5vSZ7kh41XzNZ05SPhmnTL3nIhaL0f
         Fzu7I2nbmUJ66OPmzv0uIT/Qgi8cbgLWc0aZpvLmo8qo9gQ6T0bw5IDyZbxvOrR2JRfr
         0mJIMruhCm70cd2bHMjOx2WrPKe5rYYOM11ODjgLEdkUMOnqA9wn6asUKvcIwQcEfaZe
         d6jA==
X-Gm-Message-State: ABy/qLYsNsT6Bj9PT0Ndji0nkFKgxNvTEXPZcKr0zFVm1Vg6/aG7TtKR
        JqctusyyXT/LeZT1FG+gWLXwdw==
X-Google-Smtp-Source: APBJJlFiVPhfb1GfgNtwVodItt0v4QcSUUEBiKLz58kaCDmEyFPmbNi36CHoHy1qhesBw6bJU2XfDw==
X-Received: by 2002:a5d:50c6:0:b0:317:5b5f:3348 with SMTP id f6-20020a5d50c6000000b003175b5f3348mr5461667wrt.71.1690295709150;
        Tue, 25 Jul 2023 07:35:09 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j9-20020a5d4529000000b0030fd03e3d25sm16550394wra.75.2023.07.25.07.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 07:35:08 -0700 (PDT)
Message-ID: <e26e1738-73fb-77e0-3600-063ef5b9e083@linaro.org>
Date:   Tue, 25 Jul 2023 15:35:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] usb: typec: qcom: fix return value check in
 qcom_pmic_typec_probe()
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        gregkh@linuxfoundation.org, caleb.connolly@linaro.org
References: <20230725125319.565733-1-yangyingliang@huawei.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230725125319.565733-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2023 13:53, Yang Yingliang wrote:
> device_get_named_child_node() returns NULL, if it fails, replace
> IS_ERR() with NULL pointer check.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
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

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
