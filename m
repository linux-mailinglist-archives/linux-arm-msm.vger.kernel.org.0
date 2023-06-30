Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D45A7436CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 10:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbjF3IPU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 04:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232383AbjF3IPS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 04:15:18 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC74E35AB
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:15:10 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b698dd515dso24277351fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688112909; x=1690704909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OhFdwYkyZTL6Y1dUm2j0hCQyzhpxxGY7i59uaPWC9mw=;
        b=doZoTSG79zw54hBGm/a397QqLE5+JZzxPqm1H9BYAwN6DWbpJwKYFlxKjkNRrebTDP
         rg5jhM9/YzMtRGlSFp3RB5lhPHQNrABOBKk1zFJmN7MC33ArkIpl0Sc9gF1n0IsSgP8W
         W8/Ns7TkJFb8YkX1hSjAlsXEf5KvHjF5CDXhTFVf7bkkmEYp8h6Uhs6SRLoAB+yYJbXr
         Z21588BEeYzns+9aFlvOffNuQ4f5ctLg6A+wkwU/nWgKpl+oWhWloK6at+T83Fx3FHc/
         ezG9uCEaAjMaXSSPwz0Oua5lsnhrTTGAftoHZUrS9X9MDItwp16jCLWITF/AEak6V/X6
         SmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688112909; x=1690704909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OhFdwYkyZTL6Y1dUm2j0hCQyzhpxxGY7i59uaPWC9mw=;
        b=OncAM3Y4TfmoZZeEOYSVK9flvXi3yvdTaUH4v0cfV2Qvrl+rEA8M3HSumt9CBgITBC
         zVBkr32ppfVxx6ttvq6k3RkiMoghM5eeJ78IOQffuuVtjq6wZIE5fHoUByLVlQIDzQNj
         CbV8H+ksnzw1oWGPM4BBwvHEJ9//MYhDTLhFBUpx+GodIyrJVwxEUIWHzRT0LmCRsqHG
         Mema33twdO6kc0/2+z5kFpfkHUBH81EwmzimJPuzmmbHVGvItJQZ2LhUXSPJ6W3mtbmv
         Da4CK9cNgaWh3CFC1qBcnYRyqKmhuVwzI7nKzZg+5fb9yiEtjakYkUH8vskGpE26PTuA
         5F8Q==
X-Gm-Message-State: ABy/qLaoN/WSCj4IXHbk37JsZETOZysIdr36SIgIU21YQ6YlXizFCnBG
        DdBtSBeUfbeD9gR0T9Uu51smTA==
X-Google-Smtp-Source: APBJJlEJWRIJLTWA7dUfWDNzYLHpqqVTSo1Adrdzt+ZJB4Vp6q5Q2cmQ+16P7/sQKC6XWjGODY8bTA==
X-Received: by 2002:ac2:5e70:0:b0:4fa:abe7:7c80 with SMTP id a16-20020ac25e70000000b004faabe77c80mr1450320lfr.39.1688112909193;
        Fri, 30 Jun 2023 01:15:09 -0700 (PDT)
Received: from [192.168.1.101] (abyj222.neoplus.adsl.tpnet.pl. [83.9.29.222])
        by smtp.gmail.com with ESMTPSA id f23-20020ac25337000000b004eb12329053sm903915lfh.256.2023.06.30.01.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 01:15:08 -0700 (PDT)
Message-ID: <bfe2f1a6-e8d8-e2de-ea40-aedfb543bba0@linaro.org>
Date:   Fri, 30 Jun 2023 10:15:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8450-hdk: define DIE_TEMP
 channels
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
 <20230630061315.4027453-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230630061315.4027453-7-dmitry.baryshkov@linaro.org>
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

On 30.06.2023 08:13, Dmitry Baryshkov wrote:
> Declare the DIE_TEMP channels provided by PMICs. Use them to provide
> temperature reading for the spmi-temp-alarm thermal zones.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 43 +++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index dabb7e872f38..d07e402eaba3 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -6,6 +6,10 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pm8350b.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include "sm8450.dtsi"
>  #include "pm8350.dtsi"
> @@ -588,6 +592,45 @@ &pcie1_phy {
>  	vdda-pll-supply = <&vreg_l6b_1p2>;
>  };
>  
> +&pm8350_temp_alarm {
> +	io-channels = <&pmk8350_vadc PM8350_ADC7_DIE_TEMP(1)>;
> +	io-channel-names = "thermal";
> +};
> +
> +&pm8350b_temp_alarm {
> +	io-channels = <&pmk8350_vadc PM8350B_ADC7_DIE_TEMP>;
> +	io-channel-names = "thermal";
> +};
> +
> +&pmr735a_temp_alarm {
> +	io-channels = <&pmk8350_vadc PMR735A_ADC7_DIE_TEMP>;
> +	io-channel-names = "thermal";
> +};
> +
> +&pmk8350_vadc {
> +	status = "okay";
> +
> +	channel@3 {
> +		reg = <PMK8350_ADC7_DIE_TEMP>;
> +		label = "pmk8350_die_temp";
> +	};
> +
> +	channel@103 {
> +		reg = <PM8350_ADC7_DIE_TEMP(1)>;
> +		label = "pm8350_die_temp";
> +	};
> +
> +	channel@303 {
> +		reg = <PM8350B_ADC7_DIE_TEMP>;
> +		label = "pm8350b_die_temp";
> +	};
> +
> +	channel@403 {
> +		reg = <PMR735A_ADC7_DIE_TEMP>;
> +		label = "pmr735a_die_temp";
> +	};
> +};
> +
>  &remoteproc_adsp {
>  	status = "okay";
>  	firmware-name = "qcom/sm8450/adsp.mbn";
