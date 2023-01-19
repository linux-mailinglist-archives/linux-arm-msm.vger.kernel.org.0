Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF35673EAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 17:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjASQZJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 11:25:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbjASQYr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 11:24:47 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6178A0CB
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 08:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1674145482; x=1705681482;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mvTu+MkrqbFrYom9OnvzEVX8ZpTp3ptK16XH6TGMfjw=;
  b=asdEsF9v3+cIPcTDOfNCNBj95qm5WvMJR0zwFs0/tV4aYKYWw7uoNx7G
   70qoZ6LQ2V3p/t+OE9pLyth9hGMu65LWjMwigPCJ4+MwnNGNiLYuskFIE
   ZGH1U8WoMy7AHhmblJq3W3boH8T9+ZiCGZ16qwH8nRIGIgbl8poA5WFyw
   Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Jan 2023 08:24:42 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 08:24:41 -0800
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 08:24:41 -0800
Message-ID: <c9f67c35-9abb-8d3c-d6d1-e55451c453a1@quicinc.com>
Date:   Thu, 19 Jan 2023 08:24:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v3 1/3] drm: Introduce solid fill property for drm
 plane
Content-Language: en-US
To:     Harry Wentland <harry.wentland@amd.com>,
        <freedreno@lists.freedesktop.org>
CC:     <sebastian.wick@redhat.com>, <ppaalanen@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <quic_abhinavk@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <swboyd@chromium.org>,
        <daniel.vetter@ffwll.ch>, <seanpaul@chromium.org>,
        <laurent.pinchart@ideasonboard.com>, <dmitry.baryshkov@linaro.org>,
        <wayland-devel@lists.freedesktop.org>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <20230104234036.636-2-quic_jesszhan@quicinc.com>
 <c380bb1b-6e65-23c4-6e6b-29ce410b6baa@amd.com>
 <512bf32f-b8d2-91b7-a23c-1905354ff0e9@quicinc.com>
 <e5d0b837-2fd3-7bfa-155b-d80418dc2e79@amd.com>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <e5d0b837-2fd3-7bfa-155b-d80418dc2e79@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/19/2023 7:57 AM, Harry Wentland wrote:
> 
> 
> On 1/18/23 17:53, Jessica Zhang wrote:
>>
>>
>> On 1/18/2023 10:57 AM, Harry Wentland wrote:
>>> On 1/4/23 18:40, Jessica Zhang wrote:
>>>> Add support for solid_fill property to drm_plane. In addition, add
>>>> support for setting and getting the values for solid_fill.
>>>>
>>>> solid_fill holds data for supporting solid fill planes. The property
>>>> accepts an RGB323232 value and the driver data is formatted as such:
>>>>
>>>> struct drm_solid_fill {
>>>>      u32 r;
>>>>      u32 g;
>>>>      u32 b;
>>>> };
>>>
>>> Rather than special-casing this would it make sense to define this
>>> as a single pixel of a FOURCC property?
>>>
>>> I.e., something like this:
>>>
>>> struct drm_solid_fill_info {
>>>      u32 format; /* FOURCC value */
>>>      u64 value; /* FOURCC pixel value */
>>> }
>>>
>>> That removes some ambiguity how the value should be interpreted, i.e.,
>>> it can be interpreted like a single pixel of the specified FOURCC format.
>>>
>>> It might also make sense to let drivers advertise the supported
>>> FOURCC formats for solid_fill planes.
>>
>> Hi Harry,
>>
>> The initial v1 of this RFC had support for taking in a format and such, but it was decided that just supporting RGB323232 would work too.
>>
>> Here's the original thread discussing it [1], but to summarize, the work needed to convert the solid fill color to RGB is trivial (as it's just a single pixel of data). In addition, supporting various formats for solid_fill would add complexity as we'd have to communicate which formats are supported.
>>
>> [1] https://lists.freedesktop.org/archives/dri-devel/2022-November/379148.html
>>
> 
> Make sense, and thanks for summarizing.
> 
> The only comment I would have left then, is that maybe it'd be good to add
> an alpha value. I think it was suggested by someone else as well.

Yep it was mentioned in the v1 discussion, but we came to the conclusion 
that user can set the alpha through the separate alpha plane property.

Thanks,

Jessica Zhang

> 
>>>
>>> Is there an implementation for this in a corresponding canonical
>>> upstream userspace project, to satisfy [1]? If not, what is the plan
>>> for this? If so, please point to the corresponding patches.
>>
>> The use case we're trying to support here is the Android HWC SOLID_FILL hint [1], though it can also be used to address the Wayland single pixel FB protocol [2]. I'm also planning to add an IGT test to show an example of end to end usage.
>>
>> [1] https://android.googlesource.com/platform/hardware/interfaces/+/refs/heads/master/graphics/composer/aidl/android/hardware/graphics/composer3/Composition.aidl#52
>>
>> [2] https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/104
>>
> 
> Makes sense.
> 
> Harry
> 
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>> [1] https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
>>>
>>> Harry
>>>
>>>>
>>>> To enable solid fill planes, userspace must assigned solid_fill to a
>>>> property blob containing the following information:
>>>>
>>>> struct drm_solid_fill_info {
>>>>      u8 version;
>>>>      u32 r, g, b;
>>>> };
>>>>
>>>> Changes in V2:
>>>> - Changed solid_fill property to a property blob (Simon, Dmitry)
>>>> - Added drm_solid_fill struct (Simon)
>>>> - Added drm_solid_fill_info struct (Simon)
>>>>
>>>> Changes in V3:
>>>> - Corrected typo in drm_solid_fill struct documentation
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++
>>>>    drivers/gpu/drm/drm_atomic_uapi.c         | 59 +++++++++++++++++++++++
>>>>    drivers/gpu/drm/drm_blend.c               | 17 +++++++
>>>>    include/drm/drm_blend.h                   |  1 +
>>>>    include/drm/drm_plane.h                   | 43 +++++++++++++++++
>>>>    5 files changed, 129 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
>>>> index dfb57217253b..c96fd1f2ad99 100644
>>>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>>>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>>>> @@ -253,6 +253,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>>>>        plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>>>>        plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>>>>    +    if (plane_state->solid_fill_blob) {
>>>> +        drm_property_blob_put(plane_state->solid_fill_blob);
>>>> +        plane_state->solid_fill_blob = NULL;
>>>> +    }
>>>> +
>>>>        if (plane->color_encoding_property) {
>>>>            if (!drm_object_property_get_default_value(&plane->base,
>>>>                                   plane->color_encoding_property,
>>>> @@ -335,6 +340,9 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
>>>>        if (state->fb)
>>>>            drm_framebuffer_get(state->fb);
>>>>    +    if (state->solid_fill_blob)
>>>> +        drm_property_blob_get(state->solid_fill_blob);
>>>> +
>>>>        state->fence = NULL;
>>>>        state->commit = NULL;
>>>>        state->fb_damage_clips = NULL;
>>>> @@ -384,6 +392,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
>>>>            drm_crtc_commit_put(state->commit);
>>>>          drm_property_blob_put(state->fb_damage_clips);
>>>> +    drm_property_blob_put(state->solid_fill_blob);
>>>>    }
>>>>    EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
>>>>    diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>>>> index c06d0639d552..8a1d2fb7a757 100644
>>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>>>> @@ -316,6 +316,55 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>>>>    }
>>>>    EXPORT_SYMBOL(drm_atomic_set_crtc_for_connector);
>>>>    +static void drm_atomic_convert_solid_fill_info(struct drm_solid_fill *out,
>>>> +        struct drm_solid_fill_info *in)
>>>> +{
>>>> +    out->r = in->r;
>>>> +    out->g = in->g;
>>>> +    out->b = in->b;
>>>> +}
>>>> +
>>>> +static int drm_atomic_set_solid_fill_prop(struct drm_plane_state *state,
>>>> +        struct drm_property_blob *blob)
>>>> +{
>>>> +    int ret = 0;
>>>> +    int blob_version;
>>>> +
>>>> +    if (blob == state->solid_fill_blob)
>>>> +        return 0;
>>>> +
>>>> +    drm_property_blob_put(state->solid_fill_blob);
>>>> +    state->solid_fill_blob = NULL;
>>>> +
>>>> +    memset(&state->solid_fill, 0, sizeof(state->solid_fill));
>>>> +
>>>> +    if (blob) {
>>>> +        if (blob->length != sizeof(struct drm_solid_fill_info)) {
>>>> +            drm_dbg_atomic(state->plane->dev,
>>>> +                    "[PLANE:%d:%s] bad solid fill blob length: %zu\n",
>>>> +                    state->plane->base.id, state->plane->name,
>>>> +                    blob->length);
>>>> +            return -EINVAL;
>>>> +        }
>>>> +
>>>> +        blob_version = ((struct drm_solid_fill_info *)blob->data)->version;
>>>> +
>>>> +        /* Append with more versions if necessary */
>>>> +        if (blob_version == 1) {
>>>> +            drm_atomic_convert_solid_fill_info(&state->solid_fill, blob->data);
>>>> +        } else {
>>>> +            drm_dbg_atomic(state->plane->dev,
>>>> +                    "[PLANE:%d:%s] failed to set solid fill (ret=%d)\n",
>>>> +                    state->plane->base.id, state->plane->name,
>>>> +                    ret);
>>>> +            return -EINVAL;
>>>> +        }
>>>> +        state->solid_fill_blob = drm_property_blob_get(blob);
>>>> +    }
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>>    static void set_out_fence_for_crtc(struct drm_atomic_state *state,
>>>>                       struct drm_crtc *crtc, s32 __user *fence_ptr)
>>>>    {
>>>> @@ -544,6 +593,13 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>>>>            state->src_w = val;
>>>>        } else if (property == config->prop_src_h) {
>>>>            state->src_h = val;
>>>> +    } else if (property == plane->solid_fill_property) {
>>>> +        struct drm_property_blob *solid_fill = drm_property_lookup_blob(dev, val);
>>>> +
>>>> +        ret = drm_atomic_set_solid_fill_prop(state, solid_fill);
>>>> +        drm_property_blob_put(solid_fill);
>>>> +
>>>> +        return ret;
>>>>        } else if (property == plane->alpha_property) {
>>>>            state->alpha = val;
>>>>        } else if (property == plane->blend_mode_property) {
>>>> @@ -616,6 +672,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>>>>            *val = state->src_w;
>>>>        } else if (property == config->prop_src_h) {
>>>>            *val = state->src_h;
>>>> +    } else if (property == plane->solid_fill_property) {
>>>> +        *val = state->solid_fill_blob ?
>>>> +            state->solid_fill_blob->base.id : 0;
>>>>        } else if (property == plane->alpha_property) {
>>>>            *val = state->alpha;
>>>>        } else if (property == plane->blend_mode_property) {
>>>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
>>>> index b4c8cab7158c..17ab645c8309 100644
>>>> --- a/drivers/gpu/drm/drm_blend.c
>>>> +++ b/drivers/gpu/drm/drm_blend.c
>>>> @@ -616,3 +616,20 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>>>        return 0;
>>>>    }
>>>>    EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
>>>> +
>>>> +int drm_plane_create_solid_fill_property(struct drm_plane *plane)
>>>> +{
>>>> +    struct drm_property *prop;
>>>> +
>>>> +    prop = drm_property_create(plane->dev,
>>>> +            DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
>>>> +            "solid_fill", 0);
>>>> +    if (!prop)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    drm_object_attach_property(&plane->base, prop, 0);
>>>> +    plane->solid_fill_property = prop;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
>>>> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
>>>> index 88bdfec3bd88..0338a860b9c8 100644
>>>> --- a/include/drm/drm_blend.h
>>>> +++ b/include/drm/drm_blend.h
>>>> @@ -58,4 +58,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>>>>                      struct drm_atomic_state *state);
>>>>    int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>>>                         unsigned int supported_modes);
>>>> +int drm_plane_create_solid_fill_property(struct drm_plane *plane);
>>>>    #endif
>>>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>>>> index 447e664e49d5..3b9da06f358b 100644
>>>> --- a/include/drm/drm_plane.h
>>>> +++ b/include/drm/drm_plane.h
>>>> @@ -40,6 +40,25 @@ enum drm_scaling_filter {
>>>>        DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
>>>>    };
>>>>    +/**
>>>> + * struct drm_solid_fill_info - User info for solid fill planes
>>>> + */
>>>> +struct drm_solid_fill_info {
>>>> +    __u8 version;
>>>> +    __u32 r, g, b;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct solid_fill_property - RGB values for solid fill plane
>>>> + *
>>>> + * Note: This is the V1 for this feature
>>>> + */
>>>> +struct drm_solid_fill {
>>>> +    uint32_t r;
>>>> +    uint32_t g;
>>>> +    uint32_t b;
>>>> +};
>>>> +
>>>>    /**
>>>>     * struct drm_plane_state - mutable plane state
>>>>     *
>>>> @@ -116,6 +135,23 @@ struct drm_plane_state {
>>>>        /** @src_h: height of visible portion of plane (in 16.16) */
>>>>        uint32_t src_h, src_w;
>>>>    +    /**
>>>> +     * @solid_fill_blob:
>>>> +     *
>>>> +     * Blob containing relevant information for a solid fill plane
>>>> +     * including pixel format and data. See
>>>> +     * drm_plane_create_solid_fill_property() for more details.
>>>> +     */
>>>> +    struct drm_property_blob *solid_fill_blob;
>>>> +
>>>> +    /**
>>>> +     * @solid_fill:
>>>> +     *
>>>> +     * Pixel data for solid fill planes. See
>>>> +     * drm_plane_create_solid_fill_property() for more details.
>>>> +     */
>>>> +    struct drm_solid_fill solid_fill;
>>>> +
>>>>        /**
>>>>         * @alpha:
>>>>         * Opacity of the plane with 0 as completely transparent and 0xffff as
>>>> @@ -699,6 +735,13 @@ struct drm_plane {
>>>>         */
>>>>        struct drm_plane_state *state;
>>>>    +    /*
>>>> +     * @solid_fill_property:
>>>> +     * Optional solid_fill property for this plane. See
>>>> +     * drm_plane_create_solid_fill_property().
>>>> +     */
>>>> +    struct drm_property *solid_fill_property;
>>>> +
>>>>        /**
>>>>         * @alpha_property:
>>>>         * Optional alpha property for this plane. See
>>>
> 
