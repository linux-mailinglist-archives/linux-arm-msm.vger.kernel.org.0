Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845ED24225C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 00:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgHKWJw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 18:09:52 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:26331 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726179AbgHKWJv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 18:09:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597183791; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8nVYNeSoMlj/0DZnpTkkfpxc5/vnT3kxypEjr4vqN8U=;
 b=KXq+Knhniob2+PtGiVySMsjxiz8XLkgV35ao0vOXF2RAPuJSYVIOCSRcjWpbTRtXzJs4v89y
 /yLpj790wmxAI1K9ppovkDO34T+/7s4Whb8jbIF8BYCFHXOJdb6NjNCiffJ8hnQSHkBp5yTF
 7qIuQ3kz6dcL6A12alNVD6GfPGI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f331729ba4c2cd367d667e6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 Aug 2020 22:09:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D10C1C4339C; Tue, 11 Aug 2020 22:09:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E81ABC433C6;
        Tue, 11 Aug 2020 22:09:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 11 Aug 2020 15:09:43 -0700
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>, khsieh@codeaurora.org,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Vara Reddy <varar@codeaurora.org>, aravindh@codeaurora.org,
        freedreno <freedreno@lists.freedesktop.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v9 3/5] drm/msm/dp: add support for DP PLL
 driver
In-Reply-To: <7222ceca-9fe2-f91b-4129-5a70952875f7@infradead.org>
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-4-tanmay@codeaurora.org>
 <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
 <CAF6AEGv5Yf1x7aCEauP7XtzTjpUCxJt6_GzxFhFXyf_DX_Gi+g@mail.gmail.com>
 <159683184187.1360974.15575847254880429529@swboyd.mtv.corp.google.com>
 <75acac5a-b4a5-9c5a-4404-fb936d738e46@infradead.org>
 <639438051c1b2fe1d9bec5f6343a6dec@codeaurora.org>
 <7222ceca-9fe2-f91b-4129-5a70952875f7@infradead.org>
Message-ID: <9624e970765dc0739793612c2a5c53bc@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-11 13:21, Randy Dunlap wrote:
> On 8/11/20 12:49 PM, tanmay@codeaurora.org wrote:
>> On 2020-08-07 13:28, Randy Dunlap wrote:
>>> On 8/7/20 1:24 PM, Stephen Boyd wrote:
>>>> Quoting Rob Clark (2020-08-07 08:51:48)
>>>>> On Fri, Aug 7, 2020 at 8:27 AM Randy Dunlap <rdunlap@infradead.org>
>>>>> wrote:
>>>>>> 
>>>>>> On 8/7/20 12:17 AM, Tanmay Shah wrote:
>>>>>>> diff --git a/drivers/gpu/drm/msm/Kconfig 
>>>>>>> b/drivers/gpu/drm/msm/Kconfig
>>>>>>> index ea3c4d094d09..cc1392b29022 100644
>>>>>>> --- a/drivers/gpu/drm/msm/Kconfig
>>>>>>> +++ b/drivers/gpu/drm/msm/Kconfig
>>>>>>> @@ -60,6 +60,7 @@ config DRM_MSM_HDMI_HDCP
>>>>>>>  config DRM_MSM_DP
>>>>>>>       bool "Enable DP support in MSM DRM driver"
>>>>>>>       depends on DRM_MSM
>>>>>>> +     default y
>>>>>>>       help
>>>>>>>         Compile in support for DP driver in msm drm driver. DP 
>>>>>>> external
>>>>>>>         display support is enabled through this config option. It 
>>>>>>> can
>>>>>> 
>>>>>> Hi,
>>>>>> 
>>>>>> You need a very strong justification to make an optional part of a
>>>>>> driver
>>>>>> to be "default y".
>>>>> 
>>>>> My opinion is that if the driver is built, everything should be 
>>>>> built.
>>>>> This is what makes sense for distro's.  It is only the embedded 
>>>>> case
>>>>> where you want to trim down unneeded features where you might want 
>>>>> to
>>>>> disable some parts.  So 'default y' makes sense to me.
>>> 
>>> We don't set defaults for distro convenience.
>>> 
>>>> 
>>>> Maybe use 'default DRM_MSM' so that it doesn't trigger the 'default 
>>>> y'
>>>> filters people have?
>>> 
>>> Most people can figure that one out.  ;)
>>> I don't have any automated filters.
>> 
>> After after further reviews, I agree with Rob. Display Port is 
>> required module as of now so it makes sense to keep 'default y'.
> 
> If it is required, then you don't need to have a Kconfig entry/symbol 
> for it.

Kconfig makes driver flexible. Other moudles in the driver are also 
'default y' such as DSI. I will let Rob guide us further on this as he 
is the maintainer.
