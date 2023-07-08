Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40F3C74C00D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 01:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjGHXsa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jul 2023 19:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjGHXs3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jul 2023 19:48:29 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993CF1BF
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jul 2023 16:48:26 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fba03becc6so5488750e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jul 2023 16:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688860105; x=1691452105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d1Mi3wHWXiyO0BWAg/qOl8Ezj5RyJM+jSWB6JmJBQYU=;
        b=O0/IKZjyzd3LPq4s6iVGkdUlccTt/zNXSPeHRNfTb9dzPvHNE+zmPwNx2a9nF7OHh0
         r+pcYPVL6p16pNHHuzo8ah1LrFI6K+nojO/W8DIzQPUqcyss5qIHWtytVAb/hgQq3FFN
         9EqGgzDpsoLlSjp1pDreEkmtVPluUpclZ+iwJpd8usaQwAPKZeiZ2Iig25mErnqsmREf
         LBYB8nLbU3VCI1dMFdVoP9WuzmpRe6UaQmwha414uA/2gh2vNyNdEm3rUC4s+gCXvtbY
         f1nW6CD7pz8lDBNWGPJ063wWRFP60pOW3DnBtujzefDlH27FVqizbvNNZfa28ljCOvY8
         /xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688860105; x=1691452105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1Mi3wHWXiyO0BWAg/qOl8Ezj5RyJM+jSWB6JmJBQYU=;
        b=aSeXfQymSQcZfLz9qObIn6IfUrL0Mi5j6RITf8rviVqOYrsUPrr5x3FuYMPcnrr1dq
         Dawxe+1CiNDw2/rKTSU//YJMVdCEH0OlXcI/Komwl88wEWe/YKXeygvYNRanuKbJPd2Z
         0YH0DGphSXBlWMbvVpyVexXhMfu7VhyT9k8+q1K8OIzIaoBaJ/s27kjLYW1Dvt+eExOt
         gDOJE70GnzJ2TP/Nvhcmpx0je8tRVY8+uf2c6bMpTo4RYWCnfGgGEVnD3oJoBMSAu0Bp
         NOBam5Hk9gsdwGiNZ+HlfubdOA8M9oCzPZwDqcpqDwQpZR3AfaRG9T7L70wLsb6NRq53
         Rqjw==
X-Gm-Message-State: ABy/qLaQ1TVXuAS8Chu5WexFB3bM+2blQfqkjqwf512YCwCAVK+ZgD9x
        P9uCWa3vKlsdlSiW5NWal/AqpA==
X-Google-Smtp-Source: APBJJlFNXf0aWvBVRzpbx36An29G2A6c6tzsl78luVtii+88NG5Q0fr16aFpc5jLChy4nYBvA+z4Aw==
X-Received: by 2002:ac2:5296:0:b0:4f8:6831:fd70 with SMTP id q22-20020ac25296000000b004f86831fd70mr3129812lfm.3.1688860104534;
        Sat, 08 Jul 2023 16:48:24 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w23-20020a19c517000000b004fbb1f70ceesm1149327lfe.227.2023.07.08.16.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 16:48:23 -0700 (PDT)
Message-ID: <9416e2b4-7ef9-1765-c766-a58e1125ba8c@linaro.org>
Date:   Sun, 9 Jul 2023 02:48:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v8 10/11] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 usb-role-switching for usb_1
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
 <20230515133643.3621656-11-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230515133643.3621656-11-bryan.odonoghue@linaro.org>
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
> Switch on usb-role-switching for usb_1 via TCPM. We need to declare
> usb-role-switch in &usb_1 and associate with the remote-endpoint in TCPM
> which provides the necessary signal.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 19 ++++++++++++++++++-
>   arch/arm64/boot/dts/qcom/sm8250.dtsi     |  4 ++++
>   2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index d80a22bff7969..580ed63c6fb54 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1273,7 +1273,12 @@ &usb_1 {
>   };
>   
>   &usb_1_dwc3 {
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";
> +	usb-role-switch;
> +};
> +
> +&usb_1_dwc3_role_switch_in {
> +	remote-endpoint = <&pm8150b_role_switch_out>;
>   };
>   
>   &usb_1_hsphy {
> @@ -1362,5 +1367,17 @@ connector {
>   					 PDO_FIXED_DUAL_ROLE |
>   					 PDO_FIXED_USB_COMM |
>   					 PDO_FIXED_DATA_SWAP)>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;

Empty line before the child node, please.

> +				pm8150b_role_switch_out: endpoint {
> +					remote-endpoint = <&usb_1_dwc3_role_switch_in>;
> +				};
> +			};
> +		};
>   	};
>   };
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 0bc7486e59e54..b9f55a9ef89f8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3740,6 +3740,10 @@ usb_1_dwc3: usb@a600000 {
>   				snps,dis_enblslpm_quirk;
>   				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>   				phy-names = "usb2-phy", "usb3-phy";
> +
> +				port {
> +					usb_1_dwc3_role_switch_in: endpoint {};
> +				};
>   			};
>   		};
>   

-- 
With best wishes
Dmitry

