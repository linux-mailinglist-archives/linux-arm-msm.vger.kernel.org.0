Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5084A4D7F6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Mar 2022 11:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238288AbiCNKJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Mar 2022 06:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbiCNKJY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Mar 2022 06:09:24 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8409B140E2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 03:08:10 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 89C323F5F3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 10:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647252488;
        bh=+r4tw3AIRRBCkpVG/g0AlJLi4SN41rvsicv4GMS6cfQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=OK20dovGnDlpL81vjd1FpO75ZE7eKWCDRVyBNbgm6MoBBEp7h3lij5QlxI9V7KwMX
         wxGYZ2Z2u5biU0h6t7VmcqyFlt2CKLVm+qfGDOVsOZ8Wf7Y5FD4PExWt+gqHnQCtok
         QkLCdjlojQWECMbiRhoOfchA1IP22/4r37c4AveGmNygpLVngFG9qiiGjCdfWpBi4I
         YHjBChLfBwfObAv7WH84jOjMLcn5TI8oKB7GrUSp5yR5kKDSfSs058TJ1mSz/LUAJf
         Oa6CK7lOxhftB4UNtV5Hb6ehtSly8PikJFnyrRrfzw37Uz/H/E2NFIYjpJhkW+u2Bq
         WGSNLhoATetBg==
Received: by mail-ed1-f69.google.com with SMTP id da28-20020a056402177c00b00415ce4b20baso8398366edb.17
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 03:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+r4tw3AIRRBCkpVG/g0AlJLi4SN41rvsicv4GMS6cfQ=;
        b=jHNQSxeCdXufXrCu3lO0yjWeU54x5bGzcN/SBh0lm/36IFThg4oYw32kUs5YX2AxIM
         nb2feyUBhWe/8uzFQ+VyJqaP27WHKDy5/cJURc5XXxvhOuOI9Ac25OgXih9kDW0DxArl
         VzECnMWVIagwffmCiRfNmjXrYbkItxTDPbcj887vJThnRW+kFhkvelYvo8wRp8QunVP8
         FwwLDzCOLA9rg4LGiQTNm3Ib+DZIBwS8f/RrKZyh1XcxzmGFvCbyKMPbC6MwNCLa2AhN
         /FSo/KsXbcbe91Zi6MT2v2vrG2symiEMLPJlH2r1nR+K2PYnhAP0FyEBNdmFR0BaPLzK
         58uw==
X-Gm-Message-State: AOAM533oNDI0bFLj9GmOQzV+gcVvkDwemAlrd6j+7lchWeSrLrq78GPm
        Qo/MBLHQMmafmOPVkyKUP2Ju/AvhnABytjLx1RWTyBA6VOfZz0xZ78EL6ul3fBHkaZWhXSZ3p8i
        Uo9aJJReoJjrOf1DTaqmMrv7Bg+DWM9Tdu/BQgXnU9Ko=
X-Received: by 2002:a17:906:280b:b0:6ce:f3c7:688f with SMTP id r11-20020a170906280b00b006cef3c7688fmr18204832ejc.468.1647252487972;
        Mon, 14 Mar 2022 03:08:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI3ZzFyIAPUEjWu3adeD7O9BLeA6APF0933yAfK5HzcfK0RO66XgNxL4F3sH+IGjsRiB8sDw==
X-Received: by 2002:a17:906:280b:b0:6ce:f3c7:688f with SMTP id r11-20020a170906280b00b006cef3c7688fmr18204802ejc.468.1647252487681;
        Mon, 14 Mar 2022 03:08:07 -0700 (PDT)
Received: from [192.168.0.152] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.googlemail.com with ESMTPSA id k7-20020aa7c047000000b004132d3b60aasm7616899edo.78.2022.03.14.03.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 03:08:07 -0700 (PDT)
Message-ID: <b45b3b7e-e1c0-79b6-81c0-53c70427dd10@canonical.com>
Date:   Mon, 14 Mar 2022 11:08:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,usb-snps-femto-v2: Add phy
 override params bindings
Content-Language: en-US
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_kriskura@quicinc.com
References: <1646288011-32242-1-git-send-email-quic_c_sanm@quicinc.com>
 <1646288011-32242-2-git-send-email-quic_c_sanm@quicinc.com>
 <b793195b-1d3d-63b2-19d2-72ae2aec8c0f@canonical.com>
 <20220314032952.GA27561@hu-pkondeti-hyd.qualcomm.com>
 <f1621a67-a0ff-f111-c4da-9401924e7f4a@canonical.com>
 <20220314081613.GA28402@hu-pkondeti-hyd.qualcomm.com>
 <c88396f4-4cfe-d375-1dcd-b34a6496cb06@canonical.com>
 <20220314094054.GB28402@hu-pkondeti-hyd.qualcomm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220314094054.GB28402@hu-pkondeti-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/03/2022 10:40, Pavan Kondeti wrote:
> Hi Krzysztof,
> 
> Thanks for your suggestions and guidance on this.
> 
> On Mon, Mar 14, 2022 at 09:36:02AM +0100, Krzysztof Kozlowski wrote:
>> On 14/03/2022 09:16, Pavan Kondeti wrote:
>>> Hi Krzysztof,
>>>
>>> On Mon, Mar 14, 2022 at 08:39:57AM +0100, Krzysztof Kozlowski wrote:
>>>> On 14/03/2022 04:29, Pavan Kondeti wrote:
>>>>> Hi Krzysztof,
>>>>>
>>>>> On Thu, Mar 03, 2022 at 04:59:22PM +0100, Krzysztof Kozlowski wrote:
>>>>>> On 03/03/2022 07:13, Sandeep Maheswaram wrote:
>>>>>>> Add device tree bindings for SNPS phy tuning parameters.
>>>>>>>
>>>>>>> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
>>>>>>> ---
>>>>>>>  .../bindings/phy/qcom,usb-snps-femto-v2.yaml       | 125 +++++++++++++++++++++
>>>>>>>  1 file changed, 125 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
>>>>>>> index 0dfe691..227c097 100644
>>>>>>> --- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
>>>>>>> @@ -50,6 +50,131 @@ properties:
>>>>>>>    vdda33-supply:
>>>>>>>      description: phandle to the regulator 3.3V supply node.
>>>>>>>  
>>>>>>> +  qcom,hs-disconnect:
>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>> +    description:
>>>>>>> +      This adjusts the voltage level for the threshold used to
>>>>>>> +      detect a disconnect event at the host. Possible values are.
>>>>>>
>>>>>> ':', instead of full stop.
>>>>>>
>>>>>>> +      7 -> +21.56%
>>>>>>> +      6 -> +17.43%
>>>>>>> +      5 -> +13.32%
>>>>>>> +      4 -> +9.73%
>>>>>>> +      3 -> +6.3
>>>>>>> +      2 -> +3.17%
>>>>>>> +      1 -> 0, Design default%
>>>>>>
>>>>>> Use "default:" instead. Here and in other places.
>>>>>>
>>>>>>> +      0 -> -2.72%
>>>>>>
>>>>>> In current form this should be an enum... but actually current form is
>>>>>> wrong. You should not store register values in DT. What if next version
>>>>>> of hardware has a different meaning of these values?
>>>>>>
>>>>>> Instead, you should store here meaningful values, not register values.
>>>>>>
>>>>>
>>>>> Thanks for the feedback.
>>>>>
>>>>> The values in % really makes the tuning easy. People look at the eye diagram
>>>>> and decided whether to increase/decrease the margin. The absolute values
>>>>> may not be that useful. All we need is an "adjustment" here. The databook
>>>>> it self does not give any absolute values.
>>>>>
>>>>> I agree to the "enum" suggestion which we have been following for the
>>>>> qusb2 driver already. 
>>>>>
>>>>> The values have not changed in the last 5 years for this hardware block, so
>>>>> defining enums for the % values would be really helpful. 
>>>>
>>>> I did not say you cannot store here percentages. Quite opposite - store
>>>> here the percentages. Just do not store register value. No. Please read
>>>> my comment again - meaningful values are needed.
>>>>
>>>
>>> IIUC, you are asking us to come up with a meaningful values to encode the
>>> percentage values. However, all the % increments are not linear, so we can't
>>> come up with {min, max} scheme. Lets take an example of hostdisconnect
>>> threshold.
>>>
>>> As per the data book,
>>>
>>> +      7 -> +21.56%
>>> +      6 -> +17.43%
>>> +      5 -> +13.32%
>>> +      4 -> +9.73%
>>> +      3 -> +6.3
>>> +      2 -> +3.17%
>>> +      1 -> 0, Design default%
>>> +      0 -> -2.72%
>>>
>>> so how do we give meaningful values here? Does the below scheme make sense
>>> to you?
>>
>> By "meaningful value" I mean something which has a understandable
>> meaning to reader of this code or to hardware designer. For example
>> percentage values or some units (ms, ns, Hz, mA, mV). The value used in
>> register is not meaningful in that way to us because it has a meaning
>> only to the hardware block. Storing register values is more difficult to
>> read later, non-portable and non-scalable.
>>
>>>
>>> #define QCOM_SNPS_FEMTO_HS_DISCONNECT_NEG_2P72	(-272)
>>> #define QCOM_SNPS_FEMTO_HS_DISCONNECT_DEFAULT	0
>>> #define QCOM_SNPS_FEMTO_HS_DISCONNECT_3P17	317
>>> #define QCOM_SNPS_FEMTO_HS_DISCONNECT_6P3	63
>>
>> This is some define in driver, does not look related to bindings.
>>
>>> In the driver, we have a mapping (which can be per SoC if required in future)
>>> that takes these values and convert to the correct values for a given
>>> register.
>>
>> You focus on driver but I am talking here only about bindings.
> 
> I was saying we define those defines in include/dt-bindings/phy/... header and
> use it in the device tree and as well in the driver.

Ah, I did not get it. That's not the solution for this case. defines in
dt-bindings are for constants which already can be in DT, e.g. IDs. Your
register values should not be stored in DT.

> 
>>
>> What could be the meaningful value? Percentage could work. You have
>> there a negative value, so I wonder what type of percentage is it? What
>> is the formula?
> 
> I just multiplied by 100 since device tree has no support for floating (as per
> my knowledge). The negative value represents it lowers the disconnect
> threshold by 2.72% of the default value. if it makes sense, we could also
> start from 0 like below.

ok

> 
> #define QCOM_SNPS_FEMTO_HS_DISCONNECT_NEG_2P72_PCT 0
> #define QCOM_SNPS_FEMTO_HS_DISCONNECT_DEFAULT	1
> #define QCOM_SNPS_FEMTO_HS_DISCONNECT_3P17_PCT	2
> #define QCOM_SNPS_FEMTO_HS_DISCONNECT_6P3_PCT	3
> 
> The driver can have a table to map these bindings. This looks much better
> than those x100 formula values.

Again mention driver how he can map it. I mostly don't care about the
driver. :)

I think we are getting around the problem, so to emphasize again: do not
store register values in the bindings/DT but its meaning, so in your
case most likely percentages (or permille or ratio or some other value).


Best regards,
Krzysztof
