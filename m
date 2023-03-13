Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 022C16B71C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 09:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjCMI4v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 04:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjCMI40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 04:56:26 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9345115CB2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 01:53:19 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y15so5173194lfa.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 01:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678697594;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9V26fOm4rtnnmc+zZXf336MT9Ik0qJ0WPgWAmIixGvM=;
        b=XH/HA/86C9j8tga4qxdSFBaFHjS/TgeC7Htrljy5hxViPm4jdXSYnnk/5YhpsXWQlc
         PBWhOKUsz17gWvJFIUuqNWmFmA1Nz8uSVXFyfFzLl1iiPrFBVSJ8zQjGTqBVGkcS2dWZ
         F2I+Ood5D1RCvu58vEI6bBxiwZ2QCxlh+C2gPV4gjEbKf7Qzvs53VkHrcwVwHKP8WBJ5
         2uWryUu1PZnJOGq9GWpj8VqfOAMgnPRAAGDvJsDdbx2QSqgAiRMNrsRWUDORCKrX0G77
         LJGSGkUYl78yA0tdRH8/IoqwRT9kLsqhIHK5M0OSy0Jf2d72qbEpX1/NoHQkGZhdRYi0
         bsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678697594;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9V26fOm4rtnnmc+zZXf336MT9Ik0qJ0WPgWAmIixGvM=;
        b=Uazu0/+EmH5AUYReSW1QPxRA1OJIny106eGm3fW/raYtbdJmCG8yaJbz7AZjc1m7t5
         bwnF8pRyGN+3FH4AEgxeXtsacj34w9W9FcNWkbo72k0axep2/rdZfPhMbxg3HZrHseRb
         Jb9zvQoMAP0ZB81LgGven21I+Ou0hIZF4/+PN9siJWjCmZtQ6ARVee7AQwSBRfdOlkHP
         g4pRk0u8Aiq57JXB9pdNX8+W0NVVRSEa7THoDjjiibi3Kzk9pYJAdjk3UwkpUEiaklhC
         L8WVw3dhD7f49BHpKCTjd+8y/2cLxduw3Y0V7IpcStS0oC5S8rGfOgndKDJ/jM1qHk6I
         WdYA==
X-Gm-Message-State: AO0yUKWtqRLLxE8xszuO3f5R9nckkrLmPq7hjYEcwrDZC1NsNRp3Ig2C
        TR4X6ZFdoR80qtrcy3NTvRMH/iCe/AKULMokmTg=
X-Google-Smtp-Source: AK7set9nHMSXn2a7pG1HL5sv/TQpRHqIHvfDL4QoZL1YNBR2aZrjl/5GeEjNcLNorzdVdw+ZDh5WlA==
X-Received: by 2002:ac2:5286:0:b0:4e8:4001:122 with SMTP id q6-20020ac25286000000b004e840010122mr1237506lfm.24.1678697594163;
        Mon, 13 Mar 2023 01:53:14 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id a17-20020a056512391100b004b55ddeb7e3sm893814lfu.309.2023.03.13.01.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 01:53:13 -0700 (PDT)
Message-ID: <4fac213e-0561-a496-f9b4-739d35f21330@linaro.org>
Date:   Mon, 13 Mar 2023 09:53:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 6/8] arm64: dts: qcom: msm8994-kitakami: drop unit address
 from PMI8994 regulator
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org>
 <20230312183622.460488-6-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230312183622.460488-6-krzysztof.kozlowski@linaro.org>
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



On 12.03.2023 19:36, Krzysztof Kozlowski wrote:
> The PMIC regulators are not supposed to have unit addresses.
> 
> Fixes: e9783584c9b7 ("arm64: dts: qcom: msm8994-kitakami: Add VDD_GFX regulator")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
AFAICS the code doesn't use it, so

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
> index 3ceb86b06209..26059f861250 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
> @@ -173,8 +173,7 @@ &pmi8994_spmi_regulators {
>  	 * power domain.. which still isn't enough and forces us to bind
>  	 * OXILI_CX and OXILI_GX together!
>  	 */
> -	vdd_gfx: s2@1700 {
> -		reg = <0x1700 0x100>;
> +	vdd_gfx: s2 {
>  		regulator-name = "VDD_GFX";
>  		regulator-min-microvolt = <980000>;
>  		regulator-max-microvolt = <980000>;
