Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47BB76AC431
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 15:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjCFO7T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 09:59:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjCFO7R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 09:59:17 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD8AC24113
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 06:59:09 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id f18so13138193lfa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 06:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678114748;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QhVNkn7WjdCPxjaz1Tbb6M6f25CUgW3lMmHe/Fpo+44=;
        b=B98CerCD0C3TXd1bTgvi4zz6WXqNz6df3LuG6Woz7SsKohWROnbvqPKZWoYM8jHZPf
         WNjlCmXYGuZMS/6Zyv5wNdIeMa/D4IR3dI+RhLAT+2sPApdGWSsd+ihwj3f1IpOQsMY4
         rdD1PV52X4/Lx8pXCP9apdo5J66gVHExJi06wd38hwd9Ce7pI3UJE1SlLiotq/WwJmcU
         hUmr6jTdbEXW2exRAXDAxyFwwm2zxCHPjfMKLTw1rNl+8PXmQf5Xbm82J8eMmek8jymi
         QFfqRkQL/mjwGrHmkifwqrVLf+Qts0w/RbBmxA8MR9vd4+PWn0NGb8S85VI3QOLGpGEj
         ctCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678114748;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QhVNkn7WjdCPxjaz1Tbb6M6f25CUgW3lMmHe/Fpo+44=;
        b=RYucxlbVBrQhKnWoyOO9rC15iTDZmIRmfkul6udOe7fC5TDApL8Lev6p10F6QpX/Md
         b8xfWd1dVDnf/BvptN1auwvlVNg87/ThrYnQjlk2Cm1W8LsIYVEvfUQUmFviP5Thzj5O
         RF3e7CY4IOvP/U5qxCtRv4ZXvksIIcJJfiB0+A5oqlzDg9Z3ibdoNUDv4W1JZNnz5Zil
         IS+boqkdiX7ZlbdkumWHINAbFhoMr0vjzHNbpuSfHfaWScE5zRpvv0OPCgJYedfLLPLr
         JzP62rjQK2mJn6URAqMe5Vu9i5XIj5bagi7/DxCelOTxJHpqrOWd0osUECEMwKGDexE8
         lImA==
X-Gm-Message-State: AO0yUKUt4+eLJexmkIoJsVIZRwW9ZW3gUmsyfEPY5yKgOTZYCYfkbJyJ
        f50MxsspFCcFZgzqZrkOokobbw==
X-Google-Smtp-Source: AK7set9ePr0ms8Uvpnl/sRGtNzT8G0N3zfhUBzMUQJV1qSqgz+REhiBTCCz9pt9yvnmRXvTwvFSf7Q==
X-Received: by 2002:a05:6512:489:b0:4b5:2ef3:fd2a with SMTP id v9-20020a056512048900b004b52ef3fd2amr3496960lfq.47.1678114747990;
        Mon, 06 Mar 2023 06:59:07 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id d25-20020ac25459000000b004db2b111bf3sm1665832lfn.21.2023.03.06.06.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 06:59:07 -0800 (PST)
Message-ID: <49f2efcf-da1b-051e-6396-a6f4f0b9a97a@linaro.org>
Date:   Mon, 6 Mar 2023 15:59:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 8/9] arm64: dts: qcom: sa8775p-ride: enable the GNSS
 UART port
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
 <20230216125257.112300-9-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230216125257.112300-9-brgl@bgdev.pl>
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
> Enable the high-speed UART port connected to the GNSS controller on the
> sa8775p-adp development board.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 34 +++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> index d01ca3a9ee37..6f96907b335c 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -13,6 +13,7 @@ / {
>  
>  	aliases {
>  		serial0 = &uart10;
> +		serial1 = &uart12;
>  		i2c18 = &i2c18;
>  		spi16 = &spi16;
>  	};
> @@ -66,6 +67,30 @@ qup_i2c18_default: qup-i2c18-state {
>  		drive-strength = <2>;
>  		bias-pull-up;
>  	};
> +
qup_uart12_default: [...] {
    qup_uart12_cts: [...]
};

[...]

pinctrl-0 = <&qup_uart12_default>;

?

Konrad
> +	qup_uart12_cts: qup-uart12-cts-state {
> +		pins = "gpio52";
> +		function = "qup1_se5";
> +		bias-disable;
> +	};
> +
> +	qup_uart12_rts: qup-uart12-rts-state {
> +		pins = "gpio53";
> +		function = "qup1_se5";
> +		bias-pull-down;
> +	};
> +
> +	qup_uart12_tx: qup-uart12-tx-state {
> +		pins = "gpio54";
> +		function = "qup1_se5";
> +		bias-pull-up;
> +	};
> +
> +	qup_uart12_rx: qup-uart12-rx-state {
> +		pins = "gpio55";
> +		function = "qup1_se5";
> +		bias-pull-down;
> +	};
>  };
>  
>  &uart10 {
> @@ -75,6 +100,15 @@ &uart10 {
>  	status = "okay";
>  };
>  
> +&uart12 {
> +	pinctrl-0 = <&qup_uart12_cts>,
> +		    <&qup_uart12_rts>,
> +		    <&qup_uart12_tx>,
> +		    <&qup_uart12_rx>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>  &xo_board_clk {
>  	clock-frequency = <38400000>;
>  };
