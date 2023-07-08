Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB0174C00F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 01:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjGHXs6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jul 2023 19:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjGHXs5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jul 2023 19:48:57 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C011E1BB
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jul 2023 16:48:56 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso4980958e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jul 2023 16:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688860135; x=1691452135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVJiNhNCySjlINjx/jril0AySwmYmxR3xszeJGSNhNY=;
        b=ZXHR8Vn5Dn8KGYy1nNZw00c9d/URIY1mZ/x+dMlROHcDnPKsb5g/FWBNAYRys9VbcQ
         5dN93wxn3goQmoy7x162xf3CihbwHFCoGY9lcF5ED5bPTUKTYzV1alW3W++86JNsRepO
         x8CFFWdmNw2zop7FMrmnPNx4QShghHBEQ24KXljvk1dQUS6KTBPg67ihb1einSv/B814
         KLhp1zGrFiOdNKYaB9f9O2svEhPEHKkbW/4k4by2Jg2S0QRB6Y9CjKurhQ0NL3zYE22d
         dvIIGFaTd4yTgFhV9gTLlfE0kGBPThYEpeIiSx5mx6TuJjeE1BalcGF5oFx/fJQYD4zM
         gTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688860135; x=1691452135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVJiNhNCySjlINjx/jril0AySwmYmxR3xszeJGSNhNY=;
        b=TXjFUlvC8ABuXOWvZcN7/a/oX45ei3A5Qnfu1kQxAgGPUc3wGA4ZiH6LyYrVTxqBtP
         1h4ImY/0keMi1HIl5YYPwOseX67mHFvbi89Nebyb43Y2uwfWDAnT3dLzLCrgcdETnzqt
         nqad81poeIQFf2n0rOxQ1G0VRPKtZMFiwXgfC7Xpb0kF7msPbEBEf2SDaQKv3cvvs+zJ
         DGRnWKjLpLEmHbgJOqs2QwfSfnAba/KH7AtMP+w68CcohcCRaro96plvc6UWg2tXdB8q
         ALMas7cDKnq2XvKTRbGS3jciIYGCCxUE+sPz98WCgehIj3Q3QgPic4k+dACJ5gtEIYEu
         ms0g==
X-Gm-Message-State: ABy/qLYx1ro3LyRx8ASp+0RguV4uy2tz93axhD1WdaYVx9T10soKAakN
        1XHo+u17zWN1e8Z0Ox2bPUg2wXLhhf3PPfnqfjo=
X-Google-Smtp-Source: APBJJlHLtm2A/ixoljAyvgOWXA+7wF91ZxKHd+5tB9uFY0LQhroc6GkUwhXxxoPyxl2WWLzPwu3RVw==
X-Received: by 2002:a05:6512:60f:b0:4ed:cc6d:61fe with SMTP id b15-20020a056512060f00b004edcc6d61femr5855196lfe.24.1688860134826;
        Sat, 08 Jul 2023 16:48:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id m25-20020ac24299000000b004fb8c31c8dfsm1150189lfh.267.2023.07.08.16.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 16:48:54 -0700 (PDT)
Message-ID: <dfc02969-4ef1-c548-c66b-dca37be84495@linaro.org>
Date:   Sun, 9 Jul 2023 02:48:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v8 11/11] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 orientation-switch for usb_1_qmpphy
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        lujianhua000@gmail.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
 <20230515133643.3621656-12-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230515133643.3621656-12-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/05/2023 16:36, Bryan O'Donoghue wrote:
> Switch on USB orientation-switching for usb_1_qmp via TCPM. Detecting the
> orientation switch is required to get the PHY to reset and bring-up the PHY
> with the CC lines set to the appropriate lane.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 11 +++++++++++
>   arch/arm64/boot/dts/qcom/sm8250.dtsi     |  1 +
>   2 files changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 580ed63c6fb54..9b314c390e3f8 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1294,6 +1294,11 @@ &usb_1_qmpphy {
>   
>   	vdda-phy-supply = <&vreg_l9a_1p2>;
>   	vdda-pll-supply = <&vreg_l18a_0p92>;
> +	orientation-switch;
> +};
> +
> +&usb_1_qmpphy_typec_mux_in {
> +	remote-endpoint = <&pm8150b_typec_mux_out>;
>   };
>   
>   &usb_2 {
> @@ -1378,6 +1383,12 @@ pm8150b_role_switch_out: endpoint {
>   					remote-endpoint = <&usb_1_dwc3_role_switch_in>;
>   				};
>   			};
> +			port@1 {
> +				reg = <1>;

Empty line before the child node, please.

> +				pm8150b_typec_mux_out: endpoint {
> +					remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
> +				};
> +			};
>   		};
>   	};
>   };
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index b9f55a9ef89f8..f538216f3704f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3588,6 +3588,7 @@ ports {
>   
>   				port@0 {
>   					reg = <0>;

And maybe here too.

> +					usb_1_qmpphy_typec_mux_in: endpoint {};
>   				};
>   
>   				port@1 {

-- 
With best wishes
Dmitry

