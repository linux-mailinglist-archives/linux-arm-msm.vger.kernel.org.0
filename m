Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4270769D3C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Feb 2023 20:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbjBTTF1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Feb 2023 14:05:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232369AbjBTTF0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Feb 2023 14:05:26 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929EB2005F
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 11:04:54 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id m7so2780952lfj.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 11:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pYnwwipOKcP9VV67HrsoyWSp6J/x+KVnjTvz5fJnpQ8=;
        b=hNjlBbhJMiYGCJxeLmjeuO5nWdsApC/lQnDvLh7Whr2cM4Wsty9mGSXoFm6cilThas
         2WzVVeg4Yoppjqyju6gkXao3htL1TjkDN5q8VJQSQpDSPSmMyzoZLEBKIC1DHuQWBURd
         dLKV9g6cp58hqzl4xy2Jj7hcMTvJGPL9U+9DUVpz3tpdqOPbjnP3WOpU1L1DK6b+1/to
         4jNAy6t9L9Ph51lIWvDGZn7zybjX2bqApgMmHiBVEUtrryI6iRdNRhpDrzQutBezdcCe
         5ZZsBIt68GdmVFMu90CRCOt+Dm0UOsZW5aloYFKv+OD+8X8a2/8Yk+Ye3hkotD+Sqmk0
         0LdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pYnwwipOKcP9VV67HrsoyWSp6J/x+KVnjTvz5fJnpQ8=;
        b=V7SiyVmA628y8QRozUgbovp34ythPWz56KEXWpQO5nxbdnZx56AZL6fGKrHAgsAJ41
         x8Q/G+BkVdLTrEbwUaxNX2ECmjND9MXYr05Bb1OHSDNu2ELbfd2zqq6EkSGJHUzH6Pp4
         iodF78bh2lh1YU3ZnnXYNyLaJ6S6XF1b5gY8MQDzX/IUUOEqQa4QQ3awn4DAfGGDRCQr
         tyui+G2cG+4iLz8o5IxivlFw31LYV8QXJuqqbPP6YKZUR4odPEH+2p3d63mouDhI4A+c
         CoL1MCYfcPj62iftqgMOq9aIvARnOdSag1WpRIEy4w0KdDHciFp4Uyhu0LZ4ghKZCxjF
         O0Ig==
X-Gm-Message-State: AO0yUKWNM36N5fyE5a3tNCelGm1qVA59v09j5BN56OLj4DO5McrmbxDY
        HD8UsbZpqert8cLUXHHcLmlSG90AqxT6p67G
X-Google-Smtp-Source: AK7set9cHW4Y07yIYoVQsiim3wKDzuK56ezM7MttmHftlPmKS6WvsHo3n5aqevgXm1oPinngv5gABQ==
X-Received: by 2002:a19:7006:0:b0:4dc:807a:d139 with SMTP id h6-20020a197006000000b004dc807ad139mr225188lfc.69.1676919830850;
        Mon, 20 Feb 2023 11:03:50 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
        by smtp.gmail.com with ESMTPSA id h20-20020a197014000000b004b50b4f63b7sm1597768lfc.170.2023.02.20.11.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 11:03:50 -0800 (PST)
Message-ID: <16950676-fef9-a3a0-0855-e4e6637711dd@linaro.org>
Date:   Mon, 20 Feb 2023 20:03:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 8/9] soc: qcom: rpmpd: Hook up VDDMX as parent of
 SM6375 VDDGX
Content-Language: en-US
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20230213143524.1943754-1-konrad.dybcio@linaro.org>
 <20230213143524.1943754-9-konrad.dybcio@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230213143524.1943754-9-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.02.2023 15:35, Konrad Dybcio wrote:
> The GPU core clock requires that both VDDGX and VDDMX domains are scaled
> at the same rate at the same time (well, MX just before GX but you get
> the idea). Set MX as parent of GX to take care of that.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/soc/qcom/rpmpd.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> index 2027c820caa7..2669c9210754 100644
> --- a/drivers/soc/qcom/rpmpd.c
> +++ b/drivers/soc/qcom/rpmpd.c
> @@ -216,11 +216,13 @@ static struct rpmpd gfx_s2b_vfc = {
>  	.key = KEY_FLOOR_CORNER,
>  };
>  
> +static struct rpmpd mx_rwmx0_lvl;
>  static struct rpmpd gx_rwgx0_lvl_ao;
>  static struct rpmpd gx_rwgx0_lvl = {
>  	.pd = { .name = "gx", },
>  	.peer = &gx_rwgx0_lvl_ao,
>  	.res_type = RPMPD_RWGX,
> +	.parent = &mx_rwmx0_lvl.pd,
>  	.res_id = 0,
>  	.key = KEY_LEVEL,
>  };
> @@ -228,6 +230,7 @@ static struct rpmpd gx_rwgx0_lvl = {
>  static struct rpmpd gx_rwgx0_lvl_ao = {
>  	.pd = { .name = "gx_ao", },
>  	.peer = &gx_rwgx0_lvl,
> +	.parent = &mx_rwmx0_lvl.pd,
This should have been mx_rwmx0_lvl_ao.pd.

Konrad
>  	.active_only = true,
>  	.res_type = RPMPD_RWGX,
>  	.res_id = 0,
