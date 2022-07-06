Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9636556902A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 18:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233546AbiGFQ7C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 12:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233568AbiGFQ6n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 12:58:43 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D8DA2A958
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 09:58:21 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j21so26997802lfe.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 09:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WQOxSk1KXA2FtBdi1FmOsR3LGQGiLqiV1G5FGZ4b7/o=;
        b=f/M72wViTAKDNjwFR+NQ9tO3LqWsoIJIEIkJ7q7xBILoL1gk34XR2hnt2HT8t66QTn
         JaYaw6c79EhPjZ0/G957bYeSl7U6vYXXPKQDO+lQ8CEhc5fB8nDDvJ7+gNjfxw81uxml
         K2mYmof4B8MKMX5Oz+Cad4jhD+fz/behN5g692OcMa0kBQUrEoReN3bHbKcSbViYvnBu
         Xi5AXTzlKvoIlCWQ1JwgmbV4/UW0eE/ILgWb7ZqqcyjnJpSPCMcZR0loOhMdkrpD3WgX
         PjxD2TRm0ZD5Qh6SvGRDl5lWnkDOqSNbDLh0U+Wlqb6AX5hIbvMppCLSHb7rVhHvLN5s
         W2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WQOxSk1KXA2FtBdi1FmOsR3LGQGiLqiV1G5FGZ4b7/o=;
        b=HVS2KYparbk3jsFtC/7iF+4QmXI7Xlw+PcVgfio3JrkGWSH3B2StUUv/yBYo26vBOn
         4IoHhXsyNcsovPS9gZXTito5G9tQzPlMXW8KFfiWxzwNEwm6pfeYkdSI0ZaiGZ+WeQsQ
         Qj1qQIAnOjc+zgXvlULyFOU/6JwkxbplPIClHWjoh8W6Ew1Nbhvi4T9GEG4cauNf65R0
         E+RL2PM4Ip7So7zqCEahKbkNb2FwK5EBWRB4OqDg+Zk1qOQ2XunGvLsjGL+sXPYD2cSM
         ybTcEKmzdVYQ+mrLKftmRvMwRHpoYY1az+WDQYQinhcIxqm96HpLHC6TsEoa/AVt+NVy
         0yIg==
X-Gm-Message-State: AJIora+9k6ndJXfqD7eMHXuVVJmZ+J2/12kVtd9X+ujJqCYDHZbSN+IM
        ywRINgE+yMNDqct49/kU/L8jiw==
X-Google-Smtp-Source: AGRyM1s/g4VAYvdgBQIZA3q/yKl0xbgGt09KrBAqI396vECZOIwHBUCLENVGCkLA95jiOx5ps+7tpg==
X-Received: by 2002:a05:6512:158d:b0:47f:718c:28b5 with SMTP id bp13-20020a056512158d00b0047f718c28b5mr27963507lfb.397.1657126699482;
        Wed, 06 Jul 2022 09:58:19 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n10-20020a0565120aca00b0047f77c979f3sm6354604lfu.235.2022.07.06.09.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 09:58:19 -0700 (PDT)
Message-ID: <3b3e0543-8802-469e-e0a9-61bbf26d58d7@linaro.org>
Date:   Wed, 6 Jul 2022 19:58:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/4] dt-bindings: display/msm/gpu: document using the
 amd,imageon adreno too
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
 <20220706145222.1565238-3-dmitry.baryshkov@linaro.org>
 <088c1863-ad44-61b6-8757-bc3097369335@linaro.org>
 <c6c06a9e-8b06-cb15-ae81-07053bbf80a7@linaro.org>
 <6c89ee27-43d1-b926-b061-c9f6c1085f24@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6c89ee27-43d1-b926-b061-c9f6c1085f24@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 06/07/2022 19:19, Krzysztof Kozlowski wrote:
> On 06/07/2022 18:00, Dmitry Baryshkov wrote:
>> On 06/07/2022 18:50, Krzysztof Kozlowski wrote:
>>> On 06/07/2022 16:52, Dmitry Baryshkov wrote:
>>>> The DT binding desribes using amd,imageon only for Imageon 2xx GPUs. We
>>>> have been using amd,imageon with newer (Adreno) GPUs to describe the
>>>> headless setup, when the platform does not (yet) have the display DT
>>>
>>> Does not have "yet"? So later it will have and you drop a compatible?
>>
>> Yes. For example see the arch/arm64/boot/dts/qcom/8150.dtsi, which
>> currently has only GPU node. Once we add MDSS/DPU/DSI/etc. nodes, we are
>> going to drop the compat string.
>>
>>>
>>>> nodes (and no display support). Document this trick in the schema.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>>>> index 346aabdccf7b..e006da95462c 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>>>> @@ -16,9 +16,13 @@ properties:
>>>>          - description: |
>>>>              The driver is parsing the compat string for Adreno to
>>>>              figure out the gpu-id and patch level.
>>>> +          Optional amd,imageon compatibility string enables using Adreno
>>>> +          without the display node.
>>>>            items:
>>>>              - pattern: '^qcom,adreno-[3-6][0-9][0-9]\.[0-9]$'
>>>>              - const: qcom,adreno
>>>> +          - const: amd,imageon
>>>> +        minItems: 2
>>>
>>> This is too unspecific. You allow any device to be and not to be
>>> compatible with amd,imageon.
>>
>> Yes, this is expected (kind of). Would you have any
>> alternatives/suggestions?
> 
> Using compatible for this kind of breaks the entire idea behind
> compatibles, because the device does not stop being compatible with
> amd,imageon. Either it is or it is not. I would understand that drop the
> compatible per boards which physically do not have display, physically
> are headless. But the comment in sm8250:
> "make sure to remove it when display node is added"
> is just confusing.
> 
> The typical solution would be to just check the properties of the device
> and choose different mode if display is missing (via port graph or some
> other way how the gpu is actually linked to the display).

The problem is that the gpu doesn't get linked to the display per se.

On imx5 platforms the GPU (compatible with amd,imageon) is a standalone 
device. On qcom platforms the GPU (qcom,adreno) is used as a component 
in multi-component device. By enlisting qmd,imageon for newer Adreno 
devices we just enforce non-standard probing sequence, because all other 
components just do not exist.

So, yes, this is hack around compatibles. However probably the only 
viable alternative around it would be to check in probe path if there is 
any device node compatible with "qcom,foo-mdss".

-- 
With best wishes
Dmitry
