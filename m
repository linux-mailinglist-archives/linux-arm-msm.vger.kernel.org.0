Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00495660748
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 20:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjAFTo1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 14:44:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjAFTo0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 14:44:26 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738856B1B3
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 11:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1673034265; x=1704570265;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CCrQGS+VdK6pdfSjZdxoBvR9kopNa4Ms3wMREu5mEVo=;
  b=BqZg0CX1Tg3r2JUuZK2IneLL30DVvhythvERS+le8xg8AZ2P6gIYpM/O
   Wise8uXkfV/Gr9GYdTarRvDuJr80Dktusf+K6mMkOXsA6TfqADRC2B3lA
   9XF+XGcMKBlgjMtbnjNu1JmFNZWLWvgJHFPFms+1lE8ESnpym6ZWjYEHU
   s=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 06 Jan 2023 11:44:25 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 11:44:24 -0800
Received: from [10.110.20.194] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 11:44:23 -0800
Message-ID: <5ddc0a33-114c-5fd5-78c0-2ead90accebc@quicinc.com>
Date:   Fri, 6 Jan 2023 11:44:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Daniel Vetter <daniel@ffwll.ch>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_abhinavk@quicinc.com>,
        <contact@emersion.fr>, <daniel.vetter@ffwll.ch>,
        <laurent.pinchart@ideasonboard.com>, <ppaalanen@gmail.com>,
        <sebastian.wick@redhat.com>, <wayland-devel@lists.freedesktop.org>,
        <ville.syrjala@linux.intel.com>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
 <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/5/2023 7:43 PM, Dmitry Baryshkov wrote:
> On Fri, 6 Jan 2023 at 02:38, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>>
>>
>> On 1/5/2023 3:33 AM, Daniel Vetter wrote:
>>> On Wed, Jan 04, 2023 at 03:40:33PM -0800, Jessica Zhang wrote:
>>>> Introduce and add support for a solid_fill property. When the solid_fill
>>>> property is set, and the framebuffer is set to NULL, memory fetch will be
>>>> disabled.
>>>>
>>>> In addition, loosen the NULL FB checks within the atomic commit callstack
>>>> to allow a NULL FB when the solid_fill property is set and add FB checks
>>>> in methods where the FB was previously assumed to be non-NULL.
>>>>
>>>> Finally, have the DPU driver use drm_plane_state.solid_fill and instead of
>>>> dpu_plane_state.color_fill, and add extra checks in the DPU atomic commit
>>>> callstack to account for a NULL FB in cases where solid_fill is set.
>>>>
>>>> Some drivers support hardware that have optimizations for solid fill
>>>> planes. This series aims to expose these capabilities to userspace as
>>>> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
>>>> hardware composer HAL) that can be set by apps like the Android Gears
>>>> app.
>>>>
>>>> Userspace can set the solid_fill property to a blob containing the
>>>> appropriate version number and solid fill color (in RGB323232 format) and
>>>> setting the framebuffer to NULL.
>>>>
>>>> Note: Currently, there's only one version of the solid_fill blob property.
>>>> However if other drivers want to support a similar feature, but require
>>>> more than just the solid fill color, they can extend this feature by
>>>> creating additional versions of the drm_solid_fill struct.
>>>>
>>>> Changes in V2:
>>>> - Dropped SOLID_FILL_FORMAT property (Simon)
>>>> - Switched to implementing solid_fill property as a blob (Simon, Dmitry)
>>>> - Changed to checks for if solid_fill_blob is set (Dmitry)
>>>> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
>>>>     (Dmitry)
>>>> - Removed DPU_PLANE_COLOR_FILL_FLAG
>>>> - Fixed whitespace and indentation issues (Dmitry)
>>>
>>> Now that this is a blob, I do wonder again whether it's not cleaner to set
>>> the blob as the FB pointer. Or create some kind other kind of special data
>>> source objects (because solid fill is by far not the only such thing).
>>>
>>> We'd still end up in special cases like when userspace that doesn't
>>> understand solid fill tries to read out such a framebuffer, but these
>>> cases already exist anyway for lack of priviledges.
>>>
>>> So I still think that feels like the more consistent way to integrate this
>>> feature. Which doesn't mean it has to happen like that, but the
>>> patches/cover letter should at least explain why we don't do it like this.
>>
>> Hi Daniel,
>>
>> IIRC we were facing some issues with this check [1] when trying to set
>> FB to a PROP_BLOB instead. Which is why we went with making it a
>> separate property instead. Will mention this in the cover letter.
> 
> What kind of issues? Could you please describe them?

Hi Dmitry,

PROP_BLOB is defined as a legacy type here [1], but FB_ID is a 
PROP_OBJECT which is defined as an extended type [2]. So, setting a 
property blob as the FB would fail drm_property_flags_valid() due to 
this check [3].

[1] 
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/include/uapi/drm/drm_mode.h#L523

[2] 
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/include/uapi/drm/drm_mode.h#L534

[3] 
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_property.c#L71

Thanks,

Jessica Zhang

> 
>>
>> [1]
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_property.c#L71
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>> -Daniel
>>>
>>>>
>>>> Changes in V3:
>>>> - Fixed some logic errors in atomic checks (Dmitry)
>>>> - Introduced drm_plane_has_visible_data() and drm_atomic_check_fb() helper
>>>>     methods (Dmitry)
>>>>
>>>> Jessica Zhang (3):
>>>>     drm: Introduce solid fill property for drm plane
>>>>     drm: Adjust atomic checks for solid fill color
>>>>     drm/msm/dpu: Use color_fill property for DPU planes
>>>>
>>>>    drivers/gpu/drm/drm_atomic.c              | 136 +++++++++++++---------
>>>>    drivers/gpu/drm/drm_atomic_helper.c       |  34 +++---
>>>>    drivers/gpu/drm/drm_atomic_state_helper.c |   9 ++
>>>>    drivers/gpu/drm/drm_atomic_uapi.c         |  59 ++++++++++
>>>>    drivers/gpu/drm/drm_blend.c               |  17 +++
>>>>    drivers/gpu/drm/drm_plane.c               |   8 +-
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   9 +-
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c |  65 +++++++----
>>>>    include/drm/drm_atomic_helper.h           |   5 +-
>>>>    include/drm/drm_blend.h                   |   1 +
>>>>    include/drm/drm_plane.h                   |  62 ++++++++++
>>>>    11 files changed, 302 insertions(+), 103 deletions(-)
>>>>
>>>> --
>>>> 2.38.1
>>>>
>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> http://blog.ffwll.ch
> 
> 
> 
> -- 
> With best wishes
> Dmitry
