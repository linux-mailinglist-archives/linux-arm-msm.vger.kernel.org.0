Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA2BB4018B0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 11:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbhIFJRB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 05:17:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14864 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240795AbhIFJQ6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 05:16:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630919753; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Dl9Me7VnLoTQO7YH0kYUePI2o6EfNVuN9BpuqWH1wUc=; b=RtdHrj5eMmgPgjKSat6Ob0PkDHDOa/ipuFkQNkRL9pSwiwADAYKCZXEK9z6M9WOyyKzqR8sk
 BhwJVDgBwSl4N6A/njoMzpLIaiaUHd3xteQo8xIp9uIvW+j9SdGOn/5BQq9JAQadx+LSKc6z
 4QlSgsBoe/VNjFEEXR5gFAmIFZw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6135dc4889cdb62061fa3526 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 06 Sep 2021 09:15:52
 GMT
Sender: sanm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 67FA3C43460; Mon,  6 Sep 2021 09:15:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [49.206.35.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6EF68C4338F;
        Mon,  6 Sep 2021 09:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6EF68C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings
 for dwc3 qcom
To:     Doug Anderson <dianders@chromium.org>
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
From:   Sandeep Maheswaram <sanm@codeaurora.org>
Message-ID: <1dc7aaaa-a8da-565b-664e-64f529a861b1@codeaurora.org>
Date:   Mon, 6 Sep 2021 14:45:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XjRMdB=iHDcMATWDq5CSRGdh1ZBCftjrZvTfMk_Nqgvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/31/2021 1:37 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Aug 30, 2021 at 10:55 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>> Add multi pd bindings to set performance state for cx domain
>> to maintain minimum corner voltage for USB clocks.
>>
>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> index e70afc4..838d9c4 100644
>> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> @@ -41,7 +41,18 @@ properties:
>>
>>     power-domains:
>>       description: specifies a phandle to PM domain provider node
>> -    maxItems: 1
>> +    minItems: 1
>> +    items:
>> +      - description: optional,cx power domain
>> +      - description: USB gdsc power domain
> You need to re-order the above. The optional one needs to be second, not first.
>
I wanted to use required-opps for cx domain only. so I have put it first 
in order.
>> +  power-domain-names:
>> +     items:
>> +      - const: cx
>> +      - const: usb_gdsc
> Why do you need the names at all? The ordering of power-domains is
> well defined and there are no holes in it and there are no legacy
> reasons for having the names (like there are for clocks), so you
> should drop. This is much like reg-names and I always point people to
> this message from Rob Herring about reg-names:
>
> https://lore.kernel.org/r/CAL_Jsq+MMunmVWqeW9v2RyzsMKP+=kMzeTHNMG4JDHM7Fy0HBg@mail.gmail.com/
>
> You'll have to change your driver to use dev_pm_domain_attach_by_id()
> but that should be fine.
>
> -Doug

Ok..I will try using  dev_pm_domain_attach_by_id()


