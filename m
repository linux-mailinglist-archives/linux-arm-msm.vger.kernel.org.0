Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D81242089
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 21:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgHKTtE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 15:49:04 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55961 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726164AbgHKTtE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 15:49:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597175344; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JjTim0gb+1hEs7u9Q27jb9eJJjx9k1/9OYuzAM5+4TM=;
 b=X/J9wGSOPA0ty28YYGMRwYKINwjzTeZTWfGeCjJ13qH5kAeW50SYOmVNOGIuK/75KDb6Wkdz
 XFOZPPe4GPjk4lh11boAtViMcVPj7zhwMUBAvN4eer0cZqBU+T6c4QCSW4y9r3PsH5LpDUFc
 +GvgbjreV/NN9OQAIrtJrUoCcJA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f32f62fcbcd42bdee6d2e58 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 Aug 2020 19:49:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DA6F7C433AD; Tue, 11 Aug 2020 19:49:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8F82BC433C9;
        Tue, 11 Aug 2020 19:49:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 11 Aug 2020 12:49:00 -0700
From:   tanmay@codeaurora.org
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, aravindh@codeaurora.org,
        Abhinav Kumar <abhinavk@codeaurora.org>, khsieh@codeaurora.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
Subject: Re: [PATCH v9 3/5] drm/msm/dp: add support for DP PLL driver
In-Reply-To: <75acac5a-b4a5-9c5a-4404-fb936d738e46@infradead.org>
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-4-tanmay@codeaurora.org>
 <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
 <CAF6AEGv5Yf1x7aCEauP7XtzTjpUCxJt6_GzxFhFXyf_DX_Gi+g@mail.gmail.com>
 <159683184187.1360974.15575847254880429529@swboyd.mtv.corp.google.com>
 <75acac5a-b4a5-9c5a-4404-fb936d738e46@infradead.org>
Message-ID: <639438051c1b2fe1d9bec5f6343a6dec@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-07 13:28, Randy Dunlap wrote:
> On 8/7/20 1:24 PM, Stephen Boyd wrote:
>> Quoting Rob Clark (2020-08-07 08:51:48)
>>> On Fri, Aug 7, 2020 at 8:27 AM Randy Dunlap <rdunlap@infradead.org>
>>> wrote:
>>>> 
>>>> On 8/7/20 12:17 AM, Tanmay Shah wrote:
>>>>> diff --git a/drivers/gpu/drm/msm/Kconfig 
>>>>> b/drivers/gpu/drm/msm/Kconfig
>>>>> index ea3c4d094d09..cc1392b29022 100644
>>>>> --- a/drivers/gpu/drm/msm/Kconfig
>>>>> +++ b/drivers/gpu/drm/msm/Kconfig
>>>>> @@ -60,6 +60,7 @@ config DRM_MSM_HDMI_HDCP
>>>>>  config DRM_MSM_DP
>>>>>       bool "Enable DP support in MSM DRM driver"
>>>>>       depends on DRM_MSM
>>>>> +     default y
>>>>>       help
>>>>>         Compile in support for DP driver in msm drm driver. DP 
>>>>> external
>>>>>         display support is enabled through this config option. It 
>>>>> can
>>>> 
>>>> Hi,
>>>> 
>>>> You need a very strong justification to make an optional part of a
>>>> driver
>>>> to be "default y".
>>> 
>>> My opinion is that if the driver is built, everything should be 
>>> built.
>>> This is what makes sense for distro's.  It is only the embedded case
>>> where you want to trim down unneeded features where you might want to
>>> disable some parts.  So 'default y' makes sense to me.
> 
> We don't set defaults for distro convenience.
> 
>> 
>> Maybe use 'default DRM_MSM' so that it doesn't trigger the 'default y'
>> filters people have?
> 
> Most people can figure that one out.  ;)
> I don't have any automated filters.

After after further reviews, I agree with Rob. Display Port is required 
module as of now so it makes sense to keep 'default y'.

