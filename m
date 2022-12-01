Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27ED263F639
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 18:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbiLARg1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 12:36:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiLARgY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 12:36:24 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4B398E89
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 09:36:22 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id z4so2689540ljq.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 09:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IDJJ8iwQKSOrOee0LUttztO1ikmBHL9eZbYNjvPa90=;
        b=CPTun7yXSFFql3odJhnl0fPjTYcZ8kerJP9q4Z21pwC89aNVu0qNrS+acMT7ChawGD
         tCofOMdVuf+0TA7eIZlQQAqH7Ff/DnHR5RAXnXHH8wOsiEvOhupLvbz4sAxhxNUgZM/g
         v/EYQxiYv5hmqyDxK/MOwIOtUkbVzjgG5Z5duPGaZBB2pO3tktv7JQKh8LV7drH2wa96
         tOuGUuOM5igjpV6TxAXOJN4Ylho0uTnxUFg+Bwioylg8+PLuV1Uq8tmEB8s6fyc28Oks
         Tm+b8TziA/VJOPU6C07f8gRHFbFWJgyC0QejSAIlciH6v/1N6w2epoDK4beh+Jo+kKpO
         DLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IDJJ8iwQKSOrOee0LUttztO1ikmBHL9eZbYNjvPa90=;
        b=OyNI4sMAmXVoiUi6y2vFRgUXRv+MtBdnKHI+aDH+cBSdb/UZc5Xehbd+rQElKcErrD
         GNUHYqJMbOspC0+FxWRDLHYV0qYzm6h9rc5N3h4PVdGlaZF6nQnHREuhd60fyQF6JahA
         wa12H4sF02uYjWAJW/WzRJoym8WtcFctOx374i0oMLEnflndyYUbIr4IO2zVbTqoQIzE
         b7/JnXlOcZ52qTE7W6ugNPCbkPwHhheai1EntEDfx0COhezqHVnROdjOfjnOOXO3Zto3
         r5+B3qvgcY0CxBnkhVPOsFU4MIpuAGPwmA6fqtlEgBCYsteC5qwcNk8T+7z0WNzSsM4/
         Tyog==
X-Gm-Message-State: ANoB5plPddXYpu3HJsogyIiLX1ofJxRKtNFSKjjNcz4XaSR8rqCC8YtP
        EkNuXBO1o5HntC0tS1yfIbwQOA==
X-Google-Smtp-Source: AA0mqf4oCjlx3y5ZA0TAXj6HqUdJYdc4tWeuZdaW4wxvDH0jzSoqOnNb8fLgjpLvWyShJHOJ55hCXA==
X-Received: by 2002:a2e:a90b:0:b0:277:794:ae09 with SMTP id j11-20020a2ea90b000000b002770794ae09mr21149541ljq.286.1669916181166;
        Thu, 01 Dec 2022 09:36:21 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d23-20020a194f17000000b0049482adb3basm715458lfb.63.2022.12.01.09.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 09:36:20 -0800 (PST)
Message-ID: <64107527-ff02-6743-cfb2-aedb4241d531@linaro.org>
Date:   Thu, 1 Dec 2022 19:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 1/4] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1669852310-22360-1-git-send-email-quic_khsieh@quicinc.com>
 <1669852310-22360-2-git-send-email-quic_khsieh@quicinc.com>
 <7bf73466-e476-4a1d-5dc0-1b63ea742226@linaro.org>
 <edf6735c-9903-a3c1-fb6f-22a76b11604e@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <edf6735c-9903-a3c1-fb6f-22a76b11604e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/12/2022 19:34, Kuogee Hsieh wrote:
> 
> On 11/30/2022 4:07 PM, Dmitry Baryshkov wrote:
>> On 01/12/2022 01:51, Kuogee Hsieh wrote:
>>> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
>>> add link-frequencies property into dp_out endpoint as well. The last
>>> frequency specified at link-frequencies will be the max link rate
>>> supported by DP.
>>>
>>> Changes in v5:
>>> -- revert changes at sc7180.dtsi and sc7280.dtsi
>>> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi
>>>
>>> Changes in v6:
>>> -- add data-lanes and link-frequencies to yaml
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   .../devicetree/bindings/display/msm/dp-controller.yaml  | 17 
>>> +++++++++++++++++
>>
>> Separate patch. Also you didn't check the get_maintainers output, so 
>> required parties were not included into the distribution.
>>
>> Also as you'd check the get_maintainers output, please fix other email 
>> addresses too.
>>
>>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi            |  6 +++++-
>>>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi          |  6 +++++-
>>>   3 files changed, 27 insertions(+), 2 deletions(-)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml 
>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> index 94bc6e1..af70343 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> @@ -90,6 +90,20 @@ properties:
>>>           $ref: /schemas/graph.yaml#/properties/port
>>>           description: Output endpoint of the controller
>>>   +        properties:
>>> +          endpoint:
>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>> +
>>> +          properties:
>>> +            link-frequencies: true
>>> +            data-lanes: true
>>
>> No. Use $ref for both of them.
>>
>>> +
>>> +          required:
>>> +            - link-frequencies
>>> +            - data-lanes
>>
>> No, they are not required.
>>
>>> +
>>> +          additionalProperties: false
>>> +
>>
>> deprecation of old data-lanes property?
> there is no old data-lanes property.

There is one:

$ grep -n data-lanes 
Documentation/devicetree/bindings/display/msm/dp-controller.yaml
82:  data-lanes:


-- 
With best wishes
Dmitry

