Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C35D828E14F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 15:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbgJNNaF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 09:30:05 -0400
Received: from z5.mailgun.us ([104.130.96.5]:23176 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728376AbgJNNaE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 09:30:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602682203; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=rIC1SuV56SFchiZDRV34vNBmeGLmpoLkREQhbX7ZtSU=; b=n8qeyMflh12nyKhPN3zoytm/kCwgDBFUu1px0QFYnryu1Yf9TPuC0hy+oVJ2+B9zQ1qfHaBj
 ITgZB/Pfda5mP5/3vqwtTVevITm80/Kun7bh10H/xA1Aq5ziU8+y0KDQc1kNZ3rUui2ONBUA
 3GPOpXrRId8uRqnGj5jQQbgacVM=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f86fd3d0764f13b00a65ffc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Oct 2020 13:29:33
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 46285C433F1; Wed, 14 Oct 2020 13:29:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.9] (unknown [117.210.180.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F1AA7C433C9;
        Wed, 14 Oct 2020 13:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F1AA7C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Add gpu cooling support
To:     Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>, manafm@codeaurora.org
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, dri-devel@freedesktop.org,
        freedreno <freedreno@lists.freedesktop.org>
References: <1602176947-17385-1-git-send-email-akhilpo@codeaurora.org>
 <CAD=FV=WjWv040TyBaqU8ZAuxGi-YpJ2tsVcUbOV4Htv=_-n8fA@mail.gmail.com>
 <20201009165705.GA1292413@google.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <fc490021-b046-68c5-7ceb-9c63d3ff5650@codeaurora.org>
Date:   Wed, 14 Oct 2020 18:59:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201009165705.GA1292413@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/9/2020 10:27 PM, Matthias Kaehlcke wrote:
> On Fri, Oct 09, 2020 at 08:05:10AM -0700, Doug Anderson wrote:
>> Hi,
>>
>> On Thu, Oct 8, 2020 at 10:10 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>>>
>>> Add cooling-cells property and the cooling maps for the gpu tzones
>>> to support GPU cooling.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 29 ++++++++++++++++++++++-------
>>>   1 file changed, 22 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>> index d46b383..40d6a28 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>> @@ -2,7 +2,7 @@
>>>   /*
>>>    * SC7180 SoC device tree source
>>>    *
>>> - * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>>> + * Copyright (c) 2019-20, The Linux Foundation. All rights reserved.
>>>    */
>>>
>>>   #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
>>> @@ -1885,6 +1885,7 @@
>>>                          iommus = <&adreno_smmu 0>;
>>>                          operating-points-v2 = <&gpu_opp_table>;
>>>                          qcom,gmu = <&gmu>;
>>> +                       #cooling-cells = <2>;
>>
>> Presumably we should add this to the devicetree bindings, too?
Yes, thanks for catching this. Will update in the next patch.

>>
>>
>>>                          interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;
>>>                          interconnect-names = "gfx-mem";
>>> @@ -3825,16 +3826,16 @@
>>>                  };
>>>
>>>                  gpuss0-thermal {
>>> -                       polling-delay-passive = <0>;
>>> +                       polling-delay-passive = <100>;
>>
>> Why did you make this change?  I'm pretty sure that we _don't_ want
>> this since we're using interrupts for the thermal sensor.  See commit
>> 22337b91022d ("arm64: dts: qcom: sc7180: Changed polling mode in
>> Thermal-zones node").
> 
> I was going to ask the same, this shouldn't be needed.
> 
>>>                          polling-delay = <0>;
>>>
>>>                          thermal-sensors = <&tsens0 13>;
>>>
>>>                          trips {
>>>                                  gpuss0_alert0: trip-point0 {
>>> -                                       temperature = <90000>;
>>> +                                       temperature = <95000>;
>>>                                          hysteresis = <2000>;
>>> -                                       type = "hot";
>>> +                                       type = "passive";
>>
>> Matthias probably knows better, but I wonder if we should be making
>> two passive trip levels like we do with CPU.  IIRC this is important
>> if someone wants to be able to use this with IPA.
> 
> Yes, please introduce a second trip point and make both of them
> 'passive'.
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
Adding Manaf here.

-Akhil.

