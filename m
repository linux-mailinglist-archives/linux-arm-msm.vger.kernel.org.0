Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9926274EB3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 11:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbjGKJ4r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 05:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbjGKJ4q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 05:56:46 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A6B100
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 02:56:44 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-991fe70f21bso693553766b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 02:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689069403; x=1691661403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=upbOxyXp4mVAYSocF6k5O/9iwv+CSFfSi0xOaanNTa4=;
        b=idihlWGC3A4c4CjRdMzrM2YcUwLnEWwG9hACAZkBBxJUCs3u0k/xuKQFmE9pb6lTK0
         U2waxDrrLAK69sI/Wqr2/h2RJhfGH95QZt+hqUlAtlLfNVq6HyB1x64x3g1fNsmi7Mzn
         LhmJOfiVWmGR12I8tRgKCfRwyyUFRNUgDWiJqCKBAfGW7JVH00xhctQYv7xWtwZpyAsv
         wKBI7jMb0fBpVFZGBwTaAolQNwxg959nHd16lGtB8GpC89BxpQoeevnSTgkyhyNfBPDb
         s63QP7dGyerrqRMHwyd8akVZw6w9V7MTvi6GUsADuu4YPvsSblsBKrkLjz6Vlzd5y9Vo
         oAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689069403; x=1691661403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=upbOxyXp4mVAYSocF6k5O/9iwv+CSFfSi0xOaanNTa4=;
        b=NwQexQb/UGGHrpwCefxGPQmCXKvzfjfo0QuvRULJxvkAMl09ix6JPdydo+apXIO/L1
         IYWFKdUnwnpiSYUVy3RfD5mWXk3v9LNVlWypNd9rjbpFRQsMEtOMQey5d/GR9rMLzdW/
         xa9C8ZIXVHykoINd9YFvJ2bMU2vjlrHIiVP9nbKPUR8/tNRY9fmqt7QEcyupO/lrlcw7
         jqABYhxh1gVfTEf7cZAwQuk2z7/aGy/zyETfzndmnoCU6c4iAfcBvDtMEcR6QwsFAZjS
         cdwE1hYkS0b6rRB1i5KTIBhukn05+LP4vXweT2teYt+DWmPU1YgYHbDWrPt/v02TkRnf
         c4Cw==
X-Gm-Message-State: ABy/qLYEDwi8fvno/ovO9hgCeON4Gvk8wJoLklEhVLJeE634Fn1wFrBw
        0hofCL0Jwc5UGkuJHkXQCu/Wjw==
X-Google-Smtp-Source: APBJJlGL1sUiIdx+PLMzcFRXWj8lfDbCISDCxdOhwpLiqJpYpBhEShWcKu/1tdR3lye2TUZZRjpBAA==
X-Received: by 2002:a17:906:20d8:b0:994:1802:c663 with SMTP id c24-20020a17090620d800b009941802c663mr3021834ejc.8.1689069403033;
        Tue, 11 Jul 2023 02:56:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id x18-20020a170906149200b00989027eb30asm930684ejc.158.2023.07.11.02.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 02:56:42 -0700 (PDT)
Message-ID: <fa2fae05-7ff3-ec6b-45a9-b256b9d5d92c@linaro.org>
Date:   Tue, 11 Jul 2023 11:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/6] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, arnd@arndb.de, geert+renesas@glider.be,
        neil.armstrong@linaro.org, nfraprado@collabora.com,
        rafal@milecki.pl, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org
Cc:     quic_saahtoma@quicinc.com
References: <20230711093529.18355-1-quic_devipriy@quicinc.com>
 <20230711093529.18355-5-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230711093529.18355-5-quic_devipriy@quicinc.com>
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

On 11/07/2023 11:35, Devi Priya wrote:
> Add Networking Sub System Clock Controller(NSSCC) driver for ipq9574 based
> devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig         |    6 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/nsscc-ipq9574.c | 3080 ++++++++++++++++++++++++++++++
>  3 files changed, 3087 insertions(+)
>  create mode 100644 drivers/clk/qcom/nsscc-ipq9574.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 263e55d75e3f..5556063d204f 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -195,6 +195,12 @@ config IPQ_GCC_9574
>  	  i2c, USB, SD/eMMC, etc. Select this for the root clock
>  	  of ipq9574.
>  
> +config IPQ_NSSCC_9574
> +	tristate "IPQ9574 NSS Clock Controller"

I think you do not run arm32 there, so missing depends on ARM64 ||
COMPILE_TEST

> +	depends on IPQ_GCC_9574
> +	help
> +	  Support for NSS clock controller on ipq9574 devices.
> +


Best regards,
Krzysztof

