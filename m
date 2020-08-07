Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBBE23F3C5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 22:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgHGU2u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 16:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgHGU2u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 16:28:50 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0120EC061756;
        Fri,  7 Aug 2020 13:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=xRUD55pKuLg6gojA/cds2ffAUN36ReNagtqRG0GQuOQ=; b=eMECZogztFAvPBcu91JBf/wLGM
        k1ceU0vlipiSyF/G/oMzLceUJUkmnts30fR0q2pmDv82h1fK80oSlFWBy8h78KX7AiVirD+JYaJxy
        tXpFbNVVNfKY4cuNjqdQBKxlNJ5k7EfvRwx5DrJOSYcQB1lY0LQsWjpTvI0R9nyB2LyNsR6CeJe8R
        zGc5QI7AEsgMCNtqPdk4LZ28D+nZnjXA+qImpWBbKE1C1AMO6wG5mShWIw8NjQJvFKBbkygQBr/Qh
        HrP6IkmCYd6dCSvDooYUEj2SzoS3QhuYD4ld+Mzq8LJd2BKL1LvTwVvph76zE+uCdeKXqjNqslrtl
        iOfpdiUw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k48yo-0004Yn-VD; Fri, 07 Aug 2020 20:28:43 +0000
Subject: Re: [PATCH v9 3/5] drm/msm/dp: add support for DP PLL driver
To:     Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>
Cc:     Tanmay Shah <tanmay@codeaurora.org>,
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
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-4-tanmay@codeaurora.org>
 <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
 <CAF6AEGv5Yf1x7aCEauP7XtzTjpUCxJt6_GzxFhFXyf_DX_Gi+g@mail.gmail.com>
 <159683184187.1360974.15575847254880429529@swboyd.mtv.corp.google.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <75acac5a-b4a5-9c5a-4404-fb936d738e46@infradead.org>
Date:   Fri, 7 Aug 2020 13:28:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159683184187.1360974.15575847254880429529@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/7/20 1:24 PM, Stephen Boyd wrote:
> Quoting Rob Clark (2020-08-07 08:51:48)
>> On Fri, Aug 7, 2020 at 8:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> On 8/7/20 12:17 AM, Tanmay Shah wrote:
>>>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>>>> index ea3c4d094d09..cc1392b29022 100644
>>>> --- a/drivers/gpu/drm/msm/Kconfig
>>>> +++ b/drivers/gpu/drm/msm/Kconfig
>>>> @@ -60,6 +60,7 @@ config DRM_MSM_HDMI_HDCP
>>>>  config DRM_MSM_DP
>>>>       bool "Enable DP support in MSM DRM driver"
>>>>       depends on DRM_MSM
>>>> +     default y
>>>>       help
>>>>         Compile in support for DP driver in msm drm driver. DP external
>>>>         display support is enabled through this config option. It can
>>>
>>> Hi,
>>>
>>> You need a very strong justification to make an optional part of a driver
>>> to be "default y".
>>
>> My opinion is that if the driver is built, everything should be built.
>> This is what makes sense for distro's.  It is only the embedded case
>> where you want to trim down unneeded features where you might want to
>> disable some parts.  So 'default y' makes sense to me.

We don't set defaults for distro convenience.

> 
> Maybe use 'default DRM_MSM' so that it doesn't trigger the 'default y'
> filters people have?

Most people can figure that one out.  ;)
I don't have any automated filters.

-- 
~Randy

