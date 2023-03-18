Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A87A16BFA21
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 14:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjCRNJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 09:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjCRNJY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 09:09:24 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C43B193E5
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 06:09:22 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id t14so7728945ljd.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 06:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679144959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OnCGRRCmuT2n7/11BbKyXGI253cixkIhzslRtxlqK98=;
        b=IySg5DcyyALB+pdkVIZl5+opDdMQLEsXe3wIlz1/JWwJKgMUsGlLDyYRyAtvjck0G8
         Pj+wEIxWBlLck5eqLhS21uu4xD0OBy0a5adEYexLg8pS0MSLR4e9rpaIPgrCjIgMRtYp
         S/HmOe9/m1dtie5V/kxKKNGmBREXwGtoX4W2eHYNPf3zJNZVKhT98EuPFAYDeZw4xvVq
         G2bgppPc+2kAkH81tDjkzIgRP0ihCvVh804XRJtZLqGKPvDUyOEzZgJ4J2k0cWprL0DJ
         RjArvMmTyHcYoz/F9vgjh9IKPpoHw5MbiUsuGmP+dFOnvS/2DfPeBtngSvyIKOtl3qt6
         OTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679144959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OnCGRRCmuT2n7/11BbKyXGI253cixkIhzslRtxlqK98=;
        b=QZYZ3coSv5XeXQueWHSzeMEB3Ezy6yawJ+hVagvY5ke7bTno1UHcrRtEMTPVQYzYFe
         +hX2ZTSM5WIObSI6kEK7WbYPZwcmaSnshAhreNkfcO+vuPgsTJ2/tivib70aOHX6y3J+
         rqp3PjrUT4snWzFc/yiXCgyEfPbyhAaZqHoq6R/9mZx05UpUmkRaVEHnN7NBLTbnktYV
         Fs3pvjGVsQy8ulKKFof2yxCtro8NrPAeJNgXYJBNYpwrjb1ySSOuLCqBcWJJFHroNV+U
         pkyZqn9Uhon4xfG2dXbqvlZbftePmcc0RpU9H2U9Bg2DQYdF4CQRRD7co9Xsiy84T9pO
         3VtQ==
X-Gm-Message-State: AO0yUKWQcqiD0L1lqhFoti50sdqePCh+jjaIl2iJy2DCGZzwUZnhb4to
        9K7wKAEwo826a15eOShzVnfWtxUFragV8vgFYBI=
X-Google-Smtp-Source: AK7set9JFAdH42KlQbgNcUSmjjNh5mtU6bs1V4hw5WXRR4ArJHIGLYZzUQjoaL5CIthir123nxYq4Q==
X-Received: by 2002:a2e:b5d5:0:b0:294:697a:d6a9 with SMTP id g21-20020a2eb5d5000000b00294697ad6a9mr3737891ljn.28.1679144959542;
        Sat, 18 Mar 2023 06:09:19 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id p15-20020a2e740f000000b00295b588d21dsm878319ljc.49.2023.03.18.06.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 06:09:18 -0700 (PDT)
Message-ID: <3acf8c05-3108-6819-9e72-b04d4a090949@linaro.org>
Date:   Sat, 18 Mar 2023 14:09:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 16/18] arm64: dts: qcom: qrb5165-rb5: Switch on basic
 TCPM
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-17-bryan.odonoghue@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230318121828.739424-17-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18.03.2023 13:18, Bryan O'Donoghue wrote:
> Switch on TCPM for the RB5. Here we declare as a source only not a sink
> since qrb5165 doesn't support powering exclusively from the type-c port.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 1ce88f0c31db2..965742a5be7ae 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/sound/qcom,q6asm.h>
> +#include <dt-bindings/usb/pd.h>
>  #include "sm8250.dtsi"
>  #include "pm8150.dtsi"
>  #include "pm8150b.dtsi"
> @@ -1339,8 +1340,32 @@ &qup_spi0_data_clk {
>  	bias-disable;
>  };
>  
> +&pm8150b_typec {
> +	status = "okay";
> +};
> +
> +&pm8150b_pdphy {
> +	status = "okay";
> +};
Swap these two ('p' < 't')


> +
>  &pm8150b_vbus {
>  	regulator-min-microamp = <500000>;
>  	regulator-max-microamp = <3000000>;
>  	status = "okay";
>  };
> +
> +&tcpm {
> +	status = "okay";
Add a newline before the child node, please

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	connector {
> +		compatible = "usb-c-connector";
> +
> +		power-role = "source";
> +		data-role = "dual";
> +		self-powered;
> +
> +		source-pdos = <PDO_FIXED(5000, 3000,
> +					 PDO_FIXED_DUAL_ROLE |
> +					 PDO_FIXED_USB_COMM |
> +					 PDO_FIXED_DATA_SWAP)>;
> +	};
> +};
