Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF70B1BD8DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 11:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgD2JzZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 05:55:25 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:41709 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726457AbgD2JzZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 05:55:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588154123; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3iXUY6EYpmcQbL2bjsrp6J9NTxmranLuwsV6XKvgXqY=; b=KDzoDVd+e77z84IEkU6YgpXbq9Bh54WHwsp0kdi1Qzez5INl7HtOjhcadksNLyhj2g2S+cqr
 7lWv5E+IcAIc4bB17synA683LM+9jJ3Um/HPti8poomBGxSHkME6iGOT8WDH+nC3wmBnvzAI
 3JgxuvziUR5GpI7FiW822MIwTvw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea94f0b.7fd361bc4ae8-smtp-out-n02;
 Wed, 29 Apr 2020 09:55:23 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 32DACC433BA; Wed, 29 Apr 2020 09:55:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.227] (unknown [49.204.176.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 07F91C433D2;
        Wed, 29 Apr 2020 09:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 07F91C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: Add a new compatible string and a
 clock
To:     Doug Anderson <dianders@chromium.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>, tdas@codeaurora.org
References: <1588073914-15712-1-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=WPG4x+TTu5-169EPObhvtPEpodzjnk2WSBCQgR434xdA@mail.gmail.com>
From:   Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <9aece4ec-6a14-ea73-fe9c-5f097a018354@codeaurora.org>
Date:   Wed, 29 Apr 2020 15:25:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WPG4x+TTu5-169EPObhvtPEpodzjnk2WSBCQgR434xdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/29/2020 3:57 AM, Doug Anderson wrote:
> Hi,
>
> On Tue, Apr 28, 2020 at 4:39 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>> This patch adds a new compatible string for sc7180 and also an
>> additional clock listing needed to power the TBUs and the TCU.
>>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
> nit: mention sc7180 in subject, like:
>
> dt-bindings: arm-smmu: Add sc7180 compatible string and mem_iface clock
>
>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 6515dbe..15946ac 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -28,6 +28,7 @@ properties:
>>             - enum:
>>                 - qcom,msm8996-smmu-v2
>>                 - qcom,msm8998-smmu-v2
>> +              - qcom,sc7180-smmu-v2
>>                 - qcom,sdm845-smmu-v2
>>             - const: qcom,smmu-v2
>>
>> @@ -113,16 +114,22 @@ properties:
>>         present in such cases.
>>
>>     clock-names:
>> +    minItems: 2
>> +    maxItems: 3
>>       items:
>>         - const: bus
>>         - const: iface
>> +      - const: mem_iface_clk
> People usually frown on clock-names ending in "_clk".  Just name it "mem_iface".
>
>
>>     clocks:
>> +    minItems: 2
>> +    maxItems: 3
>>       items:
>>         - description: bus clock required for downstream bus access and for the
>>             smmu ptw
>>         - description: interface clock required to access smmu's registers
>>             through the TCU's programming interface.
>> +      - description: clock required for the SMMU TBUs and the TCU
> Is this clock only needed for sc7180, or would it be useful if we
> enabled certain features on existing devices?  Please document exactly
> when someone would provide this clock and when they'd leave it off.
>
> ...also: maybe it's obvious to those that understand IOMMUs in depth,
> but to me I have no idea what your description means and why it's
> different from the other two clocks.  Any way you could punch up your
> description a little bit?
>
> Looking at sdm845 I see that this clock seems to exist but wasn't
> listed in the IOMMU device tree node.  Is that a mistake on sdm845?
> ...or is it just fine because the GPU holds the clock?  Is there a
> reason the sdm845 solution and the sc7180 solution shouldn't be the
> same (AKA we should either add this clock to the sdm845 device tree
> file or remove it from sc7180)?

I went and checked the downstream SDM845 device tree for GPU SMMU and I 
do see this clock listed on there. I am no expert in SMMU either but my 
understanding is that this clock is needed for core working of the SMMU 
like the pagetable walks, TLB invalidations etc, whereas the other two 
clocks are required to access SMMU register space from the host.My 
proposal is to add this clock to SDM845 as well as a follow up effort so 
that we can remove the Min/MaxItems properties which I do not like.

@Jordan, do you remember why this clock was added to SDM845?

> Thanks!
>
> -Doug
