Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB7FB210A34
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 13:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730239AbgGALVO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 07:21:14 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:12342 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730216AbgGALVO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 07:21:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593602473; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=n9dv+4uh/SqsbO43SuymhrpHyZhUe1aTGaZYaxpJrSM=; b=ngOPaMsaRXmApgg2JQjTxNH5m9rAjUw/6xIVRdH1AezMLMgKxR1NBAUs+NGJP0xIVeLySOYN
 AJXGwLFN/TI0DRPJh2PQ9EOoYOSSQLKSA+0iHozygDKppltrGqCCf/Dy4Q7lfhm2pPaAvgjo
 86yU12/7qHnAXIB8twTve3NeEXI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5efc718f8fe116ddd9e7ecea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 01 Jul 2020 11:20:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2B195C433CB; Wed,  1 Jul 2020 11:20:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.50.36.152] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 53A55C433C6;
        Wed,  1 Jul 2020 11:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 53A55C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2] dt-bindings: media: venus: Add an optional power
 domain for perf voting
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Cc:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
References: <1589349807-10163-1-git-send-email-rnayak@codeaurora.org>
 <20200527193638.GA2604206@bogus>
 <448cc4c0-0714-dc62-df19-7fa8fba91758@codeaurora.org>
Message-ID: <1e8c07c8-0954-462a-cfe6-a1ccde1bedea@codeaurora.org>
Date:   Wed, 1 Jul 2020 16:50:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <448cc4c0-0714-dc62-df19-7fa8fba91758@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/1/2020 11:26 AM, Rajendra Nayak wrote:
> 
> On 5/28/2020 1:06 AM, Rob Herring wrote:
>> On Wed, May 13, 2020 at 11:33:27AM +0530, Rajendra Nayak wrote:
>>> Add an optional power domain which when specified can be used for
>>> setting the performance state of Venus.
>>>
>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>> ---
>>>   Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml    | 6 +++++-
>>>   Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 6 +++++-
>>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
>>> index 764affa..ac1ed64 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
>>> @@ -25,12 +25,16 @@ properties:
>>>       maxItems: 1
>>>     power-domains:
>>> -    maxItems: 2
>>> +    minItems: 2
>>> +    maxItems: 3
>>>     power-domain-names:
>>> +    minItems: 2
>>> +    maxItems: 3
>>>       items:
>>>         - const: venus
>>>         - const: vcodec0
>>> +      - const: opp-pd
>>
>> Humm, looks suspicious. This is a phyical power island in this block?
> 
> yes, this is used to represent the physical 'cx' power island in the SoC
> (Its a shared power island, not a power island specific to this block)
> that can be scaled to different 'performance levels' based on the frequency
> the codec is expected to run at.

Rob, Did you have any other concerns here? Should I be re-posting this?

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
