Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579A723F0E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 18:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgHGQVl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 12:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgHGQVl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 12:21:41 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED584C061756;
        Fri,  7 Aug 2020 09:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=S8JHbHVUKOnsDJ6vyDw0HBSI86uZiFi5itw14Bq3gQU=; b=jOD2ZI+n0+FgJNGycqX64zKdGD
        4/o/iIp+buCL8ZsTq/dYT8ZX74PeRaHP6hBP81XbZUifMux8OnSCQfaQVrm39N5NQrK6yZwlMxBCg
        NVr0dwLLvZmb5NBI4j+0nMIPLKe5ZCSs/8iOWOj/HqN3ssOP9EimnDK0TI6TxKJJ4izGK92drhUF2
        Ym5tlRsy9nNUxy56Zhg3vFijErdRX9ObeRw2KSOEZYdBMTg9JMugJXgmnnQ6SiCc5Jp6Feb8ICndg
        JaTSsg2+dw7MzWTiI1Zivi2/El06E6dbX9ZiDkbTp7C4DYk6/MUYyYgJs2gWzqUjB+NuCqc5E5p5i
        +7tqXNDw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k457g-0002hE-0j; Fri, 07 Aug 2020 16:21:36 +0000
Subject: Re: [PATCH v9 2/5] drm/msm/dp: add displayPort driver support
To:     Guenter Roeck <groeck@google.com>
Cc:     Tanmay Shah <tanmay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        freedreno@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, aravindh@codeaurora.org,
        abhinavk@codeaurora.org, khsieh@codeaurora.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-3-tanmay@codeaurora.org>
 <b0e8415f-53e6-575d-5774-5f4f7adca982@infradead.org>
 <CABXOdTf6be2-O_aBakamNFswt+Xk0urJ7_x9hgwuuFO6=NDeew@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ab0a3659-b4c4-e7a9-f010-9ace4dae84a7@infradead.org>
Date:   Fri, 7 Aug 2020 09:21:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CABXOdTf6be2-O_aBakamNFswt+Xk0urJ7_x9hgwuuFO6=NDeew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/7/20 9:09 AM, Guenter Roeck wrote:
> On Fri, Aug 7, 2020 at 8:37 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 8/7/20 12:17 AM, Tanmay Shah wrote:
>>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>>> index 6deaa7d01654..ea3c4d094d09 100644
>>> --- a/drivers/gpu/drm/msm/Kconfig
>>> +++ b/drivers/gpu/drm/msm/Kconfig
>>> @@ -57,6 +57,14 @@ config DRM_MSM_HDMI_HDCP
>>>       help
>>>         Choose this option to enable HDCP state machine
>>>
>>> +config DRM_MSM_DP
>>> +     bool "Enable DP support in MSM DRM driver"
>>
>>         bool "Enabled DisplayPort support in MSM DRM driver"
>>
> Why "Enabled" ? This would be quite unusual for a Kconfig entry.

Sorry, my typo.
Just "Enable", like it was earlier.

> Guenter
> 
>>> +     depends on DRM_MSM
>>> +     help
>>> +       Compile in support for DP driver in msm drm driver. DP external
>>
>>                                               MSM DRM
>>
>> Also:
>> I can't find anywhere in drivers/gpu/drm/msm/ that explains what MSM means.
>> What does it mean?
>>
>>> +       display support is enabled through this config option. It can
>>> +       be primary or secondary display on device.
>>> +
>>>  config DRM_MSM_DSI
>>>       bool "Enable DSI support in MSM DRM driver"
>>>       depends on DRM_MSM


-- 
~Randy

