Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC16C6204A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 01:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbiKHAWz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 19:22:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbiKHAWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 19:22:54 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2CD1183D
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 16:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1667866973; x=1699402973;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FlMHoVGGx96A8CLQzFkB6RKzbHGwQWkSrPqZ7LElMVI=;
  b=dSuJWvIVn2tZjzZiaUIQxPMA1bNwG0dQ6Oquygjgr82pZ6OTpkQbs5Iz
   sT9Uo3vYqxORiQHRqJ4LyXfaAUxMldfd35OgOIkkItu3zAUGSf3V48VUt
   h3QW5oIBKOH0DoOlnY9hHN9GRybUC6VfRHBxtBW8Q2TimO6VelMkpw9Vz
   g=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Nov 2022 16:22:53 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 16:22:52 -0800
Received: from [10.71.111.47] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 7 Nov 2022
 16:22:52 -0800
Message-ID: <c196f010-34e7-4c1c-4ca6-852a4c32b154@quicinc.com>
Date:   Mon, 7 Nov 2022 16:22:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [Freedreno] [RFC PATCH 0/3] Support for Solid Fill Planes
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>
CC:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        <daniel.vetter@ffwll.ch>, <quic_abhinavk@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <swboyd@chromium.org>,
        <seanpaul@chromium.org>, <laurent.pinchart@ideasonboard.com>,
        <linux-arm-msm@vger.kernel.org>, <dmitry.baryshkov@linaro.org>,
        <freedreno@lists.freedesktop.org>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com>
 <5a9167d5-f88d-ed6b-abff-8ae39117feb1@quicinc.com>
 <CAF6AEGtbwsvr5A+mX7BxP95u3RyRiUFzE6dfiZacS96WVBhuvw@mail.gmail.com>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAF6AEGtbwsvr5A+mX7BxP95u3RyRiUFzE6dfiZacS96WVBhuvw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/7/2022 2:09 PM, Rob Clark wrote:
> On Mon, Nov 7, 2022 at 1:32 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>>
>>
>> On 11/7/2022 11:37 AM, Ville Syrjälä wrote:
>>> On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
>>>> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
>>>> properties. When the color fill value is set, and the framebuffer is set
>>>> to NULL, memory fetch will be disabled.
>>>
>>> Thinking a bit more universally I wonder if there should be
>>> some kind of enum property:
>>>
>>> enum plane_pixel_source {
>>>        FB,
>>>        COLOR,
>>>        LIVE_FOO,
>>>        LIVE_BAR,
>>>        ...
>>> }
>>
>> Hi Ville,
>>
>> Makes sense -- this way, we'd also lay some groundwork for cases where
>> drivers want to use other non-FB sources.
>>
>>>
>>>> In addition, loosen the NULL FB checks within the atomic commit callstack
>>>> to allow a NULL FB when color_fill is nonzero and add FB checks in
>>>> methods where the FB was previously assumed to be non-NULL.
>>>>
>>>> Finally, have the DPU driver use drm_plane_state.color_fill and
>>>> drm_plane_state.color_fill_format instead of dpu_plane_state.color_fill,
>>>> and add extra checks in the DPU atomic commit callstack to account for a
>>>> NULL FB in cases where color_fill is set.
>>>>
>>>> Some drivers support hardware that have optimizations for solid fill
>>>> planes. This series aims to expose these capabilities to userspace as
>>>> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
>>>> hardware composer HAL) that can be set by apps like the Android Gears
>>>> app.
>>>>
>>>> Userspace can set the color_fill value by setting COLOR_FILL_FORMAT to a
>>>> DRM format, setting COLOR_FILL to a color fill value, and setting the
>>>> framebuffer to NULL.
>>>
>>> Is there some real reason for the format property? Ie. why not
>>> just do what was the plan for the crttc background color and
>>> specify the color in full 16bpc format and just pick as many
>>> msbs from that as the hw can use?
>>
>> The format property was added because we can't assume that all hardware
>> will support/use the same color format for solid fill planes. Even for
>> just MSM devices, the hardware supports different variations of RGB
>> formats [1].
> 
> Sure, but the driver can convert the format into whatever the hw
> wants.  A 1x1 color conversion is not going to be problematic ;-)

Hi Rob,

Hm... that's also a fair point. Just wondering, is there any advantage 
of having the driver convert the format, other than not having to 
implement an extra format property?

(In case we end up wrapping everything into a prop blob or something)

Thanks,

Jessica Zhang

> 
> BR,
> -R
> 
>> Thanks,
>>
>> Jessica Zhang
>>
>> [1]
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c#L697
>>
>>>
>>>>
>>>> Jessica Zhang (3):
>>>>     drm: Introduce color fill properties for drm plane
>>>>     drm: Adjust atomic checks for solid fill color
>>>>     drm/msm/dpu: Use color_fill property for DPU planes
>>>>
>>>>    drivers/gpu/drm/drm_atomic.c              | 68 ++++++++++++-----------
>>>>    drivers/gpu/drm/drm_atomic_helper.c       | 34 +++++++-----
>>>>    drivers/gpu/drm/drm_atomic_uapi.c         |  8 +++
>>>>    drivers/gpu/drm/drm_blend.c               | 38 +++++++++++++
>>>>    drivers/gpu/drm/drm_plane.c               |  8 +--
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 ++++++++++++++--------
>>>>    include/drm/drm_atomic_helper.h           |  5 +-
>>>>    include/drm/drm_blend.h                   |  2 +
>>>>    include/drm/drm_plane.h                   | 28 ++++++++++
>>>>    10 files changed, 188 insertions(+), 76 deletions(-)
>>>>
>>>> --
>>>> 2.38.0
>>>
>>> --
>>> Ville Syrjälä
>>> Intel
