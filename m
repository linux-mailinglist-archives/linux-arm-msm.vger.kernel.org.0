Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBBDE473779
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 23:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240188AbhLMWbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 17:31:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235263AbhLMWbt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 17:31:49 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C984EC06173F
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 14:31:48 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id n104-20020a9d2071000000b005799790cf0bso19048362ota.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 14:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7GNt3+ytkxOOCBKUiZb2RI1k+EL5kuClexcB/h1/ebo=;
        b=HlXAnJWV0V5Zijv7Z6WiL8LWTUjhLwICYWwfF9xns9m4JefYgv3J/DyoRJBL9e+95g
         CN6BmgcwJ0XRebobnOTYhZNjbTmYt8eYiTbBEJ6NUNwU8K+Ge2Sf6grD/7t18AoJTYL1
         VYmsiao7NTonfa5aAlQxOX+0k+4ejwnaw/pJJ1fLIoJSPPzpDRx6mqn4IMo1owSyEaXn
         dRRkpzOvHE9H7Ec7wLESedOsR89tRHAOrtK31YhsqEo4lNHeaf8OhcuBSzRk1qCcxkgq
         xPligA/+9NnYnaR3N4Le3CplJHOazw4oA9UwAoXoUPz900s2UZuD8qFABwGNa0CyvyzF
         sfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7GNt3+ytkxOOCBKUiZb2RI1k+EL5kuClexcB/h1/ebo=;
        b=4YHxOCytEUHQot6zYilcGki5q57NRzenu3eRMedjtmstq/Ssu/qeASjV6lTnSqdhOu
         /h4jpGT1q6wyIx+cZhRPH0/fcr76Dsysohkdh0ofe6w0T4YfZkc9Ua+2VWLhU/4Pogwr
         0uve9nXGva+CssF/Qd0q0r+F6BKXMOxRzDN9BRFxJPSgjdwNtIiTEgTv3oaSzJICvW6E
         VZe3e/vlyDvKjYtUCARGQtseWrNhwRo6ANHcghp6IyD8C9/scdmJ+eKLF25OIUcN0kPO
         aSMfaMcN1k20SgUfhhOIEruAdgz8U2mupiOvWvH4ZhJU+VWyaW3lo/LP3QGz+mKAcBp1
         8hCQ==
X-Gm-Message-State: AOAM5302XZLtVs8DzDJOTCc0wlRLFMKAnR0JuP0B7EcDzfidg4Cjng91
        tHwOmD7titUNGNtvqBYJ8P+Qsw==
X-Google-Smtp-Source: ABdhPJwuCHh8yAGFAx4GVCYKrGZNBwGBwCiHyaa8Wc1qTy6ZEj29vhik8ncIkCG7LYsTyYoqDTUBUQ==
X-Received: by 2002:a05:6830:270c:: with SMTP id j12mr1140169otu.231.1639434708148;
        Mon, 13 Dec 2021 14:31:48 -0800 (PST)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id h14sm2462401ots.22.2021.12.13.14.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 14:31:47 -0800 (PST)
Message-ID: <bf54a838-b053-8a55-92f1-91bd3199489f@kali.org>
Date:   Mon, 13 Dec 2021 16:31:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: fix microphone bias properties
 and values
Content-Language: en-US
To:     David Heidelberg <david@ixit.cz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Caleb Connolly <caleb@connolly.tech>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211213195105.114596-1-david@ixit.cz>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20211213195105.114596-1-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/13/21 1:51 PM, David Heidelberg wrote:
> replace millivolt with correct microvolt and adjust value to
> the minimal value allowed by documentation.
>
> Found with `make qcom/sdm845-oneplus-fajita.dtb`.
>
> Fixes:
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: codec@1: 'qcom,micbias1-microvolt' is a required property
>          From schema: Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: codec@1: 'qcom,micbias2-microvolt' is a required property
>          From schema: Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: codec@1: 'qcom,micbias3-microvolt' is a required property
>          From schema: Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: codec@1: 'qcom,micbias4-microvolt' is a required property
>          From schema: Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: codec@1: 'qcom,micbias1-millivolt', 'qcom,micbias2-millivolt', 'qcom,micbias3-millivolt', 'qcom,micbias4-millivolt' do not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
>
> Fixes: 27ca1de07dc3 ("arm64: dts: qcom: sdm845: add slimbus nodes")
>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index cfdeaa81f1bb..1bb4d98db96f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3613,10 +3613,10 @@ wcd9340: codec@1{
>   					#clock-cells = <0>;
>   					clock-frequency = <9600000>;
>   					clock-output-names = "mclk";
> -					qcom,micbias1-millivolt = <1800>;
> -					qcom,micbias2-millivolt = <1800>;
> -					qcom,micbias3-millivolt = <1800>;
> -					qcom,micbias4-millivolt = <1800>;
> +					qcom,micbias1-microvolt = <1800000>;
> +					qcom,micbias2-microvolt = <1800000>;
> +					qcom,micbias3-microvolt = <1800000>;
> +					qcom,micbias4-microvolt = <1800000>;
>   
>   					#address-cells = <1>;
>   					#size-cells = <1>;

Tested on the Lenovo Yoga C630

Tested-By: Steev Klimaszewski <steev@kali.org>

