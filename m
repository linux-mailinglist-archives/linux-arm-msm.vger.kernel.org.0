Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 250AB616106
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 11:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbiKBKjn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 06:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbiKBKjL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 06:39:11 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C931192AA
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 03:38:32 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so967176wmg.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 03:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:reply-to:organization:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hRYCRL/SBQ45Ja/04fjZY/45c3An/3ZI+v6TZQZgOFs=;
        b=JkjxUWpdZACAbfgRAF8iqhXJ/9ga/2EeSTQJMmEiZPH6vIlZdzVFvJujbP30Y9VN0r
         evr3SnPsLcUFNrW6Fat3FEFpwWgVNAXyKaDdMiZsqf5w0+6V6aGk8hmRyoM0bhNABD/Y
         lbXeXdwmOHD95Mx7m2KpQhUyssC8D6igfIa/Yeb1aPkLmbUCUFFeJEC9trFTbqO+Fcrj
         kGjd4MfPFtZnQ7HYhXkF/p237RXpQB5ucgS+GaaSR7KZNt23Zq4goV3vG7k/T2U+lMi9
         XxVdCFBzoFyeqlxhnBndvV9wqL+xTvT52eVIByvylSheN432OE3ucWCDAf/l5Lqes+AL
         d/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:reply-to:organization:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRYCRL/SBQ45Ja/04fjZY/45c3An/3ZI+v6TZQZgOFs=;
        b=iITplLPboBz3LV4a1tQrIZlfMiZThdxZeQ4SQarz8lFvPnPnMOKwXxQjvkTkG2TlFV
         4uSIYfsN5RIs4B3gyxeYVcaKmhRHmuyq7cjjhjiZtn91U0Q3CpTo8IG2pSlYMpC5MWts
         SFOmIVKZKTw3fpJSzF6WqYqrl/A9ROX6CLZzP8T3FplLJP7KKGYNBIOOvXD4CyTqcO/E
         Y3ANQjHFeh9WahOzYZb/whj3HtV4ha9ncariPXgFBEPyiTKJB3PppJfNM5msCTWojbIm
         A8S0cP/OA68+RzfCPZRGBaXlkpwPIsdueT9fRnMkmosWTitbg97UN60kMDK5JZzsOhx4
         6gjQ==
X-Gm-Message-State: ACrzQf2hgLoXl3mZ8qkB+1c3MmrWunZHlyK4zwkv0PalCi0rzysllHBJ
        8gTng+a9CdAfLWhhxtf8RXbwBw==
X-Google-Smtp-Source: AMsMyM7+g1dcKLFTAyXXyWWdBiZhU3NGuGjw8oKD1SRd73NeAVaUVT5p/5IUP9D2SvUeXDKXmcIvSQ==
X-Received: by 2002:a05:600c:42c9:b0:3cf:69d4:72d9 with SMTP id j9-20020a05600c42c900b003cf69d472d9mr12879993wme.93.1667385510803;
        Wed, 02 Nov 2022 03:38:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4? ([2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4])
        by smtp.gmail.com with ESMTPSA id x21-20020a1c7c15000000b003b492753826sm1546169wmc.43.2022.11.02.03.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 03:38:30 -0700 (PDT)
Message-ID: <ea0fd9da-4fdc-9d9b-f3ea-e74fae6d3723@linaro.org>
Date:   Wed, 2 Nov 2022 11:38:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 2/3] regulator: dt-bindings: qcom,usb-vbus-regulator:
 change node name
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afd@ti.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221031173933.936147-1-luca@z3ntu.xyz>
 <20221031173933.936147-2-luca@z3ntu.xyz>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
Reply-To: neil.armstrong@linaro.org
In-Reply-To: <20221031173933.936147-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

On 31/10/2022 18:39, Luca Weiss wrote:
> usb-vbus-regulator is a better generic node name than dcdc to change the
> example to match.

Subject is wrong, should be something like:
dt-bindings: regulator: qcom,usb-vbus-regulator: update example node name

> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes in v2:
> * New patch
> 
>   .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> index dbe78cd4adba..b1cff3adb21b 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> @@ -33,7 +33,7 @@ examples:
>        pm8150b {
>           #address-cells = <1>;
>           #size-cells = <0>;
> -        pm8150b_vbus: dcdc@1100 {
> +        pm8150b_vbus: usb-vbus-regulator@1100 {
>               compatible = "qcom,pm8150b-vbus-reg";
>               reg = <0x1100>;
>           };

Thanks,
Neil
