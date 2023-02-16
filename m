Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB3E698FA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 10:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjBPJVI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 04:21:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjBPJVH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 04:21:07 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9C01C7E7
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 01:21:05 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id c1so1888578edt.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 01:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QICcZD+PgFsGFoOEwt7J2Od7jkS4WHo0ZTXSjNqBbTc=;
        b=mfpHDB8Oy6XWEJRnuYg0wHDj4hNxQ7QE770q5mLgqIOHo65Pspkhpct8QewFldFv4v
         3R6v6Zfzrp42R17ah1Ef8ki3OAAraUtNfpzfAMRyqk/fjnIa94kOzwedskNG9JVUOGDR
         JUEOCbG6EDUguPOCVeHFNLN9auDkEjW5ELjrMjcqvSA4iG8NfkJELki0aMUf2j/mCOcj
         v8E7OQxBHS8b2KwESqZluTj9ybEaX4OLiXA/KedEhqnVrE7/PoIBs+SPh0kRuPoPctc3
         P/D6jL9/CrcUMQI15rwz5ZUVjUEP3hqziE+y/IO/7QpXoBQxmf6mG8OKI6edmd4YIODF
         uq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QICcZD+PgFsGFoOEwt7J2Od7jkS4WHo0ZTXSjNqBbTc=;
        b=UQrel35GKv1bgaI34oMfV4FXDZgv8oKiJrMOLwYiCpT2kAN+102GWrVv364+eojQRk
         8ks8CODzGTAdAbHSh6oXs7KWjrSPga6GFs2Wfs4Y6YmGbcqi0omOhyTAdH2qtRAdkFp7
         C+YEAZF9rKDE+7r8k/qSTDk0o4RmyPFBs/o8ZAfcLiBttLRZuErY5LYWMn8e5wHCxr4j
         PeDPGNoXLF9SNkPy2gySilRGD5B+7WZHrlZ2sJar8jzE+5/FHDNAm+6upcnaIuAhpwaO
         zU2HIf1Yo9dsNoiMGeFJeT1TuRUr98a1qC86dk4rZ526AoPY+eJlKWPEU9Ym6NMS1e0D
         fRHg==
X-Gm-Message-State: AO0yUKUA6EqsPZqHfPEIFI2tQg1Lso2SS2/qGjxU+KNIqyUkkZZCShUV
        CR3HXctPfcYakTQJEgE5aaVb8w==
X-Google-Smtp-Source: AK7set9STcXussFDXouuPm3WzxGdJij6lEuQJwj8KfQn4K+7Yi2MLpesEfjeb9R8T/OKd77L0RkYFg==
X-Received: by 2002:aa7:c981:0:b0:4ab:16a8:bc64 with SMTP id c1-20020aa7c981000000b004ab16a8bc64mr5324123edt.24.1676539263978;
        Thu, 16 Feb 2023 01:21:03 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v9-20020a509549000000b004acc6cbc451sm552809eda.36.2023.02.16.01.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 01:21:03 -0800 (PST)
Message-ID: <568d585c-0f89-0b0b-3cbe-d3025208cdea@linaro.org>
Date:   Thu, 16 Feb 2023 10:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sa8775p: add the GNSS high-speed
 UART for sa8775p-ride
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230214155715.451130-1-brgl@bgdev.pl>
 <20230214155715.451130-4-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214155715.451130-4-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/02/2023 16:57, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the serial port connected to the GNSS on sa8775p-ride.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 34 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi     | 17 ++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> index d01ca3a9ee37..9aee6e4c1ba1 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -13,6 +13,7 @@ / {
>  
>  	aliases {
>  		serial0 = &uart10;
> +		serial1 = &uart17;
>  		i2c18 = &i2c18;
>  		spi16 = &spi16;
>  	};
> @@ -66,6 +67,30 @@ qup_i2c18_default: qup-i2c18-state {
>  		drive-strength = <2>;
>  		bias-pull-up;
>  	};
> +
> +	qup_uart17_cts: qup-uart17-cts-state {
> +		pins = "gpio91";
> +		function = "qup2_se3";
> +		bias-disable;
> +	};
> +
> +	qup_uart17_rts: qup0_uart17_rts-state {

No underscores in node names.

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

Best regards,
Krzysztof

