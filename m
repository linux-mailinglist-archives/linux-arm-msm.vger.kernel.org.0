Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D620C4EB3E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Mar 2022 21:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240829AbiC2TJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Mar 2022 15:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238694AbiC2TJf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Mar 2022 15:09:35 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9700818C0D9
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 12:07:51 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id b24so21777200edu.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 12:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yhgPOGAVmyQr7JxdPjvW6xGasXtlIg7HxSen89iggoA=;
        b=OCLOATCC9xXHVe4a0iMgeyHyhhwx8hbFCql6lAWZvnXG6d3sl/0QVexDFmktE2G0cM
         Lv3SQOqZ6DCUE2xARSMBDfBg0pj5nfqD2mFIixTpQ5gGMGTIc25MrGY7yqM+tzPPm76o
         KsDOA9necaa8FVNViYZzmvRu1l1+k+Sqx2rweYEub8JliEyRHYUoHu0G/XgflEel9NhZ
         hj/Ikup+9G9g8s4rozkVh3YwNMT/UepwWnlki6SL8MUnK/lWFxEnpa4veLB993w9o/yH
         jZUcfeO5X9eQK3dOFmBvHk0oF+UmtemkpeZ9qBQo70c5sRVpDxHc8DFPyzbdTAbxtm7F
         OOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yhgPOGAVmyQr7JxdPjvW6xGasXtlIg7HxSen89iggoA=;
        b=KL+lVGKhpnVv0uEzX+SRFbJgFDeUkZbwXhTYefqe6mGS6dbjBFFx9OZfrCWM2xTEJx
         0Z74acUk0fIMtfMHEEyEMx0UgI5XIAks87+xXixkQXxFLCYIWOuSR8gWZ++F6PkyZTs2
         WFwZILWA8o4jA1cXM1SwdZhYsL8LwVmtF9SegsPPY5p0xYH32ZpWHswJMvpNKYZCk2HX
         Khhmgf4zwPS/oHlM4dOb/GywMFyf2HCWcVqrMnQEiFPox+iOL7/tvudXJ7p4OuIW/ea9
         oCu74Qpxg+E2gKqP9xfPtN6I0xrfDmGgdkait275TM1KacJcN8RtTfSYVAOZ7TCzVZe0
         D+pQ==
X-Gm-Message-State: AOAM531zdG90YG3zbPJ02HwrFyOJtW4d1CY483Xw6CPuDqWsaxcfOKFh
        qqn0C/alpokn4k7a97OhnkHNlw==
X-Google-Smtp-Source: ABdhPJwZDEHSCgrPPVgyK2IEKdK01rzfZ1/0otBReDcM0nkYrFyjBbB5TNRPyJ1p2EYESvb6AhyExQ==
X-Received: by 2002:a05:6402:2065:b0:407:eb07:740 with SMTP id bd5-20020a056402206500b00407eb070740mr6480403edb.406.1648580870206;
        Tue, 29 Mar 2022 12:07:50 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7c38c000000b0041939d9ccd0sm8789447edq.81.2022.03.29.12.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 12:07:49 -0700 (PDT)
Message-ID: <98910392-a7f0-3ba5-1aff-165dac8be0c6@linaro.org>
Date:   Tue, 29 Mar 2022 21:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] spi: dt-bindings: qcom,spi-geni-qcom: convert to
 dtschema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-spi@vger.kernel.org
References: <20220329112717.252647-1-krzysztof.kozlowski@linaro.org>
 <1648580700.635474.1067575.nullmailer@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1648580700.635474.1067575.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/03/2022 21:05, Rob Herring wrote:
> On Tue, 29 Mar 2022 13:27:16 +0200, Krzysztof Kozlowski wrote:
>> Convert the GENI based Qualcomm Universal Peripheral (QUP) Serial
>> Peripheral Interface (SPI) bindings to DT Schema.
>>
>> The original bindings in TXT were not complete, so add during conversion
>> properties already used in DTS and/or in the driver: reg-names, dmas,
>> interconnects, operating points and power-domains.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/spi/qcom,spi-geni-qcom.txt       |  39 ------
>>  .../bindings/spi/qcom,spi-geni-qcom.yaml      | 131 ++++++++++++++++++
>>  2 files changed, 131 insertions(+), 39 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.txt
>>  create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.example.dt.yaml:0:0: /example-0/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
> 

I will try to find some better example for the child device (or skip it?).


Best regards,
Krzysztof
