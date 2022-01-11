Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656EE48BB47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jan 2022 00:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbiAKXM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jan 2022 18:12:57 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:21246 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233265AbiAKXM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jan 2022 18:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1641942777; x=1673478777;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=O80s66nOpB/k6B4TPTZcxyn7QvmmJWT7wRfqjQprV3M=;
  b=BBqJRudiCQYSLaS18Fn9Yw847cLxIyldbRVG5fUJRqfdbVFdss+dsyrq
   98UUzik0dFkTdteJfUuRlZtGUhN/QCu397L9ro2kbIeRyFjP0mL13VFqK
   QYw3Uyc/yZ7J8gMzi/Sp+MG3iu5idPlQRy8rt3B5v7xQ5LlZIqO6hkPPM
   s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 11 Jan 2022 15:12:56 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 15:12:56 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 11 Jan 2022 15:12:55 -0800
Received: from [10.110.25.55] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 11 Jan
 2022 15:12:55 -0800
Message-ID: <7ce0750b-2e0a-1036-f156-3cc8212e6099@quicinc.com>
Date:   Tue, 11 Jan 2022 15:12:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 2/7] drm/msm/dp: support attaching bridges to the DP
 encoder
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
 <20220107020132.587811-3-dmitry.baryshkov@linaro.org>
 <CAE-0n51XaV1+rh4CZKz7gMZBPkpq+wHcbNbgHFxoC1ikoDLkhQ@mail.gmail.com>
 <a97cec56-5a8d-2b92-2850-af2a6d3fbf09@linaro.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <a97cec56-5a8d-2b92-2850-af2a6d3fbf09@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 1/6/2022 9:26 PM, Dmitry Baryshkov wrote:
> On 07/01/2022 06:42, Stephen Boyd wrote:
>> Quoting Dmitry Baryshkov (2022-01-06 18:01:27)
>>> Currently DP driver will allocate panel bridge for eDP panels.
>>> Simplify this code to just check if there is any next bridge in the
>>> chain (be it a panel bridge or regular bridge). Rename panel_bridge
>>> field to next_bridge accordingly.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>>>   drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>>>   drivers/gpu/drm/msm/dp/dp_drm.c     |  4 ++--
>>>   drivers/gpu/drm/msm/dp/dp_parser.c  | 26 ++++++++------------------
>>>   drivers/gpu/drm/msm/dp/dp_parser.h  |  2 +-
>>>   5 files changed, 13 insertions(+), 23 deletions(-)
>>
>> I like this one, it certainly makes it easier to understand.
>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c 
>>> b/drivers/gpu/drm/msm/dp/dp_parser.c
>>> index a7acc23f742b..5de21f3d0812 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
>>> @@ -307,11 +299,9 @@ static int dp_parser_parse(struct dp_parser 
>>> *parser, int connector_type)
>>>          if (rc)
>>>                  return rc;
>>>
>>> -       if (connector_type == DRM_MODE_CONNECTOR_eDP) {
>>
>> It feels like this is on purpose, but I don't see any comment so I have
>> no idea. I think qcom folks are concerned about changing how not eDP
>> works. I'll have to test it out locally.
>
> Ah, another thing that should go into the commit message.
>
> Current situation:
> - DP: no external bridges supported.
> - eDP: only a drm_panel wrapped into the panel bridge
>
> After this patch:
> - both DP and eDP support any chain of bridges attached.
>
>
> While the change means nothing for the DP (IIUC, it will not have any 
> bridges), it simplifies the code path, lowering the amount of checks.
>
> And for eDP this means that we can attach any eDP-to-something bridges 
> (e.g. NXP PTN3460).
>
>
> Well... After re-checking the source code for 
> devm_drm_of_get_bridge/drm_of_find_panel_or_bridge I should probably 
> revert removal of the check. The function will return -ENODEV if 
> neither bridge nor panel are specified.
>
I am new to drm and  confusing with bridge here.

Isn't bridge used to bridging two different kind of interface together?

for example, dsi <--> bridge <--> dp.

why edp need bridge here?

Can you give me more info regrading what bridge try to do here.



>>
>>> -               rc = dp_parser_find_panel(parser);
>>> -               if (rc)
>>> -                       return rc;
>>> -       }
>>> +       rc = dp_parser_find_next_bridge(parser);
>>> +       if (rc)
>>> +               return rc;
>>>
>>>          /* Map the corresponding regulator information according to
>>>           * version. Currently, since we only have one supported 
>>> platform,
>
>
