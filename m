Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEC135B44F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 09:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiIJHxK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 03:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiIJHxJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 03:53:09 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C8565641
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 00:53:08 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id k10so6517765lfm.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 00:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yVGqcrQFlEfjiFrysCCuP1o3U/tDjW1TRB9WhX0ej9Q=;
        b=JPf/YnnEqNe3FWESlm9wT9UUkd3umwAOkaJvFRXlQo/NwqhtPwkpuVeL0oA8O4ZKhC
         cHmzIYl7KXQTxdrjLTJGjlbqy+TxY+hpZcbktnN3URurR+gOWNfrIJD/RjwTKvUijJKf
         +dtWKjBgYg641Er13Te752MPSxox5XlvHXGjyU+isOyCVrKOQ7K2dNI+PeQHWMF3AXVa
         Yn8ieU1uvVp2MyoQl4CT+T1S8OH0n68ocjlMcU4r2iuqNMhE7EJNfNSkVwHTpewA461i
         3TTrGUmCW9JwGy0InxricQRCWoYRIRun+otEofpumxkW+o3AyPq9Y9rAmn+mfW6iDlem
         AeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yVGqcrQFlEfjiFrysCCuP1o3U/tDjW1TRB9WhX0ej9Q=;
        b=USpK0vvo1Bf6bY228p0pZOHL5Z94XV3r0hLefIx6TCDD84BPmbxnu2mPyiIAV1E4IO
         TI5cwSNmYla0gsR0ta2zMDeH6qPlt9Y8/TcvSlE2V8Mb58g4esFWF0T28K8Oot1KDAug
         IuySJ03Qeqo17gvJFjrYAOjG+sarK4zgtpHSOCDon2uSTYJ1LlW79mPbUm4HCZcJkZTi
         lN7OCSyiM38wGsMw/YBIBBF4Hl55cx9RVq4iNSWV4WoTNI0vMr0Xjoox+uSl0IupMP3P
         ais7q1lX9nyPDHPVq2fdx6ed0xuZYBoydXiDFFkTD13A66+EdoT0GV1sMOUqix9cSllZ
         K8Tg==
X-Gm-Message-State: ACgBeo1/bmF0gPopnzBnin210mRetAeTdaBH6zuXFuZ2B9Zn/2EByVlM
        Bkbynug/2RhVENT3noQIFe2tcw==
X-Google-Smtp-Source: AA6agR5z6dihRJApOItR5UtJniejPzRs3cFc63NZvF0V+Ks5bCh8ylcbXyse+Ha2Mfbj443WIRaClQ==
X-Received: by 2002:a05:6512:2248:b0:48a:f36a:2e63 with SMTP id i8-20020a056512224800b0048af36a2e63mr5750327lfu.485.1662796387080;
        Sat, 10 Sep 2022 00:53:07 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e6-20020a05651236c600b00499aefcf68esm114188lfs.292.2022.09.10.00.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 00:53:06 -0700 (PDT)
Message-ID: <c3dd211c-658d-7c4d-8be4-71d8ae117493@linaro.org>
Date:   Sat, 10 Sep 2022 09:53:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/6] dt-bindings: phy: qcom,hdmi-phy-other: use pxo clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>
References: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
 <20220909132010.3814817-2-dmitry.baryshkov@linaro.org>
 <d72fc00c-85ba-8b48-1fcf-42fe9e8daeee@linaro.org>
 <59242592-4e3d-b7c2-e0bb-b39df780c26b@linaro.org>
 <c3b4638e-05f7-cc73-b893-422f92909f6e@linaro.org>
 <3ED996B7-F1BE-4AF0-AD95-500DA0B202FB@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3ED996B7-F1BE-4AF0-AD95-500DA0B202FB@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2022 22:29, Dmitry Baryshkov wrote:
> 
> 
> On 9 September 2022 19:44:11 GMT+03:00, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>> On 09/09/2022 17:03, Dmitry Baryshkov wrote:
>>>>> +    then:
>>>>> +      properties:
>>>>> +        clocks:
>>>>> +          minItems: 1
>>>>> +          maxItems: 2
>>>>> +        clock-names:
>>>>> +          minItems: 1
>>>>> +          items:
>>>>> +            - const: slave_iface
>>>>> +            - const: pxo
>>>>
>>>> Why pxo is optional? Commit msg does not say much here.
>>>
>>> It's optional as it is not present in current DT files. The driver will 
>>> fallback to 'pxo_board' if the clock is not present.
>>>
>>>> It seems you also miss the DTS change adding the clock.
>>>
>>> Oh, I'll add it to v2.
>>
>> How about adding it to DTS and making it required in the bindings? I did
>> not check the driver, but isn't the driver fail if clock is missing thus
>> the clock is really required?
> 
> I had the impression that we cannot make a clock mandatory of it wasn't present before. Please correct me if I'm wrong.

We cannot break the ABI which means implementation must accept old DTS.
As you wrote below, the implementation will handle this case. Whether we
can require new DTS properties (if implementation respects ABI) is a
different problem and I believe that we can. Bindings can grow, even
with necessary changes, because no ABI is actually broken here.

> 
> No, the driver will not fail. It will fallback to the lookup of the `pxo_board' clock from the system clock list.

Ah, good!


Best regards,
Krzysztof
