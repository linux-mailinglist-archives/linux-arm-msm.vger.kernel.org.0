Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19CCB67E44C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 12:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234098AbjA0L5A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 06:57:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjA0L42 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 06:56:28 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B0D8003E
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:53:38 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id vw16so12940887ejc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2GOhGaZPElQirCQ8y5f/SzlHhA/Pc0oVddW/GxMyIYo=;
        b=D+YiZd9y4aKawIjayOydozjYqPTKdXuKyAaQW5361znZnm9vxkZ6revV8mx7NBoQnD
         4YGrQNJz8ZhZc9TCz+Tnp3vSFbB3NpgKLrttnPzC4ACVcebB92JnroeDVS66LaVWtfZn
         OT3UuquNQMzNi0+8junkdIX/FnV6G6LFWZFo7UM5OhTbkZrvbil3kGq3L8/WW5NgcrZK
         npLGNznXC3lIs5K9ELs3lT7WmoAI6E6bvXkbI8riK5xJhXy71UIV2hZhmawSYbTmEKLm
         0YE/t0zk1eSSGm9XCakrJSXewbAwtezfHPA5+/jrgot0gTvPHw3lLmF8wLQXH33K5FPb
         4WVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2GOhGaZPElQirCQ8y5f/SzlHhA/Pc0oVddW/GxMyIYo=;
        b=P1qPcHDFapZYh5lDMMrsOKmoO/debmxqB6gQVkcbbjRe8E7UkO8FdnGks1ve5Y5fq9
         +KVIatHNlCxQSnXGw6fqjtZeGIRTqg3QOHHn8CJ6Fl1YIinV725qypE6h+CLb4p0rApn
         vvT9UASbTtYmeEr9pOKvscNHLxg0euJ5fltXF7Xlg1GbAX5wCpWn7BtvF+AAzeuMWSsZ
         WHfJ66BoJ/0ljkSKD1Jl9p1krmL1CmK7REiIy+uuFxs++5ZBFiZT65DCOwS24G6arrNn
         ON50aO3reqqi/hbieYGVqhpuYC0k9cpYU1WTGt3q4z2olvP43K+WFPlBeq+48KGNyh5I
         JuFQ==
X-Gm-Message-State: AO0yUKVAZu5ZgBpZT1Fqbc4JACPc4c+Qx969+3y8EGFN8MhnOMu+DWWO
        3TLaWgBQ985Wo1oSOgpH5kOqtw==
X-Google-Smtp-Source: AK7set//GHmm+2mKK6X4Q6zeLFoaysIt3TRd7MuvXFhxpN4xAzfOJKJOXUG8pLBDyant5TV1ryrqxQ==
X-Received: by 2002:a17:906:3704:b0:878:43bb:357 with SMTP id d4-20020a170906370400b0087843bb0357mr7997550ejc.14.1674820338957;
        Fri, 27 Jan 2023 03:52:18 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id u20-20020a50a414000000b004a08c52a2f0sm2220084edb.76.2023.01.27.03.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 03:52:18 -0800 (PST)
Message-ID: <9e542412-6373-372f-ae24-7989817284c3@linaro.org>
Date:   Fri, 27 Jan 2023 12:52:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 03/11] arm64: dts: qcom: sa8295p-adp: align RPMh regulator
 nodes with bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230127114347.235963-1-krzysztof.kozlowski@linaro.org>
 <20230127114347.235963-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230127114347.235963-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27.01.2023 12:43, Krzysztof Kozlowski wrote:
> Device node names should be generic and bindings expect certain pattern
> for RPMh regulator nodes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> index bb4270e8f551..fd253942e5e5 100644
> --- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> @@ -111,7 +111,7 @@ edp3_connector_in: endpoint {
>  };
>  
>  &apps_rsc {
> -	pmm8540-a-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8150-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> @@ -151,7 +151,7 @@ vreg_l11a: ldo11 {
>  		};
>  	};
>  
> -	pmm8540-c-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm8150-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> @@ -224,7 +224,7 @@ vreg_l17c: ldo17 {
>  		};
>  	};
>  
> -	pmm8540-g-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8150-rpmh-regulators";
>  		qcom,pmic-id = "g";
>  
