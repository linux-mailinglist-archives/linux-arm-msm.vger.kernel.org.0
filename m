Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8C682F2186
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 22:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731502AbhAKVHQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 16:07:16 -0500
Received: from relay07.th.seeweb.it ([5.144.164.168]:48413 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730488AbhAKVHQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 16:07:16 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E39D03E8CF;
        Mon, 11 Jan 2021 22:06:18 +0100 (CET)
Subject: Re: [PATCH 5/7] regulator: qcom-labibb: Implement short-circuit and
 over-current IRQs
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
References: <20210109132921.140932-1-angelogioacchino.delregno@somainline.org>
 <20210109132921.140932-6-angelogioacchino.delregno@somainline.org>
 <20210111135745.GC4728@sirena.org.uk>
 <6dee36e4-fc78-c21b-daf8-120ee44535a3@somainline.org>
 <8115a574-ad43-d3c6-70d4-28c8a2f4a5f6@somainline.org>
Message-ID: <09d70d24-5d0d-f1cd-d99e-5c213c8ea98c@somainline.org>
Date:   Mon, 11 Jan 2021 22:06:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <8115a574-ad43-d3c6-70d4-28c8a2f4a5f6@somainline.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 11/01/21 20:23, AngeloGioacchino Del Regno ha scritto:
> Il 11/01/21 20:14, AngeloGioacchino Del Regno ha scritto:
>> Il 11/01/21 14:57, Mark Brown ha scritto:
>>> On Sat, Jan 09, 2021 at 02:29:19PM +0100, AngeloGioacchino Del Regno 
>>> wrote:
>>>
>>>> +    /* If the regulator is not enabled, this is a fake event */
>>>> +    if (!ops->is_enabled(vreg->rdev))
>>>> +        return 0;
>>>
>>> Or handling the interrupt raced with a disable initiated from elsewhere.
>>> Does the hardware actually have a problem with reporting spurious 
>>> errors?
>>>
> Sorry, I forgot to answer to this one in the previous email.
> 
> Yes, apparently the hardware has this issue: when the current draw is 
> very high and you disable the regulator while the attached device is 
> still drawing a lot of current (like on the Xperia XZ2 smartphone, but I 
> don't want to comment on that phone's HW quirks...) then the OCP 
> interrupt fires *after* disabling the LAB/IBB regulators.
> 
> This doesn't seem to happen if the current draw is low in the exact 
> moment the regulator gets disabled, but that's not always possible since 
> it depends on external HW design / board design sometimes...
> 
> 
>>>> +    return ret ? IRQ_NONE : IRQ_HANDLED;
>>>
>>> Here and elsewhere please write normal conditional statements to improve
>>> legibility.
>>>
>> No problem. Will do.
>>
>>>> +    /* This function should be called only once, anyway. */
>>>> +    if (unlikely(vreg->ocp_irq_requested))
>>>> +        return 0;
>>>
>>> If this is not a fast path it doesn't need an unlikely() annotation;
>>> indeed it sounds more like there should be a warning printed if this
>>> isn't supposed to be called multiple times.
>>>
>> That was extra-paranoid safety, looking at this one again, that should 
>> be totally unnecessary.
>> I think that removing this check entirely would be just fine also 
>> because.. anyway.. writing to these registers more than once won't do 
>> any harm, nor break functionality: I mean, even if it happens for 
>> whatever reason, there's *no real need* to avoid it from the hw 
>> perspective.
>>
>>>> +    /* IRQ polarities - LAB: trigger-low, IBB: trigger-high */
>>>> +    if (vreg->type == QCOM_LAB_TYPE) {
>>>> +        irq_flags |= IRQF_TRIGGER_LOW;
>>>> +        irq_trig_low = 1;
>>>> +    } else {
>>>> +        irq_flags |= IRQF_TRIGGER_HIGH;
>>>> +        irq_trig_low = 0;
>>>> +    }
>>>
>>> This would be more clearly written as a switch statement.
>>>
>> A switch statement looked like being a bit "too much" for just two 
>> cases where vreg->type cannot be anything else but QCOM_LAB_TYPE or 
>> QCOM_IBB_TYPE... but okay, let's write a switch statement in place of 
>> that.
>>
>>>> +    return devm_request_threaded_irq(vreg->dev, vreg->ocp_irq, NULL,
>>>> +                     qcom_labibb_ocp_isr, irq_flags,
>>>> +                     ocp_irq_name, vreg);
>>>
>>> Are you *sure* that devm_ is appropriate here and the interrupt handler
>>> won't attempt to use things that will be deallocated before devm gets
>>> round to freeing the interrupt?
>>>
>> Yeah, I'm definitely sure.
>>
>>>> +        if (!!(val & LABIBB_CONTROL_ENABLE)) {
>>>
>>> The !! is redundant here and makes things less clear.
>>>
>> My bad, I forgot to clean this one up before sending.
>>
>>>> @@ -166,8 +560,37 @@ static int qcom_labibb_of_parse_cb(struct 
>>>> device_node *np,
>>>>                      struct regulator_config *config)
>>>>   {
>>>>       struct labibb_regulator *vreg = config->driver_data;
>>>> +    char *sc_irq_name;
>>>
>>> I really, really wouldn't expect to see interrupts being requested in
>>> the DT parsing callback - apart from anything else the device is going
>>> to have the physical interrupts with or without DT binding information.
>>> These callbacks are for regulator specific properties, not basic 
>>> probing.
>>> Just request the interrupts in the main probe function, this also means
>>> you can avoid using all the DT specific APIs which are generally a
>>> warning sign.
>>>
>>
>> ...And I even wrote a comment saying "The Short Circuit interrupt is 
>> critical: fail if not found"!!! Whoa! That was bad.
>> Yeah, I'm definitely moving that to the appropriate place.
> 

I'm sorry for the triple e-mail... but I've just acknowledged that using 
platform_get_irq is actually impossible with the current schema.
As you can see in the dt-bindings documentation, the driver is supposed 
to be declared in DT as

		labibb {

			compatible = "qcom,pmi8998-lab-ibb";



			ibb: ibb {

				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>,

					     <0x3 0xdc 0x0 IRQ_TYPE_LEVEL_HIGH>;

				interrupt-names = "sc-err", "ocp";

			};



			lab: lab {

				interrupts = <0x3 0xde 0x1 IRQ_TYPE_EDGE_RISING>,

					     <0x3 0xde 0x0 IRQ_TYPE_LEVEL_LOW>;

				interrupt-names = "sc-err", "ocp";

			};

		};

...which was already a requirement before I touched it.
Now, this leaves two options here:
1. Keep the of_get_irq way, or
2. Move the interrupts, change the documentation (currently, only 
pmi8998.dtsi) and also fix pmi8998.dtsi to reflect the new changes.

I am asking before proceeding because I know that changing a schema that 
is already set sometimes gets "negated".

How should I proceed?

-- Angelo
