Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84277666525
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 21:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbjAKU56 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 15:57:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbjAKU55 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 15:57:57 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7202D60DC
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:57:55 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id o7so16965281ljj.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0xPaw/Uyv/k7eUrz3wz2tQnGPVLOhSDaCGzsFiBw08=;
        b=PHIrZLjfwQAfYFzBCB3qVyPbnK1UiAST6v9IF2VJ6YKqoAC01RRoqjljm6PRgbRZDd
         ypU2+ap8fjPZFZe3s8HzwEjsudpvb01z4yudhBAF4KidIwbrCefrHsHfJnYlp76AeMHE
         0VKnSp4Lxa+VwFicuaHHWuQBNumLGAAtDqtRyqBeok+kxVXJX95Q/S/BWzYv5J/DjQld
         Rv3wZBgf4V3QdRSXsVuQ1LVHHq0jFC899VORqneigPbZtC091iHHy1BZ05rSoyVaxT2K
         zzpsd7gsKdnkck7tMdLoYTLZj6wVxiBlB3kS5/OuR5NYwwBpJwhHMnQNTRWjajhIrrG5
         vKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0xPaw/Uyv/k7eUrz3wz2tQnGPVLOhSDaCGzsFiBw08=;
        b=LfrVI8yzAxLbQS1xblE8i9LtwMOhxbavr/xqfQP8OZbSeI6e04Km0ZYfoPqcLZ8W6H
         wTJoUQmHSZGEKUQMt/7Y8PMzfHprG1ELg8WaFLpQJg1HdHoEzW/DmWoD3DZwqQOxUtE4
         b0jU9+GUldvJzyySIUoyDYhD9aA1yKlAxj8L14iEIeJ5PRd9XiJ7dEG/3FYnYuNvBQXR
         xFeXPzP9izopm0LkGMkDqEAAFjwMvsG9JoDKvzqX5ZQyxEvOuVa6A5QAQDi4zyAH1QHl
         7iDkEaQkAOLUMO96cEaFz4yXCnIrLDkkMTwPzXRdV8nifR/wuW2D05dovl5vcvOZ8kbr
         aWhA==
X-Gm-Message-State: AFqh2koGQAZyIYFdZG9GJCG95wSl+fBpg5m1dq+gW2pxFqfTjB2AbXYX
        Xop6gPXUPTsgTcRUolX/vG7O7A==
X-Google-Smtp-Source: AMrXdXsEzTvPWySwtT0sjwtm3wmAb+qXxyrINFUu3Oi/DvpWybE9NFSsVAgUYtI6XN9ic879EQiMrQ==
X-Received: by 2002:a2e:82cd:0:b0:27a:c0f:30be with SMTP id n13-20020a2e82cd000000b0027a0c0f30bemr18932726ljh.35.1673470673802;
        Wed, 11 Jan 2023 12:57:53 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id t5-20020a05651c204500b0027ff129de9fsm1889764ljo.24.2023.01.11.12.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 12:57:51 -0800 (PST)
Message-ID: <cdf3b086-2fed-0207-f018-a21bab54faf2@linaro.org>
Date:   Wed, 11 Jan 2023 21:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 02/13] clk: qcom: cpu-8996: correct PLL programming
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
 <20230111192004.2509750-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230111192004.2509750-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11.01.2023 20:19, Dmitry Baryshkov wrote:
> Change PLL programming to follow the downstream setup.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-cpu-8996.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index ee76ef958d31..ed8cb558e1aa 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -93,12 +93,9 @@ static const u8 prim_pll_regs[PLL_OFF_MAX_REGS] = {
>  static const u8 alt_pll_regs[PLL_OFF_MAX_REGS] = {
>  	[PLL_OFF_L_VAL] = 0x04,
>  	[PLL_OFF_ALPHA_VAL] = 0x08,
> -	[PLL_OFF_ALPHA_VAL_U] = 0x0c,
>  	[PLL_OFF_USER_CTL] = 0x10,
> -	[PLL_OFF_USER_CTL_U] = 0x14,
>  	[PLL_OFF_CONFIG_CTL] = 0x18,
>  	[PLL_OFF_TEST_CTL] = 0x20,
> -	[PLL_OFF_TEST_CTL_U] = 0x24,
>  	[PLL_OFF_STATUS] = 0x28,
>  };
>  
> @@ -106,8 +103,10 @@ static const u8 alt_pll_regs[PLL_OFF_MAX_REGS] = {
>  
>  static const struct alpha_pll_config hfpll_config = {
>  	.l = 60,
> -	.config_ctl_val = 0x200d4aa8,
> +	.config_ctl_val = 0x200d4828,
>  	.config_ctl_hi_val = 0x006,
> +	.test_ctl_val = 0x1c000000,
> +	.test_ctl_hi_val = 0x00004000,
>  	.pre_div_mask = BIT(12),
>  	.post_div_mask = 0x3 << 8,
>  	.post_div_val = 0x1 << 8,
