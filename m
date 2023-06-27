Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BECF573EF8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 02:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjF0AHF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 20:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjF0AHE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 20:07:04 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82728D8
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 17:07:01 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so5251599e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 17:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687824420; x=1690416420;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kl3+pFwKtLJmqLnw6tlFkazZTvLbT9r9SvDA09y7uQk=;
        b=b9+Y1kwItIG6h10RZkptATaQj0HvkqdC2URVOnChDTM9yYHNg01eehqvw/JBlYFN4T
         2QXZJrMwWGSHUtIIgdTpghA/Gsb4s0+v+mEo7WAv+Tb2aYt5F4IRDRXd3JqaEtvkuTE/
         2ONdIcOmNJ7t80gwAYqlnqIfErQCpyBwHHt5f1r0woQqEs7TaulFk23eqGsiuUGcBn6m
         /ZSGbNJ/gH9B+kfPAyYe8Y0UDpnc+lpskvxsnYj1tM95c0AJFuoVWFLjbhN4ePVyVo4N
         7bRfC87WbWqltKNShynkll6MyHT2yg+PyMhCeTndGxsVo6H1u6w5V/AOo3xuME/WDUq7
         zJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687824420; x=1690416420;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kl3+pFwKtLJmqLnw6tlFkazZTvLbT9r9SvDA09y7uQk=;
        b=j2yR+SNaDBxzWZn55QoC082whToSw9baEVtcredOD4Bfa2cPKsuaG99qfpJN3lenJ7
         CasPPeP0cRMM+0/br+KW2fq5ZbS9J/UuPjwnZyrgwJGvVbf4zO3bvX9PEx8smuuyvyPo
         hSfIYz796srtgEPJD+7ux8WioeiXpnuZinar+0iVAcafwFXu3nq+z8YhIK5/owkrt/df
         j/WwO/HkbtgFD+aLMH51u2YYYGah6rjUdf7/fTBZWxsMigh5MjIDjmxGUC2X3N6apjsc
         2A+dYmdSHjFgAGgKGFRL9FJO1wI3wEaTZU+sO1baybzoaD3dI0WWMIbVrWOR/vpghFtC
         4pIQ==
X-Gm-Message-State: AC+VfDyOfh3IxzUOzz8YDhhnVbMQoHR0Kied7rmngso26oLTOWHOWj1g
        nOdh4DRDbrz0SJumX/Xzke0OFjm3Lzrmz17RI24=
X-Google-Smtp-Source: ACHHUZ6DwEr2YqD3bcsN5V1RfYC1fZlGW33REOa6O2+SEKcO+JVyBSFltBNmRe0K3HtvvICgSewWQA==
X-Received: by 2002:a05:6512:54a:b0:4f8:5854:6e70 with SMTP id h10-20020a056512054a00b004f858546e70mr21070052lfl.12.1687824419629;
        Mon, 26 Jun 2023 17:06:59 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p3-20020ac246c3000000b004f59c182f7bsm1293217lfo.249.2023.06.26.17.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 17:06:59 -0700 (PDT)
Message-ID: <d8b1e910-6943-d7b7-5433-71f8b350bfcb@linaro.org>
Date:   Tue, 27 Jun 2023 03:06:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH 0/3] Support for Solid Fill Planes
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
        swboyd@chromium.org, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
        laurent.pinchart@ideasonboard.com,
        wayland-devel@lists.freedesktop.org
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com>
 <d0b5abdc-85ad-fee2-9760-866c32bab111@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d0b5abdc-85ad-fee2-9760-866c32bab111@quicinc.com>
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

On 27/06/2023 02:02, Jessica Zhang wrote:
> 
> 
> On 11/7/2022 11:37 AM, Ville Syrjälä wrote:
>> On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
>>> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
>>> properties. When the color fill value is set, and the framebuffer is set
>>> to NULL, memory fetch will be disabled.
>>
>> Thinking a bit more universally I wonder if there should be
>> some kind of enum property:
>>
>> enum plane_pixel_source {
>>     FB,
>>     COLOR,
>>     LIVE_FOO,
>>     LIVE_BAR,
>>     ...
>> }
> 
> Reviving this thread as this was the initial comment suggesting to 
> implement pixel_source as an enum.
> 
> I think the issue with having pixel_source as an enum is how to decide 
> what counts as a NULL commit.
> 
> Currently, setting the FB to NULL will disable the plane. So I'm 
> guessing we will extend that logic to "if there's no pixel_source set 
> for the plane, then it will be a NULL commit and disable the plane".
> 
> In that case, the question then becomes when to set the pixel_source to 
> NONE. Because if we do that when setting a NULL FB (or NULL solid_fill 
> blob), it then forces userspace to set one property before the other.

Why? The userspace should use atomic commits and as such it should all 
properties at the same time.

> Because of that, I'm thinking of having pixel_source be represented by a 
> bitmask instead. That way, we will simply unset the corresponding 
> pixel_source bit when passing in a NULL FB/solid_fill blob. Then, in 
> order to detect whether a commit is NULL or has a valid pixel source, we 
> can just check if pixel_source == 0.
> 
> Would be interested in any feedback on this.

This is an interesting idea. Frankly speaking, I'd consider it 
counter-intuitive at the first glance.

Consider it to act as a curtain. Setup the curtain (by writing the fill 
colour property). Then one can close the curtain (by switching source to 
colour), or open it (by switching to any other source). Bitmask wouldn't 
complicate this.

> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>>> In addition, loosen the NULL FB checks within the atomic commit 
>>> callstack
>>> to allow a NULL FB when color_fill is nonzero and add FB checks in
>>> methods where the FB was previously assumed to be non-NULL.
>>>
>>> Finally, have the DPU driver use drm_plane_state.color_fill and
>>> drm_plane_state.color_fill_format instead of dpu_plane_state.color_fill,
>>> and add extra checks in the DPU atomic commit callstack to account for a
>>> NULL FB in cases where color_fill is set.
>>>
>>> Some drivers support hardware that have optimizations for solid fill
>>> planes. This series aims to expose these capabilities to userspace as
>>> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
>>> hardware composer HAL) that can be set by apps like the Android Gears
>>> app.
>>>
>>> Userspace can set the color_fill value by setting COLOR_FILL_FORMAT to a
>>> DRM format, setting COLOR_FILL to a color fill value, and setting the
>>> framebuffer to NULL.
>>
>> Is there some real reason for the format property? Ie. why not
>> just do what was the plan for the crttc background color and
>> specify the color in full 16bpc format and just pick as many
>> msbs from that as the hw can use?
>>
>>>
>>> Jessica Zhang (3):
>>>    drm: Introduce color fill properties for drm plane
>>>    drm: Adjust atomic checks for solid fill color
>>>    drm/msm/dpu: Use color_fill property for DPU planes
>>>
>>>   drivers/gpu/drm/drm_atomic.c              | 68 ++++++++++++-----------
>>>   drivers/gpu/drm/drm_atomic_helper.c       | 34 +++++++-----
>>>   drivers/gpu/drm/drm_atomic_uapi.c         |  8 +++
>>>   drivers/gpu/drm/drm_blend.c               | 38 +++++++++++++
>>>   drivers/gpu/drm/drm_plane.c               |  8 +--
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 ++++++++++++++--------
>>>   include/drm/drm_atomic_helper.h           |  5 +-
>>>   include/drm/drm_blend.h                   |  2 +
>>>   include/drm/drm_plane.h                   | 28 ++++++++++
>>>   10 files changed, 188 insertions(+), 76 deletions(-)
>>>
>>> -- 
>>> 2.38.0
>>
>> -- 
>> Ville Syrjälä
>> Intel

-- 
With best wishes
Dmitry

