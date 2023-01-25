Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFBA67AD32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 10:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234844AbjAYJDR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 04:03:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235260AbjAYJDH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 04:03:07 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C096ECC1E
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:02:47 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ss4so45612120ejb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CXeCYzMZdHlOowH7OuNx8RgAvuvHYBPsScMx04fOpZg=;
        b=vcIv9Y64XEGo09bA0mU16yRuI5X4hqMPGY6isbMqJYiu/V5vXZmjYg02OL4H+H9adS
         ao0kZ4CdLjh9kK5BPqinueGq8+HYhu5z93koSDzdiTFhki3GofPfDcZxq6qbzV0WLqlV
         f4bD5+CC3jRTGb+i7H3wjtgq+W1beaAgztTdJ0nrjcdCrWfoN3BRpdZ69g4cjuPNY2Oz
         i5HkcMts5uXEW4I4VYV24ABD+bp3Vh0St2sFTOH1a2cOHJoaHi/CLZy+Gm4Ri0JrbZdE
         zFWF/9gya7ufTHemculuN5lL2KGju1PaQXNjGb1FAOOAe5GA3fs3dauZogVpCwFMxW2f
         aTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXeCYzMZdHlOowH7OuNx8RgAvuvHYBPsScMx04fOpZg=;
        b=AhXY19tn8a6OHjjZ/wvXKmu3793+0tUQFesgiekxLcZXq+gDaqDNkE932PWq3GHaXU
         AbCX0gOQgH9Sv8seiTnp9c0MbUAGUfjwGI1MC2+DIg8jBZ5rGpGmDILjyhBxp9eGQPfO
         5Hw8RZCvB4YucNp0kJKFxD9am9v9SgQLRoQeUoWtDmodDFJL+2OuWhvYLvTVFMchbyY/
         CoWHxCHMvZJPoo5gyG9DsoYGqqKkx2KI3ocYvG4vjU0cwYlQxS5y5uJSAS371nc5lsd/
         9tAn3fZJDK/ITwCAVs2jug6OZ9h9G86Td4dzzSJ4s+UJbdr3/hiAeGZ2j9U8jX6yF1VZ
         0xgg==
X-Gm-Message-State: AFqh2kr/T5YvVkGYFB93pzKPPHmwVy4O/ITyYtn20UHYwt7X3ZXBfx61
        6Q6dhSxOFecxdu01wt6x8gCJmw==
X-Google-Smtp-Source: AMrXdXur1bTvNUgeXSfPs6pIk27Hd+iLD/aXSmGQ5xjftXsdD/iogZQazZe/hBxa8lVmhjoTv31i+Q==
X-Received: by 2002:a17:906:2c49:b0:7c0:fd1e:972e with SMTP id f9-20020a1709062c4900b007c0fd1e972emr35089828ejh.46.1674637366198;
        Wed, 25 Jan 2023 01:02:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t17-20020a170906949100b0073022b796a7sm2101711ejx.93.2023.01.25.01.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:02:45 -0800 (PST)
Message-ID: <32f36ec1-3f40-d12c-43e4-69862cd37606@linaro.org>
Date:   Wed, 25 Jan 2023 11:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/7] soc: qcom: rpmpd: Remove SoC names from RPMPD names
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, linux-kernel@vger.kernel.org
References: <20230125032728.611640-1-konrad.dybcio@linaro.org>
 <20230125032728.611640-5-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230125032728.611640-5-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 25/01/2023 05:27, Konrad Dybcio wrote:
> SoC names were used only to distinguish between defines. That made
> reusing them messy and often times, the same RPM power domains were
> defined multiple times. Assign descriptive, SoC-independent names to
> each RPMPD description struct and remove duplicate definitions.
> 
> Bloat-o-meter results:
> Total: Before=133713, After=74201, chg -44.51%
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/soc/qcom/rpmpd.c | 763 +++++++++++----------------------------
>   1 file changed, 205 insertions(+), 558 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> index a69182618b76..9fff40527f9e 100644
> --- a/drivers/soc/qcom/rpmpd.c
> +++ b/drivers/soc/qcom/rpmpd.c
> @@ -69,50 +69,50 @@ struct rpmpd_desc {
>   static DEFINE_MUTEX(rpmpd_lock);
>   
>   /* mdm9607 RPM Power Domains */
> -static struct rpmpd mdm9607_vddcx_ao;
> -static struct rpmpd mdm9607_vddcx = {
> +static struct rpmpd cx_s3a_lvl_ao;
> +static struct rpmpd cx_s3a_lvl = {
>   	.pd = { .name = "vddcx", },
> -	.peer = &mdm9607_vddcx_ao,
> +	.peer = &cx_s3a_lvl_ao,
>   	.res_type = RPMPD_SMPA,
>   	.res_id = 3,
>   	.key = KEY_LEVEL,
>   };
>   
> -static struct rpmpd mdm9607_vddcx_ao = {
> +static struct rpmpd cx_s3a_lvl_ao = {
>   	.pd = { .name = "vddcx_ao", },
> -	.peer = &mdm9607_vddcx,
> +	.peer = &cx_s3a_lvl,
>   	.active_only = true,
>   	.res_type = RPMPD_SMPA,
>   	.res_id = 3,
>   	.key = KEY_LEVEL,
>   };
>   
> -static struct rpmpd mdm9607_vddcx_vfl = {
> +static struct rpmpd cx_s3a_lvl_vfl = {

As you are already adding _lvl to the name, _lvl_floor might be betther 
than _lvl_vfl.

>   	.pd = { .name = "vddcx_vfl", },
>   	.res_type = RPMPD_SMPA,
>   	.res_id = 3,
>   	.key = KEY_FLOOR_LEVEL,
>   };

[skipped]

-- 
With best wishes
Dmitry

