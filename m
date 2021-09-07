Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0157A402897
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 14:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344162AbhIGMVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 08:21:43 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:60079 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344710AbhIGMVO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 08:21:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631017208; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=5HlGghoP2b2ht8fi4G9mfxQrkVUoJI58Mvkt18+LJGM=; b=E2PKS55+oBzsdq3iszSYbCnh8g0jmMRh/Ngv7yg5jhNY5paGFJ8W4BgAMHRN8g0Dd3Fmo7/I
 8mWFlE3AyZgzd63trw+i31KLhgUKXflyMoFdCzGk4On6igi3zyUlm46F9HTrvGvnaWvDX71v
 giqtJ3s+tRU/eghIhAe3q7uKXgU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 613758e91567234b8c943a56 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Sep 2021 12:19:53
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4675FC4314C; Tue,  7 Sep 2021 12:19:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [192.168.1.105] (unknown [49.207.193.119])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 339F4C43619;
        Tue,  7 Sep 2021 12:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 339F4C43619
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings
 for dwc3 qcom
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Pratham Pratap <prathampratap@codeaurora.org>
References: <1630346073-7099-1-git-send-email-sanm@codeaurora.org>
 <1630346073-7099-2-git-send-email-sanm@codeaurora.org>
 <CAD=FV=XjRMdB=iHDcMATWDq5CSRGdh1ZBCftjrZvTfMk_Nqgvg@mail.gmail.com>
 <1dc7aaaa-a8da-565b-664e-64f529a861b1@codeaurora.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <bfed78b2-38dd-444a-244f-76c280137a1d@codeaurora.org>
Date:   Tue, 7 Sep 2021 17:49:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1dc7aaaa-a8da-565b-664e-64f529a861b1@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/6/2021 2:45 PM, Sandeep Maheswaram wrote:
> 
> On 8/31/2021 1:37 AM, Doug Anderson wrote:
>> Hi,
>>
>> On Mon, Aug 30, 2021 at 10:55 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>>> Add multi pd bindings to set performance state for cx domain
>>> to maintain minimum corner voltage for USB clocks.
>>>
>>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>>> ---
>>>   Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 13 ++++++++++++-
>>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>>> index e70afc4..838d9c4 100644
>>> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>>> @@ -41,7 +41,18 @@ properties:
>>>
>>>     power-domains:
>>>       description: specifies a phandle to PM domain provider node
>>> -    maxItems: 1
>>> +    minItems: 1
>>> +    items:
>>> +      - description: optional,cx power domain
>>> +      - description: USB gdsc power domain
>> You need to re-order the above. The optional one needs to be second, not first.
>>
> I wanted to use required-opps for cx domain only. so I have put it first in order.

You can always put a <> for the power-domains for which there are no required-opps

+			power-domain-names = "usb_gdsc", "cx";
+
+			required-opps = <>, <&rpmhpd_opp_nom>;

>>> +  power-domain-names:
>>> +     items:
>>> +      - const: cx
>>> +      - const: usb_gdsc
>> Why do you need the names at all? The ordering of power-domains is
>> well defined and there are no holes in it and there are no legacy
>> reasons for having the names (like there are for clocks), so you
>> should drop. This is much like reg-names and I always point people to
>> this message from Rob Herring about reg-names:
>>
>> https://lore.kernel.org/r/CAL_Jsq+MMunmVWqeW9v2RyzsMKP+=kMzeTHNMG4JDHM7Fy0HBg@mail.gmail.com/
>>
>> You'll have to change your driver to use dev_pm_domain_attach_by_id()
>> but that should be fine.
>>
>> -Doug
> 
> Ok..I will try using  dev_pm_domain_attach_by_id()
> 
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
