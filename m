Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9C1A740657
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 00:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjF0WAG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 18:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbjF0V7s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 17:59:48 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC87B2977
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 14:59:33 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so1879469e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 14:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687903172; x=1690495172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yByiezXxcyHW4qkhlUlEjU08tvm9rolFDrdL0O06s20=;
        b=qBRCvznOUJbRU+IcNu6M2BZ6qHrWDNkWj4HtmpKyjVzgo7R/APonDjV0jdvQaxTNQQ
         LbwXFAksCGG27cdysEvis/RhCl0hwjGW0cy7/SyF1uc6rxe75SGYTuNrCfJtM0aoCTsw
         YoOaNJzrtvoadPixXZsvQONKpJ+Hye0Jc/10sw+kFow8GFPfv3IZchJXS3jR5RIRhQgF
         m6FFobC5JpC5o3yjgVxOQuzySv6R5uUqq/0AUe5o/YvvnAuHO7XipaY1CNq+L2kra+1n
         nkG2kkgnWcs1RgxZE1WXSTf3SK/F9KTV0yYuVsjrjh9pvwh7/a0NxipOQB/f6iULycIH
         CUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687903172; x=1690495172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yByiezXxcyHW4qkhlUlEjU08tvm9rolFDrdL0O06s20=;
        b=VZMD001GfaeNfTSkaCOoSPIGbTqOvKrz3PvcxaoPfwTzRiqd2L9hitoTKyIA4pcjM0
         QMA7itqjhjeoa2342f/IceyiqUlCCcKai4OdCmGwI6wlPxRx4TXH/wkaA1heiCVf15Wh
         OISvqkvaEld5PIKsZaNhYFnaWZbhT8pW8Wp9SUVVXiFUu427AYWV22+CNS2MjOO95Hbi
         jcjLVo2abgyCNc+0/Nu0j9HnXvWsca9VmkWYsCC+JyOCZu9iWrDO+IONz+nZxA7vM+LK
         2ZWdS8nCz67H+sBMGG0Xi1/uFeYnZQEGDvq14wzmCTE2a8bu3zFfM29ZvPyfuv5vTULE
         lTkQ==
X-Gm-Message-State: AC+VfDxhFXHkFh1RlTkvoBD9VMV8nEG1RoEfCTZDI01qYOusbAqYbmaZ
        T2UEJ+dXk8jDcHkqWuWhSu5I6g==
X-Google-Smtp-Source: ACHHUZ4908rxmdnYHHSeX4dMNn61Y5/yq2vw9R90sTy3DvsnC7cLF3sJFUdkqVnpFK7ECc+cdDx2Tw==
X-Received: by 2002:a05:6512:402a:b0:4fb:7c40:9f95 with SMTP id br42-20020a056512402a00b004fb7c409f95mr3704463lfb.47.1687903171816;
        Tue, 27 Jun 2023 14:59:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l11-20020ac2554b000000b004fad5602c18sm1391694lfk.73.2023.06.27.14.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 14:59:31 -0700 (PDT)
Message-ID: <54f194fe-ab7b-247d-600b-6da8f5c57dbf@linaro.org>
Date:   Wed, 28 Jun 2023 00:59:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH 0/3] Support for Solid Fill Planes
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        Pekka Paalanen <ppaalanen@gmail.com>
Cc:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        daniel.vetter@ffwll.ch, quic_abhinavk@quicinc.com,
        dri-devel@lists.freedesktop.org, swboyd@chromium.org,
        seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
        linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com>
 <d0b5abdc-85ad-fee2-9760-866c32bab111@quicinc.com>
 <20230627105849.004050b3@eldfell>
 <5e60fe99-76d5-c242-608e-b74bf6f0e7bd@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5e60fe99-76d5-c242-608e-b74bf6f0e7bd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/06/2023 00:27, Jessica Zhang wrote:
> 
> 
> On 6/27/2023 12:58 AM, Pekka Paalanen wrote:
>> On Mon, 26 Jun 2023 16:02:50 -0700
>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>>> On 11/7/2022 11:37 AM, Ville Syrjälä wrote:
>>>> On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
>>>>> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
>>>>> properties. When the color fill value is set, and the framebuffer 
>>>>> is set
>>>>> to NULL, memory fetch will be disabled.
>>>>
>>>> Thinking a bit more universally I wonder if there should be
>>>> some kind of enum property:
>>>>
>>>> enum plane_pixel_source {
>>>>     FB,
>>>>     COLOR,
>>>>     LIVE_FOO,
>>>>     LIVE_BAR,
>>>>     ...
>>>> }
>>>
>>> Reviving this thread as this was the initial comment suggesting to
>>> implement pixel_source as an enum.
>>>
>>> I think the issue with having pixel_source as an enum is how to decide
>>> what counts as a NULL commit.
>>>
>>> Currently, setting the FB to NULL will disable the plane. So I'm
>>> guessing we will extend that logic to "if there's no pixel_source set
>>> for the plane, then it will be a NULL commit and disable the plane".
>>>
>>> In that case, the question then becomes when to set the pixel_source to
>>> NONE. Because if we do that when setting a NULL FB (or NULL solid_fill
>>> blob), it then forces userspace to set one property before the other.
>>
>> Right, that won't work.
>>
>> There is no ordering between each property being set inside a single
>> atomic commit. They can all be applied to kernel-internal state
>> theoretically simultaneously, or any arbitrary random order, and the
>> end result must always be the same. Hence, setting one property cannot
>> change the state of another mutable property. I believe that doing
>> otherwise would make userspace fragile and hard to get right.
>>
>> I guess there might be an exception to that rule when the same property
>> is set multiple times in a single atomic commit; the last setting in
>> the array prevails. That's universal and not a special-case between two
>> specific properties.
>>
>>> Because of that, I'm thinking of having pixel_source be represented by a
>>> bitmask instead. That way, we will simply unset the corresponding
>>> pixel_source bit when passing in a NULL FB/solid_fill blob. Then, in
>>> order to detect whether a commit is NULL or has a valid pixel source, we
>>> can just check if pixel_source == 0.
>>
>> Sounds fine to me at first hand, but isn't there the enum property that
>> says if the kernel must look at solid_fill blob *or* FB_ID?
>>
>> If enum prop says "use solid_fill prop", the why would changes to FB_ID
>> do anything? Is it for backwards-compatibility with KMS clients that do
>> not know about the enum prop?
>>
>> It seems like that kind of backwards-compatiblity will cause problems
>> in trying to reason about the atomic state, as explained above, leading
>> to very delicate and fragile conditions where things work intuitively.
>> Hence, I'm not sure backwards-compatibility is wanted. This won't be
>> the first or the last KMS property where an unexpected value left over
>> will make old atomic KMS clients silently malfunction up to showing no
>> recognisable picture at all. *If* that problem needs solving, there
>> have been ideas floating around about resetting everything to nice
>> values so that userspace can ignore what it does not understand. So far
>> there has been no real interest in solving that problem in the kernel
>> though.
>>
>> Legacy non-atomic UAPI wrappers can do whatever they want, and program
>> any (new) properties they want in order to implement the legacy
>> expectations, so that does not seem to be a problem.
> 
> Hi Pekka and Dmitry,
> 
> After reading through both of your comments, I think I have a better 
> understanding of the pixel_source implementation now.
> 
> So to summarize, we want to expose another property called 
> "pixel_source" to userspace that will default to FB (as to not break 
> legacy userspace).
> 
> If userspace wants to use solid fill planes, it will set both the 
> solid_fill *and* pixel_source properties to a valid blob and COLOR 
> respectively. If it wants to use FB, it will set FB_ID and pixel_source 
> to a valid FB and FB.
> 
> Here's a table illustrating what I've described above:
> 
> +-----------------+-------------------------+-------------------------+
> | Use Case        | Legacy Userspace        | solid_fill-aware        |
> |                 |                         | Userspace               |
> +=================+=========================+=========================+
> | Valid FB        | pixel_source = FB       | pixel_source = FB       |
> |                 | FB_ID = valid FB        | FB_ID = valid FB        |
> +-----------------+-------------------------+-------------------------+
> | Valid           | pixel_source = COLOR    | N/A                     |
> | solid_fill blob | solid_fill = valid blob |                         |

Probably these two cells were swapped.

> +-----------------+-------------------------+-------------------------+
> | NULL commit     | pixel_source = FB       | pixel_source = FB       |
> |                 | FB_ID = NULL            | FB_ID = NULL            |
> +-----------------+-------------------------+-------------------------+

                                               | or:
                                               | pixel_source = COLOR
                                               | solid_fill = NULL
> 
> Is there anything I'm missing or needs to be clarified?
> 

LGTM otherwise

> Thanks,
> 
> Jessica Zhang
> 
>>
>>
>> Thanks,
>> pq
>>
>>
>>>
>>> Would be interested in any feedback on this.
>>>
>>> Thanks,
>>>
>>> Jessica Zhang
>>>
>>>>> In addition, loosen the NULL FB checks within the atomic commit 
>>>>> callstack
>>>>> to allow a NULL FB when color_fill is nonzero and add FB checks in
>>>>> methods where the FB was previously assumed to be non-NULL.
>>>>>
>>>>> Finally, have the DPU driver use drm_plane_state.color_fill and
>>>>> drm_plane_state.color_fill_format instead of 
>>>>> dpu_plane_state.color_fill,
>>>>> and add extra checks in the DPU atomic commit callstack to account 
>>>>> for a
>>>>> NULL FB in cases where color_fill is set.
>>>>>
>>>>> Some drivers support hardware that have optimizations for solid fill
>>>>> planes. This series aims to expose these capabilities to userspace as
>>>>> some compositors have a solid fill flag (ex. SOLID_COLOR in the 
>>>>> Android
>>>>> hardware composer HAL) that can be set by apps like the Android Gears
>>>>> app.
>>>>>
>>>>> Userspace can set the color_fill value by setting COLOR_FILL_FORMAT 
>>>>> to a
>>>>> DRM format, setting COLOR_FILL to a color fill value, and setting the
>>>>> framebuffer to NULL.
>>>>
>>>> Is there some real reason for the format property? Ie. why not
>>>> just do what was the plan for the crttc background color and
>>>> specify the color in full 16bpc format and just pick as many
>>>> msbs from that as the hw can use?
>>>>>
>>>>> Jessica Zhang (3):
>>>>>     drm: Introduce color fill properties for drm plane
>>>>>     drm: Adjust atomic checks for solid fill color
>>>>>     drm/msm/dpu: Use color_fill property for DPU planes
>>>>>
>>>>>    drivers/gpu/drm/drm_atomic.c              | 68 
>>>>> ++++++++++++-----------
>>>>>    drivers/gpu/drm/drm_atomic_helper.c       | 34 +++++++-----
>>>>>    drivers/gpu/drm/drm_atomic_uapi.c         |  8 +++
>>>>>    drivers/gpu/drm/drm_blend.c               | 38 +++++++++++++
>>>>>    drivers/gpu/drm/drm_plane.c               |  8 +--
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 
>>>>> ++++++++++++++--------
>>>>>    include/drm/drm_atomic_helper.h           |  5 +-
>>>>>    include/drm/drm_blend.h                   |  2 +
>>>>>    include/drm/drm_plane.h                   | 28 ++++++++++
>>>>>    10 files changed, 188 insertions(+), 76 deletions(-)
>>>>>
>>>>> -- 
>>>>> 2.38.0
>>>>
>>>> -- 
>>>> Ville Syrjälä
>>>> Intel
>>

-- 
With best wishes
Dmitry

