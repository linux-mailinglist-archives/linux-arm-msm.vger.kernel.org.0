Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C54A5712E7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 22:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243786AbjEZUvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 16:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243872AbjEZUvN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 16:51:13 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E611E59
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 13:51:09 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2af2696fd1cso12027361fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 13:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685134267; x=1687726267;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z5AatKw6EtxzG9E4dF0UYt5pzjSCEqOZGHssidQMlz4=;
        b=CFWTVoeRCdniU+x2qGDJhodKgGHp1JKCle+Ga8fFPMpQ7B4BhuvPLNIgT2gNcBWdm/
         rmJ7+zhRGA6CfusOOvkE6UET4zEm7HKXXbh+9AR7VUFcS0AeuvvYB0dTERm7ZO1Z9tnc
         Ea39RjrFKznDv7D/pH8AQScSp3cSmSY6qfHGxmiizl+fCTnqfwLwzekBcTLkIXWr8+nk
         TF0zAPIqz8VKE6uVTAYzgP/RSPXJyH6SwKZgXPHq/6/QyY8TEkLNUQC4bN0/lnh3XQs+
         Oui3IOpPCgrKQs5GJUUM2HLW2rjR1OFZQ+3SlBpjkO8AUkNMsVv7gAwxub1v1K0pVseJ
         0Qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685134267; x=1687726267;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5AatKw6EtxzG9E4dF0UYt5pzjSCEqOZGHssidQMlz4=;
        b=JsNBsB+bSwnB822t6JMxeZm7/zt9C7zfcQAleEQeUnElkImxe/POWA6YF+IL/UiCGK
         kdxOGpQ9f3j5sEevzYlqrKm49MXnYJhMYCmyfWF0W/+E1T4+0RO8VpcILSahZDj+QGVp
         8bSrNA3RZDmnL3O/gsLCONFx5b5Vwg15fRIxkGT1+uMj7rA4yyc05GmxEzHElvXJdwth
         G5wIULVooQWmiK556SPVhthsIe5e9oxU5V0copGIFVG0FKTwVus8G+o6XTqFEYyUJ83R
         F4KnGiGSGy21ybkz/KpZsKh+zzsSGynHEyt0mn4zJkQ+3kRjoiIbbK8/SLDzAzaRVFhx
         7Y6w==
X-Gm-Message-State: AC+VfDwlP0gocjtFqaXk3Prbb2tvDgw+69XUkrEgSoaWJhZUDjC1Vta2
        KMpt1GYGYMlwouaRDGa86dKYi/e7QVDmdGHXMnc=
X-Google-Smtp-Source: ACHHUZ7eoEEQ+WYgy29uaLJ4siKa8UDIyEBc1moLD4g7vHo2xRi2pXCLl62zxT4o/c1z5ryQM/t2NA==
X-Received: by 2002:a2e:9e8e:0:b0:29f:58c6:986e with SMTP id f14-20020a2e9e8e000000b0029f58c6986emr821078ljk.52.1685134267123;
        Fri, 26 May 2023 13:51:07 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id p19-20020a2e9a93000000b002ad8fc8dda6sm935227lji.17.2023.05.26.13.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 13:51:06 -0700 (PDT)
Message-ID: <83465b41-3894-3490-e030-a523073e498f@linaro.org>
Date:   Fri, 26 May 2023 22:51:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] clk: qcom: gcc-ipq6018: update UBI32 PLL
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, andersson@kernel.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230526190855.2941291-1-robimarko@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230526190855.2941291-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 26.05.2023 21:08, Robert Marko wrote:
> Update the UBI32 alpha PLL config to the latest values from the downstream
> QCA 5.4 kernel.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  drivers/clk/qcom/gcc-ipq6018.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
> index 350ead66914ca..abd97b939850f 100644
> --- a/drivers/clk/qcom/gcc-ipq6018.c
> +++ b/drivers/clk/qcom/gcc-ipq6018.c
> @@ -4149,15 +4149,20 @@ static struct clk_branch gcc_dcc_clk = {
>  
>  static const struct alpha_pll_config ubi32_pll_config = {
>  	.l = 0x3e,
> -	.alpha = 0x57,
> +	.alpha = 0x6667,
>  	.config_ctl_val = 0x240d6aa8,
>  	.config_ctl_hi_val = 0x3c2,
> +	.config_ctl_val = 0x240d4828,
> +	.config_ctl_hi_val = 0x6,
>  	.main_output_mask = BIT(0),
>  	.aux_output_mask = BIT(1),
>  	.pre_div_val = 0x0,
>  	.pre_div_mask = BIT(12),
>  	.post_div_val = 0x0,
>  	.post_div_mask = GENMASK(9, 8),
> +	.alpha_en_mask = BIT(24),
> +	.test_ctl_val = 0x1C0000C0,
Please use lowercase hex.

Konrad
> +	.test_ctl_hi_val = 0x4000,
>  };
>  
>  static const struct alpha_pll_config nss_crypto_pll_config = {
