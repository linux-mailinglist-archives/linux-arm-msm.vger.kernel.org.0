Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2536ABD81
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 11:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbjCFK5z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 05:57:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjCFK5y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 05:57:54 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC75265A1
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 02:57:50 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id b13so9159251ljf.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 02:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678100269;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6k06/urQlnX96V6sKmqlfD8yeUDFIrdwFIHJbCTqmKk=;
        b=AA7MfnAeG9ZUwxzEiBke/uuBEXzDu85frbtcsukFI0i04FeTSfWHcMR00gbm2pVJue
         w6UVoOMh60CTKIld98upSm+QDVZMnG3N6sxbik4RS4f0X3WEqG0fYi64IcDa/tnL4HMc
         pCzlQgLilVfTGpSrw8hRy5IxA1DPEngvJhm/duM7XAsRb89NZaHuuHXtWcjVWS1Ktdvw
         BDNCWMe5FWmSoisMatsngYWwrI/u8eRqySFADmy15SS4cYrT6Jwn5HsKaJf1bldlvdA/
         agRPty9zGk20e/r17aHgs0c/odoj0sjVNx513A1tOpIfuLfXJZ8gYjqnLQA4Xl64Yk9k
         kgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678100269;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6k06/urQlnX96V6sKmqlfD8yeUDFIrdwFIHJbCTqmKk=;
        b=e6G2u3IiScdPKkc38HxLpKk0+ZqZ97Zv6zijiTf5ouBBFpwlg869im9wsGqnuH/qTn
         qpmQoXU26+ppkytz8dMKPBIwUrafwjl6CEymLIANTuknztgqPE+gclfdJoJVLcAp5Al4
         ewLYMri+jLBxBcikNBxCEeBaCfPHoASbpbMKUmIBQS5aICoWNM570BRoLuas9zmp6PmZ
         rxyW1EtEGx3hyUnyL13BDfwTUKGhxc+y+jTvwoFTIjaN1VErdVubjwU+1ND9S02lpGjF
         7ClvfyeyK+nDMi2EWdH7zD9pm+cME2aXEb0k+V6+2Oooza5rUsxKN5gSZEv/7Bk1R6yv
         Zjeg==
X-Gm-Message-State: AO0yUKXSvPet4GKosh6jyDJnp9ZRGjVlF3mShOvp86mQ8pf5rUZIjxdU
        2OczyME6XKRSDgFxRJh6vlHGMbzyY6V8aYkEMlM=
X-Google-Smtp-Source: AK7set9x4to9rbieAFAUs8+SK9uxC6k6XFgAsppFmyWqBXon6PbHCB6AiOCIKK/9MK2eDS1Zeadfng==
X-Received: by 2002:a2e:9147:0:b0:290:6500:40f0 with SMTP id q7-20020a2e9147000000b00290650040f0mr2869640ljg.42.1678100269114;
        Mon, 06 Mar 2023 02:57:49 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id q23-20020a2e9157000000b002934febffe4sm1659967ljg.128.2023.03.06.02.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 02:57:48 -0800 (PST)
Message-ID: <cd9f2ea6-9323-3d63-6f69-ce50bf6b1327@linaro.org>
Date:   Mon, 6 Mar 2023 11:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 06/11] arm64: dts: qcom: ipq6018-cp01-c1: drop SPI
 cs-select
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230305125954.209559-1-krzysztof.kozlowski@linaro.org>
 <20230305125954.209559-6-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230305125954.209559-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5.03.2023 13:59, Krzysztof Kozlowski wrote:
> The SPI controller nodes do not use/allow cs-select property:
> 
>   ipq6018-cp01-c1.dtb: spi@78b5000: Unevaluated properties are not allowed ('cs-select' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> index 2aee8594b280..f5f4827c0e17 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> @@ -35,7 +35,6 @@ &blsp1_i2c3 {
>  };
>  
>  &blsp1_spi1 {
> -	cs-select = <0>;
>  	pinctrl-0 = <&spi_0_pins>;
>  	pinctrl-names = "default";
>  	status = "okay";
