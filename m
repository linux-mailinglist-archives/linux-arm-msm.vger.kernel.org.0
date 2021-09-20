Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC12A41158D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 15:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239668AbhITN0y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 09:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239441AbhITN0n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 09:26:43 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB1DC061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 06:25:16 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id h17so61521463edj.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 06:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fnQFPyNQnVgzXIVUEHXtp70eiyNNUDqOkLiOuvUzb64=;
        b=PnuSR2v6OiCOGSzVEEKQpKpgIhXG5EoZ+Ev0QbiebTaL2dbwvVb3deWYVcwZM04o9S
         fnriGnHJfqDSMvPQY8msyWKDE7s2Tal6Yd9DsyEurT/dPU5e/wceL2vMwXyMJ8zEdpmL
         uAoFR28OgyGd9B7hbDUxKJms5KjQ4iswwzV044IUbEZ6HCIAKv7i7/Ml+fWaLMsoaTo+
         0/TA3XArpGwBy7Scn/n2dQsVSbkXSMwcNxgpNuJJF2XH2Vcxr+6i5DIF5O7LGjlTENdq
         TANahzgWrIu0T9dEIo/SvTufHoeMmqnnTzZ0s0r4ezSSsi6LVs/dw4CwEGAaMh2LS0Hs
         R4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fnQFPyNQnVgzXIVUEHXtp70eiyNNUDqOkLiOuvUzb64=;
        b=bMJbzHzqKHLLa3XGddCToJD4bhD7UnNq8wWOnKPiw1Rmhk39KfuJZYsG+GP5pUej7h
         QWeAXhux8Pqr3vsXe/GR0HWpqoNnMI0ZqSgZ8Xt68MLQWzeQaxk2yO0Pd64pkS9r021j
         ZiNRZT1vGwHE4oq4GfpSeTfYVb3ayJnk8eK71JKXEo4CtkmGdGgdUHk1CrG2b28bU18N
         XJpX1p5Od05Awf9MJ1aXP/2tlNShVCdzkrDqIIr2QTkb8Dt4rrWV/hG7BC+9HTF6iN8L
         foIew2psxSjc4pF//SZNI7JUiPlW9PraBuHm7zER0/UtYFEHqAXJ+9Odxx8ppkRxYaJG
         vZqA==
X-Gm-Message-State: AOAM531Mpj2KYVfLmzXqrFGxknwv9BdrHq6O0unvXQUlsDT90G45hlYy
        rrSXgPjpS55I742zjasQhdVJIw==
X-Google-Smtp-Source: ABdhPJwFRm04TtqLKziX/WoySMiRVV/jdimq1erlSAB7wjzNz7QWT/dYAeSUIh6enE0Nz39x24l/qA==
X-Received: by 2002:a05:6402:c8b:: with SMTP id cm11mr28988017edb.368.1632144313857;
        Mon, 20 Sep 2021 06:25:13 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id dn28sm7045619edb.76.2021.09.20.06.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 06:25:13 -0700 (PDT)
Subject: Re: [PATCH 4/7] ASoC: codecs: lpass-va-macro: Change bulk voting to
 individual clock voting
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
 <1632123331-2425-5-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5f915592-0ca6-2839-43fc-6d9aef1484b7@linaro.org>
Date:   Mon, 20 Sep 2021 14:25:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1632123331-2425-5-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20/09/2021 08:35, Srinivasa Rao Mandadapu wrote:
> Change bulk clock frequency voting to individual voting.
> 
Can you please explain why do we need to move out using clk bulk apis?

Am not seeing any thing obvious behavior changing as part of this patch, 
more details please..
> Fixes: 908e6b1df26e (ASoC: codecs: lpass-va-macro: Add support to VA Macro)

Why this has Fixes tag? Are we fixing any bug with this patch?

> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   sound/soc/codecs/lpass-va-macro.c | 46 ++++++++++++++++++++++++---------------
>   1 file changed, 28 insertions(+), 18 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index d312a14..0ea39ae 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -193,7 +193,10 @@ struct va_macro {
>   
>   	int dec_mode[VA_MACRO_NUM_DECIMATORS];
>   	struct regmap *regmap;
> -	struct clk_bulk_data clks[VA_NUM_CLKS_MAX];
> +	struct clk *mclk;
> +	struct clk *macro;
> +	struct clk *dcodec;
> +
>   	struct clk_hw hw;
>   
>   	s32 dmic_0_1_clk_cnt;
> @@ -1321,7 +1324,7 @@ static const struct clk_ops fsgen_gate_ops = {
>   
>   static int va_macro_register_fsgen_output(struct va_macro *va)
>   {
> -	struct clk *parent = va->clks[2].clk;
> +	struct clk *parent = va->mclk;
>   	struct device *dev = va->dev;
>   	struct device_node *np = dev->of_node;
>   	const char *parent_clk_name;
> @@ -1404,15 +1407,18 @@ static int va_macro_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	va->dev = dev;
> -	va->clks[0].id = "macro";
> -	va->clks[1].id = "dcodec";
> -	va->clks[2].id = "mclk";
>   
> -	ret = devm_clk_bulk_get(dev, VA_NUM_CLKS_MAX, va->clks);
> -	if (ret) {
> -		dev_err(dev, "Error getting VA Clocks (%d)\n", ret);
> -		return ret;
> -	}
> +	va->macro = devm_clk_get_optional(dev, "macro");
> +	if (IS_ERR(va->macro))
> +		return PTR_ERR(va->macro);
> +
> +	va->dcodec = devm_clk_get_optional(dev, "dcodec");
> +	if (IS_ERR(va->dcodec))
> +		return PTR_ERR(va->dcodec);
> +
> +	va->mclk = devm_clk_get(dev, "mclk");
> +	if (IS_ERR(va->mclk))
> +		return PTR_ERR(va->mclk);
>   
>   	ret = of_property_read_u32(dev->of_node, "qcom,dmic-sample-rate",
>   				   &sample_rate);
> @@ -1426,10 +1432,11 @@ static int va_macro_probe(struct platform_device *pdev)
>   	}
>   
>   	/* mclk rate */
> -	clk_set_rate(va->clks[1].clk, VA_MACRO_MCLK_FREQ);
> -	ret = clk_bulk_prepare_enable(VA_NUM_CLKS_MAX, va->clks);
> -	if (ret)
> -		return ret;
> +	clk_set_rate(va->mclk, VA_MACRO_MCLK_FREQ);
> +
> +	clk_prepare_enable(va->mclk);
> +	clk_prepare_enable(va->macro);
> +	clk_prepare_enable(va->dcodec);
>   
>   	base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(base)) {
> @@ -1457,8 +1464,9 @@ static int va_macro_probe(struct platform_device *pdev)
>   	return ret;
>   
>   err:
> -	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
> -
> +	clk_disable_unprepare(va->mclk);
> +	clk_disable_unprepare(va->macro);
> +	clk_disable_unprepare(va->dcodec);
>   	return ret;
>   }
>   
> @@ -1466,8 +1474,10 @@ static int va_macro_remove(struct platform_device *pdev)
>   {
>   	struct va_macro *va = dev_get_drvdata(&pdev->dev);
>   
> -	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
> -
> +	of_clk_del_provider(pdev->dev.of_node);

fsgen clk is registered using devm_* variant of clk apis, so why do we 
need this here?


--srini
> +	clk_disable_unprepare(va->mclk);
> +	clk_disable_unprepare(va->macro);
> +	clk_disable_unprepare(va->dcodec);
>   	return 0;
>   }
>   
> 
