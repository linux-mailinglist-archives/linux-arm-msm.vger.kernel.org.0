Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7CFA614226
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Nov 2022 01:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiKAAL3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 20:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiKAAL2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 20:11:28 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA6911461
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 17:11:27 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g7so21617415lfv.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 17:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P3LTqyqWBzv9fHqykWjiyJGMtYcyNpMWAEys/K3hCq0=;
        b=KQ110xzIMaSBzdl3iczzohlj69Uo0zFtp6ZEUvdNDjiUx/rqHMFTzoAXPdqamV639E
         oqWu87j8mjEG/sK68kLL783rwUa60vPPrjkSQ95YpzR1cHt4qOX0fdQj7Pa9USgZfhPC
         3AAcE/llBlAr56liuzqvqCVvnPEle0mzmXEDuK9NyhfKllo2osjnQcDtxB0Ww0+dE0mF
         A0gHDpBy1ZJ1y1WqyVy/eq0Z64yoBrEJU82ta+gycTEcM87mRGdSeow77omAJaw8Vq2K
         p0PeR51EP6pHQrNIHev7iM7Dg29T2hwYi9qJf2FoVXaVWv08HZfpHIOrfOIxLNwu5OGo
         W+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P3LTqyqWBzv9fHqykWjiyJGMtYcyNpMWAEys/K3hCq0=;
        b=UH+dn5YGm5r1UEh5K0Xe0oFs/Xi4yKRAJWv2LFJWYd7ZLL0/d07yHXcWzwaCC8xqmO
         Pv9d4JHyCZ5nLccd4yuqeOfWw3nV7M3ebph+3MeRvnklrBasYafdiP/J+PhoFWTbNlbw
         0JnpcM7+Be4ocYia6usBNQD4+PY7V5v5H/0miekpHuHfPX2iggMK+COvYcUMzlMk9znb
         Zj53oMCAgSpQOPqyqPB0BvPgimnH+LSlBZMsaNX9PtcroZqfd5B2Ir1ERVvkDXkgLCM4
         tTnyQMaqMA9cJCT8dh1GAEZdt5VoxpANU3LLOS/ZR/iEJjwzOIG0H1AgWlQot7018Xzm
         UQDA==
X-Gm-Message-State: ACrzQf2u0dhgYjRdeOIEStaRaKi6x7iUlFk8gFsktVgArj9bPZupPHAk
        xfj/kFTIf2uFdS05PQ4cXPDUaA==
X-Google-Smtp-Source: AMsMyM5BfD7kDwlJj4fH4FJ8IGvRlMoyczOlVTrPbmiN/Q5azkfZmQttcPiPQ7i6BvW78HLgJx3Edg==
X-Received: by 2002:a05:6512:39d6:b0:4b0:f505:919b with SMTP id k22-20020a05651239d600b004b0f505919bmr13857lfu.306.1667261485523;
        Mon, 31 Oct 2022 17:11:25 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v12-20020ac258ec000000b004a619367dd9sm1481904lfo.66.2022.10.31.17.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 17:11:25 -0700 (PDT)
Message-ID: <33ed79bf-3a05-0ae9-b3ef-d38608ff5c63@linaro.org>
Date:   Tue, 1 Nov 2022 03:11:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm
 plane
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, contact@emersion.fr,
        daniel.vetter@ffwll.ch, laurent.pinchart@ideasonboard.com
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <712a9a25-4c38-9da5-b1a6-39e4665b4d31@linaro.org>
 <b890681d-9c40-32c6-061a-668dce01d89d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b890681d-9c40-32c6-061a-668dce01d89d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 01/11/2022 01:24, Jessica Zhang wrote:
> 
> 
> On 10/29/2022 5:08 AM, Dmitry Baryshkov wrote:
>> On 29/10/2022 01:59, Jessica Zhang wrote:
>>> Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
>>> drm_plane. In addition, add support for setting and getting the values
>>> of these properties.
>>>
>>> COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
>>> represents the format of the color fill. Userspace can set enable solid
>>> fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
>>> the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
>>> framebuffer to NULL.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com> >
>> Planes report supported formats using the drm_mode_getplane(). You'd 
>> also need to tell userspace, which formats are supported for color 
>> fill. I don't think one supports e.g. YV12.
> 
> Hey Dmitry,
> 
> Good point. Forgot to add this in the patch [3/3] commit message, but 
> FWIW MSM DPU devices only support the RGB format variants [1].
> 
> [1] 
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c#L697

Ack. So you'd need to tell this to userspace.

> 
>>
>> A bit of generic comment for the discussion (this is an RFC anyway). 
>> Using color_fill/color_fill_format properties sounds simple, but this 
>> might be not generic enough. Limiting color_fill to 32 bits would 
>> prevent anybody from using floating point formats (e.g. 
>> DRM_FORMAT_XRGB16161616F, 64-bit value). Yes, this can be solved with 
>> e.g. using 64-bit for the color_fill value, but then this doesn't 
>> sound extensible too much.
> 
> Hm... I can definitely change color_fill to use u64 instead. As for 
> making it more extensible, do you have any suggestions?

No. Not u64. It is a blob. Basically because when designing API you can 
not guarantee that all fill values would fit into u64. Also see below.

> 
>>
>> So, a question for other hardware maintainers. Do we have hardware 
>> that supports such 'color filled' planes? Do we want to support format 
>> modifiers for filling color/data? Because what I have in mind is 
>> closer to the blob structure, which can then be used for filling the 
>> plane:
>>
>> struct color_fill_blob {
>>      u32 pixel_format;
>>      u64 modifiers4];
>>      u32 pixel_data_size; // fixme: is this necessary?
>>      u8 pixel_data[];
>> };
> 
> Just a question about this blob struct -- what is the purpose of 
> pixel_data?
> 
> At least for devices using the DPU driver, the only data needed to 
> enable solid fill is color_fill and color_fill_format. I'd also be 
> interested in knowing if there are other drivers support a similar 
> feature and what is needed for them.

Yes. You are thinking from the DPU point of view. ARGB only. However as 
we are adding generic API, we should not limit ourselves to it. Other 
deivces might support other formats of fill data. For example using 
YUY2/UYVY for filling the plane. And such YUV data is not a colour 
anymore. It is a pixel data, just as I named it.

Another hardware might support some fill patterns. Or e.g. passing a 
compressed texels/macrotiles. So, pixel data. Note, I've added format 
modifiers. Maybe `u64 modifiers[4]` is an overkill, as we have just a 
single data plane. Maybe just `u64 modifier` would be enough.

> 
>>
>> And then... This sounds a lot like a custom framebuffer.
>>
>> So, maybe what should we do instead is to add new 
>> DRM_MODE_FB_COLOR_FILL flag to the framebuffers, which would e.g. mean 
>> that the FB gets stamped all over the plane. This would also save us 
>> from changing if (!fb) checks all over the drm core.
> 
> JFYI we did originally consider using a custom 1x1 FB to for color fill 
> [1], but decided to go with a plane property instead. IIRC the 
> conclusion was that having color fill as a plane property is a cleaner 
> solution.
> 
> As for creating a new blob struct to hold all color fill info, I'm open 
> to implementing that over having 2 separate properties.
> 
> [1] https://oftc.irclog.whitequark.org/dri-devel/2022-09-23#31409842

Let me cite the conclusion form the IRC chat: `22:20 <robclark> 
abhinav__: kinda.. the proposal was that userspace creates a blob 
property with the solid fill color, and then attaches the blob-prop id 
to the plane's FB_ID`.

It's not a pair of properties. It is a blob, because it is not that 
limited as the pair of range properties is.

I will reread the log later, but just my 2c. Attaching the blob property 
as the FB_ID might confuse userspace. I'd be slightly biased to being 
more conservative here. However as the final proposal was to attach the 
blob ID, let's do it this way.

> 
>>
>> Another approach might be using a format modifier instead of the FB flag.
> I like the idea of having a format modifier denoting if the driver 
> supports color_fill for that specific format. This would allow userspace 
> to know which formats are supported by solid fill planes.

Yes, exactly. It would come in a natural way.

[Rumbling: and then it's natural to have the fill data in FB. Dull mode 
off.]

-- 
With best wishes
Dmitry

