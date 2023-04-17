Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8554C6E40F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 09:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbjDQHa3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 03:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbjDQH3u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 03:29:50 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98FB44B6
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 00:29:46 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2a8b3ecf59fso11126661fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 00:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681716585; x=1684308585;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GpltZtCq/U3px+n4yeGKDtDrcK3MPotiHkPGXajJ8sw=;
        b=LuMD79D03Rro+0OGYFZcMjM9m5UgIq0FTbk1dZCm/+8cQ3qGexs9zlqkdJd9/Gfcrk
         cJJwZgWGIk78fsmm9DgjBkRET1xHCCePbtRNXPikjfL4p+ZUNsuS+rdEkq846C1mt8T0
         c5eJD+BE17qTrpthdhT3GV/bi37Te0eSDG8VpBs7m0xkSZ9XPk9iwsD697q+1IevnMF8
         jzjIOKUCdb/1/A7LTqQL7tN5d+m6px/35ssFTLJ9zx3TCWk01g9a2JSLcJeeXt9K5Tzw
         7wSFnXEdS28iJ9257pau+5dL1+zP1uJ18FsT9jXuPrD0vimF+Vmz3qS65H4eyLUMJBRI
         eLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681716585; x=1684308585;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GpltZtCq/U3px+n4yeGKDtDrcK3MPotiHkPGXajJ8sw=;
        b=BuJ0rN8hplwpjZuxh2Kv7tanYnJkoxz2NP/yHk2bBiWaGCpxv/H/kZ8p+fHmTjeX4B
         PCTvHLt9e9W10C6E9anlUvVJ+1oYN7t0N+KTyXuhBwF7fpgP8RHMzKwAs0ReTqxXCTQj
         FsvSXxMTlmnH9xafZHViWbZrldxQaIJQYz37EG/XWM3kcWlcAdACxz7o4cvzZl8qzQ4N
         /pqqPvjlqQbQF8fs+Glo4Bg1JWQO6FmaJ7EyfRcN7MOR5m8Ta13ntnJA39dezIXBcI3Y
         /jrjkZ+7kYubIzN661ZMSMkRJXPE0BSGYMHrcj4+esUvwoFy2Xbg8GfCtx5J++Z1nS2l
         UtuA==
X-Gm-Message-State: AAQBX9cGGwCHW7TKJSEKRwXwz20j+PrUGoBboprN2mHWjc4Z4/hk0Fvf
        /8nVJICrgbbCACdz7bC0nrRwTw==
X-Google-Smtp-Source: AKy350bUive8yjq7JXG3ZO6E8GHtfsuzmNQaPCF69DZVmIcs4sTm+SHi77E65Ykcalg6RM7tGQT3iw==
X-Received: by 2002:ac2:5635:0:b0:4eb:3de1:dfc0 with SMTP id b21-20020ac25635000000b004eb3de1dfc0mr1441691lff.69.1681716584898;
        Mon, 17 Apr 2023 00:29:44 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
        by smtp.gmail.com with ESMTPSA id h14-20020ac2596e000000b004eaf6181a32sm1951079lfp.75.2023.04.17.00.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 00:29:44 -0700 (PDT)
Message-ID: <071fc8fe-1228-4a37-31dc-886526ba8db4@linaro.org>
Date:   Mon, 17 Apr 2023 09:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/6] arm64: dts: qcom: ipq6018: drop incorrect SPI bus
 spi-max-frequency
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230416123730.300863-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230416123730.300863-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16.04.2023 14:37, Krzysztof Kozlowski wrote:
> The spi-max-frequency property belongs to SPI devices, not SPI
> controller:
> 
>   ipq6018-cp01-c1.dtb: spi@78b5000: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index f531797f2619..54af7cb3c7a8 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -441,7 +441,6 @@ blsp1_spi1: spi@78b5000 {
>  			#size-cells = <0>;
>  			reg = <0x0 0x078b5000 0x0 0x600>;
>  			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> -			spi-max-frequency = <50000000>;
>  			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "core", "iface";
> @@ -456,7 +455,6 @@ blsp1_spi2: spi@78b6000 {
>  			#size-cells = <0>;
>  			reg = <0x0 0x078b6000 0x0 0x600>;
>  			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> -			spi-max-frequency = <50000000>;
>  			clocks = <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "core", "iface";
