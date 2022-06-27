Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF4B55DE90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239408AbiF0VX3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 17:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238349AbiF0VX2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 17:23:28 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D5362F8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 14:23:27 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id bn8so12545059ljb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 14:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/wLPUoy2pPh5k2BqmFFOQy1JZHLjbPr706Aorr9RkCg=;
        b=ZUvtm84o5Xus6asD33Qz20UyzTK82ynVsnvqIECW2CLfDOWIdFwz79aOYCZXfn4si6
         Ofx2gMQcJPnuq13TzHmlG/CsnjPBslYItdIM8B0NCxiVYI/McIWlZ/Z4kayA6HQsKLeB
         5vKcA303I1x4QKCPydiaj6cA8XvkldMirOnaXWAtn9kLhvi4j18Axjt6/DyHxfKQcaJZ
         buSdq3CqcUBWJ3u/+gtBVjy/j4ImB39eVf3tBIDT/C8K62t7Q0TjU6uO16f0WycK4wel
         bZFFHCrcY614cmIRdsq7OjLtWc7vk5gMY4k1F7KGqXyKbketsU3epjWnW8+0V8KURHRA
         5R0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/wLPUoy2pPh5k2BqmFFOQy1JZHLjbPr706Aorr9RkCg=;
        b=tu0+0BJh+zOHGh/wiBGQm9HOH32GXQFsNh9GjnbXsvYrgfHtjn/kwCx4qQJABnJ7AC
         JwNi+fzILJrncqr41tYot84zM+P47HHYr0apZILpxpT2XoS7TnjvnFYngU3UfNrLkULm
         T9Jy+GhSEKhTe58GGQifotU1md+01zMQJAzIoy7YVhU0jLsnNHD4BgZZqvMEGlEh/OiW
         /G98pkUe9xQRPfVpwuPJihTXoKk22bsSpYCXAOvtGCpsillBKP36+Qpm52RWgY7hmN+K
         2RXD+ErVrePxvsx2YirxZFboXnrARS30DudM9D5Gvpwmgak1ifv02wCNmLwDsG7LZsYL
         ETDA==
X-Gm-Message-State: AJIora+RC7+Mw90zbWREztrNXvkDVJKobsada4stm+K+th27ahEU/mVG
        kIS6xVH62GPNSnDVpoVW74nVUA==
X-Google-Smtp-Source: AGRyM1sopHDGUg40Tmfjl6TKQ3fPR8QMuGTPk5+XM5+KH9vn2PFRQl0J662G84sETgPQUtNaQIRYbA==
X-Received: by 2002:a05:651c:a04:b0:25b:bc07:8884 with SMTP id k4-20020a05651c0a0400b0025bbc078884mr4939922ljq.39.1656365005631;
        Mon, 27 Jun 2022 14:23:25 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q10-20020a056512210a00b0047da5e98e66sm1946927lfr.1.2022.06.27.14.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 14:23:24 -0700 (PDT)
Message-ID: <84819c2b-54b5-218e-6d42-bdd8a5fe9103@linaro.org>
Date:   Tue, 28 Jun 2022 00:23:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/msm/dp: use ARRAY_SIZE for calculating num_descs
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
 <9f82dd3f-5ecc-4e1d-6cce-0749b8316d49@quicinc.com>
 <CAA8EJprR23ugdi926BDtGOGdGEqvWBgOQfekyJjD_OFE3yx0Aw@mail.gmail.com>
 <9e7c1015-80e6-308d-7910-95d27df174b4@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9e7c1015-80e6-308d-7910-95d27df174b4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/06/2022 00:01, Kuogee Hsieh wrote:
> 
> On 6/27/2022 1:05 PM, Dmitry Baryshkov wrote:
>> On Mon, 27 Jun 2022 at 22:26, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>> wrote:
>>>
>>> On 6/27/2022 9:54 AM, Dmitry Baryshkov wrote:
>>>> If for some reason the msm_dp_config::descs array starts from non-zero
>>>> index or contains the hole, setting the msm_dp_config::num_descs might
>>>> be not that obvious and error-prone. Use ARRAY_SIZE to set this field
>>>> rather than encoding the value manually.
>>>>
>>>> Reported-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 46 
>>>> +++++++++++++++++------------
>>>>    1 file changed, 27 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index f87fa3ba1e25..6fed738a9467 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -131,35 +131,43 @@ struct msm_dp_config {
>>>>        size_t num_descs;
>>>>    };
>>>>
>>>> +static const struct msm_dp_desc sc7180_dp_descs[] = {
>>>> +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>> +};
>>>> +
>>>>    static const struct msm_dp_config sc7180_dp_cfg = {
>>>> -     .descs = (const struct msm_dp_desc[]) {
>>>> -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>> -     },
>>>> -     .num_descs = 1,
>>>> +     .descs = sc7180_dp_descs,
>>>> +     .num_descs = ARRAY_SIZE(sc7180_dp_descs),
>>>> +};
>>>> +
>>> why you want to do that?
>>>
>>> It is very clear only one entry, why you want to make it 2 entry here?
>>>
>>> can you just embedded MSM_DP_COTROLLER_x into struct msm_dp_config?
>> Because we had enough stories of using a manually set 'number of
>> something' field. So I'd prefer to have it done automatically.
>> Also using the indexed array spares us from 'look for the DP
>> controller number N' functions. You can just get it.
> 
> static const struct msm_dp_config sc7280_dp_cfg = {
>           .descs = (const struct msm_dp_desc[]) {
>                   [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000, 
> .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
>           },
>           .num_descs = ARRAY_SIZE(sc7280_dp_descs),

This will not work.

> };
> 
> At above example table, it just waste one entry. is it ok?

I'd assume this is an interim development state. Then it's fine. In the 
final version one would fill all existing DP controllers starting from 0.

> 
> can you elaborate  more on 'look for the DP controller number N' 
> functions, where is it?

Ignore this.

> 
> 
>>>> +static const struct msm_dp_desc sc7280_dp_descs[] = {
>>>> +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = 
>>>> true },
>>>> +     [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
>>>>    };
>>>>
>>>>    static const struct msm_dp_config sc7280_dp_cfg = {
>>>> -     .descs = (const struct msm_dp_desc[]) {
>>>> -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = 
>>>> true },
>>>> -             [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
>>>> -     },
>>>> -     .num_descs = 2,
>>>> +     .descs = sc7280_dp_descs,
>>>> +     .num_descs = ARRAY_SIZE(sc7280_dp_descs),
>>>> +};
>>>> +
>>>> +static const struct msm_dp_desc sc8180x_dp_descs[] = {
>>>> +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>> +     [MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>> +     [MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_eDP },
>>>>    };
>>>>
>>>>    static const struct msm_dp_config sc8180x_dp_cfg = {
>>>> -     .descs = (const struct msm_dp_desc[]) {
>>>> -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>> -             [MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>> -             [MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_eDP },
>>>> -     },
>>>> -     .num_descs = 3,
>>>> +     .descs = sc8180x_dp_descs,
>>>> +     .num_descs = ARRAY_SIZE(sc8180x_dp_descs),
>>>> +};
>>>> +
>>>> +static const struct msm_dp_desc sm8350_dp_descs[] = {
>>>> +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>>    };
>>>>
>>>>    static const struct msm_dp_config sm8350_dp_cfg = {
>>>> -     .descs = (const struct msm_dp_desc[]) {
>>>> -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>> -     },
>>>> -     .num_descs = 1,
>>>> +     .descs = sm8350_dp_descs,
>>>> +     .num_descs = ARRAY_SIZE(sm8350_dp_descs),
>>>>    };
>>>>
>>>>    static const struct of_device_id dp_dt_match[] = {
>>
>>


-- 
With best wishes
Dmitry
