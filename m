Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB6064C721
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 11:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237891AbiLNKbn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 05:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237658AbiLNKbj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 05:31:39 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E002C1D647
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 02:31:36 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id h10so6185559ljk.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 02:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=El9/7ifi8O+Hz4glsuL6bqzvFzAy2OEtSXzBNpeIHsk=;
        b=abKZhRwBMNORACyyZGYHCzGwqAY1dHPJDSnBagPflABjCWBL9Xe6DxA+XTH4sF1AoG
         cI2xtleH8gJ0M+P2f2kP1HMCBWUGz84Ruj4zc5YSaxlzL9XGUGD/j/CGxnkd36y3/Zxy
         Zaq5YyMniXNwOKlHYsvJA3RH29DtKt7TpZS+Fo0sFNMoqL7sA8mJsY1OgGMWCHoEqXIb
         4sgYBLlz8mSuxJQqPU8oETjE/DdUlJoNBIXS9hKWzw+SRn4VDv+AkR/VxYyDHDQj5vX5
         r+TgyV6N/e+7udUPbal2Urw6lpBVV9SKT6zCCRfG8aaEqQKNu/WPiKSKoioOkeEkCHK/
         95hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=El9/7ifi8O+Hz4glsuL6bqzvFzAy2OEtSXzBNpeIHsk=;
        b=jGjJgMvEBSqfeV7s89smmIEGk22aoHLyeSw9F37crwskBxuUTA4iTW/pLik8pHmTzu
         K1m5DVb1UsHkbHSnOtNEYIek7BeIIXlkl5KAy7m+wcIP2nFXLh5ZNfUFpagu4PFTiqK9
         RgrnGHgHiTjL5XdIOUkxSm++y7dSabXiphvha3pdQFz4aKvPAPjbom9/dDrSISi0Qy78
         fnrW/hWJl+TWim0mI4a+VkLpPF7XTs1Yq9sDc+Kp44eH0TLR2TJtgzF7T0B7+metFtbJ
         A4BVNU+zOLIYxgII1a+JYKChh642wo2DPJs7aqZfcwWaTg9GNoVV87E70jU/VEfb2cbI
         MRMA==
X-Gm-Message-State: ANoB5pmSaSKSsPoPi/tIaEBzU9AzcGxmVmnxJAu2TrrMmlGki3LF09gu
        NJP0zXjARaR24+wt8IMrKo1VAg==
X-Google-Smtp-Source: AA0mqf79fSzvtWEz4zFvsacTgnHGgwwi5oyFdTQ/LV9ocjYJdhjLUODvN0JF0Y9hIngMVmut6eGalQ==
X-Received: by 2002:a2e:bd05:0:b0:278:eef5:8d1a with SMTP id n5-20020a2ebd05000000b00278eef58d1amr8100534ljq.24.1671013895286;
        Wed, 14 Dec 2022 02:31:35 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p13-20020a2eb98d000000b0027a02d2d4ecsm574058ljp.24.2022.12.14.02.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 02:31:34 -0800 (PST)
Message-ID: <149db463-bc54-7a12-eb95-eeef5be137ba@linaro.org>
Date:   Wed, 14 Dec 2022 11:31:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: reserved-memory: rmtfs: Document
 qcom,assign-to-nav
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221213170340.456252-1-konrad.dybcio@linaro.org>
 <e79ae240-95ce-1629-70f3-378d98f38841@linaro.org>
 <005d073c-a937-5ef8-a97b-09bc17d6f354@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <005d073c-a937-5ef8-a97b-09bc17d6f354@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/12/2022 10:55, Konrad Dybcio wrote:
> 
> 
> On 14.12.2022 09:11, Krzysztof Kozlowski wrote:
>> On 13/12/2022 18:03, Konrad Dybcio wrote:
>>> Some SoCs mandate that the RMTFS is also assigned to the NAV VM, while
>>> others really don't want that. Since it has to be conditional, add a
>>> bool property to toggle this behavior.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  .../devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml  | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
>>> index 2998f1c8f0db..1d8c4621178a 100644
>>> --- a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
>>> +++ b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
>>> @@ -31,6 +31,11 @@ properties:
>>>      description: >
>>>        vmid of the remote processor, to set up memory protection
>>>  
>>> +  qcom,assign-to-nav:
>>> +    type: boolean
>>> +    description: >
>>
>> No need for '>'
>>
>>> +      whether to also assign the region to the NAV VM
>>
>> Here and in property name you express desired Linux driver action, but
>> it is better to express the property of the hardware. What is
>> different/special in these SoCs or their configuration that additional
>> assignment is needed?
> Honestly, I have no clue.. probably there's something more complex
> than was there before connected to GPS..

One thing could be number of VMs - if it is even something known.

Best regards,
Krzysztof

