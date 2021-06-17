Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 815733AB6EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 17:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbhFQPLc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 11:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233081AbhFQPLb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 11:11:31 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7A0C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 08:09:23 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id if15so1830826qvb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 08:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uJTGcAdupVs9Ugv04FHACXamoJzkCvHB9LUInm949rQ=;
        b=0kwTwa8f3hL8cWbkSabeU4ie2c9poFkRbJwAggFGl/9viq04wZmf6V6XbbKd1TiAnN
         jCXYwWonNLnHSk4ogPtzJpv/SkyQOz9+jlMxA0jXywR3iIFgFUTH+dvFrnDJkQnSZJcB
         6WnI5/68gIlAVUn/yb4Dih1Nsp9TIuYps08ChmTbRaAuXAknAaLXwVeSl6zQXPc3lXgj
         ksQTS8LFPtiSlkkEb6rHbt7q1V8obRSc6xpK6B55Ma0BMqvqakvbu9B7Gq/7fSKZvIun
         KMbI5DWSAyKE5FDiAeI7NttzZCF6KjWOgp7X3zeCgz7HsDUorQ3YkXnXjdho/4uGL/3x
         oc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uJTGcAdupVs9Ugv04FHACXamoJzkCvHB9LUInm949rQ=;
        b=cHKxGKAFEEBr/AvGbpNNbylJ+4Qnw9xgl7xaarHGOKhOHHYsMxvDR5wXMhZNb9fN03
         +ahp8JS9d9qEdajH8JbMWJPNU7nbszRU8Iuf0WRyE/mC7B5/roHHAXI08Wg67+qgSg7U
         crrXqXQRrY8407DmqKXCRSnVGCt76xJH6xpev2bYlX6OycvRz30GCDLW2GR0amrjvA5S
         2D4ASAO8zFM85A37lwTnMZxl40ZM2pD+7keVVY1CWZzv2YD/+StimiTJPydAr1bRdR8v
         2aEMKF7aruowJuuJPUhRNxKVTpriImAnFR3QELB0icAu8aOD28yKGWRJrsEazTJ+AliF
         6ymg==
X-Gm-Message-State: AOAM53061vJzzM/+i8YMiE8ys+FYOVW3VHx73UagOCJpKItNicIQvfhr
        FWaowXjjgWaN1T/mllMLpxh72A==
X-Google-Smtp-Source: ABdhPJwJejmVo9lW9I1PL6mSnmsN3+f7RnHD762sdEeQaHmkPGliIyoIwmCfZe6dH6xvZmtgm3QnOQ==
X-Received: by 2002:ad4:4772:: with SMTP id d18mr342093qvx.35.1623942562870;
        Thu, 17 Jun 2021 08:09:22 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id h17sm3297933qtk.23.2021.06.17.08.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 08:09:21 -0700 (PDT)
Subject: Re: [v1 1/3] dt-bindings: msm/dsi: Add yaml schema for 7nm DSI PHY
To:     rajeevny@codeaurora.org, Rob Herring <robh@kernel.org>,
        robh+dt@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sean@poorly.run, robdclark@gmail.com,
        abhinavk@codeaurora.org, kalyan_t@codeaurora.org,
        mkrishn@codeaurora.org
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
 <1622468035-8453-2-git-send-email-rajeevny@codeaurora.org>
 <20210601205848.GA1025498@robh.at.kernel.org>
 <ec1bcb4e734b784ab17c4fc558a5fab9@codeaurora.org>
 <27dec6f881a3b8bd5e13ba32990f975b@codeaurora.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <a453734a-ab1f-bf35-9272-0b94c713f05b@marek.ca>
Date:   Thu, 17 Jun 2021 11:07:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <27dec6f881a3b8bd5e13ba32990f975b@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/16/21 1:50 AM, rajeevny@codeaurora.org wrote:
> On 03-06-2021 01:32, rajeevny@codeaurora.org wrote:
>> On 02-06-2021 02:28, Rob Herring wrote:
>>> On Mon, May 31, 2021 at 07:03:53PM +0530, Rajeev Nandan wrote:
>>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - const: qcom,dsi-phy-7nm
>>>
>>> When would one use this?
>> This is for SM8250.
>>
>>>
>>>> +      - const: qcom,dsi-phy-7nm-7280
>>>> +      - const: qcom,dsi-phy-7nm-8150
>>>
>>> These don't look like full SoC names (sm8150?) and it's
>>> <vendor>,<soc>-<block>.
>>
>> Thanks, Rob, for the review.
>>
>> I just took the `compatible` property currently used in the DSI PHY 
>> driver
>> (drivers/gpu/drm/msm/dsi/phy/dsi_phy.c), and added a new entry for 
>> sc7280.
>> A similar pattern of `compatible` names are used in other variants of the
>> DSI PHY driver e.g. qcom,qcom,dsi-phy-10nm-8998, qcom,dsi-phy-14nm-660 
>> etc.
>>
>> The existing compatible names "qcom,dsi-phy-7nm-8150" (SoC at the end) 
>> make
>> some sense, if we look at the organization of the dsi phy driver code.
>> I am new to this and don't know the reason behind the current code
>> organization and this naming.
>>
>> Yes, I agree with you, we should use full SoC names. Adding
>> the SoC name at the end does not feel very convincing, so I will 
>> change this
>> to the suggested format e.g. "qcom,sm8250-dsi-phy-7nm", and will 
>> rename the
>> occurrences in the driver and device tree accordingly.
>> Do I need to make changes for 10nm, 14nm, 20nm, and 28nm DSI PHY too?
>> Bindings doc for these PHYs recently got merged to msm-next [1]
>>
>>
>> [1]
>> https://gitlab.freedesktop.org/drm/msm/-/commit/8fc939e72ff80116c090aaf03952253a124d2a8e 
>>
>>
> 
> Hi Rob,
> 
> I missed adding "robh+dt@kernel.org" earlier in this thread.
> 
> Please check my response to your review comments. Regarding your 
> suggestion to use <vendor>,<soc>-<block> format for compatible property, 
> should I also upload a new patch to make changes in 10nm, 14nm, 20nm, 
> and 28nm DSI PHY DT bindings?
> 
> Thanks,
> Rajeev
> 

Hi,

I missed this and ended up sending a similar patch a week later (as part 
of my cphy series, because I needed it to add a "phy-type" property).

"qcom,dsi-phy-7nm" and "qcom,dsi-phy-7nm-8150" aren't new compatibles, 
they were previously documented in the .txt bindings, which are getting 
removed, but the new .yaml bindings didn't include them. Documenting 
them is just a fixup to that patch [1] which is already R-B'd by RobH 
(and has similar compatibles such as "qcom,dsi-phy-10nm" and 
"qcom,dsi-phy-10nm-8998
").

You can use a different/better naming scheme for sc7280, but changing 
the others has nothing to do with adding support for sc7280.

[1] 
https://gitlab.freedesktop.org/drm/msm/-/commit/8fc939e72ff80116c090aaf03952253a124d2a8e 




