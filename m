Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E281F6BFA22
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 14:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjCRNK4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 09:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjCRNKz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 09:10:55 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407382914C
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 06:10:52 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id l22so7710579ljc.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679145050;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aoIhQI7D33i/dBHYhN2kmQsNP0se6cFUzJJTdr3osns=;
        b=G+0Ta1iD8rnqmznWLJDErr7na5PKGlN9iRBwS6SmAaFcqpwVU/aH6BoHI2eK8mTS+6
         pUaktpblGj8frP1dVKK7Afj7z9BFV1DZ91Mhk953oOZDqhoshEUPriT73CjJfpBd+g9+
         OoCYvAhyAXpE6EIWbyrwEruW2OJkDnGFYsfcN37tYIbLTSxaTjLSbsPSGRfkB3KM44Bf
         lBh9rgqQsJGv/c3SxDGWPwjGsSqJ3S/YxMEI40ZhQ1rrH5hPLMnFL3UoAr2psVg+ZUpe
         IUE070zh6TwxMQdu+82LbUfHvJsip7HuC0V1DySOpW2SVb6Rc3UvmRVusohQQsbURQ0G
         28Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679145050;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoIhQI7D33i/dBHYhN2kmQsNP0se6cFUzJJTdr3osns=;
        b=INZPvYQjIsfqBrBGPsnKnoLBpHlSSxtPYIhXVDUXYf3oKstDae62uPP8ilwnPPAW9H
         qfgrwpQaO7/e7yTPW1HmVOZ1pgFhhob3zadRHtFNQtLOQexYOk74CjHwl24I1M6/aFUC
         BOXohVptPLyJ1evhHSM2XpIe4hwy/mn7P1+eAZ0xAF5POlgJ1ajYFGgPvs5NuQsp8ncW
         1iOSGyNz12odFwmxK8DhZTHHfoGihK34G3fwBS1fzSTmToEllsYegsnkH94fFlCmpAyI
         SNJbzDZmsjC0INLZjnNoeXo4XXhHPWTrtKUppdAQMNvVW7Zy4JtiJuK7QR91aiLZBwCS
         RgyA==
X-Gm-Message-State: AO0yUKWc8vFbkQRuAJK0kVoPtzyVOcEZjwLy7qRJPwyRaRepZGMN3HE9
        qKL/O1XUrUJc1eO6AQS5QePFUg==
X-Google-Smtp-Source: AK7set+tkuKobpkyQyGJGTMOQXKSuIPhODPCMF1fWdnLyuYGFmcCfnejU1YGO7+K0Tlor0r2lQTPrw==
X-Received: by 2002:a2e:a311:0:b0:29a:96f0:54ed with SMTP id l17-20020a2ea311000000b0029a96f054edmr1496080lje.30.1679145050504;
        Sat, 18 Mar 2023 06:10:50 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id y21-20020a2e9d55000000b002989fc0a69csm866012ljj.124.2023.03.18.06.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 06:10:50 -0700 (PDT)
Message-ID: <6e897b77-671b-2049-4327-631350e8f868@linaro.org>
Date:   Sat, 18 Mar 2023 14:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 17/18] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 usb-role-switching for usb_1
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-18-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230318121828.739424-18-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18.03.2023 13:18, Bryan O'Donoghue wrote:
> Switch on usb-role-switching for usb_1 via TCPM. We need to declare
> usb-role-switch in &usb_1 and associate with the remote-endpoint in TCPM
> which provides the necessary signal.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 965742a5be7ae..43d549d6672e9 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1273,7 +1273,13 @@ &usb_1 {
>  };
>  
>  &usb_1_dwc3 {
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";
> +	usb-role-switch;
This could maybe go to the SoC DTSI.. Bjorn, Krzysztof, WDYT?

Also, please add a newline before the subnode.

> +	port {
> +		dwc3_drd_switch: endpoint {
> +			remote-endpoint = <&usb3_role>;
> +		};
> +	};
DWC3 ports (@0 for HS, @1 for SS and @2 for altmode) can definitely
go to the SoC DTSI.

>  };
>  
>  &usb_1_hsphy {
> @@ -1356,6 +1362,12 @@ &pm8150b_vbus {
>  
>  &tcpm {
>  	status = "okay";
Please add a newline before the subnode.

Konrad

> +	port {
> +		usb3_role: endpoint {
> +			remote-endpoint = <&dwc3_drd_switch>;
> +		};
> +	};
> +
>  	connector {
>  		compatible = "usb-c-connector";
>  
