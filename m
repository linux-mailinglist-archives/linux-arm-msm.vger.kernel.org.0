Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E78264F96B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 15:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbiLQOhG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 09:37:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbiLQOhC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 09:37:02 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0733F5A6
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 06:37:01 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id cf42so7693970lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 06:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yhIs6fKfOUXpD44jRG6XVKMUeo1AQbRaXZh3dXmE8yg=;
        b=lfg6T6tFtiAwoV/7hjiVnUpzD0U08hBpMrXzDfxyyX6O+JgJwNME6Tx/VMZvDsLRUK
         dJJKvmfPwAiAQHIfnFfPsKivMkKJ/nB2sfZdssw6F9XoS8ECTG+GmetrDl6rfo6WoFDa
         9jBSN2FtnCudfLcssTYe1qK6Yq60Qa9rfrI9+KCPG9/ows4q6C3ZbD3mXQg7JkJ++jO6
         kwHbmGBkE1Cn4JDir+wHbQUSKiMpuOs+iLiUHI4+oFip5oMHylRIysZXtFjKxD5QkTzc
         26kqtHr3GmpR/47abQeDxesy6Xp1aTLHC9erjMS9mFuMsP3pD3SaP1F+HO6qBankCXfS
         uBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yhIs6fKfOUXpD44jRG6XVKMUeo1AQbRaXZh3dXmE8yg=;
        b=Dcobjy82iRIR2GdzF6zaHhhGpATO1HAiA0l7PHXH6XCk+uySt6Op3VRLzuW+H9RMbW
         qcH/P6FghiB0h6oX2bAlZVktkGNE6uaInEQr70vC+MqHsELxkAIhk/kYm3bMrlnmJe2f
         6519RzotWM505scGi42sYsqijKM9/8szR/csSiOAhdNPwLMQ0ebmXKM3cU+4iPXo0j/S
         H9K0ymPW2X0cZVklnXZsJttJXnfhqaiONb/zegzOh4UG2bwU8PdP2/jyxa7+vNe7LMId
         kWStrgsjyLIJhhi6iVqmAV/BRGnqqHXh/4LUFpZcNMM3JQy9TaOeQYv7A30JGkf28Amq
         otag==
X-Gm-Message-State: ANoB5pkFzCVQe6/eyUmaRey9pZTmM56VXJnyUcupC2QYOVhfMEgIyypU
        uv8VeWYfe5BS3t8mXjI93zKyiS4dzDS6+njY
X-Google-Smtp-Source: AA0mqf6oGEg0XjMplLN1FeA974LONUwNKg1/PZjvwG7VNjiM+Ymn5G8rg5XoALL2ckkwj53VP5P5zg==
X-Received: by 2002:a05:6512:1698:b0:4af:ac78:2602 with SMTP id bu24-20020a056512169800b004afac782602mr14565352lfb.29.1671287820054;
        Sat, 17 Dec 2022 06:37:00 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id p13-20020a056512328d00b00497a61453a9sm516617lfe.243.2022.12.17.06.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 06:36:59 -0800 (PST)
Message-ID: <7b6e1c29-4e33-b66c-00c8-836a62a0941d@linaro.org>
Date:   Sat, 17 Dec 2022 15:36:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: rename pm8450a dtsi to
 sa8540p-pmics
Content-Language: en-US
To:     Eric Chanudet <echanude@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Brian Masney <bmasney@redhat.com>
References: <20221216232606.2123341-1-echanude@redhat.com>
 <20221216232606.2123341-2-echanude@redhat.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221216232606.2123341-2-echanude@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.12.2022 00:26, Eric Chanudet wrote:
> pm8450a.dtsi was introduced for the descriptions of sa8540p based boards.
> Rename the dtsi to make this relationship explicit.
> 
For the descriptions of PMICs used on SA8540p based boards, I suppose?
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
The change itself looks perfectly fine though!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/{pm8450a.dtsi => sa8540p-pmics.dtsi} | 0
>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts                     | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename arch/arm64/boot/dts/qcom/{pm8450a.dtsi => sa8540p-pmics.dtsi} (100%)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8450a.dtsi b/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
> similarity index 100%
> rename from arch/arm64/boot/dts/qcom/pm8450a.dtsi
> rename to arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
> diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> index 6c547f1b13dc..77d499702ea8 100644
> --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> @@ -10,7 +10,7 @@
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
>  #include "sa8540p.dtsi"
> -#include "pm8450a.dtsi"
> +#include "sa8540p-pmics.dtsi"
>  
>  / {
>  	model = "Qualcomm SA8540P Ride";
