Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3C4662531
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 13:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234169AbjAIMOY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 07:14:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236276AbjAIMN6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 07:13:58 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663021A805
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 04:13:56 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso6833058wmb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 04:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Apvhoqi+OOOMQ4HR148na/DFjKLgEz3QcDuyY6Juuo=;
        b=cXWt+TZUXIaL9XldVhJ2vQAL0UbkG3l6tWldpJQy6EwO/KXPFQTOJh1Q627alitksd
         3I+SxiZkYaZB4GFyIxrqdw4qQA2016UwUmC7gJiDkZVmifRLZfUdqPDdVdgSxdr+B3V8
         iseK937jZMBLIs4melo7vjit8D+2bnhklYItCPewIdj14ACF14BSCtIwp0z7PCDkpndO
         yCEnRh/r6maQzdiDGt8I5S8U6zq9lrg+0qJHYzuxV5O/93UABmOYrr8td6EV/XlfYRNS
         ySV61YC9coDEBUMGOeRW/7Ph47TcK2kauv1iNm9V7srJ+Cewn3eahZc41oK6E4l+pJI4
         IoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Apvhoqi+OOOMQ4HR148na/DFjKLgEz3QcDuyY6Juuo=;
        b=et77iZ6nzwZehVmPP/Xwk2kPGM7AW7M7fiTsTFkCi3EpNWgfBS2eOhKpSAMmjQpDEu
         ii+0gL52rKeJsTRWYsrg2hxS4SUYaYv0jICjWpIHj9Rql8mQy9RyEP1obUSgfr66fh7d
         WhKiO0bXvO2ldaologosvTkaSxBQF11fIL1yK2KPq13u1bZvlklSUm2Zih/8sIDXYlfr
         B8+oni2RfiduXXTtythorhu5u/qb9O0t0nGy2xAr42CRuBPoowpuTZx7KjI45Hkc/7cf
         HkXG2p4A9z06mwZhcqJKQrOIsn6J3lCKHdESXEcUH5mO3Pgp66RutOhkcn1E6NJyQCe4
         YUOQ==
X-Gm-Message-State: AFqh2koA/UmiJXwuWm1Ilq0D9Y+1HNXb62GLsiBB72ug3D+wEVjbri71
        e65eVMY4dtOFfIrk8oMAz1nfSVDkbWTOVnME
X-Google-Smtp-Source: AMrXdXsILHpk+nalIB34Dpa0HY57tdFpemqwhDbetBXThq02zr0jZIk4EOyQv8rCh0UzImryFrdc8Q==
X-Received: by 2002:a05:600c:3550:b0:3d9:ed30:6a73 with SMTP id i16-20020a05600c355000b003d9ed306a73mr3300171wmq.9.1673266434967;
        Mon, 09 Jan 2023 04:13:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t12-20020a05600c198c00b003d9de0c39fasm13687845wmq.36.2023.01.09.04.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 04:13:54 -0800 (PST)
Message-ID: <118e34d1-617e-3d95-c31b-73b99109fc40@linaro.org>
Date:   Mon, 9 Jan 2023 13:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/3] dt-bindings: reserved-memory: rmtfs: Make
 qcom,vmid an array
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230109093947.83394-1-konrad.dybcio@linaro.org>
 <2bc5d781-499b-fe39-2dc5-92bc9ba8396d@linaro.org>
 <97dafa30-8b76-8bf9-4411-be6d10e4c71a@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <97dafa30-8b76-8bf9-4411-be6d10e4c71a@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 09/01/2023 12:41, Konrad Dybcio wrote:
> 
> 
> On 9.01.2023 10:51, Krzysztof Kozlowski wrote:
>> On 09/01/2023 10:39, Konrad Dybcio wrote:
>>> Some SoCs mandate that the RMTFS is also assigned to the NAV VM, while
>>> others really don't want that. Since it has to be conditional, turn
>>> qcom,vmid into an u32 array so that we can handle the NAV case, as
>>> well as other similar ones if they pop up in the future.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>> v2 -> v3:
>>> Rewrite to accomodate for changes, don't pick up tags
>>>
>>>  .../devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml   | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
>>> index 2998f1c8f0db..cfc2fda30eba 100644
>>> --- a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
>>> +++ b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
>>> @@ -27,9 +27,9 @@ properties:
>>>        identifier of the client to use this region for buffers
>>>  
>>>    qcom,vmid:
>>> -    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>      description: >
>>> -      vmid of the remote processor, to set up memory protection
>>> +      Array of vmids of the remote processors, to set up memory protection
>>
>> You need now min and maxItems.
> Hm, I tested it with and without:
> 
> minItems: 1
> maxItems: 2
> 
> on DTs with either one or two VMIDs defined and neither complains..

You can also make a property like:

	qcom,vmid: true

which will accept anything but it won't be correct approach. Properties
should have some reasonable constraints. Otherwise binding is not really
specific and is describing the interface in a very relaxed way.

Best regards,
Krzysztof

