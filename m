Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A897B5F12F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 21:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbiI3TpU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 15:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbiI3TpS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 15:45:18 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DDE43625
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:45:16 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id r15-20020a4abf0f000000b004761c7e6be1so2920085oop.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=m4m3sjgLDE+/ONrvXDCMDbMUrc0dF2u9xPL/tSwjQTU=;
        b=PMJp9UEV6calyOMaNaIFQLBiUAnI0ygAWWxw04JKFOEkMBqNaT0NytXpBLaPBezSQ+
         kgyGAyLsPPgBr1XmBt4eXUVQtCGn98+p/d5HzEDHKCQi4he4TlAdbT+mi+eqy1vnb4Yq
         XumkvS+RZfqySXlOWoP+to9G1osC+jsOFRaU5PjTS8ak9Uv6A09h6ztcUQomq6S9kkrD
         bofF0/wucJGNMpWwfhN6l7TsX94Jclyaz/+e8Y4Kg+JAOXjjq/nxk+AxFrDstduVcWH+
         XZuwhdFoI4aFWtHd0dr0ZNawchHVoiC8yikIBYDICLGYR1EjOjnty/MjQQCaHn0dr+ag
         UuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=m4m3sjgLDE+/ONrvXDCMDbMUrc0dF2u9xPL/tSwjQTU=;
        b=USry2+QADjzR7+2ncxHRcPBaskbZzOFKKjQ8yAq+MuVkguzFodhecHRDehPtejVRlp
         SjO3qfoBW5UVS+5LlVUToIVthsx7eUYGG3MaMb5c4nrjhCk7RBCHkdxS00QMXj4AaBtZ
         uc5YzSuu8aC9bEaTIbdaQ3zBUjY1oBSbU4ddAvhBYReJcj0BLHfjZjUG87G1TDtrJLTw
         QrnalTSIC6bGc2r/qitPKNafKPCC24I5juB7Uvxdt5qJV7MsJwFJpdu2xAHG5MpV1yXe
         xz9G7zPpyW9ZURoMPBAOva34NvN3ZzbWT35/3oEokrhBuVNHnNfMJqVqMtU045W/Og50
         /1sA==
X-Gm-Message-State: ACrzQf2aRSdlQvaEZ3RVFDJnGp/qyacJVp76lNq0pb19ossZNG4IrYZs
        Elej3piUXgVbyU0JzuAsQnURvw==
X-Google-Smtp-Source: AMsMyM7bD9TGDk6oI2MAvPg/h/AW/SzY20K8Y4e5K/IJ5U6nlmPuG1ueW2fbwgzgvbTsWxyt9mRH6g==
X-Received: by 2002:a9d:7c89:0:b0:655:dfb1:331c with SMTP id q9-20020a9d7c89000000b00655dfb1331cmr3968455otn.224.1664567116057;
        Fri, 30 Sep 2022 12:45:16 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id p21-20020a9d6955000000b00657a221eb71sm743272oto.65.2022.09.30.12.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 12:45:14 -0700 (PDT)
Message-ID: <8cead1ca-e293-5172-d305-f8d308f93379@kali.org>
Date:   Fri, 30 Sep 2022 14:45:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm850-lenovo-yoga-c630: correct
 I2C12 pins drive strength
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Vinod Koul <vkoul@kernel.org>,
        Xilin Wu <wuxilin123@gmail.com>,
        Molly Sophia <mollysophia379@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     stable@vger.kernel.org
References: <20220930192039.240486-1-krzysztof.kozlowski@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220930192039.240486-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/30/22 2:20 PM, Krzysztof Kozlowski wrote:
> The pin configuration (done with generic pin controller helpers and
> as expressed by bindings) requires children nodes with either:
> 1. "pins" property and the actual configuration,
> 2. another set of nodes with above point.
>
> The qup_i2c12_default pin configuration used second method - with a
> "pinmux" child.
>
> Fixes: 44acee207844 ("arm64: dts: qcom: Add Lenovo Yoga C630")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index be59a8ba9c1f..74f43da51fa5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -487,8 +487,10 @@ pinconf {
>   };
>   
>   &qup_i2c12_default {
> -	drive-strength = <2>;
> -	bias-disable;
> +	pinmux {
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
>   };
>   
>   &qup_uart6_default {

Tested-by: Steev Klimaszewski <steev@kali.org>

