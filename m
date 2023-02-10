Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D392A6921FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 16:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232702AbjBJPWO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 10:22:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232689AbjBJPWN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 10:22:13 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3827395E
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:22:04 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id jg8so16773340ejc.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oew11yu8MfKQXmlqds/ZdpKNPQOBOvmSSo/K5IYjTAM=;
        b=eTv8R2vImTQQIHG54ISpCFbu/N47MXf/nxtUhciMhXMLxB/Zm67IaydkDMWL1dZm+I
         uUWpLFxAngPa0pLGL3jSq0hdfrXH/CDO1sFsMzJZcybJnB39Ut6gm4qOibdY90vNKIAc
         +hLM3dHS99dpMs3roN3SjtGhu381MjBqXK2fOxF8AZXur/COtMzmqA4VKYzwf7Zg2Z5C
         Eo11DgjwieCsmdZD7/4X+bd/cn9uqcwCZ+mMIBgbCxteStmiNmtQcV4cR7MD+HGsUAV5
         3c59fScBARO7fZEty+tzi9Jw9EeEphx0tpD9t7pVCoX47luqg2rvC7OCe9mjgzzNi+aA
         sMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oew11yu8MfKQXmlqds/ZdpKNPQOBOvmSSo/K5IYjTAM=;
        b=CjpCX5+drMFz0SqKkIONG2lbi/F8hQzLUF0kv5rWxEm5eayKk75UzzBqnLbB+HELAh
         GlYZhJwNSPM3f3umCY45n5V92xv9NOLwj9R8H7z2zL9nMHUAFjioc4nWPaxZcvpYKO0s
         M39yHQo1NRYzX6jrv547JAxI8caoHuq3lYKDmJh7Z8AFXbeR2BfnLTkuLcHBLHBFcqcv
         w5KG9gWy/cnCo6IrDlw+cZcSfQWXCwXWkUFPvhSqyGxNVIcIAYT+DdGj8OBmyDSP5KVT
         H5WOKIHE120oz3P0SQO6RVt5sNA/cbQIlUV0S06gRTK6kMrU4IWmAiJs51rVWbdmwwcz
         vxrA==
X-Gm-Message-State: AO0yUKVch0n52ahXyd/NszzXOOdp8cJFIMvlXi4MFwrksZ6FCQCP2CVN
        +7T1a7Rce75jnPwBUH/mr2NHmQ==
X-Google-Smtp-Source: AK7set9VjovkMb4GQDk67TMl80fnNirRSZ3EC2VnEHufl4wFD6e8omACLOkNfxVsPgfemhuSyxV0YA==
X-Received: by 2002:a17:906:1514:b0:88c:4f0d:85af with SMTP id b20-20020a170906151400b0088c4f0d85afmr16208944ejd.75.1676042523160;
        Fri, 10 Feb 2023 07:22:03 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id i12-20020a170906250c00b008adc971f5acsm2515268ejb.178.2023.02.10.07.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 07:22:02 -0800 (PST)
Message-ID: <ea64a232-9784-c721-0ccb-8744f2eb045e@linaro.org>
Date:   Fri, 10 Feb 2023 16:22:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 09/11] arm64: dts: qcom: sm8450-hdk: add pmic glink
 node
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230130-topic-sm8450-upstream-pmic-glink-v2-0-71fea256474f@linaro.org>
 <20230130-topic-sm8450-upstream-pmic-glink-v2-9-71fea256474f@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v2-9-71fea256474f@linaro.org>
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



On 10.02.2023 16:02, Neil Armstrong wrote:
> Add the pmic glink node linked with the DWC3 USB controller
> switched to OTG mode and tagged with usb-role-switch.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 45 ++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index feef3837e4cd..1755ee3aa04c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -87,6 +87,40 @@ lt9611_3v3: lt9611-3v3-regulator {
>  		enable-active-high;
>  	};
>  
> +	pmic-glink {
> +		compatible = "qcom,sm8450-pmic-glink", "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_ss>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
>  	vph_pwr: vph-pwr-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -724,7 +758,16 @@ &usb_1 {
>  };
>  
>  &usb_1_dwc3 {
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";
> +	usb-role-switch;
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&usb_1_dwc3_ss {
> +	remote-endpoint = <&pmic_glink_ss_in>;
>  };
>  
>  &usb_1_hsphy {
> 
