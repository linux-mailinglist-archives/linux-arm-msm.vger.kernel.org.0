Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF876B0528
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 11:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjCHK6Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 05:58:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbjCHK6O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 05:58:14 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D67A25290
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 02:58:12 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id g17so20810592lfv.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 02:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678273090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ly+vDcCpnW54O8Ba0iQIw5nf+silshFfhHfrj3bQXis=;
        b=o4J5DX5HhtkX52CNpG2DzZ1FGxA2xKUEu/D5OUJ7pJkRIgovvKhJnBnbKQWl0VA3/S
         L316HAIE0lKsNolAkLCxg1HYQMXXsnSfdKr14mAh/eNUd9CZJWBtA+rltS7XYj9H/T6e
         skm+l0Zlpl7qVgIAo3eto83JZ9VAiyV+CpLnlF9fpDDjj2iSP0Qqp0Nlg1O4jdKWOtzk
         r2ug0rqZ4XYaAWGEfzWutjXlljrDISslY66OmGTwoFwHXn/5biTop3glq84gfdFMtTGL
         XQ8VzQGlpkx294J0Fhb2EWkO14HCyIEBxB3aQsbqGAlumvXNQhY8IexBrKZDNNC7IybR
         7cNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678273090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ly+vDcCpnW54O8Ba0iQIw5nf+silshFfhHfrj3bQXis=;
        b=7E59FA/OEek3zznrRCrA1Mj5lvqcWzyqGMMP53hYZ3Qsoa+nO7ruW8EMhCZqRvB1zW
         LmvxXx+wiT1gFE/fMUj3+V43CaQR2CJU942S0GmMT/63Jo6n2lchNmUGTE6m8epdsGYU
         Z3kdbqzUuU4IcfDr5nMEU38WljFPmwVLqRjqGI7v0Z5gfyiueGxkGcquTinhNwx56WlA
         dd25qBBdF2smfmzI23n0dstMbtJc2o8XfIVXqjp4xwD0GkHmIUGXG/1ZSjFTVA4Q787a
         jgd7FB5JvKAKgaTNL+/1CEKMD4aiSi2JB1LT2tdtAl9IsxOuErq6ZcTNxbegTyGkISKS
         7hKA==
X-Gm-Message-State: AO0yUKV9BNIRMeSLp7VxUzS1xiLLhhPUucveAKskWeYj4yH8rEKRelBF
        1BELze/eOQWplgs84e5G0Nl1KY6OWkDl2fIiLNs=
X-Google-Smtp-Source: AK7set/8ieG/KYRT4vvNRVEbRvpxWUw4E0am4sCZtg678xDy6Oc4MFpBAwPKrJVm9uUkjDnvD3yDAA==
X-Received: by 2002:ac2:51aa:0:b0:4db:38ba:ca61 with SMTP id f10-20020ac251aa000000b004db38baca61mr5042386lfk.53.1678273089957;
        Wed, 08 Mar 2023 02:58:09 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id b16-20020ac24110000000b004d862e9b453sm2305849lfi.196.2023.03.08.02.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:58:09 -0800 (PST)
Message-ID: <5aacecc9-e3e4-f229-350d-14d547b52578@linaro.org>
Date:   Wed, 8 Mar 2023 11:58:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 6/9] arm64: dts: qcom: sa8775p-ride: enable the SPI
 node
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230308104009.260451-1-brgl@bgdev.pl>
 <20230308104009.260451-7-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230308104009.260451-7-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.03.2023 11:40, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Enable the SPI interface exposed on the sa8775p-ride development board.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> index 5fdce8279537..d01ca3a9ee37 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -14,6 +14,7 @@ / {
>  	aliases {
>  		serial0 = &uart10;
>  		i2c18 = &i2c18;
> +		spi16 = &spi16;
>  	};
>  
>  	chosen {
> @@ -40,12 +41,25 @@ &sleep_clk {
>  	clock-frequency = <32764>;
>  };
>  
> +&spi16 {
> +	pinctrl-0 = <&qup_spi16_default>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>  &tlmm {
>  	qup_uart10_default: qup-uart10-state {
>  		pins = "gpio46", "gpio47";
>  		function = "qup1_se3";
>  	};
>  
> +	qup_spi16_default: qup-spi16-state {
> +		pins = "gpio86", "gpio87", "gpio88", "gpio89";
Rather weird to have an identical configuration for all
MOSI/MISO/CS/CLK pins.. Please doublecheck

Konrad
> +		function = "qup2_se2";
> +		drive-strength = <6>;
> +		bias-disable;
> +	};
> +
>  	qup_i2c18_default: qup-i2c18-state {
>  		pins = "gpio95", "gpio96";
>  		function = "qup2_se4";
