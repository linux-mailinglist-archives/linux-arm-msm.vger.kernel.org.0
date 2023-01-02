Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44D7065B052
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 12:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbjABLNU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 06:13:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjABLNT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 06:13:19 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4D8296
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 03:13:16 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id p36so41147703lfa.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 03:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XrAuu6jhWQcJPRy3SyR8DJMB6n9oyPHi0cJUo5aTP1M=;
        b=TDxK7d58A8UUv02W8aKwKPEUAyJ3zuNrur2SMEHuZv/XN6EQqTht78KO95AEPDz5RV
         XxxEva42gcnEMTwkAPjn3oj7ehnaYPkSwT0MdR8nZWcvjKvVYOBebfR8w7UUh7/pLqU9
         KcTPhLR0CUOUieC1SXUV/kaqIrYFqep23w19lUkOzpQl39pLKy+A3aLxFlnKWZwCpHOS
         fFaMsX2H4/Itrmi/HxL36MATC5M+1/6w1heZrytpk5167EhpARmKctB98lb3o0zAcAxf
         H4LxWB+BJPF14LWQaw+BwG2KZyhjda+u3A51HmIlS/cDAtw9TC9/fc4sp1b5OkERnKJB
         fNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrAuu6jhWQcJPRy3SyR8DJMB6n9oyPHi0cJUo5aTP1M=;
        b=krOAkpVa/F6RBkMjp9KGmuQio9bxarISNzYAthtUqLKKmVlmIuLc5PuHyOSbbrloIv
         oi9iai5uUGMaczxwb8/pBVm6DQrjrxNxdRq0f++pfuShyBIITH7nBAtWa+guY2ySkKuV
         pyJfc6NZqrwxcMAcT8ju4nfaHI+ek0EgccfrQ6ybhIcvjxPJ0Y0ksVrAIDCiBPldoczs
         XcbvF63Ceba06kAXxEr+hp7pV/eT4TfOqyf4hDRoA9pdazFQ13/duiiAj4BKd0itCp3L
         Bg+YEikLbS0L0rkfLtzfNHvM3rKw6B9LPcIpBbJ3RcQVoQc2jqJ5zJUaad2y/bWpRytJ
         HzsA==
X-Gm-Message-State: AFqh2kqQJLeoPh/I3h6g5vzW+k7RrD94aIKn+H7790Y2UWHoYrZo1+sM
        g3+3F04M7x5H0aQjlC1twOOy1yXc59NGA9bj
X-Google-Smtp-Source: AMrXdXu9A6IJpPIV473+gDxlcRy5OhdMTgcZTjcjH9z3hHhKbWNgCinBM66KDhd4qIObIxYnh6mgHA==
X-Received: by 2002:a05:6512:1687:b0:4cb:bf8:cf0e with SMTP id bu7-20020a056512168700b004cb0bf8cf0emr7727872lfb.19.1672657995269;
        Mon, 02 Jan 2023 03:13:15 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id z5-20020ac24f85000000b004b5480edf67sm4426477lfs.36.2023.01.02.03.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 03:13:14 -0800 (PST)
Message-ID: <32f7fea6-e99c-9bf5-fa7c-044a45e9a68a@linaro.org>
Date:   Mon, 2 Jan 2023 12:13:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sc8280xp: disable sound nodes
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230102105038.8074-1-johan+linaro@kernel.org>
 <20230102105038.8074-3-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230102105038.8074-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2.01.2023 11:50, Johan Hovold wrote:
> The sound nodes in the SoC dtsi should be disabled by default.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index ed1e2bee86ee..c1ce2d7b3675 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -1733,6 +1733,8 @@ rxmacro: rxmacro@3200000 {
>  
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&rx_swr_default>;
> +
> +			status = "disabled";
>  		};
>  
>  		/* RX */
> @@ -1760,6 +1762,8 @@ swr1: soundwire-controller@3210000 {
>  			#sound-dai-cells = <1>;
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> +
> +			status = "disabled";
>  		};
>  
>  		txmacro: txmacro@3220000 {
> @@ -1783,6 +1787,8 @@ txmacro: txmacro@3220000 {
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			#sound-dai-cells = <1>;
> +
> +			status = "disabled";
>  		};
>  
>  		wsamacro: codec@3240000 {
> @@ -1804,6 +1810,8 @@ wsamacro: codec@3240000 {
>  
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&wsa_swr_default>;
> +
> +			status = "disabled";
>  		};
>  
>  		/* WSA */
> @@ -1830,6 +1838,8 @@ swr0: soundwire-controller@3250000 {
>  			#sound-dai-cells = <1>;
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> +
> +			status = "disabled";
>  		};
>  
>  		/* TX */
> @@ -1858,6 +1868,8 @@ swr2: soundwire-controller@3330000 {
>  			qcom,ports-word-length =	/bits/ 8 <0xff 0x00 0xff 0xff>;
>  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
>  			qcom,ports-lane-control =	/bits/ 8 <0x00 0x01 0x00 0x00>;
> +
> +			status = "disabled";
>  		};
>  
>  		vamacro: codec@3370000 {
> @@ -1874,6 +1886,8 @@ vamacro: codec@3370000 {
>  			#clock-cells = <0>;
>  			clock-output-names = "fsgen";
>  			#sound-dai-cells = <1>;
> +
> +			status = "disabled";
>  		};
>  
>  		lpass_tlmm: pinctrl@33c0000 {
> @@ -1888,6 +1902,8 @@ lpass_tlmm: pinctrl@33c0000 {
>  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>  			clock-names = "core", "audio";
>  
> +			status = "disabled";
> +
>  			tx_swr_default: tx-swr-default-state {
>  				clk-pins {
>  					pins = "gpio0";
