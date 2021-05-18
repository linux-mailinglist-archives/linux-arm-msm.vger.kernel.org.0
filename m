Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585C9387D89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 18:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243080AbhERQcf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 12:32:35 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:49383 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344233AbhERQcf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 12:32:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621355477; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Og8vpZqeLAdSl93O6NbyuGWY01inTUHJlOZ8Qy7/qaA=;
 b=csL0q9rg88Q8Rml8oTflscAgojF/uwOWzvAo6z0T4fozYAJVAry6CY9asxyQokokaSR8xmye
 IFgv8iEkSy7e/SgYpmMvhVS65P4Ywv9MTMqfzsAKjOFWtquJwBRoTNzysMWGGDZtm1f2GZZm
 hvShBAvI24MhUNuoJXEwoXlD+DI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60a3ebb91449805ea2688de0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 May 2021 16:30:49
 GMT
Sender: gubbaven=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C29CAC43460; Tue, 18 May 2021 16:30:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gubbaven)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E564C4338A;
        Tue, 18 May 2021 16:30:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 18 May 2021 22:00:42 +0530
From:   gubbaven@codeaurora.org
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Rob Herring <robh@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        Bluetooth Kernel Mailing List 
        <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>, hbandi@codeaurora.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Subject: Re: [PATCH v3 4/5] dt-bindings: net: bluetooth: Convert Qualcomm BT
 binding to DT schema
In-Reply-To: <C6C73C77-669D-4552-AC0B-74BAA3FF583F@holtmann.org>
References: <1620322392-27148-1-git-send-email-gubbaven@codeaurora.org>
 <1620322392-27148-5-git-send-email-gubbaven@codeaurora.org>
 <20210507011753.GB1126886@robh.at.kernel.org>
 <C81968AD-1C0B-4764-9631-FF227D026ED7@holtmann.org>
 <CAL_JsqKy-wyrG8hvg2yTBdB44BgPa11hcTPwKTD-WgVykvpLaw@mail.gmail.com>
 <C6C73C77-669D-4552-AC0B-74BAA3FF583F@holtmann.org>
Message-ID: <8ba855ff3f1e285a87b651ed4b98a702@codeaurora.org>
X-Sender: gubbaven@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marcel and Rob,

On 2021-05-13 20:51, Marcel Holtmann wrote:
> Hi Rob,
> 
>>>>> Converted Qualcomm Bluetooth binidings to DT schema.
>>>>> 
>>>>> Signed-off-by: Venkata Lakshmi Narayana Gubba 
>>>>> <gubbaven@codeaurora.org>
>>>>> ---
>>>>> .../devicetree/bindings/net/qualcomm-bluetooth.txt |  69 
>>>>> -------------
>>>>> .../bindings/net/qualcomm-bluetooth.yaml           | 111 
>>>>> +++++++++++++++++++++
>>>>> 2 files changed, 111 insertions(+), 69 deletions(-)
>>>>> delete mode 100644 
>>>>> Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>>>>> create mode 100644 
>>>>> Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
>>>> 
>>>> 
>>>>> diff --git 
>>>>> a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml 
>>>>> b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
>>>>> new file mode 100644
>>>>> index 0000000..3f3ec4d
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
>>>>> @@ -0,0 +1,111 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Qualcomm Bluetooth Chips
>>>>> +
>>>>> +maintainers:
>>>>> +  - Marcel Holtmann <marcel@holtmann.org>
>>>> 
>>>> This should be someone who cares about Qcom BT.
>>> 
>>> yes, please, assign this to someone that knows the hardware.
>>> 
>>> Rob, can we leave this out for now if there is no dedicated person?
>> 
>> No, it's required. It can be me if it comes to that. However, if no
>> one can be bothered to step up, then we should just remove it perhaps.
>> QCom is a big company, I'm sure they can find some name.
> 
> I hope so as well since my name is clearly the wrong one there. I have
> too little knowledge about that hardware and the platforms it is used
> in.
> 
[Venkata]:
I will update maintainers names in next patchset.
> Regards
> 
> Marcel

Regards,
Venkata.
