Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A55B694839
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 15:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbjBMOig (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 09:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbjBMOi3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 09:38:29 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C6B1C594
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 06:38:23 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id lu11so32419666ejb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 06:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUlXZt5oQBO5ZjSgXSiLtzBvwbC0c48+aoeBfUKza8k=;
        b=uSjmmIZRhpr3H/PWz2qzwBO0ZzRl8xH9kPFNtCdf77h6AL5t1xjPSE+ZqVB8YFw3/h
         SaSUfdwwzzPF9AEH6Oh0Sf7NsTdeSFZnzWiEQVugAnxRsqCNbRqVA+v2r1/WFZ8FVKxD
         LIw/ngaiXUEx2nzMNlWFghMJY5FPzOEsdwRtt5TJUCMmpXDFE2GhR1LEfOVBmEQrF7k/
         IHBaBH3fSzkyxxS9MD0Br4ZtqcHSs8zNOBE3vGBgh0u+QIuua5fAI9urJMmSwdnzX/0x
         WVsRMLy14HUXpyhcm+Fki3In6mCurLM3tpdzuaV7he8fd1PQ5fn/6HUTZo7MgVysJm9Q
         OpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUlXZt5oQBO5ZjSgXSiLtzBvwbC0c48+aoeBfUKza8k=;
        b=IL/6X0j2e4IhQrp4l6AuQ/uwYhddcO79mwmaCmmpY97GnyQld/eBPKHUUNswHJRtoy
         dJ5u83Ohtwt7RKyzcykLS/PjG39mfJ/Xi4gnaliYBQEHG5iLSaRvyGdk9pHTIBqpSeVs
         Hdjk6zd5wIgIZS2a/1IBk2eJ4eUcAHgXKZKg06EFvHv6Saz7MS/HoI80K183tbk5fSJz
         RkUhnbDlFbNlYS+TzI929M58Q85qN4a/dHRMhJZgNdmBt5vm40qB7iL0qNASDClTbezh
         ZnryGi0l/DikXU4uUgXhmDkKaJ+dI5hl3Z16W7pOYr3wE20tm/LBJgt3f1cgwSlRYLDh
         47hA==
X-Gm-Message-State: AO0yUKX5HHwLjAPMdNRCoxWN+7c3hS6vX4V63tmUqMSuIVFJWoOyar5m
        K76ImTqGWGvE3kJ0w0gkBfs8rQ==
X-Google-Smtp-Source: AK7set91nYaB1XNNNxb+llEG/j3BYKk/kVjm4FMLyh+w/aFGEsk4rvwfhWkei8OKAbdKr/+VRc503g==
X-Received: by 2002:a17:906:eb14:b0:87b:d409:f087 with SMTP id mb20-20020a170906eb1400b0087bd409f087mr25101635ejb.21.1676299101809;
        Mon, 13 Feb 2023 06:38:21 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id n5-20020a17090673c500b0088aadc18b69sm6885347ejl.101.2023.02.13.06.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 06:38:21 -0800 (PST)
Message-ID: <632e5aa9-6b0a-032f-27db-3cbda6c66d7f@linaro.org>
Date:   Mon, 13 Feb 2023 15:38:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm7225-fairphone-fp4: move status
 property down
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230213-fp4-more-i2c-v1-0-5be09dbb5ce6@fairphone.com>
 <20230213-fp4-more-i2c-v1-1-5be09dbb5ce6@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230213-fp4-more-i2c-v1-1-5be09dbb5ce6@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.02.2023 14:26, Luca Weiss wrote:
> Currently the dts contains a mix of status-as-first-property (old qcom
> style) and status-as-last-property (new style).
> 
> Move all status properties down to the bottom once and for all so that
> the style is consistent between different nodes.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 34 +++++++++++------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index f7602e93121a..86114dd2c0c4 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -110,8 +110,8 @@ active-config0 {
>  };
>  
>  &adsp {
> -	status = "okay";
>  	firmware-name = "qcom/sm7225/fairphone4/adsp.mdt";
> +	status = "okay";
>  };
>  
>  &apps_rsc {
> @@ -355,13 +355,13 @@ &cci1_i2c0 {
>  };
>  
>  &cdsp {
> -	status = "okay";
>  	firmware-name = "qcom/sm7225/fairphone4/cdsp.mdt";
> +	status = "okay";
>  };
>  
>  &i2c10 {
> -	status = "okay";
>  	clock-frequency = <400000>;
> +	status = "okay";
>  
>  	haptics@5a {
>  		compatible = "awinic,aw8695";
> @@ -396,8 +396,8 @@ &ipa {
>  };
>  
>  &mpss {
> -	status = "okay";
>  	firmware-name = "qcom/sm7225/fairphone4/modem.mdt";
> +	status = "okay";
>  };
>  
>  &pm6150l_flash {
> @@ -423,11 +423,11 @@ led-1 {
>  };
>  
>  &pm6150l_wled {
> -	status = "okay";
> -
>  	qcom,switching-freq = <800>;
>  	qcom,current-limit-microamp = <20000>;
>  	qcom,num-strings = <2>;
> +
> +	status = "okay";
>  };
>  
>  &pm6350_gpios {
> @@ -441,8 +441,8 @@ gpio_keys_pin: gpio-keys-state {
>  };
>  
>  &pm6350_resin {
> -	status = "okay";
>  	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";
>  };
>  
>  &pm7250b_adc {
> @@ -535,21 +535,21 @@ &uart9 {
>  };
>  
>  &ufs_mem_hc {
> -	status = "okay";
> -
>  	reset-gpios = <&tlmm 156 GPIO_ACTIVE_LOW>;
>  
>  	vcc-supply = <&vreg_l7e>;
>  	vcc-max-microamp = <800000>;
>  	vccq2-supply = <&vreg_l12a>;
>  	vccq2-max-microamp = <800000>;
> +
> +	status = "okay";
>  };
>  
>  &ufs_mem_phy {
> -	status = "okay";
> -
>  	vdda-phy-supply = <&vreg_l18a>;
>  	vdda-pll-supply = <&vreg_l22a>;
> +
> +	status = "okay";
>  };
>  
>  &usb_1 {
> @@ -562,26 +562,26 @@ &usb_1_dwc3 {
>  };
>  
>  &usb_1_hsphy {
> -	status = "okay";
> -
>  	vdd-supply = <&vreg_l18a>;
>  	vdda-pll-supply = <&vreg_l2a>;
>  	vdda-phy-dpdm-supply = <&vreg_l3a>;
> +
> +	status = "okay";
>  };
>  
>  &usb_1_qmpphy {
> -	status = "okay";
> -
>  	vdda-phy-supply = <&vreg_l22a>;
>  	vdda-pll-supply = <&vreg_l16a>;
> +
> +	status = "okay";
>  };
>  
>  &wifi {
> -	status = "okay";
> -
>  	vdd-0.8-cx-mx-supply = <&vreg_l4a>;
>  	vdd-1.8-xo-supply = <&vreg_l7a>;
>  	vdd-1.3-rfa-supply = <&vreg_l2e>;
>  	vdd-3.3-ch0-supply = <&vreg_l10e>;
>  	vdd-3.3-ch1-supply = <&vreg_l11e>;
> +
> +	status = "okay";
>  };
> 
