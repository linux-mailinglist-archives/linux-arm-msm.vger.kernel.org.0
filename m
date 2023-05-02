Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAFB6F4227
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 13:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233854AbjEBLAe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 07:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233970AbjEBLAZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 07:00:25 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFAB649FA
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 04:00:23 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4efea4569f5so4253212e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 04:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683025222; x=1685617222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPrcR5zRt/5wdmoUheBS/OrOG/+LC3z94YQ63WlKnZQ=;
        b=xkUEUV77JrPp/1qG0oTfYxFB25WXZqg4DiYgWLyQXjIz5eR94KOl2ZjCpyK2zj5ZI3
         uS9xa+3DNMvRKsUo8U9K6Lj4iyM04TeZULGJczQSrVKes1+3K8+WZOVA/w6EWxTAKmW3
         5JcbASx0QdkB9auDJmqYFeNF9ZNYfKJaxtlGLDNh3TM4E2KM1S+2idmHt664he0zQ1Hh
         bvovg8yF8UTzob248EfTSBg9p9wyK0H8vem32eapZoleKCSunRi+uqXZJNaSCpd3rxcb
         PlLM8+wzbyVWAT3jwZZTqKSPlO2hdJyXg0XrnIZkbMFhNm5rYYW5EyAcX7xmr25RuAOp
         zc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683025222; x=1685617222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPrcR5zRt/5wdmoUheBS/OrOG/+LC3z94YQ63WlKnZQ=;
        b=EIPCw6T/IbOQSj4yP3Ckr9RPb1Xj6719wivlsfap4g6WS61bxQG/VD5cWMRCbc6Ke7
         DPS0VcuCzm0YdrtIJ1ik83F3P6ZYcywih16AKAir0g0j9Jl7LSAx5SezbVJQ6T0vANqe
         fMd7ztPRbyXIYL88w1v6rAhm8auBRjT8CpghhixxsH9HcTTVL8Mw2tKA3BcpxEaRFkxD
         32ne+7zed4J5RBfY/DSu1zFbQghZjYeoGmIT4UhqsEz3XSaYpaBJPeBDgVKzFHHa5e3M
         lUKGB7ibiyBeGkYZoHkHeUZYVfjwWBAzVoqLQSZTm38lnScfmuVG/yHEHJVQ2nejaWwE
         0fHg==
X-Gm-Message-State: AC+VfDyPeIDLxRlOQqlD2ZghqL5VPFX4nrs8raMn2v/XJAPs6doFxMo8
        NDizghueNAZecfSN6lXRInRKMw==
X-Google-Smtp-Source: ACHHUZ5/l9KIOUjJwlsFquuO2UGiadDsYm2qawPBKPXxh57WhjgA/0sS9sFUW5Wal+pEYGDyZsis1w==
X-Received: by 2002:ac2:5fb0:0:b0:4ef:e990:8a53 with SMTP id s16-20020ac25fb0000000b004efe9908a53mr4649494lfe.18.1683025222029;
        Tue, 02 May 2023 04:00:22 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id z2-20020ac25de2000000b004ec89c94f04sm5287065lfq.155.2023.05.02.04.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 04:00:21 -0700 (PDT)
Message-ID: <109dc9fe-5ca7-1a98-3222-8c2297f4e8ce@linaro.org>
Date:   Tue, 2 May 2023 13:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 12/13] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 usb-role-switching for usb_1
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-13-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230501121111.1058190-13-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1.05.2023 14:11, Bryan O'Donoghue wrote:
> Switch on usb-role-switching for usb_1 via TCPM. We need to declare
> usb-role-switch in &usb_1 and associate with the remote-endpoint in TCPM
> which provides the necessary signal.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 19 ++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/sm8250.dtsi     |  4 ++++
>  2 files changed, 22 insertions(+), 1 deletion(-)
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
Any reason you're redefining it? You can just do

&dwc3_role_switch_in {
	remote-endpoint = <&pm8150b_role_switch_out>;
};


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
Similarly to the QMPPHY, the port definition can be moved to
the common node in the SoC DTSI

Konrad

> +					remote-endpoint = <&dwc3_role_switch_in>;
> +				};
> +			};
> +		};
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index af16d3ba76b8e..af988328db6b9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3740,6 +3740,10 @@ usb_1_dwc3: usb@a600000 {
>  				snps,dis_enblslpm_quirk;
>  				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>  				phy-names = "usb2-phy", "usb3-phy";
> +
> +				port {
> +					dwc3_role_switch_in: endpoint {};
> +				};
>  			};
>  		};
>  
