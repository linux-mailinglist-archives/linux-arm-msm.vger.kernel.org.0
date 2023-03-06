Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 261416AC409
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 15:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjCFOyi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 09:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbjCFOyg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 09:54:36 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E4212057
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 06:54:19 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id s20so13061189lfb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 06:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678114457;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D4hPOH/rGtXOjMhjVg8DgbrSjsdHuXvtiEwaQN5mANg=;
        b=esIFSFEWPwIbRSAMpJ95HNs9W7PVydYc6P0VjqKceCXKQGaZANviPEZ5TyLbk7y4NX
         ZPmU4lbF7z6Ax0JzTeUqRnWy8ga8knqdTOV2ab7fS4ir5QHD7CB1yt77q2ZY49h/aIPg
         0mGIq+M/bCu4YprOIYHjlwkZjmUTBgFgIXngpwMk/5WA5W1NbsUJjJZbGMnMWe1AJW0c
         sHYLlYkex0oYyPHcHVUHa2NEaRKcdwq1gccnQrw331DNNVbyiJ84bS/+rcULV+WyNDoT
         RP9B+On2RTPv1prU0ZC/ka+b6NFFXFUAFVAEso2gvzCGzmoYgw16EjPeoxjCnTYRbCsa
         gZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678114457;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4hPOH/rGtXOjMhjVg8DgbrSjsdHuXvtiEwaQN5mANg=;
        b=C37nmc7SQtoRk4we7e9yXb4Y/2i3KBSo5dOo/EC9fl0LUERjrgbVRrNFcICezOpNHu
         mJrN8i3ElWfFvd3rmT8tL2WSuSGQgLnLLtDvXhx34MQyhTb66c0UXYA7fdFQ1iguJ0sC
         +o92BrE3jtw6d1lgHRZPsx5nqEAzzKBe3s31wCFU/fvByy7ZX7bRrsS9RhEm3LfG7viw
         0kFlFvSRdObKU4AhGabDcAtzEvlgPbbn5vwH8uVR2JZD3asN3qPydKD2V/XQe/rHsW2P
         7Dcz0N7uS0FUBh8ifUDIEd6BUkdo5gQCJ2Fj3EY/cNXywvR3rRRMx4D+JHyxllGdhZP2
         ncWw==
X-Gm-Message-State: AO0yUKVGcMiXh8gMGw5KQd8pyVXtrD3/UecUVfaKIK1GLlraWXvSe+HD
        VFmV/Y9bu2p8Ld5r46bfgf7/lw==
X-Google-Smtp-Source: AK7set+duXkxOrZM2gtgFBIaFnyS/nNfOPTanwIJZcijDHJuasu1PglSvwBJflmT1IX06jz2/ijhcw==
X-Received: by 2002:ac2:568c:0:b0:4d7:4826:3192 with SMTP id 12-20020ac2568c000000b004d748263192mr2744357lfr.5.1678114457708;
        Mon, 06 Mar 2023 06:54:17 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id x16-20020ac259d0000000b004d291dcee7fsm1667696lfn.55.2023.03.06.06.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 06:54:17 -0800 (PST)
Message-ID: <917c2d90-71e3-72d5-e22c-0ff9d2533455@linaro.org>
Date:   Mon, 6 Mar 2023 15:54:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 4/9] arm64: dts: qcom: sa8775p-ride: enable i2c18
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230216125257.112300-1-brgl@bgdev.pl>
 <20230216125257.112300-5-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230216125257.112300-5-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16.02.2023 13:52, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This enables the I2C interface on the sa8775p-ride development board.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> index a538bb79c04a..5fdce8279537 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -13,6 +13,7 @@ / {
>  
>  	aliases {
>  		serial0 = &uart10;
> +		i2c18 = &i2c18;
>  	};
>  
>  	chosen {
> @@ -20,6 +21,13 @@ chosen {
>  	};
>  };
>  
> +&i2c18 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&qup_i2c18_default>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>  &qupv3_id_1 {
>  	status = "okay";
>  };
> @@ -37,6 +45,13 @@ qup_uart10_default: qup-uart10-state {
>  		pins = "gpio46", "gpio47";
>  		function = "qup1_se3";
>  	};
> +
> +	qup_i2c18_default: qup-i2c18-state {
> +		pins = "gpio95", "gpio96";
> +		function = "qup2_se4";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
>  };
>  
>  &uart10 {
