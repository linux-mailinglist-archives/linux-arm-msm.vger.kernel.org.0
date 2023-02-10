Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0866921F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 16:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbjBJPVx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 10:21:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232631AbjBJPVv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 10:21:51 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28572B6D73
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:21:28 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id l12so5073132edb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uir/jHBYC/5IZ284bGDQz3M0J00B5bDwpvAn9rozFo8=;
        b=E2+G7hwqFEkVJIpKmVFoWKFBeVxaCfUXHhhqmojAnYb6RoBPcoe6jIEbQrDL94o6wa
         vlF19vC3g7CsizGRRPT/FNWlxFblwn3/KAK6mlhYTvbyigvg7xl6N2gzSP20GWRyLumE
         xMjo9TKc2C8zLdWWRKJVq1OJXnVe49wDhAA614GuBYubW5uS/meM3qmmXcIBxnG/JG8j
         gnwDfKcYTMGgLLHZzuAvrh19wvGpZZDl98HuM1qcKOc5pyn/Y1U/2/WRwyghJQlm8slr
         gN/IogL117YLEW9rPHRfh2bNv5WHdq5WqT3JEvoHmqlKmwe3SI1YBCX6W6i0sImkNz4E
         4uWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uir/jHBYC/5IZ284bGDQz3M0J00B5bDwpvAn9rozFo8=;
        b=xJGPQaxIntv3k+Pkd1+cIrTzBogp287yw1i89t7llko2PUfkVnO9vme0j+Zh7hdWsu
         eMfn17ETHUY+eRAx/RDjJBj19poGZYKGRvr5WpCWUaKT1tSM7mGM+rI7NOjJg56F1D/k
         3RWmUr/Y8jIzCi8uZHLyJjg34a6QjQNSrwKN6ZscfRjSrx2OYsYzlKWlWbm05u7U+bfm
         V9i0Ik+ph0AnKqYKbPmMt+9ptOPBtLKjDOjyRGlCfMEs6xjfcK/e1RtgddWMsxhkBiWG
         qWUDLULeS1zBt4ZROgGxt4tXq5PPzTIkuLKR65QfJ4uU8N7vJDugK5AIBSOQLQB2NGHa
         oWtQ==
X-Gm-Message-State: AO0yUKW/HqjdjAM/AU3lMPLduJpAP92RI4OIGipFu0SIGjSzoDVVJ5cE
        d1ENmlQnndK7H3YkgTGB2vShtQ==
X-Google-Smtp-Source: AK7set/kiHuZpiLQV0U5126ZTrO/Hr0uei28Fo++bkTEbsF3Ihxj+xTFyTutL4xaRx1XQex7ZhXvHw==
X-Received: by 2002:a50:cd06:0:b0:4aa:c3da:3ac5 with SMTP id z6-20020a50cd06000000b004aac3da3ac5mr17720588edi.3.1676042486655;
        Fri, 10 Feb 2023 07:21:26 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id ds11-20020a0564021ccb00b004a9b5c957bfsm2333161edb.77.2023.02.10.07.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 07:21:26 -0800 (PST)
Message-ID: <a0a47304-3d57-40ff-421d-f040420ec0b0@linaro.org>
Date:   Fri, 10 Feb 2023 16:21:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 08/11] arm64: dts: qcom: sm8350-hdk: add pmic glink
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
 <20230130-topic-sm8450-upstream-pmic-glink-v2-8-71fea256474f@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v2-8-71fea256474f@linaro.org>
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
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 77 ++++++++++++++++++++++++++++-----
>  1 file changed, 65 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index 54654eb75c28..28fc9a835c5d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -31,6 +31,40 @@ hdmi_con: endpoint {
>  		};
>  	};
>  
> +	pmic-glink {
> +		compatible = "qcom,sm8350-pmic-glink", "qcom,pmic-glink";
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
> @@ -666,23 +700,42 @@ &usb_1 {
>  };
>  
>  &usb_1_dwc3 {
> -	/* TODO: Define USB-C connector properly */
> -	dr_mode = "peripheral";
> -};
> +	dr_mode = "otg";
> +	usb-role-switch;
>  
> -&usb_1_hsphy {
Are you removing the hsphy completely?

Konrad
> -	status = "okay";
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
>  
> -	vdda-pll-supply = <&vreg_l5b_0p88>;
> -	vdda18-supply = <&vreg_l1c_1p8>;
> -	vdda33-supply = <&vreg_l2b_3p07>;
> +		port@0 {
> +			reg = <0>;
> +
> +			usb_1_dwc3_hs: endpoint {
> +				remote-endpoint = <&pmic_glink_hs_in>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			usb_1_dwc3_ss: endpoint {
> +				remote-endpoint = <&pmic_glink_ss_in>;
> +			};
> +		};
> +	};
>  };
>  
> -&usb_1_qmpphy {
> -	status = "okay";
> +&usb_1_dwc3 {
> +	dr_mode = "otg";
> +	usb-role-switch;
> +};
>  
> -	vdda-phy-supply = <&vreg_l6b_1p2>;
> -	vdda-pll-supply = <&vreg_l1b_0p88>;
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&usb_1_dwc3_ss {
> +	remote-endpoint = <&pmic_glink_ss_in>;
>  };
>  
>  &usb_2 {
> 
