Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97C954EB3F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Mar 2022 21:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240794AbiC2TNm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Mar 2022 15:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240863AbiC2TNl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Mar 2022 15:13:41 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4CEB6E73
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 12:11:57 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id a17so21813154edm.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 12:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Zs4+wicwiuzKeibf/6a5M7Gi78Hfv23A59sxjvNvMUU=;
        b=wRMGvtYne2xt5h30GhOYcCw/PFtzV2Z5DknJEIfkjSyA9c59a8gelUpGWkjL9N3J27
         XBf0a2apTd/mbbpjfJAkeIivA4hkd7eIiteudnX+Glepx99Z+Z/qDDZug0p54xkjwyYF
         mlGMdKDSTnFpKs5iPYqXqYa0vWC+6mlqnPdC8jlYiNRcxNnyijdyJdMRW/4N6+7IoMQQ
         MI0LNClF9+F3C+2DkRecHDITk0WYfwFxLUWk0lsuPh8y1kHJZemXFOfzPn3WRpPfl33g
         pJFH0dWWHTqEGiwElq2W7nu+QkkDB+sdCJ0x2OnqaC9FAwJfgusIlEEHuZn9WzXobkaO
         pE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Zs4+wicwiuzKeibf/6a5M7Gi78Hfv23A59sxjvNvMUU=;
        b=Ox253wzuBtBDHDnT4sz+bV9yjBLuz4kXORzLDk0MOxSk9bG15KjSK5NeuZGXX5wNTJ
         QNcm8rD94Yab6o3UDGauVjSZ5r2MBMmIsQnqWoyG0U3OeUDKsh3l7rvv60119gMTi6gL
         iH4Smb9mXecCtJmpUfBaCPeojcebC3sXQjH5NVuu0+s2eSLmUQk2a1ra6h5XPNpc0/W3
         nTRnjhIMkrrStDN6pQk+oklk3HKJsxOr0IIGS/XCCwOXlcgvr+djFW7bDMWd4UrRwy2t
         AzweY3ckHswkLA7b3OGnO0DQABTb6Aknu7wBnYTSYDgFacMm1ErApgrJGSu64fy/dmDF
         FXSA==
X-Gm-Message-State: AOAM530LIBDOQF8G2eD34uzOXZ0Y7uNS8qov2RxeciN0pfWc5Ly8S19C
        WAiLWqd2vqyKUmMfUV/+zqe9Tw==
X-Google-Smtp-Source: ABdhPJwCTzbCOxjzUYik789yfqeDFi1lbcyCdm8UwGFPA7I3vtWU95A1xbvTgjVm0+950GczLqagPQ==
X-Received: by 2002:a05:6402:3719:b0:412:fc6b:f271 with SMTP id ek25-20020a056402371900b00412fc6bf271mr6572253edb.345.1648581115904;
        Tue, 29 Mar 2022 12:11:55 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id k3-20020a05640212c300b0041605b2d9c1sm8867928edx.58.2022.03.29.12.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 12:11:55 -0700 (PDT)
Message-ID: <d810a2c2-688b-e07e-0444-5013ef02362f@linaro.org>
Date:   Tue, 29 Mar 2022 21:11:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/4] spi: dt-bindings: qcom,spi-qup: convert to dtschema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>
References: <20220329112902.252937-1-krzysztof.kozlowski@linaro.org>
 <20220329112902.252937-5-krzysztof.kozlowski@linaro.org>
 <1648580700.650850.1067578.nullmailer@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1648580700.650850.1067578.nullmailer@robh.at.kernel.org>
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

On 29/03/2022 21:05, Rob Herring wrote:
> On Tue, 29 Mar 2022 13:29:02 +0200, Krzysztof Kozlowski wrote:
>> Convert the Qualcomm Universal Peripheral (QUP) Serial Peripheral
>> Interface (SPI) bindings to DT Schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../devicetree/bindings/spi/qcom,spi-qup.txt  | 103 ------------------
>>  .../devicetree/bindings/spi/qcom,spi-qup.yaml |  82 ++++++++++++++
>>  2 files changed, 82 insertions(+), 103 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qup.txt
>>  create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qup.yaml
>>
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/1610591
> 
> 
> spi@78b5000: clock-names:0: 'core' was expected
> 	arch/arm64/boot/dts/qcom/qcs404-evb-1000.dt.yaml
> 	arch/arm64/boot/dts/qcom/qcs404-evb-4000.dt.yaml
> 
> spi@78b5000: clock-names:1: 'iface' was expected
> 	arch/arm64/boot/dts/qcom/qcs404-evb-1000.dt.yaml
> 	arch/arm64/boot/dts/qcom/qcs404-evb-4000.dt.yaml

All of these (and dma-names) should be fixed with my DTS patches in the
series.


Best regards,
Krzysztof
