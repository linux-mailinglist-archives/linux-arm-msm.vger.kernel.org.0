Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD649680B17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 11:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232776AbjA3KlU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 05:41:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235485AbjA3KlS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 05:41:18 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4DEA30E91
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 02:41:16 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id qw12so14501511ejc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 02:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97/znp2230QJNhFIapyUFDHAE778/+RAJ0xxz1nk3/E=;
        b=GjYICRrne9CSOAg6uWRCmWyly6EbzYEqX4ldhGUQKU0osjgMim1E5WJ483fuvzOu6F
         s6Z5edpSdFy/NjdFzO5SAp6s22pVwv3RFqODmDDfH/8R43lTBms9PHUnmAF5I5GfwHh3
         VCDXI/7EvNW3cYs3gpXypkqirWAPOk2gIAeDzYOXi/yIp5DgKCideyDn2lT1iAC2tPhO
         QOC1HvzynFgSs86RfexQWZUTKn9/J6bM3nXfY9yTnRDTYdwFafrNBpbc82pqPzJiYsJg
         8AWE4Totx+ehOM/x4ibysnsOTFHycGjMLmpMiWq94N/0eCka0rk50y0fbcWtpCRW4mC6
         qFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=97/znp2230QJNhFIapyUFDHAE778/+RAJ0xxz1nk3/E=;
        b=t3GVchXmYlHEM7cQ0x8d9i5Vwx+przUzN54A67L7ltR3dHMOSGhyxAulPoUT9xONNK
         u2uFv0BDccqlnDs0DlNOImGp3uHspCj/i5ORse8iU/I75TflYc79y5B0+x7v82uP/qFg
         eLt1cMJhrDcdYnqS3rX0P4aFw5XubHpNLKIKiBhbOf+MZBZWume8MEgsdKYkiXsteZyL
         z57FoBnGEh5qNHQ7FcxBpWE+pS1ylVSPqogjBMLbQTyDS4sCOsGsCwr2SxpXk1XE57c9
         oPbBW8KO3f/l905Dq9Xt33PoNfnK0WOKaXOXa/uB+owof4vqSgqw4EBi74yGaw9VCi3D
         OqtQ==
X-Gm-Message-State: AO0yUKWJuONqEE3KImk1RxUKxaBMd64cnsb+y56q7CzCzL4webHZN6eI
        QOtoVn+B8VAzBh0/NnRIJbkDXg==
X-Google-Smtp-Source: AK7set9JxzzkgOcPgM3MNIcB9kqa35FeLk0/0bFeqnLVmtL4mvZ093dlX4S9Eu+v5FgZuWA0wAXiBQ==
X-Received: by 2002:a17:906:5ace:b0:88a:7408:384c with SMTP id x14-20020a1709065ace00b0088a7408384cmr929296ejs.47.1675075275384;
        Mon, 30 Jan 2023 02:41:15 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id i4-20020a170906264400b0084d35ffbc20sm6670053ejc.68.2023.01.30.02.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 02:41:15 -0800 (PST)
Message-ID: <f178793c-5e73-65d0-0daf-72f99b201d4e@linaro.org>
Date:   Mon, 30 Jan 2023 11:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8550-mtp: add pmic glink node
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
References: <20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org>
 <20230130-topic-sm8450-upstream-pmic-glink-v1-6-0b0acfad301e@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v1-6-0b0acfad301e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30.01.2023 10:54, Neil Armstrong wrote:
> Add the pmic glink node linked with the DWC3 USB controller
> switched to OTG mode and tagged with usb-role-switch.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 34 ++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index 725d3bc3ee72..f054c11fe1f6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -27,6 +27,31 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	pmic-glink {
> +		compatible = "qcom,sm8450-pmic-glink",
8550?

Otherwise same comments as for the previous patch

Konrad
"qcom,pmic-glink";
> +
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
> +				port@0 {
> +					reg = <0>;
> +					pmic_glink_dwc3_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_out>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
>  	vph_pwr: vph-pwr-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -546,7 +571,14 @@ &usb_1 {
>  };
>  
>  &usb_1_dwc3 {
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";
> +	usb-role-switch;
> +
> +	port {
> +		usb_1_dwc3_out: endpoint {
> +		      remote-endpoint = <&pmic_glink_dwc3_in>;
> +	      };
> +	};
>  };
>  
>  &usb_1_hsphy {
> 
