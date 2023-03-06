Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBA96ABBE1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 11:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbjCFKWb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 05:22:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjCFKWR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 05:22:17 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1AB4EEE
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 02:22:14 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id b10so9111987ljr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 02:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678098132;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0ThiK0KLjMKldmwf3KFurkdGvE7BcPLyV81e9kuRrc=;
        b=lSDL6YD6UaRClwKuJIET7ABfT7lZxByp0OSO8D7Y+XAoeLoyYXH+0BfZSivvnlYtYv
         WXGIINU5Y9JIPH/LKZCxZ6j/cLHofxOowXfxByeF9Xw1omSsSPD/2TnGjIe7eqG48Akq
         uun+apcfYR4KfGeOtIuedwKvj22tIc1AHgPJKtvIDU2SfgQbwF0ykkTXvuVuy1MbWyT/
         DcC93SujO8isBwgwNnjlgSD5SKX9qbO71Sjr21ciwbG9uSomnBId8Uxo5MWEBWin2e7c
         36q5WQNrozK38+zZoHt7GX7vEr0TLHnquvAEd5v8gCWsTLGigZ8mEiV2w9GsvITciDGH
         2YOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098132;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J0ThiK0KLjMKldmwf3KFurkdGvE7BcPLyV81e9kuRrc=;
        b=5JOSQ/mUssQzZv7devprBMSlgNcT64tdNMklsI4SQv70djEG7nVoa+OtaooZYvOr9y
         05/0lpoKDtmmZSD24toruqLfBNpCC3FEgxZUaHG4D9vlA6U5Ls1JiT7sqGDTJr/aX8RM
         LjSFq7Pgf9K+XanOB3ZfDx//dghiueXudDqT00oibqdzgcarY0fCkv796SPVNWMxc17I
         08e+q3LT80+jjpo+bOM73o+Vea2MT01Sa2UoxdSISufcsBt6xuykE9+SKkyW7pBVglBh
         OPpXvthZ7MZYmADxI2P98RhMnUmh1YML83pjivRiyDVC6BWHhsWp4RJdtl7MqN2FsTiM
         sKjw==
X-Gm-Message-State: AO0yUKV2YiQgfM1jb+ncnsEv402N+lPjLK90eBvVMC1jUynFUPa4ZNks
        +mjmn5dWkc4071K4JYPMVQCGbQ==
X-Google-Smtp-Source: AK7set+2JI2qWPKk0d4THhMUBcdEvRLQ+YEyJal35Ettz0XZ8ViiMUP6nN05C0DXaNuL/J4FPKS87Q==
X-Received: by 2002:a05:651c:2122:b0:293:40ce:b08e with SMTP id a34-20020a05651c212200b0029340ceb08emr4212903ljq.16.1678098132189;
        Mon, 06 Mar 2023 02:22:12 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id p4-20020a2ea404000000b00297dad1a2b0sm1592883ljn.103.2023.03.06.02.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 02:22:11 -0800 (PST)
Message-ID: <e961324d-fc75-aa61-9c76-13a80c62deb7@linaro.org>
Date:   Mon, 6 Mar 2023 11:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-db845c: drop empty node
 override
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230306081430.28491-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230306081430.28491-1-krzysztof.kozlowski@linaro.org>
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



On 6.03.2023 09:14, Krzysztof Kozlowski wrote:
> Drop empty override of pm8998_gpios.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
I wonder if dtc could detect these with not a lot of work..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index acd4f9ca6c09..e14fe9bbb386 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1135,10 +1135,6 @@ &qup_uart9_tx {
>  	bias-disable;
>  };
>  
> -&pm8998_gpios {
> -
> -};
> -
>  /* PINCTRL - additions to nodes defined in sdm845.dtsi */
>  &qup_spi0_default {
>  	drive-strength = <6>;
