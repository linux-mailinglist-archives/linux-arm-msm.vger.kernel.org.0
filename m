Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCB644407D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 12:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhKCLY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 07:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbhKCLYz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 07:24:55 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2534EC061205
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Nov 2021 04:22:19 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id s13so3047471wrb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Nov 2021 04:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KoBsY/v2YAD1F++lHfydsccb+T5wE0Od+5p17s3OU2Y=;
        b=OXNFVzvq+7nEH4ch8+to3fOVoIMMO2gBiWS8xhy4MCq7yWZtUQBJOUu4Jb6nLeJS+Y
         B/Dkakm3hIhKqUPfR2I4SN/WC8e+78yYmVUZOBEvEF/RfxOXixnTsG1AYGlBjpEo0pcd
         D+msUGoGtZlwXrFYumjvhJkf0ILFoRnMppVcfMWhVCJ9aeDs3O6xZLMO8WEMYFC77P2x
         TOLwQImtGQ/tiKjAKBM9Saj5Vx2gmTmpI+v+n2G0VMr3QkRxWuN0BI5YDHhLrcQs92Nd
         pEvqGYISAQ47iw76UENR4ukRS0PJ8vKZOd7sJpQNPsEK/wXV3gjnmUf2BrJMnY3K1GIC
         At7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KoBsY/v2YAD1F++lHfydsccb+T5wE0Od+5p17s3OU2Y=;
        b=b5dmxzqyqzrCc/lppfpZv1bQvTupyQWCtXyv1Mj/XlqLdlLs8I0dRSwnfZnTN67CaF
         sgXihUUvzOfEeStUFcPR+mMxsd1NRrp9wRykf1ym17SuJFQJL7Kig5c69/CdwNx/IMuQ
         NWNknKHA+EWRnHvQjlVcMcofa0Z54yJxfJ0PQCyRuR9gYpA3qxxBEKQcjrxAvPzDtP8u
         BtpyFxYkSTrNY+cZW+GHTrpJibbpLdvWMZIyJL/6YSmu1Dw0YjPI7BJxTxf2CcOgGGp4
         fCZH5la8ooy9+HJNzgQnuYMmuf5t8vPI/Cf9n+JYXOmrPzETVx1lB1Q6CBp5VucAPX7t
         nNEw==
X-Gm-Message-State: AOAM533i80vC+X+Hy4TgxTrh5cu1gHQ135ZDYZ5KuW2Vs94rvfFRaAnl
        ZybHb8VI6RGkhv8+Q8vfEgbhUA==
X-Google-Smtp-Source: ABdhPJwv+grHB+mZcRA+5mD+6l0sJS48c0xkSjK7q3ekgXs5ZAd7UVU1ZmlJW0S5D07s0h7TMr7rcA==
X-Received: by 2002:a05:6000:120a:: with SMTP id e10mr11955108wrx.156.1635938537706;
        Wed, 03 Nov 2021 04:22:17 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id u5sm1696919wrg.57.2021.11.03.04.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 04:22:17 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] pinctrl: qcom: Update lpass variant independent
 functions as generic
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1635342097-2726-1-git-send-email-srivasam@codeaurora.org>
 <1635342097-2726-2-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <01c32c7f-9639-b3c8-045b-35469a3e54aa@linaro.org>
Date:   Wed, 3 Nov 2021 11:22:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1635342097-2726-2-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Srinivasa,
Thanks for the patches, I think you forgot to add correct mailing list 
for this drivers.

Please consider using scripts/get_maintainer.pl to help you with this list.

On 27/10/2021 14:41, Srinivasa Rao Mandadapu wrote:
> Update pin control variable names to make common for all lpass varients.
> Update bulk clock voting to optional voting as ADSP bypass platform doesn't
> need macro and decodec clocks, these are maintained as power domains and
> operated from lpass audio core cc.

How are you going to ensure that the powerdomains are switched on when 
setting up the pinctrl configuration.

Should we not take a reference to the power-domain in this driver?

--srini
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 2f19ab4..0bd0c16 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -107,7 +107,7 @@ struct lpi_pinctrl {
>   };
>   
>   /* sm8250 variant specific data */
> -static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
> +static const struct pinctrl_pin_desc lpass_lpi_pins[] = {
>   	PINCTRL_PIN(0, "gpio0"),
>   	PINCTRL_PIN(1, "gpio1"),
>   	PINCTRL_PIN(2, "gpio2"),
> @@ -124,7 +124,7 @@ static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
>   	PINCTRL_PIN(13, "gpio13"),
>   };
>   
> -enum sm8250_lpi_functions {
> +enum lpass_lpi_functions {
>   	LPI_MUX_dmic1_clk,
>   	LPI_MUX_dmic1_data,
>   	LPI_MUX_dmic2_clk,
> @@ -203,7 +203,7 @@ static const struct lpi_pingroup sm8250_groups[] = {
>   	LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
>   };
>   
> -static const struct lpi_function sm8250_functions[] = {
> +static const struct lpi_function lpass_functions[] = {
>   	LPI_FUNCTION(dmic1_clk),
>   	LPI_FUNCTION(dmic1_data),
>   	LPI_FUNCTION(dmic2_clk),
> @@ -228,12 +228,12 @@ static const struct lpi_function sm8250_functions[] = {
>   };
>   
>   static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
> -	.pins = sm8250_lpi_pins,
> -	.npins = ARRAY_SIZE(sm8250_lpi_pins),
> +	.pins = lpass_lpi_pins,
> +	.npins = ARRAY_SIZE(lpass_lpi_pins),
>   	.groups = sm8250_groups,
>   	.ngroups = ARRAY_SIZE(sm8250_groups),
> -	.functions = sm8250_functions,
> -	.nfunctions = ARRAY_SIZE(sm8250_functions),
> +	.functions = lpass_functions,
> +	.nfunctions = ARRAY_SIZE(lpass_functions),
>   };
>   
>   static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
> @@ -615,7 +615,7 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>   				     "Slew resource not provided\n");
>   
> -	ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> +	ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Can't get clocks\n");
>   
> 
