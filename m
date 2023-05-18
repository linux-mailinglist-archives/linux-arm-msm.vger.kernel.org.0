Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D75AF707D7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 12:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjERKBe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 06:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbjERKBd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 06:01:33 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB333E7B
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 03:01:30 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f380cd1019so2224770e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 03:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684404089; x=1686996089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pj4weIGpudmyNlnO9uJ3E1FMhSIXf4L7qvix1QY0ZZk=;
        b=GB579InNIIFWRmiIhrdlhHkDUbiM7L+cpzuzjT6xTrvcjfQDdX2r9q8CCOKjxxMR7k
         E09SIZLQ93IdwUBC9qNDIIPU2gReGjlkfJXIqozEPpRNkjx63gvrKd94Bk4yM9C/URtb
         psQcz4UPt8suQbTDQAPbgZSdoLa2WaCY/W8dYsDk/2/sfcDYlP3q4hEoJxpp+h23Gopf
         xLqZUZCQOMM5CHVke8SZmZkv+pA5Dzz8IKcYqkkEba9LhGE16rTTmOXyajzjMumNSpix
         28lgEpFHYEVCRCDmxZZgRyfOVREwyoexu8UejvGOkMsq+7qThMWE7Vt7WIZ5jvUaqjdh
         NWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684404089; x=1686996089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pj4weIGpudmyNlnO9uJ3E1FMhSIXf4L7qvix1QY0ZZk=;
        b=DfUr0Q/89m8HykT2cv6VLj2z13r/eQyLmkHy0UAKk4p386jlKVRMcgwqPa3NLdGeLc
         vbcVzhqfjN06FrFNTBrXRXoFa8Vr3XYHruFn2Mhtzsz7zjZdmRKfHmxwYUxIJtNN6/Ss
         uQ5SY3aBD/M3duqIGXQ3HW15Wj5KI23y7n3k4/XE1LicwDbODFeig+EJzNNA7tJtxODg
         0BenFMKt6GBHhzVNcOJGfG21+aeJ/dRCTe5XUshJlc5jwZoQ1DIeKg6jvGMuzBqzgnTH
         kuj7pKvqW+E0j/6HRZRTZqBuUJ92SdPOelrzqRxDDA+2rEePABsuX7neTjpbANbFBS/k
         D/Tg==
X-Gm-Message-State: AC+VfDxAJkDwCs7iN2lr4pYD0tjdQG2JPb+0jKCpJev0+WHlosZfPN+z
        YcY/JaPHOqxwFZIU/zEpZ0RwRA==
X-Google-Smtp-Source: ACHHUZ6vcruuErDembFyHezvNlJZxkYd1xQDCehRrXEG/lUXOgDps+48EZl+lSGZfc+c6aaQMEfiww==
X-Received: by 2002:a19:7005:0:b0:4f1:4526:1d80 with SMTP id h5-20020a197005000000b004f145261d80mr980455lfc.50.1684404088926;
        Thu, 18 May 2023 03:01:28 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id u25-20020ac243d9000000b004f26d63f823sm189462lfl.237.2023.05.18.03.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 03:01:28 -0700 (PDT)
Message-ID: <e73e6a7c-9d6f-9d4e-424d-445a003adb05@linaro.org>
Date:   Thu, 18 May 2023 12:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 07/11] arm64: dts: qcom: pm8150b: Add a TCPM
 description
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        lujianhua000@gmail.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
 <20230515133643.3621656-8-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230515133643.3621656-8-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15.05.2023 15:36, Bryan O'Donoghue wrote:
> Type-C port management functionality lives inside of the PMIC block on
> pm8150b.
> 
> The Type-C port management logic controls orientation detection, vbus/vconn
> sense and to send/receive Type-C Power Domain messages.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/pm8150b.dtsi | 40 +++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> index 66752cc063d60..136e5f96a3d53 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> @@ -59,6 +59,46 @@ pm8150b_vbus: usb-vbus-regulator@1100 {
>  			reg = <0x1100>;
>  		};
>  
> +		pm8150b_typec: typec@1500 {
> +			compatible = "qcom,pm8150b-typec";
> +			status = "disabled";
> +			reg = <0x1500>,
> +			      <0x1700>;
> +			interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x00 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x01 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x02 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x03 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x04 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x05 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x06 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x07 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "or-rid-detect-change",
> +					  "vpd-detect",
> +					  "cc-state-change",
> +					  "vconn-oc",
> +					  "vbus-change",
> +					  "attach-detach",
> +					  "legacy-cable-detect",
> +					  "try-snk-src-detect",
> +					  "sig-tx",
> +					  "sig-rx",
> +					  "msg-tx",
> +					  "msg-rx",
> +					  "msg-tx-failed",
> +					  "msg-tx-discarded",
> +					  "msg-rx-discarded",
> +					  "fr-swap";
> +			vdd-vbus-supply = <&pm8150b_vbus>;
> +		};
> +
>  		pm8150b_temp: temp-alarm@2400 {
>  			compatible = "qcom,spmi-temp-alarm";
>  			reg = <0x2400>;
