Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAD56B5621
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 01:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjCKAE6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 19:04:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbjCKAEz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 19:04:55 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8BF1151E1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 16:04:53 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id y14so7058332ljq.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 16:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678493092;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0nQUEM3Mo/qwKczoK7AnFt/+sDF/eJanC0q6vkKReng=;
        b=k0cyTmcp+EpinxlK4oohVCqw4aFXJ5Ze7JLEd0oJ6gyeL4zdyQeycf9eknHIeAywHO
         nVLnGKm1Etkg/uG+vKmqFxsWQOy4Im/xo4pnU4lI0xxzh40etCR16CMVbiSHurs4oRTs
         ZfSm47DBhNvz0szizRcsaPTy9pN13DYuMe352zNHkAsoIog+qGH3zVqJ0G0rbAsUzErz
         KoybY2SDPVj4hM4Fiha/VchNK/zTVTNsoF+fhoEQ058zXV7DiHQ8rtpb9dKXB2UOVLjF
         FxEoAauygxMW1GOYFUT12+VQ+wjukB7EUISOgtCAXpEsIba+rBM6wmqSLWOetnsxDaS3
         Gtvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678493092;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0nQUEM3Mo/qwKczoK7AnFt/+sDF/eJanC0q6vkKReng=;
        b=2th6bs1SDMWunDRNk7C5yva7y9gWmAkHp8W01Y6jnZrDiHs0jEPOSzyCGiCCc+/RcY
         EkHy7buinoKUMeJZMmoF0vrnafVLACXkqDL6IH+/fFbxVrvQMlyZAc8Y1B/puEYLdUWk
         E6k7/n/SJbOzu1da/QPhvfW+sUD+mfejb4YFXIREQ/bXV9fcV44xYY9Jg9CQCVA2CZ8O
         oJMFtsVpDYLnYGoqwGRFIexHQm88e+ZgNoBdIv81yBJBtSYAhGMe4iZ4YsKXeLep87/1
         IAvOzwAreNzudUqX8OpRTWmRzytFnuw2BUIgjEVAeHko2umCOlw62MK6DTjfvQqLooVb
         G3gw==
X-Gm-Message-State: AO0yUKVSH2RrEzrqFWEcUHBZ4ajIvdPBOtXzpAmg3QMLaZe/YuK8jU0q
        qlOaXqb6hwkM1nyjajUV/KZ1M+xos7JsUIepiOM=
X-Google-Smtp-Source: AK7set8Rub8g/i5L5oS7Y6g5pT7fTegGL1L8CLe7ACsepZQzepmtJ1r7KlOUmUJqyAeZPP0KOwtXVw==
X-Received: by 2002:a2e:8750:0:b0:295:c399:68b with SMTP id q16-20020a2e8750000000b00295c399068bmr8483830ljj.23.1678493091819;
        Fri, 10 Mar 2023 16:04:51 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id g13-20020a2ea4ad000000b0029839faa74fsm154680ljm.134.2023.03.10.16.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 16:04:51 -0800 (PST)
Message-ID: <a5f943d0-1653-3269-32c1-d879bc333ded@linaro.org>
Date:   Sat, 11 Mar 2023 01:04:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] soc: qcom: gsbi: mark OF related data as maybe unused
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230310214413.275054-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230310214413.275054-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10.03.2023 22:44, Krzysztof Kozlowski wrote:
> The driver can be compile tested with !CONFIG_OF making certain data
> unused:
> 
>   drivers/soc/qcom/qcom_gsbi.c:117:34: error: ‘tcsr_dt_match’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Shouldn't this driver depend on OF?

Konrad
>  drivers/soc/qcom/qcom_gsbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/qcom_gsbi.c b/drivers/soc/qcom/qcom_gsbi.c
> index 290bdefbf28a..f1742e5bddb9 100644
> --- a/drivers/soc/qcom/qcom_gsbi.c
> +++ b/drivers/soc/qcom/qcom_gsbi.c
> @@ -114,7 +114,7 @@ struct gsbi_info {
>  	struct regmap *tcsr;
>  };
>  
> -static const struct of_device_id tcsr_dt_match[] = {
> +static const struct of_device_id tcsr_dt_match[] __maybe_unused = {
>  	{ .compatible = "qcom,tcsr-ipq8064", .data = &config_ipq8064},
>  	{ .compatible = "qcom,tcsr-apq8064", .data = &config_apq8064},
>  	{ .compatible = "qcom,tcsr-msm8960", .data = &config_msm8960},
