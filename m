Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12DD75E958E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Sep 2022 20:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbiIYS6p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Sep 2022 14:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiIYS6n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Sep 2022 14:58:43 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227372A706
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 11:58:43 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-127dca21a7dso6759820fac.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 11:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=M3tmqKTq30hnagEOzKLlmynUjQTBZCoWj+kBx7NUQOc=;
        b=KU9NTpKaj9sX6HbIO7VUMhid7Iu14PvSEZSCrkBPcJN7A0Z/b4jHSzehqFPFJ+q3hA
         Y291vI139cdUevC+1kubb6EY4ozQ50v5OezE4h2R5XkF8GP7dYPIzBXwFr/FXbHuqIKd
         u2u/LvvBDPulfI9fAyNFfxPt6J2lKH24R5mud3Yp3zk+QjqEGzO/GJiDmu9NW6kJ22kt
         X2TKZjJ9vvvCTXnpg/WVrXp7Di8ce36ceyVkGJ1dK6u9Wtm654vMKBMPNkX6ulRQ3hHl
         AbJSr5L6drEJ7Te17lbIGxVXo1iq5xmtCvkLAmOcyHVnKrqj/sM1TqaxFS5T2vKY4K3z
         LlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=M3tmqKTq30hnagEOzKLlmynUjQTBZCoWj+kBx7NUQOc=;
        b=GpZ/l1ow5RH+4Xes97wWFwHBl5VxUfoNZfuvTRyMpc3iuG2SNee6wzG5FATDyIfvYO
         X8VRORi7N9uCqfCCdlngU+eE1WDlrVa1sVwU7VnARBddtI/At06Bn7rcDVp36prHuJVK
         xUm7bYHQ1kvD3VUBRuw+z6JGjZxv/LVjTKGosnOHwlaxn+PlaUekGHEfgShStA4fbFNy
         HTlCmJfcEtsjBlFnaxDvnwE6jXHMdKmGqz4nA+yg0mmU1R+7DhLypHVe3mq2pLbKNDAD
         xaWmCuqG3mO15p6gPOdncYWxTo4KtF8ghnzITqGYfO5GJIHtXotrE182BD9XsT4YwGeO
         PCMw==
X-Gm-Message-State: ACrzQf3FuBMLj1VRRmjdjkeZdVsr9Q59nhyq8u7m5RdbiHZVUGY3CB1C
        /lJcFFhGMOnkVpZ8jNmKWqIacA==
X-Google-Smtp-Source: AMsMyM6dfh0CcbJflisdwaZ+hNfWoQV1N1y0eqrFuZDEIicfSlJbuuNrqKvXCOmWVQCqQN9VTUWAmQ==
X-Received: by 2002:a05:6870:1694:b0:127:8d30:5afc with SMTP id j20-20020a056870169400b001278d305afcmr10882036oae.26.1664132322423;
        Sun, 25 Sep 2022 11:58:42 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id u8-20020a0568301f4800b0065126423321sm6946171oth.76.2022.09.25.11.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 11:58:41 -0700 (PDT)
Message-ID: <d3218018-45c4-4777-77a7-91947ad48666@kali.org>
Date:   Sun, 25 Sep 2022 13:58:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sdm8458: align node names with DT
 schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
 <20220923161453.469179-8-krzysztof.kozlowski@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220923161453.469179-8-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krztof

On 9/23/22 11:14 AM, Krzysztof Kozlowski wrote:
> New slimbus DT schema expect only SLIMbus bus nodes to be named
> "slimbus".  In case of Qualcomm SLIMbus NGD, the bus node is what was
> called "ngd".
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 1213f78a8b7a..7b62efb180d5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3823,7 +3823,7 @@ qspi: spi@88df000 {
>   			status = "disabled";
>   		};
>   
> -		slim: slim@171c0000 {
> +		slim: slim-ngd@171c0000 {
>   			compatible = "qcom,slim-ngd-v2.1.0";
>   			reg = <0 0x171c0000 0 0x2c000>;
>   			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> @@ -3835,7 +3835,7 @@ slim: slim@171c0000 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   
> -			ngd@1 {
> +			slim@1 {
>   				reg = <1>;
>   				#address-cells = <2>;
>   				#size-cells = <0>;

Subject has a typo - sdm8458 -> sdm845

Tested on Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>

