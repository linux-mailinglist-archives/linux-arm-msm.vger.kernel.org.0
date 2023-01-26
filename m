Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5F1067D0C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 17:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbjAZQBM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 11:01:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbjAZQBL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 11:01:11 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9067D4F35C
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 08:01:10 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id j17so1471138wms.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 08:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FcQ8vq6lUSoBcskeTdnLtSTsDVmAwYg1jg2lyisgCl8=;
        b=l2geVIF7Cfn/0E5HIjMq40Ir/HPwxXgiS7dR57dcGci+Y95s25TMwfB0YUJqd6DzVv
         qEfN6GkXi+VyC7xiGffcp0Hhn2GgRG+IbuZ+IRN6QUgS+CswhZq7jNb5RdlgRvv5gUqQ
         AN2XAOLGWn8yGWqpjyEBxuV5KCru+byPUtX0opGO87zUIBYJlxuHdpl/xeaV9fo1gc6a
         En8sW7dzkyZ3cYuE6Xv8z04LVTHnqYw6OVG6pJ2xhn6g1EVB/31ydh66u7BUWg/XO7Dh
         X3yXsMpRrDojOZi2gNQ2PruEHPbamKlCnTCIAdMzdMf2IsvNA+QyYp3qs0X4m9FgVuDg
         xLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcQ8vq6lUSoBcskeTdnLtSTsDVmAwYg1jg2lyisgCl8=;
        b=P3fkJPvHxIu/DD+A3kGRsqO4FEoG3eFlfgKAiPLPdjrgzCDAaLeRlYrLFkMkeR0sep
         u/kEabLZwrKduZ+S8C3+YOwOxIDgQZ3Ru7iEZn+99OrO85tj4xdO8/oGh/G/iLdaREhj
         gdBjDwEtuWPL4s0RpJcd+ONS9KEFXQfi+FNj265gu8QMppfX+JSECA9VVwJIS/SfX6gD
         PdGbbttuGBiGASn80PWEGCVx4bFjZejn4ZzMG3gXgyAvkSYSirOXbRra+fdYlmr3vyIf
         T0/raoQHBEPJ5FVLwvGb7hb+kKyAHCkJjGdz58p+qvFRUvkdkIFxAKRsiUe7ZfTDvagh
         uLUg==
X-Gm-Message-State: AFqh2ko/91PBb+hqjMQqnD3HTfKZDC2qqQfwsGhRecFXa7eKb4K6XHEQ
        k/iRB6BvE7JOP+Chjz1W3EbwvQ==
X-Google-Smtp-Source: AMrXdXs6JAtLvjTpQlUAkzsZq1XnTeNHQWtt5ki8p1OQb+ECja5bbx3QJ6wq8n9QR639AVO1rNPmdQ==
X-Received: by 2002:a05:600c:1906:b0:3da:1d51:ef9d with SMTP id j6-20020a05600c190600b003da1d51ef9dmr36757088wmq.15.1674748869113;
        Thu, 26 Jan 2023 08:01:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c180a00b003daf672a616sm1753836wmp.22.2023.01.26.08.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 08:01:08 -0800 (PST)
Message-ID: <9cbc160e-5aef-1de4-f1c8-a2d51b37aa0e@linaro.org>
Date:   Thu, 26 Jan 2023 17:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/6] clk: qcom: Add GPU clock controller driver for SM6125
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230126144033.216206-1-konrad.dybcio@linaro.org>
 <20230126144033.216206-3-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126144033.216206-3-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/01/2023 15:40, Konrad Dybcio wrote:
> Add support for the GPU clock controller found on SM6125.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig        |   8 +
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-sm6125.c | 444 ++++++++++++++++++++++++++++++++
>  3 files changed, 453 insertions(+)
>  create mode 100644 drivers/clk/qcom/gpucc-sm6125.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index ca6c7d2ada6c..ca2c83ecc6a6 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -798,6 +798,14 @@ config SM_GCC_8550
>  	  Say Y if you want to use peripheral devices such as UART,
>  	  SPI, I2C, USB, SD/UFS, PCIe etc.
>  
> +config SM_GPUCC_6125
> +	tristate "SM6125 Graphics Clock Controller"
> +	select SM_GCC_6125

depends on ARM64 || COMPILE_TEST

Same for second patch

Best regards,
Krzysztof

