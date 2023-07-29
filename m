Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE2B176795A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 02:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235910AbjG2AFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 20:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235864AbjG2AFh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 20:05:37 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B346C3C24
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 17:05:35 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5221e487e08so3713735a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 17:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690589134; x=1691193934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6AoRC5Ze9gLmlNt0sk++x0v2iDf5h30oOIYuEKlSQk0=;
        b=z47WAlqmDTVf/lInB/LW9WNv1MS1ADhXSxrgyVvTpp2StYDR8K4r3oFp+kP/sjcywG
         GSJKLr6uyGsjxhof28IRJhmzzKaY7I+7voI+YEcDxwJEigCiCFTLijWwTw+CxbO47v2c
         l5RfCCL5HvIjnFPgrkPt/qk7rFM4fSlKnUahrDoA+hDWPDc7VgOATEaJk+R+PhjVtKCH
         qPirqh89elNF5X/I+5OEsDGFkI6vs25Q/NI7meErMcCgz60poRETrltK7su9hz/FsX+5
         /fK3CSVy75CGaQ/F4RDljJFqV+eeNaC/sJnABHk6rPjbbX72+zdOUjTOxJoLIZ58nQ35
         G40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690589134; x=1691193934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6AoRC5Ze9gLmlNt0sk++x0v2iDf5h30oOIYuEKlSQk0=;
        b=GQUPzsT1my8mxi0pdVGW5s6z/60wja6KoRsyFY6M3JU0XSbonQ18gls163i5xmkedM
         OSRe9lS41OhFu7TTntlpIGGoI9AweRDtR0uisZeLdQcSgGZNepVki1+iVjZk5UuKtd6r
         6f4rjUB4QOqSQRmwqm37a1RAn7eTYtyruiG3KJusTo1VTRfKMd7dd0Hj6NRhyQp7JJ3m
         cvoQly/1UjBiru/MC+Fz34V14SxzD0qYORcRTx2L11ar1Niq+H4q94sNdWuHopbSBzC3
         Ray9EMgbG0yIaYN8dpEGzM9tHeBUKr+f6FSS60bsP7t82uTkTsC4ZrYVzgR3Nech6xOV
         gs1w==
X-Gm-Message-State: ABy/qLbqijm61DpUmzuR+NNz2SDUlCIVh+EfjMjahm5GcPfbCvc573Ld
        dlC+1xk1KsJ30tbUy/mNvFztkQ==
X-Google-Smtp-Source: APBJJlHwGV/fV5tcFX+2wVYvsCriro0EemjtEEYhiKr/RV/iLJYNeYugWZaYhJnNMgQmctjIwpD2Wg==
X-Received: by 2002:a17:906:2d6:b0:993:ec0b:1a27 with SMTP id 22-20020a17090602d600b00993ec0b1a27mr801948ejk.24.1690589134205;
        Fri, 28 Jul 2023 17:05:34 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b14-20020a1709062b4e00b0099290e2c163sm2615799ejg.204.2023.07.28.17.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 17:05:33 -0700 (PDT)
Message-ID: <b3407550-164c-b148-461d-a353eb1ee398@linaro.org>
Date:   Sat, 29 Jul 2023 03:05:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC v5 05/10] drm/atomic: Add solid fill data to plane
 state dump
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
 <20230728-solid-fill-v5-5-053dbefa909c@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230728-solid-fill-v5-5-053dbefa909c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/07/2023 20:02, Jessica Zhang wrote:
> Add solid_fill property data to the atomic plane state dump.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic.c |  4 ++++
>   drivers/gpu/drm/drm_plane.c  | 10 ++++++++++
>   include/drm/drm_plane.h      |  3 +++
>   3 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index c38014abc590..1ee7d08041bc 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -717,6 +717,10 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
>   	drm_printf(p, "\tfb=%u\n", state->fb ? state->fb->base.id : 0);
>   	if (state->fb)
>   		drm_framebuffer_print_info(p, 2, state->fb);
> +	drm_printf(p, "\tsolid_fill=%u\n",
> +			state->solid_fill_blob ? state->solid_fill_blob->base.id : 0);
> +	if (state->solid_fill_blob)
> +		drm_plane_solid_fill_print_info(p, 2, state);
>   	drm_printf(p, "\tcrtc-pos=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&dest));
>   	drm_printf(p, "\tsrc-pos=" DRM_RECT_FP_FMT "\n", DRM_RECT_FP_ARG(&src));
>   	drm_printf(p, "\trotation=%x\n", state->rotation);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 4188b3491625..009d3ebd9b39 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1494,11 +1494,21 @@ const char *drm_plane_get_pixel_source_name(enum drm_plane_pixel_source pixel_so
>   		return "NONE";
>   	case DRM_PLANE_PIXEL_SOURCE_FB:
>   		return "fb";
> +	case DRM_PLANE_PIXEL_SOURCE_SOLID_FILL:
> +		return "solid_fill";
>   	default:
>   		return "";
>   	}
>   }

This chunk should be a part of the previous commit. Or dropped 
completely once DRM_ENUM_NAME_FN is used.

The rest LGTM.

>   
> +void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned int indent,
> +				     const struct drm_plane_state *state)
> +{
> +	drm_printf_indent(p, indent, "r=0x%x\n", state->solid_fill.r);
> +	drm_printf_indent(p, indent, "g=0x%x\n", state->solid_fill.g);
> +	drm_printf_indent(p, indent, "b=0x%x\n", state->solid_fill.b);
> +}
> +
>   /**
>    * drm_plane_get_damage_clips - Returns damage clips.
>    * @state: Plane state.
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 234fee3d5a95..303f01f0588c 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -1000,6 +1000,9 @@ drm_plane_get_damage_clips_count(const struct drm_plane_state *state);
>   struct drm_mode_rect *
>   drm_plane_get_damage_clips(const struct drm_plane_state *state);
>   
> +void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned int indent,
> +				     const struct drm_plane_state *state);
> +
>   int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>   					     unsigned int supported_filters);
>   
> 

-- 
With best wishes
Dmitry

