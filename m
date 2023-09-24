Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D51F37AC786
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Sep 2023 12:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjIXKXY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Sep 2023 06:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjIXKXY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Sep 2023 06:23:24 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0BEB100
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 03:23:17 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99357737980so569532866b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 03:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695550996; x=1696155796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NAyZdodbhEHxyvfq9t25K1kT6NpZjHkp5WFQo3bH0kU=;
        b=dPhvxPsmi2ULOZlaBLixH9C5ikSzaU/Ps9qavWOYUH1nOrgRumElAetfGYhf2rUdLz
         2i+TFGU3lturtc7AN5fd/mt4UzS0iQEL3MIlcAZiLBytiq9rOfzimBsX/pADfsZScgQX
         GCK5xdt1fFlaadXPcWiA4qTQ/ylz/RQxWYIIA5m+INusKDhckz5NMIpLThXDLNVUaGsW
         OSiqi+Mm/9hn8vJiimdzNsWOeN1eWoHLjedPE871biRe9Kiu9CIB0vpt+QJ2RGDDW8Id
         tCmvW3NNsPs7ZF1ijT9Mg5aGN+aeyP6/+vbKLnwQNojULzqefh6HkmNtwbkMU0543mq6
         f8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695550996; x=1696155796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NAyZdodbhEHxyvfq9t25K1kT6NpZjHkp5WFQo3bH0kU=;
        b=Jndxbp0s6xXteq0eLBygHRllOORYRLj/So8w8Um3SW7L+u2tjHKS7vOqe/RuCTG4E8
         E4fIIKClh4+uXQ+Os+DvGVnN8B4QuERcBvmwFrfChp/Y9Bu2KDlFPM5okQVAnUVDPJHU
         nEVxKJBAQa6WhMb0cAxTyOIBEHmNBUVLyLqdMIYjo0OT5bZjyXTxdowr2umX4IFF15w4
         utPDEfoMF4enzZHHoWsZuse3spEs5R8ZkmoGt5ME93OoulMy8tQHW9ssZNP96P4mEyZv
         Cpsh7malGDxdpMqbMivaER2s9LEHCzo7+ItCI07qNf7ZoJ5Ifvj/Nc/lD7UYyjOhXblI
         q6kQ==
X-Gm-Message-State: AOJu0Yz/aZCv0aHVnQFH+xypYte/y+TFrQe6xdZ/WW4VE2zgid0vGEY6
        5JLdyOhrv3EbUSRhByE1oS3TaQ==
X-Google-Smtp-Source: AGHT+IErimtHQwXCllH1LgG+MK0TOlPSL6e6E6XP+QbXRiZkmk5TFH/ytDFtnePyqJJQRL/OxC7FCg==
X-Received: by 2002:a17:907:7636:b0:9ad:99a8:7c53 with SMTP id jy22-20020a170907763600b009ad99a87c53mr3492921ejc.60.1695550996095;
        Sun, 24 Sep 2023 03:23:16 -0700 (PDT)
Received: from [10.73.151.44] ([188.111.42.10])
        by smtp.gmail.com with ESMTPSA id lw13-20020a170906bccd00b0098884f86e41sm4809559ejb.123.2023.09.24.03.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Sep 2023 03:23:15 -0700 (PDT)
Message-ID: <6851b864-447f-453f-8b34-1fbb6e97eefe@linaro.org>
Date:   Sun, 24 Sep 2023 13:23:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Freedreno] [PATCH RFC v6 07/10] drm/atomic: Loosen FB atomic
 checks
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        Pekka Paalanen <ppaalanen@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        sebastian.wick@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        laurent.pinchart@ideasonboard.com, Daniel Vetter <daniel@ffwll.ch>,
        contact@emersion.fr,
        Marijn Suijten <marijn.suijten@somainline.org>,
        wayland-devel@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-7-a820efcce852@quicinc.com>
 <20230829112230.7106a8bf@eldfell>
 <752176d8-23f4-4689-8bf4-db27f153fd39@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <752176d8-23f4-4689-8bf4-db27f153fd39@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/09/2023 20:49, Jessica Zhang wrote:
> 
> 
> On 8/29/2023 1:22 AM, Pekka Paalanen wrote:
>> On Mon, 28 Aug 2023 17:05:13 -0700
>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>>> Loosen the requirements for atomic and legacy commit so that, in cases
>>> where pixel_source != FB, the commit can still go through.
>>>
>>> This includes adding framebuffer NULL checks in other areas to 
>>> account for
>>> FB being NULL when non-FB pixel sources are enabled.
>>>
>>> To disable a plane, the pixel_source must be NONE or the FB must be NULL
>>> if pixel_source == FB.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/drm_atomic.c        | 20 +++++++++++---------
>>>   drivers/gpu/drm/drm_atomic_helper.c | 36 
>>> ++++++++++++++++++++----------------
>>>   include/drm/drm_atomic_helper.h     |  4 ++--
>>>   include/drm/drm_plane.h             | 29 +++++++++++++++++++++++++++++
>>>   4 files changed, 62 insertions(+), 27 deletions(-)
>>
>> ...
>>
>>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>>> index a58f84b6bd5e..4c5b7bcdb25c 100644
>>> --- a/include/drm/drm_plane.h
>>> +++ b/include/drm/drm_plane.h
>>> @@ -992,6 +992,35 @@ static inline struct drm_plane 
>>> *drm_plane_find(struct drm_device *dev,
>>>   #define drm_for_each_plane(plane, dev) \
>>>       list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
>>> +/**
>>> + * drm_plane_solid_fill_enabled - Check if solid fill is enabled on 
>>> plane
>>> + * @state: plane state
>>> + *
>>> + * Returns:
>>> + * Whether the plane has been assigned a solid_fill_blob
>>> + */
>>> +static inline bool drm_plane_solid_fill_enabled(struct 
>>> drm_plane_state *state)
>>> +{
>>> +    if (!state)
>>> +        return false;
>>> +    return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_SOLID_FILL 
>>> && state->solid_fill_blob;
>>> +}
>>> +
>>> +static inline bool drm_plane_has_visible_data(const struct 
>>> drm_plane_state *state)
>>> +{
>>> +    switch (state->pixel_source) {
>>> +    case DRM_PLANE_PIXEL_SOURCE_NONE:
>>> +        return false;
>>> +    case DRM_PLANE_PIXEL_SOURCE_SOLID_FILL:
>>> +        return state->solid_fill_blob != NULL;
>>
>> This reminds me, new UAPI docs did not say what the requirements are for
>> choosing solid fill pixel source. Is the atomic commit rejected if
>> pixel source is solid fill, but solid_fill property has no blob?
> 
> Hi Pekka,
> 
> Yes, if pixel_source is solid_fill and the solid_fill property blob 
> isn't set, the atomic commit should throw an error.
> 
> Will document this in the UAPI.

I don't see a corresponding error check in atomic_check() functions. 
Could you please check that there is one, as you are updating the uAPI.

> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>> This should be doc'd.
>>
>>
>> Thanks,
>> pq
>>
>>> +    case DRM_PLANE_PIXEL_SOURCE_FB:
>>> +    default:
>>> +        WARN_ON(state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB);
>>> +    }
>>> +
>>> +    return state->fb != NULL;
>>> +}
>>> +
>>>   bool drm_any_plane_has_format(struct drm_device *dev,
>>>                     u32 format, u64 modifier);
>>>
>>

-- 
With best wishes
Dmitry

