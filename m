Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5510A65E2CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 03:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjAECM1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 21:12:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjAECMZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 21:12:25 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164D444358
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 18:12:24 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id j17so43679939lfr.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 18:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H93nCo5ur4nJMByR48TskV+BfJCAkHk6VSmb9r9zNIk=;
        b=Tbg1nEjsmOX0fx/CSobrtzzJOLRxHoweQs9pjXKgdNKIb5SxfwHhQOppOw9f36DRfn
         mzvMjFi2l8w51kXpjJtiSV7Qmy5WG74zu2Gk7yBWbcVHDobov2wMEWzOfcDEz6LTKuH9
         XpCjFqFNYlt0p1pZgvAGMO1v0eCe48I4n5EXQUMH2+i5PhR7F5O6Ec4mU5h0h75v0qkP
         4d3hC6loJ3WnfYqkqbrZyx68EYFKmJwxefLqtBGDySY+T2+kgzVUForRwwQDZMNhuv+a
         08YB0jvjCDMA4If/W1dPlcOtZNsLP4xC61nHN4PpvbBnvD9LoOXo+9Wvyaj4MbIPO/7x
         zTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H93nCo5ur4nJMByR48TskV+BfJCAkHk6VSmb9r9zNIk=;
        b=luJMx/fcrcyP+QeK8WsMENaZPLm6HfQYDaBXfkx5XVbY4guqoyr8Do6c7tO34caw1g
         upRtqwOCpUuRc1HDrnKHfZxyXTfOHAT8atrzZlA+7n2RzqjTmtU8NVjoWLpHQPuoYcRB
         xVt9gfLphroimEwdvhs5zL6gGrH86LytG44FZG45+0Uvu60M/DpPZ4H58KWKx8zIBFdj
         pXr7pyJPxiD/g0qq1/E96DJ1oQk61UOib8XP24csuvTklPS6hiUWuFXLKgALSGoev//s
         8mkHm+YLW+21ouVBMi3oRSiSHLZ7W2Z1BQGP7lJes3hyiRhXKtFZ+AoFT2Bz6ZAYlO7T
         skjg==
X-Gm-Message-State: AFqh2kruHCdBiqaqqXT0TTjJYfHq205KsrjCaxYKmTzELMVjNBBTKdp3
        YFE9seg3+50G0OaIAUPb4KL1MA==
X-Google-Smtp-Source: AMrXdXuNvXtekh/hZoHpUpmXCwjfnc13T6oiv1mmMsTB4I4lvrOsAx9+7KAS8WD+F8VCPttCyFzFCg==
X-Received: by 2002:a05:6512:1523:b0:4a4:68b7:deb8 with SMTP id bq35-20020a056512152300b004a468b7deb8mr16929414lfb.20.1672884742471;
        Wed, 04 Jan 2023 18:12:22 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s11-20020a056512214b00b004b57c5b7ec3sm5311699lfr.235.2023.01.04.18.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 18:12:21 -0800 (PST)
Message-ID: <34880c9e-6150-5a90-ed0e-5dcdc862f2b8@linaro.org>
Date:   Thu, 5 Jan 2023 04:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v3 1/3] drm: Introduce solid fill property for drm
 plane
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, contact@emersion.fr,
        daniel.vetter@ffwll.ch, laurent.pinchart@ideasonboard.com,
        ppaalanen@gmail.com, sebastian.wick@redhat.com,
        wayland-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <20230104234036.636-2-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230104234036.636-2-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/01/2023 01:40, Jessica Zhang wrote:
> Add support for solid_fill property to drm_plane. In addition, add
> support for setting and getting the values for solid_fill.
> 
> solid_fill holds data for supporting solid fill planes. The property
> accepts an RGB323232 value and the driver data is formatted as such:
> 
> struct drm_solid_fill {
> 	u32 r;
> 	u32 g;
> 	u32 b;
> };
> 
> To enable solid fill planes, userspace must assigned solid_fill to a
> property blob containing the following information:
> 
> struct drm_solid_fill_info {
> 	u8 version;
> 	u32 r, g, b;

BTW: should we add support for alpha too? DPU hardware supports using 
RGBA as a fill colour format, doesn't it?

But then we face the obvious question, how do we communicate to 
userspace if the hardware support RGB or RGBA?

> };
> 
> Changes in V2:
> - Changed solid_fill property to a property blob (Simon, Dmitry)
> - Added drm_solid_fill struct (Simon)
> - Added drm_solid_fill_info struct (Simon)
> 
> Changes in V3:
> - Corrected typo in drm_solid_fill struct documentation
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++
>   drivers/gpu/drm/drm_atomic_uapi.c         | 59 +++++++++++++++++++++++
>   drivers/gpu/drm/drm_blend.c               | 17 +++++++
>   include/drm/drm_blend.h                   |  1 +
>   include/drm/drm_plane.h                   | 43 +++++++++++++++++
>   5 files changed, 129 insertions(+)

-- 
With best wishes
Dmitry

