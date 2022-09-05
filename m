Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9CD5AD7E4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Sep 2022 18:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236147AbiIEQxb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Sep 2022 12:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbiIEQx2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Sep 2022 12:53:28 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87BA61D58
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Sep 2022 09:53:26 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id s15so9789602ljp.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Sep 2022 09:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=e0lLC5ZiEIfJ07eh7fy6PTusqi97x3Ht6sH47DJZN6Q=;
        b=ruhaVWd7wPnc+FXNi4eNuTVHtls1LsF1PHJTdH3s1EaQ/KQ69XhQ6HjGR7RwSha5qa
         2/7Pnvn0SKK4mf8Bin+EjNcF20ki92UQZJ44QNjVeYL8BfKnWo30GxzLIxnB30t+PPq/
         k+bYNXSxSAJkPT3EIL9Y7Mn5ATk75iaxzeAwSjdgoEuJiTTK6N9l3ANnK5OgVJNZ7b3G
         KDD8xTuT62eytLa05LCYgk2oDjr97JvCPdURC5u9OGvqMCzPAEESOHifu2+3GJ6515+/
         qomNwj6aF7pTk9L/Q4M3x91ya1o0IZ+0/lUDRNZazVh2TFuE1TmhoT2m6vgh3AqMb3tC
         9/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=e0lLC5ZiEIfJ07eh7fy6PTusqi97x3Ht6sH47DJZN6Q=;
        b=X6VJ6WKmIzbrWOMkUQKSXGDlpMxJVghCGNDAizDbgWDG5PUKuEpLSf8kQNMTrCwl2B
         eEspUITHakrulFBz5RRxZ5sm8M4aciN7dZ757awdMskcw8h6diS7HNp4GPi7zcLm2POO
         9Or7sbRnrawtz0DmVTp/jckNBqS1mhe2s3cG8Av5Fx0Ch+4KnQ5emD0f7CMBd8Csbd1V
         MQRu8mip8j27eRTBk6PoVAefUqz7In802AXNL3dATGTxlz3oNtoKxhZ+wQnOEo7Mr7ND
         JlnNJ3YwAClynOob0yOz4Xz0BxjVXZbGtCgLjRwDDXpSQxiJWu5QP/IHOWIH2fRHB68J
         uVSw==
X-Gm-Message-State: ACgBeo0eJi2oS7bb3l/ShiDLNt8jK56trZOlC5vIcDQYpIQ6miplYJH8
        xMmDVa2C8A6DCapjPnwJYseozMS9Aqt5Vg==
X-Google-Smtp-Source: AA6agR69s27hB50PShinRYgYDWm8fftoeASujb45gyVnNACBIvLSjqxHu3WFvum47N6BVylRyIu6Ww==
X-Received: by 2002:a05:651c:17a7:b0:261:c0b1:574b with SMTP id bn39-20020a05651c17a700b00261c0b1574bmr15674002ljb.40.1662396805194;
        Mon, 05 Sep 2022 09:53:25 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a21-20020a056512201500b00492eb7205b0sm1239926lfb.210.2022.09.05.09.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 09:53:24 -0700 (PDT)
Message-ID: <a10fa048-2ccc-d946-986c-c00a02d6fd71@linaro.org>
Date:   Mon, 5 Sep 2022 18:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/3] regulator: dt-bindings: qcom,rpmh: Use
 additionalProperties
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andrew Halaney <ahalaney@redhat.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dianders@chromium.org, johan@kernel.org
References: <20220902185148.635292-1-ahalaney@redhat.com>
 <20220902185148.635292-2-ahalaney@redhat.com>
 <33c19838-2e44-2164-11c7-b14be5908809@linaro.org>
In-Reply-To: <33c19838-2e44-2164-11c7-b14be5908809@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/09/2022 18:45, Krzysztof Kozlowski wrote:
> On 02/09/2022 20:51, Andrew Halaney wrote:
>> Right now, running make dt_binding_check results in this snippet:
>>
>>     /mnt/extrassd/git/linux-next/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml: 'additionalProperties' is a required property
>>             hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
>>             from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>>       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>>     <snip..>
>>     /mnt/extrassd/git/linux-next/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml: ignoring, error in schema:
>>
>> Which results in the schema not being properly evaluated. Swap out
>> unevaluatedProperties which doesn't seem to be doing anything for
>> additionalProperties.
> 
> unevaluatedProperties were required due to usage of defs-allOf
> (ba5d99609a5e ("regulator: dt-bindings: qcom,rpmh: document supplies per
> variant")
> ).
> 
> Are you sure that it works correctly with additionalProperties?
> 
> Judging by errors it doesn't....

What's more - I cannot reproduce that error (latest released dtschema)...

Best regards,
Krzysztof
