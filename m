Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E592715A49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 11:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjE3Jgd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 05:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbjE3JgP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 05:36:15 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1492F11C
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 02:36:12 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2af2b74d258so44739521fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685439370; x=1688031370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QSUpm3/kHitKHIXTkMpVUuYD6zV358mNlZy1Pw8cixM=;
        b=eiEr/MUuXHMH+B06zqSRgv42erPKMAj9Kx7w2rZzcp4nobfc3K048jWMZ6fDFJfPoK
         ejzb1MhduHHuqF7qeVrAMH9ReQKlWVpyY/jHgMSrmhZXSq//xbDeIszHR7plCUiuUk6Q
         mB2LsUOQuyD2IOR9sbU0TqQ1q98GGIGZP+DzsiZIUTFMVMpvVMI6QzJ+x+4YKuJqXc2n
         zLhh8tC/UG9m/l/+ErMPijBdFB4jnnvtaENg+T7XfZYc95gmZ7fnIaq+eM8dMKoLIhXW
         9hLPUbsbVwaQgcU03vnEjtQXlECdjwzywct8uf+gw4nzJLtGkt3jP7A0ox4XILvb9y5s
         nhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685439370; x=1688031370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSUpm3/kHitKHIXTkMpVUuYD6zV358mNlZy1Pw8cixM=;
        b=aizKvc07WDvjgFPm9cdvy1leTq5ZHBaA07DWzdY2imAtjtMPATpV1liyokagcouvW0
         +CikWsyy2lPsr/bSn51z3UEx92PT20cpCR1SuYUkI6XajWYjCRGV9lJy3tP4NZSpokxM
         fJTQ1IJscOp2OyJY1SCa1py1G5/M3Gpr+LY3SCoTW19EipA3Ip2m9YE4NAswq9wOcfEA
         gO2mEPL4oYfU+YcAWsHJgSZ9c6qkoDxfZWWlhAW4BhiGJfh+lVbBLbg6o4fnbyeVQZc0
         iyG+V4K4LV5/fQ2+uouFm9WkWCZLQWVLjgJXHjZa61mDRjVG6wffbQ3r7DlREu6D6kQZ
         rBtg==
X-Gm-Message-State: AC+VfDx3/PYQd+ER1JsfgPJNvGDA5dEMv7OHOP1WLgP2DlUaec7I3EMi
        xgZWWaZ/7ReEj0n0nTQtVFCZyg==
X-Google-Smtp-Source: ACHHUZ4tCAl6cvbdjWTI7/zfy8x3QXYa2qQO3s7DQVmQFB/T0fJOaknRaI1yYbkdD+4GwTgultZbig==
X-Received: by 2002:a2e:3e01:0:b0:2b0:4953:e535 with SMTP id l1-20020a2e3e01000000b002b04953e535mr509158lja.19.1685439370299;
        Tue, 30 May 2023 02:36:10 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id c10-20020a2e9d8a000000b002af03f75edasm2775171ljj.80.2023.05.30.02.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 02:36:09 -0700 (PDT)
Message-ID: <d3e6a788-ecab-dd12-f091-279157ea3ad5@linaro.org>
Date:   Tue, 30 May 2023 11:36:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/2] Input: pm8941-powerkey - fix debounce on gen2+ PMICs
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20230529-pm8941-pwrkey-debounce-v1-0-c043a6d5c814@linaro.org>
 <20230529-pm8941-pwrkey-debounce-v1-2-c043a6d5c814@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230529-pm8941-pwrkey-debounce-v1-2-c043a6d5c814@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29.05.2023 21:55, Caleb Connolly wrote:
> Since PM8998/PM660, the power key debounce register was redefined to
> support shorter debounce times. On PM8941 the shortest debounce time
> (represented by register value 0) was 15625us, on PM8998 the shortest
> debounce time is 62us, with the default being 2ms.
> 
> Adjust the bit shift to correctly program debounce on PM8998 and newer.
> 
> Fixes: 68c581d5e7d8 ("Input: add Qualcomm PM8941 power key driver")
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
> This patch shouldn't be backported earlier then 5.4, as that is the
> first kernel with support for PM8998.
> ---
>  drivers/input/misc/pm8941-pwrkey.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
> index b6a27ebae977..74d77d8aaeff 100644
> --- a/drivers/input/misc/pm8941-pwrkey.c
> +++ b/drivers/input/misc/pm8941-pwrkey.c
> @@ -50,7 +50,10 @@
>  #define  PON_RESIN_PULL_UP		BIT(0)
>  
>  #define PON_DBC_CTL			0x71
> -#define  PON_DBC_DELAY_MASK		0x7
> +#define  PON_DBC_DELAY_MASK_GEN1	0x7
> +#define  PON_DBC_DELAY_MASK_GEN2	0xf
> +#define  PON_DBC_SHIFT_GEN1		6
> +#define  PON_DBC_SHIFT_GEN2		14
mask+shift -> field_prep/get?

Nice find!

Konrad
>  
>  struct pm8941_data {
>  	unsigned int	pull_up_bit;
> @@ -247,7 +250,7 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
>  	struct device *parent;
>  	struct device_node *regmap_node;
>  	const __be32 *addr;
> -	u32 req_delay;
> +	u32 req_delay, mask, delay_shift;
>  	int error;
>  
>  	if (of_property_read_u32(pdev->dev.of_node, "debounce", &req_delay))
> @@ -336,12 +339,20 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
>  	pwrkey->input->phys = pwrkey->data->phys;
>  
>  	if (pwrkey->data->supports_debounce_config) {
> -		req_delay = (req_delay << 6) / USEC_PER_SEC;
> +		if (pwrkey->subtype >= PON_SUBTYPE_GEN2_PRIMARY) {
> +			mask = PON_DBC_DELAY_MASK_GEN2;
> +			delay_shift = PON_DBC_SHIFT_GEN2;
> +		} else {
> +			mask = PON_DBC_DELAY_MASK_GEN1;
> +			delay_shift = PON_DBC_SHIFT_GEN1;
> +		}
> +
> +		req_delay = (req_delay << delay_shift) / USEC_PER_SEC;
>  		req_delay = ilog2(req_delay);
>  
>  		error = regmap_update_bits(pwrkey->regmap,
>  					   pwrkey->baseaddr + PON_DBC_CTL,
> -					   PON_DBC_DELAY_MASK,
> +					   mask,
>  					   req_delay);
>  		if (error) {
>  			dev_err(&pdev->dev, "failed to set debounce: %d\n",
> 
