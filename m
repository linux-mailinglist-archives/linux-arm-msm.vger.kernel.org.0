Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5A112B20E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 07:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfL0Gn3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 01:43:29 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:40428 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726335AbfL0Gn3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 01:43:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577429008; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=PjDZBDfXnNx/o9On+iPHoESBms7V0E/gW0H4jVJuO/A=; b=BgHH+rQ3uSOdHHksrGbwRhNdtnV9L2pzgAerwJ9d8hGnMEboTEyCiZmGzl3+cOm3NOQByJ3i
 Kp5CjTbPqEI+FAOTmy4JD8pjqvDkxTqb8WL2ft5//qB4yfK95AmzX03r5rl+c2pzirUKiIgp
 7f69/r1ZFowGx8TfiaO3sz8Q7E8=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e05a80e.7fc03d6ec308-smtp-out-n01;
 Fri, 27 Dec 2019 06:43:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 64961C447A0; Fri, 27 Dec 2019 06:43:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 85A5FC43383;
        Fri, 27 Dec 2019 06:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 85A5FC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 3/8] dt-bindings: clock: Add YAML schemas for the QCOM
 GPUCC clock bindings
To:     Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <1573812304-24074-1-git-send-email-tdas@codeaurora.org>
 <1573812304-24074-4-git-send-email-tdas@codeaurora.org>
 <CAOCk7NqfHe6jRPmw6o650fyd6EyVfFObHhJ9=21ipuAqJo6oGA@mail.gmail.com>
 <20191126181154.275EA20727@mail.kernel.org>
 <0101016eab0a4e76-b8eb44c5-d076-46b9-a156-b80dc650ca31-000000@us-west-2.amazonses.com>
 <20191219053244.88D3A222C2@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <1acbd025-d4f4-02b3-2c61-8672405894cc@codeaurora.org>
Date:   Fri, 27 Dec 2019 12:13:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191219053244.88D3A222C2@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Stephen,

On 12/19/2019 11:02 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-11-26 20:06:49)
>>
>>
>> On 11/26/2019 11:41 PM, Stephen Boyd wrote:
>>> Quoting Jeffrey Hugo (2019-11-15 07:11:01)
>>>> On Fri, Nov 15, 2019 at 3:07 AM Taniya Das <tdas@codeaurora.org> wrote:
>>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
>>>>> new file mode 100644
>>>>> index 0000000..c2d6243
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
>>>>> +      - description: GPLL0 source from GCC
>>>>
>>>> This is not an accurate conversion.  GPLL0 was not valid for 845, and
>>>> is required for 8998.
>>>
>>> Thanks for checking Jeff.
>>>
>>> It looks like on 845 there are two gpll0 clocks going to gpucc. From
>>> gpu_cc_parent_map_0:
>>>
>>>        "gcc_gpu_gpll0_clk_src",
>>>        "gcc_gpu_gpll0_div_clk_src",
>>>
>>
>> There are branches of GPLL0 which would be connected to most external
>> CCs. It is upto to the external CCs to either use them to source a
>> frequency or not.
> 
> Yes, they can decide to use them or not, but they really do go to the
> CCs so the DT should describe that.
> 

Documentation is updated with both the GPLL0 branches now.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
