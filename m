Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2254B28E686
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 20:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730054AbgJNShQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 14:37:16 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:57107 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727897AbgJNShP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 14:37:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602700634; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=IEIPMirYLglQtMG3ZhrXuMt9kWgfaS7lKvwY28y7CVA=;
 b=OPXUynk1mc5mSN05btliiY6pKNa/cTuR8QadfOlHI5RPld+3qSK88ZByD0e6npRp1IKy48gX
 PlUz3dCcXwR+ojLv+JZziUGTUY36PNdAdEziUo/PBPuKl6yuLLs5kXrVM/eHAhZohvP0AAxc
 m6saqSAYELZgxvhbX4yK4Jvv/Vo=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f87454f4f8cc67c311a0e53 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Oct 2020 18:37:03
 GMT
Sender: manafm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6643AC433FE; Wed, 14 Oct 2020 18:37:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: manafm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 45ACEC433CB;
        Wed, 14 Oct 2020 18:37:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 15 Oct 2020 00:07:01 +0530
From:   manafm@codeaurora.org
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, dri-devel@freedesktop.org,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Add gpu cooling support
In-Reply-To: <fc490021-b046-68c5-7ceb-9c63d3ff5650@codeaurora.org>
References: <1602176947-17385-1-git-send-email-akhilpo@codeaurora.org>
 <CAD=FV=WjWv040TyBaqU8ZAuxGi-YpJ2tsVcUbOV4Htv=_-n8fA@mail.gmail.com>
 <20201009165705.GA1292413@google.com>
 <fc490021-b046-68c5-7ceb-9c63d3ff5650@codeaurora.org>
Message-ID: <a4be2cf9e51e4f40aae3f9a56989a42f@codeaurora.org>
X-Sender: manafm@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-14 18:59, Akhil P Oommen wrote:
> On 10/9/2020 10:27 PM, Matthias Kaehlcke wrote:
>> On Fri, Oct 09, 2020 at 08:05:10AM -0700, Doug Anderson wrote:
>>> Hi,
>>> 
>>> On Thu, Oct 8, 2020 at 10:10 AM Akhil P Oommen 
>>> <akhilpo@codeaurora.org> wrote:
>>>> 
>>>> Add cooling-cells property and the cooling maps for the gpu tzones
>>>> to support GPU cooling.
>>>> 
>>>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 29 
>>>> ++++++++++++++++++++++-------
>>>>   1 file changed, 22 insertions(+), 7 deletions(-)
>>>> 
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi 
>>>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> index d46b383..40d6a28 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> @@ -2,7 +2,7 @@
>>>>   /*
>>>>    * SC7180 SoC device tree source
>>>>    *
>>>> - * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>>>> + * Copyright (c) 2019-20, The Linux Foundation. All rights 
>>>> reserved.
>>>>    */
>>>> 
>>>>   #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
>>>> @@ -1885,6 +1885,7 @@
>>>>                          iommus = <&adreno_smmu 0>;
>>>>                          operating-points-v2 = <&gpu_opp_table>;
>>>>                          qcom,gmu = <&gmu>;
>>>> +                       #cooling-cells = <2>;
>>> 
>>> Presumably we should add this to the devicetree bindings, too?
> Yes, thanks for catching this. Will update in the next patch.
> 
>>> 
>>> 
>>>>                          interconnects = <&gem_noc MASTER_GFX3D 
>>>> &mc_virt SLAVE_EBI1>;
>>>>                          interconnect-names = "gfx-mem";
>>>> @@ -3825,16 +3826,16 @@
>>>>                  };
>>>> 
>>>>                  gpuss0-thermal {
>>>> -                       polling-delay-passive = <0>;
>>>> +                       polling-delay-passive = <100>;
>>> 
>>> Why did you make this change?  I'm pretty sure that we _don't_ want
>>> this since we're using interrupts for the thermal sensor.  See commit
>>> 22337b91022d ("arm64: dts: qcom: sc7180: Changed polling mode in
>>> Thermal-zones node").
>> 
>> I was going to ask the same, this shouldn't be needed.
As per our understanding unlike "polling-delay",  this delay property is 
intended to activate polling thread on post trip threshold violation and 
  it is irrespective of sensor is capable for trip interrupt or not.
This polling is more of governor related. Below are the few references 
from Documentation/code which tells polling-delay-passive is needed for 
IPA for better IPA performance.

As per Power allocator documentations

1. 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/driver-api/thermal/power_allocator.rst?h=v5.4.71#n264

"The power allocator governor's PID controller works best if there is a
periodic tick.  If you have a driver that calls
`thermal_zone_device_update()` (or anything that ends up calling the
governor's `throttle()` function) repetitively, the governor response
won't be very good.  Note that this is not particular to this
governor, step-wise will also misbehave if you call its throttle()
faster than the normal thermal framework tick (due to interrupts for
example) as it will overreact"

2. In Power allocator code, when  switch_on/control trip temp violation, 
it is enabling passive counter to activate passive polling @ 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/thermal/power_allocator.c?h=v5.4.71#n634

3. while calculating derivative term, it is using passive_delay @
  
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/thermal/power_allocator.c?h=v5.4.71#n243

4. Sensor interrupt will work if temperature is fluctuating between 
trip_temp and hysteresis. But say a case where we are not enabling 
polling-delay-passive. In this case if  current temperature > 
control_temp trip(2nd passive trip) and
  temperature trend is still raising, then sensor high trip will be 
disabled (OR configured for critical trip threshold). No more trip 
interrupt from sensor until it reaches critical trip or falls below 
control_temp hysteresis.
  How  the governor re-evaluate its next mitigation without passive 
polling thread  here ?

I think the same is required for CPU thermal zone as well.
>> 
>>>>                          polling-delay = <0>;
>>>> 
>>>>                          thermal-sensors = <&tsens0 13>;
>>>> 
>>>>                          trips {
>>>>                                  gpuss0_alert0: trip-point0 {
>>>> -                                       temperature = <90000>;
>>>> +                                       temperature = <95000>;
>>>>                                          hysteresis = <2000>;
>>>> -                                       type = "hot";
>>>> +                                       type = "passive";
>>> 
>>> Matthias probably knows better, but I wonder if we should be making
>>> two passive trip levels like we do with CPU.  IIRC this is important
>>> if someone wants to be able to use this with IPA.
>> 
>> Yes, please introduce a second trip point and make both of them
>> 'passive'.
>> 
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>> 
> Adding Manaf here.
> 
> -Akhil.
