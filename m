Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 246DC6FA13A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 09:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjEHHmW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 03:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233422AbjEHHmV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 03:42:21 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488FB100D0
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 00:42:19 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4efe8991b8aso4818147e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 00:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683531737; x=1686123737;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gffsMC5tKiPhlpHpP8KgpHzg+d0NHyCkcFBsaTzuAQk=;
        b=h08IenH+ZC6UY+utZkFK6hbkNrEySaynLsS0kzHezKew1D9ubuvA3WyAaIip9xgG3V
         9NgA1Ph2fnzjbMR7ExoYzQ1I/G6r689nJRFQsqXJI4k1wnscu8ZeBbzR9dnhkb/RBuyV
         vZ/n9oTkage/jBtwAdv/+sWEY3q3nWPJNttd1I86e5gSWirb8A4GbYb6bW33SmqBy+bE
         XU+PwuONFDkSz/X33cubQF4iluIFBvV9As6Mgu0V6WvXlTh8/7GZGJdz/rnhFiVlsBBS
         MPm6o82B1hoT9k/vBYAqdAKRYu0A+2ZgLEEEH3XEq662PRgVt+4N/O/uqTWavqNO98oe
         Tw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683531737; x=1686123737;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gffsMC5tKiPhlpHpP8KgpHzg+d0NHyCkcFBsaTzuAQk=;
        b=lJiiW2k6pG12ZbnyNXIU2+bcqc7ShWld0qDdC8lcVinBlWOBa2owHc1om03X6q3z6M
         +jq035912qQR9K0iBT+B0W7d/FvfSQFW3LcBNqdqbUBx22gk7n4qb5ZZ5DGFi7jTq3U0
         SrUmrQvwtRDyvw2xd4Eo3Cs6ncw4yyDbah64HpXdIZXvuPEEfOoAPOvSa6sDAo6nqB3A
         IkE/5zWWU9HYOBfyUWSDvSwmpuDwbQDP2ldQ4wqvVbBLlHuAGhGOb8nyIO8rVmv/2z1p
         IGndBmnJgnKpggzlpuCowTNnptOzGfk3ePLNuOlczfIym/IZfOPDRWxQmcrtwPUdw7oR
         QIFw==
X-Gm-Message-State: AC+VfDy1FhnaNfP6CxaDfmHxlUopEB9YZe9dM+QxUpd37lpTEpHoYLCB
        r4N/4HSsHqT4YsrHxFkBY1/faA==
X-Google-Smtp-Source: ACHHUZ63TYuPvAGlamFDwVqcicngnKW3teRc1FlxvNTT7nNCGhrKNee4AHg5RFHuhOMeUCOPmqH/bA==
X-Received: by 2002:ac2:4357:0:b0:4ec:8e7e:46f1 with SMTP id o23-20020ac24357000000b004ec8e7e46f1mr2358472lfl.66.1683531737490;
        Mon, 08 May 2023 00:42:17 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id a17-20020ac25211000000b004f002961a96sm1203912lfl.230.2023.05.08.00.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 00:42:17 -0700 (PDT)
Message-ID: <39f89f7d-77e2-3f73-940d-1891008279bc@linaro.org>
Date:   Mon, 8 May 2023 09:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 5/6] soc: qcom: ocmem: Add support for msm8226
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230506-msm8226-ocmem-v1-0-3e24e2724f01@z3ntu.xyz>
 <20230506-msm8226-ocmem-v1-5-3e24e2724f01@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230506-msm8226-ocmem-v1-5-3e24e2724f01@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.05.2023 11:12, Luca Weiss wrote:
> The msm8226 SoC also contains OCMEM but with one region only.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soc/qcom/ocmem.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
> index 6235065d3bc9..d5892ce999c9 100644
> --- a/drivers/soc/qcom/ocmem.c
> +++ b/drivers/soc/qcom/ocmem.c
> @@ -413,12 +413,18 @@ static int ocmem_dev_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct ocmem_config ocmem_8226_config = {
> +	.num_regions = 1,
> +	.macro_size = SZ_128K,
> +};
> +
>  static const struct ocmem_config ocmem_8974_config = {
>  	.num_regions = 3,
>  	.macro_size = SZ_128K,
>  };
>  
>  static const struct of_device_id ocmem_of_match[] = {
> +	{ .compatible = "qcom,msm8226-ocmem", .data = &ocmem_8226_config },
>  	{ .compatible = "qcom,msm8974-ocmem", .data = &ocmem_8974_config },
>  	{ }
>  };
> 
