Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51E5D6EB9C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Apr 2023 16:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbjDVOwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Apr 2023 10:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjDVOwH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Apr 2023 10:52:07 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF9201981
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Apr 2023 07:52:05 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4edb26f762dso2849540e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Apr 2023 07:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682175124; x=1684767124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ywAzN0uwbepU/kzWWxbD8/+wKk3qdyKFmWyIzqUzcGQ=;
        b=JFJkSdKtcHg59NvHIer99gkKAEicInvefBh6FZHy9yKQu1SenWhI66HF4xGkIUxm1Q
         Pkg5W6ri5pkEVPnCfDezi+wDbaRRtrEn4CKDtlAgHrYwC+GvgEhJghghVpX2YGRgLlkc
         lcm4wAxqDZKg3FUJeKCTA9DGAZeAQdSm/e/+1PwMtKoZsTjzW1RZQGZXuanLWDyJFyBR
         uJUjmI4MzdCbfcqion3yjOA2sI1aUHmkR0pSTSjHZBcj2qfFbyYozPzjKQ9cMz+tLvgN
         /5fWqTjgmeL8tVbIhJSUY6zepUm1LIFjJz/LuwVYYkaAg4bWRvF8v7fXFwnoFYF3zOcs
         aLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682175124; x=1684767124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ywAzN0uwbepU/kzWWxbD8/+wKk3qdyKFmWyIzqUzcGQ=;
        b=Wq59BzRphYnNclPXjPoshHtPyQ9OePJrfuA7Clpbfsaf7DDWUrcvokV1zRYBRQsfsK
         7zRWZkMs0/XJ2dG+1XyljH6mG9XU4Mq9NMoRL//tOAThL+5NJikG/Wr8xKlLABrbYRBE
         kD/C5W7O+il7et+tgJ7E3/6N4P5bD5ugqD+y91L8G2FuhpV4CRyJUoxL4I+v8o7QuuLC
         YQs6PQmkAVmHRIOu8qHZO0JqyM9+SuELuCeVysH8rvy2MHNkApJN+vqENfqaqocUyNeK
         wnuFMe04FzXPSgpoVYIk8qk1NKc2hmetd848Dbv7j629PQtXbzeWFBnOdo3GiNozszxk
         dh2g==
X-Gm-Message-State: AAQBX9fK+lUNQ7RmPfiq7gedU4+gNjoEmmGI2AyK2WYIkrjJBcEQ6wuP
        9Y8bguXxtyvuyWfbY3fZzcPJzw==
X-Google-Smtp-Source: AKy350Yy9He00JyxJYgCrhoncnpgPUu+lmynJn6gPzpunftRFikNXDR8nvbg2gAzLONeNNn+6T+e3Q==
X-Received: by 2002:ac2:490e:0:b0:4d7:59e6:388e with SMTP id n14-20020ac2490e000000b004d759e6388emr1973780lfi.46.1682175123979;
        Sat, 22 Apr 2023 07:52:03 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id q2-20020ac25a02000000b004b4cbc942a3sm923986lfn.127.2023.04.22.07.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Apr 2023 07:52:03 -0700 (PDT)
Message-ID: <31bf025d-decf-c30c-8ffe-7e935bb31790@linaro.org>
Date:   Sat, 22 Apr 2023 16:52:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 11/14] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 usb-role-switching for usb_1
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <20230413113438.1577658-12-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230413113438.1577658-12-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.04.2023 13:34, Bryan O'Donoghue wrote:
> Switch on usb-role-switching for usb_1 via TCPM. We need to declare
> usb-role-switch in &usb_1 and associate with the remote-endpoint in TCPM
> which provides the necessary signal.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
This belongs to the SoC DTSI as it describes the capabilities
of the USB controllers on the chip.

Also please add a newline before each subnode.

Konrad
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 1e0b6fd59abc9..b5cc45358a474 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1273,7 +1273,13 @@ &usb_1 {
>  };
>  
>  &usb_1_dwc3 {
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";
> +	usb-role-switch;
> +	port {
> +		dwc3_role_switch_in: endpoint {
> +			remote-endpoint = <&pm8150b_role_switch_out>;
> +		};
> +	};
>  };
>  
>  &usb_1_hsphy {
> @@ -1359,5 +1365,16 @@ connector {
>  					 PDO_FIXED_DUAL_ROLE |
>  					 PDO_FIXED_USB_COMM |
>  					 PDO_FIXED_DATA_SWAP)>;
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				pm8150b_role_switch_out: endpoint {
> +					remote-endpoint = <&dwc3_role_switch_in>;
> +				};
> +			};
> +		};
>  	};
>  };
