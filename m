Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55F867431F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 02:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjF3AuB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 20:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjF3Atb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 20:49:31 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582BE35BF
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 17:49:30 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b6afc1ceffso21575011fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 17:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688086168; x=1690678168;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tFpLak+ksDCCGqs4Q41iM6CskPw8vvBNcPkt1q5XiVo=;
        b=Z8m9kZR+kmnsKSB4RSKFLIPkp5LPw5fvjf5TqHgFG7C/7yPFBnu5hMy3Mubv7x1ahy
         g/vRh4OtRtQaAEu5q8WI87khK6uAO47Q/2dahRTWnvUGoOhkKH/aGDw8dg7+W6B4YRc3
         9MyfleiKMJigPvyhUnRAPqNC7OU93hpxG3UKegXL2y/5hnpyY8+y9jr+UpMJKzSSfNsJ
         aubju0tNSyBfBAigNqwtUYX59KANAQXEpgZI8TACn8UxNFAHgd3K5x1hKdApgsfmzPRq
         Hmd5EpIeZ0z9osR2ZxjTahwsOiVJSmzjqWAvX9oSVZPcL6809XcYkH9p9fvla6o1UIgT
         BCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688086168; x=1690678168;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tFpLak+ksDCCGqs4Q41iM6CskPw8vvBNcPkt1q5XiVo=;
        b=ksim7cBZEoQBXt43I0//LCu2X2aBqeDy50+scbrZtrtqJB6k8AT1dvToi1txR5mQk3
         uoj7jJbcK0u7tJMioHgK2Qijv28Nl+z9rRmvGbl236YxBJL1kGNq62kB9MUKSnqsJMNf
         eu4P+3Cp5df+6bJ9fc5F2SNqlqx7PhWBhe4gx91JdTe9OgHHNbXY5ITq8g5PbCZYO6C2
         LsjJDtX2ngDheTl4IHQxEGPvfrgRkH3EjvEag9iQLeWaHkKts+EvdfHV0TdiroOQX8Tn
         iwf2ejzaZ414QIF2ZNnc9mSgGFph4DjcVSyOdU6wuN37BviIrJ+VVXA4ViaK/ska4q3y
         3hsw==
X-Gm-Message-State: ABy/qLbCi8qroNfXN2TT0slfXjNcpQCynw66dgJlr5/pqeuqy8sPTgqc
        LLDijj83mkbQ3OH4UhijmiZ0aQ==
X-Google-Smtp-Source: APBJJlE9oItsWMthbV8omjfXiAQTh2vXUK/RQwRur2Evwvh6gw4NolcCwOkvAf0UxCWDXp/r/rcjPg==
X-Received: by 2002:a2e:9659:0:b0:2b6:c16a:db06 with SMTP id z25-20020a2e9659000000b002b6c16adb06mr876985ljh.39.1688086168437;
        Thu, 29 Jun 2023 17:49:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b6-20020a2e9886000000b002b69f44646bsm2391329ljj.17.2023.06.29.17.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 17:49:28 -0700 (PDT)
Message-ID: <39ee5eac-1452-1c08-c24f-6c70c13ce804@linaro.org>
Date:   Fri, 30 Jun 2023 03:49:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v4 5/7] drm/msm/dpu: Add solid fill and pixel source
 properties
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     quic_abhinavk@quicinc.com, ppaalanen@gmail.com,
        contact@emersion.fr, laurent.pinchart@ideasonboard.com,
        sebastian.wick@redhat.com, ville.syrjala@linux.intel.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-5-f4ec0caa742d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230404-solid-fill-v4-5-f4ec0caa742d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2023 03:25, Jessica Zhang wrote:
> Add solid_fill and pixel_source properties to DPU plane
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 ++
>   1 file changed, 2 insertions(+)

This should be the last commit.
Otherwise:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c2aaaded07ed..5f0984ce62b1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1429,6 +1429,8 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
>   
>   	drm_plane_create_alpha_property(plane);
> +	drm_plane_create_solid_fill_property(plane);
> +	drm_plane_create_pixel_source_property(plane, BIT(DRM_PLANE_PIXEL_SOURCE_COLOR));
>   	drm_plane_create_blend_mode_property(plane,
>   			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>   			BIT(DRM_MODE_BLEND_PREMULTI) |
> 

-- 
With best wishes
Dmitry

