Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A428B6E90DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235064AbjDTKsw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234696AbjDTKsN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:48:13 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9FB93E1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:46:51 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2a8a59daec5so3791191fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681987608; x=1684579608;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iep7/xE+gJ5/a5+wqfQTrPkvE8qVynHVQIC8DVLeC9Y=;
        b=pPAhAYrPsjoObGLSXgVWFClu5ALl895r9YusyXjqzuu9dOdvOjd03KeN+CHp52Zs8f
         G+dJ4UkETlljzPP1XvX92jukvJZqJU0zpP605DIFvo1P8Fn6XVPnOIyMfcxzk+Q4V9on
         nIjpd1fgf2L8VoyIIppy8bdzvaUwf0HSKjuZNMuH8BUWz2zp9yuvVcL7xT0QqKxnMGh3
         TzTvaX7yClz9R128KD8QIXeRSc2GEnOas2fcEtM5OklbBwwtSD2iLdXZhVypjYBLGgOI
         YzbhJvPMCGYaMqCWBNLCDQbaLgVIGia3g1wXOlzK5UQtyxe6TQ/LRQWBQwrj436J1EEA
         PX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681987608; x=1684579608;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iep7/xE+gJ5/a5+wqfQTrPkvE8qVynHVQIC8DVLeC9Y=;
        b=NGBYQnNRAMaLLP0urKgdwLiFx/7aBUqvuuYEpXe+KMxkuhYidRyIFwnb8WWE9xutlW
         WnDYW6EscKkmMIiTOh9E1YgWldRtkT/y0FfoPIQxouh8DHKzB8MlvjX7g49qBZivwifn
         jHwAlBgSIyjlqXAe5cxj/vVl7Ml77/tgxpp4YdsMnA/BveZE8wOkmbDLNEB4U/HE9lwb
         I0lro2Xb1QMV4POQ1cucpF8ET3ZW1/XncuhH1eawTSBoU4NQ6wLeCdv1+iwxSbcn1NeY
         /Kv9Q1lIX3zliFirosbzg+7W2T47dwBpiNRXRavBqJrm7axCjmYRys1RlBuJnAMkrc58
         v5fw==
X-Gm-Message-State: AAQBX9ePo2YxlFL5rUB6xibx1zhIUsZXmT++MMKBqSmiSa+v9+Q4sM3k
        HLspAc5ZgbDRswVMW3EHPlNxHA==
X-Google-Smtp-Source: AKy350arSbY0SEXSii248y1vwLv+UCD6rWyTNQacHSu8SnbTtOUQPUvymv+aI8RMqOLM6s6P/Os73A==
X-Received: by 2002:ac2:4e72:0:b0:4de:7a23:23e2 with SMTP id y18-20020ac24e72000000b004de7a2323e2mr284361lfs.21.1681987608266;
        Thu, 20 Apr 2023 03:46:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id u17-20020a056512095100b004ec88128dc4sm177307lft.68.2023.04.20.03.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:46:47 -0700 (PDT)
Message-ID: <98d8fb6c-5e64-43be-17d5-ae37db69201b@linaro.org>
Date:   Thu, 20 Apr 2023 12:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 04/10] ARM: dts: qcom: ipq8064: drop leading 0 from
 unit-address
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
 <20230420075053.41976-4-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230420075053.41976-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.04.2023 09:50, Krzysztof Kozlowski wrote:
> Unit-address should not start with 0:
> 
>   Warning (simple_bus_reg): /soc/syscon@03000000: simple-bus unit address format error, expected "3000000"
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 621edf508a88..182018d79a7b 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -609,7 +609,7 @@ saw1: regulator@2099000 {
>  			regulator;
>  		};
>  
> -		nss_common: syscon@03000000 {
> +		nss_common: syscon@3000000 {
>  			compatible = "syscon";
>  			reg = <0x03000000 0x0000FFFF>;
some random uppercase hex, if you'd like to clean that up too!

Konrad

>  		};
