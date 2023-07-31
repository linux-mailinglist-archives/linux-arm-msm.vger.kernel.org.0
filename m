Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB44768A89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 06:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjGaECb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 00:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjGaECa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 00:02:30 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38740AD
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 21:02:27 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe0c566788so6428794e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 21:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690776145; x=1691380945;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ajHG4BBw8iHuUvtNYJ0qqb7Yvyp0zkUGuOzCXpR5oEM=;
        b=TLosVwAEYjCsImmgqiqb/tuWYyQQrOf+9i1YGcKBHX3A56WIrq4wXLtuinW/c86mJr
         +eBv3iXgJzd+BAcuGBVF9cYuPpGWy5IsH/FqkTEimIDACLW3UiSpqemlQOPv195BDdvn
         tZSbQfxzX4byxDUReBx7P+rFcKIR7I7BfaseeyA3hymFGP/+gp1EGy7ufeIJEm15eDAJ
         NwCgU9jB7tPIyiSOwb/sS8gd/b01S+LfRtoHBow9GORRNsUfHU62a7vADaxJA21O60dl
         8rI1VRYN6Q2ePoDAXnMSKr1kfl5iCRPlJo5gznBBtHhy1YR0YO7aXkqx0xJGfKc6zEkM
         tr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690776145; x=1691380945;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ajHG4BBw8iHuUvtNYJ0qqb7Yvyp0zkUGuOzCXpR5oEM=;
        b=lVaY6gzp83ohPDYtzZglESDAnOYB5vkmjNZazzS/jdo4lrQRVOP3PWHb+sWaTElLmp
         tVa9suluVuGelbD6mUG2YtmoJtLFyKopzOzag2tC4U3zbWDQHdOjBAgSACD3mMU+2tGw
         tzeJBc86//DZr/7eTYjSkaZYJknFFlEk3GXbDrDeuMcWanraLNpJIw1ybhciWnXvGv+1
         7c/mA2kopWc4kZcG5PqB1zRfw/BTK7VRfIaAcjQwTk5vZ+gr0ZSmrX8y6SDLVaKS2mYd
         ItL0Vd2825rfZPgRYXYlTZl5eTH85d5qBNrMSoYgqJ4uRJYUpsWs2Wdc96Utl4VCZfN1
         8+vg==
X-Gm-Message-State: ABy/qLalzad91qopFNO16EaILuOcMFL40kMiYi5jMIYwitDHbf0oZaia
        tSniJN/A0IZSlxblj/vwKvV0fw==
X-Google-Smtp-Source: APBJJlGKQ1Z4HFuQYySXiLXimDp4RK2g+LfSMrRqiLrLLgoGdIRiuHNA4gnfoy9Umg1ujp6nx6YBxQ==
X-Received: by 2002:a2e:81c3:0:b0:2b6:d9dd:f65f with SMTP id s3-20020a2e81c3000000b002b6d9ddf65fmr5289913ljg.17.1690776145555;
        Sun, 30 Jul 2023 21:02:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d13-20020a2e330d000000b002b6cb40e9aasm2288593ljc.103.2023.07.30.21.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 21:02:24 -0700 (PDT)
Message-ID: <a3f6a213-574e-7351-1d4f-a698116d6c95@linaro.org>
Date:   Mon, 31 Jul 2023 07:02:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC v5 03/10] drm: Add solid fill pixel source
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
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-3-053dbefa909c@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230728-solid-fill-v5-3-053dbefa909c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/07/2023 20:02, Jessica Zhang wrote:
> Add "SOLID_FILL" as a valid pixel source. If the pixel_source property is
> set to "SOLID_FILL", it will display data from the drm_plane "solid_fill"
> blob property.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_blend.c | 10 +++++++++-
>   include/drm/drm_plane.h     |  1 +
>   2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index c632dfcd8a9b..34b1fd3e2310 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -200,6 +200,9 @@
>    *	"FB":
>    *		Framebuffer source set by the "FB_ID" property.
>    *
> + *	"SOLID_FILL":
> + *		Solid fill color source set by the "solid_fill" property.
> + *
>    * solid_fill:
>    *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
>    *	contains pixel data that drivers can use to fill a plane.
> @@ -657,6 +660,9 @@ EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
>    * "FB":
>    *	Framebuffer pixel source
>    *
> + * "SOLID_FILL":
> + * 	Solid fill color pixel source
> + *
>    * Returns:
>    * Zero on success, negative errno on failure.
>    */
> @@ -668,8 +674,10 @@ int drm_plane_create_pixel_source_property(struct drm_plane *plane,
>   	static const struct drm_prop_enum_list enum_list[] = {
>   		{ DRM_PLANE_PIXEL_SOURCE_NONE, "NONE" },
>   		{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
> +		{ DRM_PLANE_PIXEL_SOURCE_SOLID_FILL, "SOLID_FILL" },
>   	};
> -	static const unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB);
> +	static const unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
> +						      BIT(DRM_PLANE_PIXEL_SOURCE_SOLID_FILL);
>   	int i;
>   
>   	/* FB is supported by default */
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index abf1458fa099..234fee3d5a95 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -43,6 +43,7 @@ enum drm_scaling_filter {
>   enum drm_plane_pixel_source {
>   	DRM_PLANE_PIXEL_SOURCE_NONE,
>   	DRM_PLANE_PIXEL_SOURCE_FB,
> +	DRM_PLANE_PIXEL_SOURCE_SOLID_FILL,
>   	DRM_PLANE_PIXEL_SOURCE_MAX
>   };
>   
> 

-- 
With best wishes
Dmitry

