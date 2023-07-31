Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7C22768A8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 06:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjGaEGc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 00:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjGaEGb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 00:06:31 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0FD1B7
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 21:06:29 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b9e6cc93c6so10242661fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 21:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690776387; x=1691381187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=su5D+Tmrapqcznb46Ug6phpVwO6dH713+EUewY3lEfg=;
        b=rrWW6dydtNphoiXUZjHrvk4yiuLdtpoCeql0RX/1BIAnOzKrZBGkWUic1Vu+Fjlji4
         J8HegS+wuDEOUBdA7hlLqzoxCOe7GZI4zVv7njw5G4XzlcHmuaRy9CDJqOGhgHQs6k91
         UbyGx4GTNCoWvHbUdl3oUVoBIvI9PUf+93aYMJU6dHp/1VgNNsunfd5mYoHfAwinzepS
         8ILHNlSNJl0Y9L9n1kTpKTubSa4LrMJGY+ubDkXoMASgF+eEbbK8zb38HdWDf18tpnFe
         LXhe0nYo+Rz2c7RcRYesW692NSwnSWlMKs5oGHaH3+su+GK2ZM6LunSBGR6YTfaKekE4
         L/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690776387; x=1691381187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=su5D+Tmrapqcznb46Ug6phpVwO6dH713+EUewY3lEfg=;
        b=IglmT/u8ikOivbERsYggU6S9m4B8tk16JT9RmOyZTj0cNZ2x49xFcYNyi48NLsq4zX
         e5n743PWDFP+UIgwaXKobulCiL5QUhNVhbWZRpglt1q/wrOkLnV7gznFsvkq6atzX/q5
         EFQ4ZrxYsscA9pyo1nqaPR5FSzURpsqXZq2Ok23vLKRPu7RovZG1MK06e0spF8iuSDKG
         u3Je7IIvqUt0HpKwJ+M5o/MARhBBU0Flqw3f6HYScy9Ptr21NBs7+hxmsjczXDhS3OZ3
         T3hsZ9TQqAEHYaoJqKLFU8twYPBtPDdCM3IbE+D+QENWYVsFFaNeoltZ/pDv6bUjWrJ8
         tSxA==
X-Gm-Message-State: ABy/qLYbUFfLrTHd5m5qX3tH+if5WdA0iAlX4yFDxWvHHxoMyGPwGiiT
        JI4/TTJ1X83ieMYy8r/NZP30xg==
X-Google-Smtp-Source: APBJJlF0D58lic6XZF5ttPkNXiwTdXgUopxk1qdtA4oKI7HVn8Spg1gPRnYEBJ2/0NLdI9pTZs/rIA==
X-Received: by 2002:a2e:3e17:0:b0:2b5:89a6:c12b with SMTP id l23-20020a2e3e17000000b002b589a6c12bmr5505065lja.10.1690776387508;
        Sun, 30 Jul 2023 21:06:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x24-20020a05651c105800b002b9aea70f9dsm1552983ljm.85.2023.07.30.21.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 21:06:26 -0700 (PDT)
Message-ID: <d99be6b0-3d03-1d9b-f102-fa57e39ddb45@linaro.org>
Date:   Mon, 31 Jul 2023 07:06:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC v5 06/10] drm/atomic: Move framebuffer checks to
 helper
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
 <20230728-solid-fill-v5-6-053dbefa909c@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230728-solid-fill-v5-6-053dbefa909c@quicinc.com>
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
> Currently framebuffer checks happen directly in
> drm_atomic_plane_check(). Move these checks into their own helper
> method.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic.c | 130 ++++++++++++++++++++++++-------------------
>   1 file changed, 73 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 1ee7d08041bc..017ce0e6570f 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -580,6 +580,76 @@ plane_switching_crtc(const struct drm_plane_state *old_plane_state,
>   	return true;
>   }
>   
> +static int drm_atomic_check_fb(const struct drm_plane_state *state)

Maybe drm_atomic_plane_check_fb()?

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +{
> +	struct drm_plane *plane = state->plane;
> +	const struct drm_framebuffer *fb = state->fb;
> +	struct drm_mode_rect *clips;
> +
> +	uint32_t num_clips;
> +	unsigned int fb_width, fb_height;
> +	int ret;
> +
> +	/* Check whether this plane supports the fb pixel format. */
> +	ret = drm_plane_check_pixel_format(plane, fb->format->format,
> +					   fb->modifier);
> +
> +	if (ret) {
> +		drm_dbg_atomic(plane->dev,
> +			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
> +			       plane->base.id, plane->name,
> +			       &fb->format->format, fb->modifier);
> +		return ret;
> +	}
> +
> +	fb_width = fb->width << 16;
> +	fb_height = fb->height << 16;
> +
> +	/* Make sure source coordinates are inside the fb. */
> +	if (state->src_w > fb_width ||
> +	    state->src_x > fb_width - state->src_w ||
> +	    state->src_h > fb_height ||
> +	    state->src_y > fb_height - state->src_h) {
> +		drm_dbg_atomic(plane->dev,
> +			       "[PLANE:%d:%s] invalid source coordinates "
> +			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
> +			       plane->base.id, plane->name,
> +			       state->src_w >> 16,
> +			       ((state->src_w & 0xffff) * 15625) >> 10,
> +			       state->src_h >> 16,
> +			       ((state->src_h & 0xffff) * 15625) >> 10,
> +			       state->src_x >> 16,
> +			       ((state->src_x & 0xffff) * 15625) >> 10,
> +			       state->src_y >> 16,
> +			       ((state->src_y & 0xffff) * 15625) >> 10,
> +			       fb->width, fb->height);
> +		return -ENOSPC;
> +	}
> +
> +	clips = __drm_plane_get_damage_clips(state);
> +	num_clips = drm_plane_get_damage_clips_count(state);
> +
> +	/* Make sure damage clips are valid and inside the fb. */
> +	while (num_clips > 0) {
> +		if (clips->x1 >= clips->x2 ||
> +		    clips->y1 >= clips->y2 ||
> +		    clips->x1 < 0 ||
> +		    clips->y1 < 0 ||
> +		    clips->x2 > fb_width ||
> +		    clips->y2 > fb_height) {
> +			drm_dbg_atomic(plane->dev,
> +				       "[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
> +				       plane->base.id, plane->name, clips->x1,
> +				       clips->y1, clips->x2, clips->y2);
> +			return -EINVAL;
> +		}
> +		clips++;
> +		num_clips--;
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * drm_atomic_plane_check - check plane state
>    * @old_plane_state: old plane state to check
> @@ -596,9 +666,6 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   	struct drm_plane *plane = new_plane_state->plane;
>   	struct drm_crtc *crtc = new_plane_state->crtc;
>   	const struct drm_framebuffer *fb = new_plane_state->fb;
> -	unsigned int fb_width, fb_height;
> -	struct drm_mode_rect *clips;
> -	uint32_t num_clips;
>   	int ret;
>   
>   	/* either *both* CRTC and FB must be set, or neither */
> @@ -625,17 +692,6 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   		return -EINVAL;
>   	}
>   
> -	/* Check whether this plane supports the fb pixel format. */
> -	ret = drm_plane_check_pixel_format(plane, fb->format->format,
> -					   fb->modifier);
> -	if (ret) {
> -		drm_dbg_atomic(plane->dev,
> -			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
> -			       plane->base.id, plane->name,
> -			       &fb->format->format, fb->modifier);
> -		return ret;
> -	}
> -
>   	/* Give drivers some help against integer overflows */
>   	if (new_plane_state->crtc_w > INT_MAX ||
>   	    new_plane_state->crtc_x > INT_MAX - (int32_t) new_plane_state->crtc_w ||
> @@ -649,50 +705,10 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   		return -ERANGE;
>   	}
>   
> -	fb_width = fb->width << 16;
> -	fb_height = fb->height << 16;
>   
> -	/* Make sure source coordinates are inside the fb. */
> -	if (new_plane_state->src_w > fb_width ||
> -	    new_plane_state->src_x > fb_width - new_plane_state->src_w ||
> -	    new_plane_state->src_h > fb_height ||
> -	    new_plane_state->src_y > fb_height - new_plane_state->src_h) {
> -		drm_dbg_atomic(plane->dev,
> -			       "[PLANE:%d:%s] invalid source coordinates "
> -			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
> -			       plane->base.id, plane->name,
> -			       new_plane_state->src_w >> 16,
> -			       ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
> -			       new_plane_state->src_h >> 16,
> -			       ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
> -			       new_plane_state->src_x >> 16,
> -			       ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
> -			       new_plane_state->src_y >> 16,
> -			       ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
> -			       fb->width, fb->height);
> -		return -ENOSPC;
> -	}
> -
> -	clips = __drm_plane_get_damage_clips(new_plane_state);
> -	num_clips = drm_plane_get_damage_clips_count(new_plane_state);
> -
> -	/* Make sure damage clips are valid and inside the fb. */
> -	while (num_clips > 0) {
> -		if (clips->x1 >= clips->x2 ||
> -		    clips->y1 >= clips->y2 ||
> -		    clips->x1 < 0 ||
> -		    clips->y1 < 0 ||
> -		    clips->x2 > fb_width ||
> -		    clips->y2 > fb_height) {
> -			drm_dbg_atomic(plane->dev,
> -				       "[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
> -				       plane->base.id, plane->name, clips->x1,
> -				       clips->y1, clips->x2, clips->y2);
> -			return -EINVAL;
> -		}
> -		clips++;
> -		num_clips--;
> -	}
> +	ret = drm_atomic_check_fb(new_plane_state);
> +	if (ret)
> +		return ret;
>   
>   	if (plane_switching_crtc(old_plane_state, new_plane_state)) {
>   		drm_dbg_atomic(plane->dev,
> 

-- 
With best wishes
Dmitry

