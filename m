Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B851BE40A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 18:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgD2Qi1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 12:38:27 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:14884 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726481AbgD2Qi1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 12:38:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588178305; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=4s/uu5d90dFDcjdFr84ftHeij5DiBpvs7D+0ACrC89Y=; b=ayOb1vKH+P5Gqd/NuAe0RG0jMkjy5C1Gw92GUTIvrj9bf++Ljy/D4yux52b4VIp2RUYWxuXF
 sMp2+HoJrpzcdmzv4iscsdxdfE1lYg7U1I7g3X0rRq3GXdZ0umaIyw29o30jQ8fJXACQm5Wx
 OIkltOhalSghsCGo2+MPDovhF1I=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea9ad81.7f88f590a500-smtp-out-n01;
 Wed, 29 Apr 2020 16:38:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D243AC433BA; Wed, 29 Apr 2020 16:38:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.182.194] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 37E15C432C2;
        Wed, 29 Apr 2020 16:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37E15C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 03/17] arm64: dts: sdm845: Add OPP table for all qup
 devices
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-4-git-send-email-rnayak@codeaurora.org>
 <20200429000234.GK4525@google.com>
 <fe4b60f9-8aa6-0173-a67f-2f0f8451ad85@codeaurora.org>
 <cc425e51-9e27-76a3-8ce6-1a751960ff7a@codeaurora.org>
 <20200429161046.GR4525@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <59f6fcbd-c7c5-c51f-cbb3-c9b980d7611b@codeaurora.org>
Date:   Wed, 29 Apr 2020 22:08:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429161046.GR4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/29/2020 9:40 PM, Matthias Kaehlcke wrote:
> On Wed, Apr 29, 2020 at 08:23:30PM +0530, Rajendra Nayak wrote:
>>
>> On 4/29/2020 7:45 PM, Rajendra Nayak wrote:
>>>
>>> On 4/29/2020 5:32 AM, Matthias Kaehlcke wrote:
>>>> Hi Rajendra,
>>>>
>>>> On Tue, Apr 28, 2020 at 07:02:51PM +0530, Rajendra Nayak wrote:
>>>>> qup has a requirement to vote on the performance state of the CX domain
>>>>> in sdm845 devices. Add OPP tables for these and also add power-domains
>>>>> property for all qup instances.
>>>>>
>>>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/sdm845.dtsi | 115 +++++++++++++++++++++++++++++++++++
>>>>>    1 file changed, 115 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>>>> index 8f926b5..36b9fb1 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>>>> @@ -804,6 +804,25 @@
>>>>>                clock-names = "core";
>>>>>            };
>>>>> +        qup_opp_table: qup-opp-table {
>>>>> +            compatible = "operating-points-v2";
>>>>> +
>>>>> +            opp-19200000 {
>>>>> +                opp-hz = /bits/ 64 <19200000>;
>>>>> +                required-opps = <&rpmhpd_opp_min_svs>;
>>>>> +            };
>>>>> +
>>>>> +            opp-75000000 {
>>>>> +                opp-hz = /bits/ 64 <75000000>;
>>>>> +                required-opps = <&rpmhpd_opp_low_svs>;
>>>>> +            };
>>>>> +
>>>>> +            opp-100000000 {
>>>>> +                opp-hz = /bits/ 64 <100000000>;
>>>>> +                required-opps = <&rpmhpd_opp_svs>;
>>>>> +            };
>>>>> +        };
>>>>> +
>>>>
>>>> Judging from SDM845 (which has more OPP tables) the convention seems to be
>>>> to add OPP tables to the nodes that use them, which seems reasonable and
>>>> keeps them out of the device list.
>>>>
>>>> Unfortunately this convention isn't completely suitable for cases like this
>>>> (and the DSI OPPs later in this series), where the same OPP table is used by
>>>> multiple devices. A possible compromise would be to add the table to the
>>>> node of the first device that uses them.
>>>
>>> Sounds fair, I will do that and respin. Thanks.
>>
>> Looking into this some more, I see we do have..
>>
>> static const struct of_device_id of_skipped_node_table[] = {
>>          { .compatible = "operating-points-v2", },
>>          {} /* Empty terminated list */
>> };
>>
>> ..in drivers/of/platform.c, so its not being added to the device list.
> 
> sure, I didn't mean that the OPP table is added by the kernel as a device, but
> that the table breaks with the structure of the DT of device nodes ordered by
> address.

Ah ok, got it.

> 
>> And atleast in case of qup, I am having to duplicate the OPP tables once for
>> each qup instance. Not to mention, having them inside the first qup device
>> just makes it a little confusing to read who the OPP table belongs to.
> 
> I'm not advocating for duplicating the OPP tables. An alternative to having
> them in the first QUP device could be to have an dedicated node with shared
> opp tables outside of the device list, similar to thermal-zones.

That sounds like a good idea too.

> I tend to like consistency and the sprinkled in OPP tables break with that,
> but ultimately it's up to Bjorn.

Bjorn, any thoughts?

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
