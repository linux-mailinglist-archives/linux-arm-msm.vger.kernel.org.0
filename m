Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBD053AC8F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 12:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhFRKlb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 06:41:31 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:25161 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233003AbhFRKla (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 06:41:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624012761; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4fG1y8WDPrYtBMq9UfTcY0OGD8AEXRPSN4vcguMIVpM=;
 b=A7b1PmaHz7eQvJp1AfqtW641FCFaWk1ts8xhg92Z/7WfxZXs2oDUGL3e2x8fNPLxAXre5id/
 HJ0scxK5Kat3D3xX5sv4H/rG3MoM32YUAuNS4ixyCjglqijX7Kb1jCW/zgaiR6nAX9BGSmD7
 W8pukQQMYfpBGJLh8IaRHOPwRAo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60cc77d751f29e6bae2a4a6f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Jun 2021 10:39:19
 GMT
Sender: rajeevny=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 04CA2C4338A; Fri, 18 Jun 2021 10:39:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajeevny)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4116CC433D3;
        Fri, 18 Jun 2021 10:39:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 18 Jun 2021 16:09:17 +0530
From:   rajeevny@codeaurora.org
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Rob Herring <robh@kernel.org>, robh+dt@kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sean@poorly.run, robdclark@gmail.com,
        abhinavk@codeaurora.org, kalyan_t@codeaurora.org,
        mkrishn@codeaurora.org
Subject: Re: [v1 1/3] dt-bindings: msm/dsi: Add yaml schema for 7nm DSI PHY
In-Reply-To: <a453734a-ab1f-bf35-9272-0b94c713f05b@marek.ca>
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
 <1622468035-8453-2-git-send-email-rajeevny@codeaurora.org>
 <20210601205848.GA1025498@robh.at.kernel.org>
 <ec1bcb4e734b784ab17c4fc558a5fab9@codeaurora.org>
 <27dec6f881a3b8bd5e13ba32990f975b@codeaurora.org>
 <a453734a-ab1f-bf35-9272-0b94c713f05b@marek.ca>
Message-ID: <a736c5e48907bc2da064f98d94dff9da@codeaurora.org>
X-Sender: rajeevny@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 17-06-2021 20:37, Jonathan Marek wrote:
> On 6/16/21 1:50 AM, rajeevny@codeaurora.org wrote:
>> On 03-06-2021 01:32, rajeevny@codeaurora.org wrote:
>>> On 02-06-2021 02:28, Rob Herring wrote:
>>>> On Mon, May 31, 2021 at 07:03:53PM +0530, Rajeev Nandan wrote:
>>> 
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    oneOf:
>>>>> +      - const: qcom,dsi-phy-7nm
>>>> 
>>>> When would one use this?
>>> This is for SM8250.
>>> 
>>>> 
>>>>> +      - const: qcom,dsi-phy-7nm-7280
>>>>> +      - const: qcom,dsi-phy-7nm-8150
>>>> 
>>>> These don't look like full SoC names (sm8150?) and it's
>>>> <vendor>,<soc>-<block>.
>>> 
>>> Thanks, Rob, for the review.
>>> 
>>> I just took the `compatible` property currently used in the DSI PHY 
>>> driver
>>> (drivers/gpu/drm/msm/dsi/phy/dsi_phy.c), and added a new entry for 
>>> sc7280.
>>> A similar pattern of `compatible` names are used in other variants of 
>>> the
>>> DSI PHY driver e.g. qcom,qcom,dsi-phy-10nm-8998, 
>>> qcom,dsi-phy-14nm-660 etc.
>>> 
>>> The existing compatible names "qcom,dsi-phy-7nm-8150" (SoC at the 
>>> end) make
>>> some sense, if we look at the organization of the dsi phy driver 
>>> code.
>>> I am new to this and don't know the reason behind the current code
>>> organization and this naming.
>>> 
>>> Yes, I agree with you, we should use full SoC names. Adding
>>> the SoC name at the end does not feel very convincing, so I will 
>>> change this
>>> to the suggested format e.g. "qcom,sm8250-dsi-phy-7nm", and will 
>>> rename the
>>> occurrences in the driver and device tree accordingly.
>>> Do I need to make changes for 10nm, 14nm, 20nm, and 28nm DSI PHY too?
>>> Bindings doc for these PHYs recently got merged to msm-next [1]
>>> 
>>> 
>>> [1]
>>> https://gitlab.freedesktop.org/drm/msm/-/commit/8fc939e72ff80116c090aaf03952253a124d2a8e
>> 
>> Hi Rob,
>> 
>> I missed adding "robh+dt@kernel.org" earlier in this thread.
>> 
>> Please check my response to your review comments. Regarding your 
>> suggestion to use <vendor>,<soc>-<block> format for compatible 
>> property, should I also upload a new patch to make changes in 10nm, 
>> 14nm, 20nm, and 28nm DSI PHY DT bindings?
>> 
>> Thanks,
>> Rajeev
>> 
> 
> Hi,
> 
> I missed this and ended up sending a similar patch a week later (as
> part of my cphy series, because I needed it to add a "phy-type"
> property).
> 
> "qcom,dsi-phy-7nm" and "qcom,dsi-phy-7nm-8150" aren't new compatibles,
> they were previously documented in the .txt bindings, which are
> getting removed, but the new .yaml bindings didn't include them.
> Documenting them is just a fixup to that patch [1] which is already
> R-B'd by RobH (and has similar compatibles such as "qcom,dsi-phy-10nm"
> and "qcom,dsi-phy-10nm-8998
> ").
> 
> You can use a different/better naming scheme for sc7280, but changing
> the others has nothing to do with adding support for sc7280.
> 
> [1]
> https://gitlab.freedesktop.org/drm/msm/-/commit/8fc939e72ff80116c090aaf03952253a124d2a8e

Hi Jonathan,

I will discard this patch and will add the bindings for the sc7280 on 
top of your patch [1].

[1] 
https://lore.kernel.org/linux-arm-msm/20210617144349.28448-2-jonathan@marek.ca/


Thanks,
Rajeev
