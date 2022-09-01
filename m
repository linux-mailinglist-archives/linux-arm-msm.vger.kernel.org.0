Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58A8A5A9CDC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 18:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234989AbiIAQOc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 12:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234974AbiIAQO1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 12:14:27 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DDF391D3A
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 09:14:26 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id z6so25142090lfu.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 09:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=E3FBXhyVm6lF2BEuLGAe+m8tutFzq4efpjh8S8bF01c=;
        b=KOPjhIR5QCCC1piD4Bzt/SYiafkbkdv9iQltRv+X4yE+S8x9ihUJnZqqsH6S3GcQAN
         W6i5LSJ3dYmnms6nuT9TdiezwANgfPmjQgRXqXzKUSo8PYE5idPFksBV2aOggsgHmVQk
         vRTZXCdKJrKc29vp+QoskX0gy/TFCwBNkHpufZQbsfWSkW0lqS7u06NFL2OC8L/ne9aq
         +S+dB6Q82q8X3zjHDqTRMhJaOmVUQD6mATxP2dkrHxPWXZ5Rcc2JglCJrt9srWpqMbmA
         uOUDJMtVkNDxPn860gQFscB5hXnEjhmm6/FXgtxNoSX2YB36IqHiIpCRrARoEr8R492Y
         uaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=E3FBXhyVm6lF2BEuLGAe+m8tutFzq4efpjh8S8bF01c=;
        b=62Ed4N4//bHt/QPwc1zpGkFQW0kXGQEs1ImMQ6Y+CUzkCUSHMo+ufa8IcDtg4e3JuK
         0DNJmSWKHzqDEAXCjjrZPJc6IEpYXPgOyVHgXn3yrWuPFDbYLBHliC/+rXsFPQx/pbCx
         EeNBIg29RKmeRNKoqLIiBCRfvqnc+8ChPy/mj+St0aQ+hh2q0Jex+w21i5qm2aUM7tRE
         KkMcQuwdq45sJKROlfbyPaPLE0atpqo+Iw0qOPBMVLjbDUE3YUkWovIq3EOz2eQOyWlp
         AE8HpddFQ1/yoUb47HNUJdboweYOFY4lcloMEbRvR0edVcuP7vK6nrGBNhE7BH7ns/GH
         WZ6A==
X-Gm-Message-State: ACgBeo09ZTFgWkoJd0oCURq/NPpDTuogzg+RYkBidgX3Es9ndO67isZE
        Rx8k5VIhdNBIb8+IUrC7VIBR+A==
X-Google-Smtp-Source: AA6agR5OKQLu0MhrFoRQhvZhnzYgN1rx6J0y6QL3Mwj6VSYPG/d+Wsepim7MaCt2gJiMHiiCRkazpg==
X-Received: by 2002:a05:6512:3b94:b0:492:bbe1:df3e with SMTP id g20-20020a0565123b9400b00492bbe1df3emr12207633lfv.371.1662048864537;
        Thu, 01 Sep 2022 09:14:24 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id f24-20020a2eb5b8000000b0025e5cd1620fsm1726297ljn.57.2022.09.01.09.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 09:14:24 -0700 (PDT)
Message-ID: <47c7bce8-9ca9-27d2-e1e2-eb65df3e6107@linaro.org>
Date:   Thu, 1 Sep 2022 19:14:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 10/14] arm64: dts: qcom: sm6115: Add SPMI bus node
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20220901072414.1923075-1-iskren.chernev@gmail.com>
 <20220901072414.1923075-11-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901072414.1923075-11-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/09/2022 10:24, Iskren Chernev wrote:
> Add support for the SPMI bus on the SM6115.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 491fffff8aa1..d578f8425e36 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -543,6 +543,25 @@ qusb2_hstx_trim: hstx_trim@25b {
>  			};
>  		};
>  
> +		spmi_bus: qcom,spmi@1c40000 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

This is spmi.


Best regards,
Krzysztof
