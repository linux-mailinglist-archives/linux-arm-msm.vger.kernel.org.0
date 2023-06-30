Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E99F4743712
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 10:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbjF3I07 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 04:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjF3I05 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 04:26:57 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFF8130;
        Fri, 30 Jun 2023 01:26:55 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fb9fd28025so1802702e87.2;
        Fri, 30 Jun 2023 01:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688113614; x=1690705614;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BO9sJ7XbsWfHnQVS5iiiqYB7vSs8omRznCKlKYkD1tw=;
        b=Qyn7fXoVrB4ccRXSLvzTjps5ijrsiHwSD9lzLxZxlQ6KinRwIW0eaSruAsyNMS7T6A
         4bKct9R5CB9+0v3Tz2rGVjptncFzKPMMQT4ua9bqPLnIKsZf7ldXzeQpKmGukeCw9uvB
         glhLoUzbm/7RdxBVNgGBOlz/zP7dAabAx/Op19R8fXx9Z9ik+nMdTyDBa3FdVLDZa+AY
         1S9Fa+X17YPFw1EKLvcZ+srBhCokz4ydmaFolpsAbZ16imzHNwzUwvyMvQHiKWXLoVIM
         8LjH4XV3/TUfBjLWU41OiSs3LvgSQy9GZIXKxUj6aXduIrSKNeVdAHmG2igX2Fsx+W9X
         YMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688113614; x=1690705614;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BO9sJ7XbsWfHnQVS5iiiqYB7vSs8omRznCKlKYkD1tw=;
        b=hNTyJgytjXW79aJAxNdma6x7HvKWSic6+VwjcAyk5mlmMt4VK9YAOyRuC0fiim1cAc
         fWPeO1BCo5GblwFffmU4m8G/dfpYoIF+ojMOKa2oJqhuDICuKJpE2UMy12EIOp4+6FBG
         xX0l82U2cykyjljfXUDw1LMwlxCXnrSEphBVjmT6PxoznG0/lb4OLytvEi8l01EC31gp
         tYsupyPNwYYoSv/EUh2o/gKUdzHqyJMlM4NRKsF4SPzIB0nB3tZZdmMbydAxpQ91s7q0
         Re1Pv5p5qp4XAfZc7eMyQU9hgxeSLwdUccnyb437zHZMwvXSe06XIvLbEfCGfKAOVzD5
         NNkw==
X-Gm-Message-State: ABy/qLYjcX9OFGBIyN3QRkhtl6dnzzQC6+M3e4Y2N77qQ7z3t8Ak8eKL
        hFt+BlRE8e26OJKGBdxzsa8=
X-Google-Smtp-Source: APBJJlGma2G/Csp0TK1HheJKDjZvq5uk9qaeGmWtRrmamtlWTkvplFtDne40BVjROwTAX1jP88ZKzA==
X-Received: by 2002:a05:6512:3491:b0:4fb:7be5:4870 with SMTP id v17-20020a056512349100b004fb7be54870mr1564922lfr.46.1688113613325;
        Fri, 30 Jun 2023 01:26:53 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id v13-20020a19740d000000b004f64582a6e6sm2645497lfe.207.2023.06.30.01.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:26:52 -0700 (PDT)
Date:   Fri, 30 Jun 2023 11:26:49 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        <quic_abhinavk@quicinc.com>, <contact@emersion.fr>,
        <laurent.pinchart@ideasonboard.com>, <sebastian.wick@redhat.com>,
        <ville.syrjala@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>,
        <wayland-devel@lists.freedesktop.org>
Subject: Re: [PATCH RFC v4 7/7] drm/msm/dpu: Use DRM solid_fill property
Message-ID: <20230630112649.263331b4@eldfell>
In-Reply-To: <20230404-solid-fill-v4-7-f4ec0caa742d@quicinc.com>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
        <20230404-solid-fill-v4-7-f4ec0caa742d@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C2RkByoz5wEuzOAQUcUL+Em";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--Sig_/C2RkByoz5wEuzOAQUcUL+Em
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Jun 2023 17:25:06 -0700
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> Drop DPU_PLANE_COLOR_FILL_FLAG and check the DRM solid_fill property to
> determine if the plane is solid fill. In addition drop the DPU plane
> color_fill field as we can now use drm_plane_state.solid_fill instead,
> and pass in drm_plane_state.alpha to _dpu_plane_color_fill_pipe() to
> allow userspace to configure the alpha value for the solid fill color.
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_plane.c
> index 4476722f03bb..11d4fb771a1f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -42,7 +42,6 @@
>  #define SHARP_SMOOTH_THR_DEFAULT	8
>  #define SHARP_NOISE_THR_DEFAULT	2
> =20
> -#define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
>  #define DPU_ZPOS_MAX 255
> =20
>  /*
> @@ -82,7 +81,6 @@ struct dpu_plane {
> =20
>  	enum dpu_sspp pipe;
> =20
> -	uint32_t color_fill;
>  	bool is_error;
>  	bool is_rt_pipe;
>  	const struct dpu_mdss_cfg *catalog;
> @@ -606,6 +604,17 @@ static void _dpu_plane_color_fill_pipe(struct dpu_pl=
ane_state *pstate,
>  	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
>  }
> =20
> +static uint32_t _dpu_plane_get_fill_color(struct drm_solid_fill solid_fi=
ll)
> +{
> +	uint32_t ret =3D 0;
> +
> +	ret |=3D ((uint8_t) solid_fill.b) << 16;
> +	ret |=3D ((uint8_t) solid_fill.g) << 8;
> +	ret |=3D ((uint8_t) solid_fill.r);

solid_fill.r, g and b are uint32_t, yes?

What's the value encoding in the UAPI? That doc was missing.

I wouldn't expect the UAPI to use 32-bit variables if it was
essentially 8-bit, so this conversion looks wrong.

Nominal color value 1.0 in u8 is 0xff. The same in u32 is probably
0xffffffff? So a simple cast to u8 won't work. You'd want to take the
upper 8 bits instead.


Thanks,
pq

> +
> +	return ret;
> +}
> +
>  /**
>   * _dpu_plane_color_fill - enables color fill on plane
>   * @pdpu:   Pointer to DPU plane object
> @@ -977,9 +986,9 @@ void dpu_plane_flush(struct drm_plane *plane)
>  	if (pdpu->is_error)
>  		/* force white frame with 100% alpha pipe output on error */
>  		_dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
> -	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
> -		/* force 100% alpha */
> -		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> +	else if (drm_plane_solid_fill_enabled(plane->state))
> +		_dpu_plane_color_fill(pdpu, _dpu_plane_get_fill_color(plane->state->so=
lid_fill),
> +				plane->state->alpha);
>  	else {
>  		dpu_plane_flush_csc(pdpu, &pstate->pipe);
>  		dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
> @@ -1024,7 +1033,7 @@ static void dpu_plane_sspp_update_pipe(struct drm_p=
lane *plane,
>  	}
> =20
>  	/* override for color fill */
> -	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
> +	if (drm_plane_solid_fill_enabled(plane->state)) {
>  		_dpu_plane_set_qos_ctrl(plane, pipe, false);
> =20
>  		/* skip remaining processing on color fill */
>=20


--Sig_/C2RkByoz5wEuzOAQUcUL+Em
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSekckACgkQI1/ltBGq
qqfH0BAAsesO+vcl5g4bFFzoDnrZUuMHSz8vrDguTh65WChGWNgiM6BEcGroLZAu
5XcTHz4za+zoz+SkuIhTpz1s2yeip2EACokS4TFsHHPTIzwfQzs3Vbjod9/HLFPT
74HCoGA4mo6LywX6IFbhv6AB4OAihDtI5mMiA4oAynhtkHzUM4Y2NwSzzHBV5DVn
rAXh0OJCL28T981UkZJcb4Mmxos8v0JhdXTIeHG0F7vdtJNzU2oIt69ilst5Z4V8
IcpDdfoeeCh5fWpgrbZiQxaXqgLvwHPQhyXD2lpKehSMS2/FD4Epbu94WVdugRl4
hwcA/Lwlw+aP3D8fs14FuqmWLTaiBPhVTGvQ12Qppql7nqkpIGNQz9fDEn1JSPPB
4B70PTEtMOWeUHplsJcab/MYUfZVKF35B7LO9NyAh5n2AHsyt47py83HbLwo4gwM
TmdV4aiDgj8gXc1SSXfLOfU7c0h2xFsPCYy3xY+GWbqYFtrnjdvTZylO1G3uoq/v
/Ubq8d82qrVJI3ulnidXhxeR8PEfCX4A9xtQ29PqtClfvg1PRVoWyBYQCYN0SUmW
nxfwO4PITAtf5a+e01JnsTNcr8EQmjurWuXECAdhTS6esjXCaxwztO+dL2rI5Hk0
r2BuqDoeebTMpy366cQu7QGisAWzbtKwXveXyYWNoB+McpXqKgU=
=GxG4
-----END PGP SIGNATURE-----

--Sig_/C2RkByoz5wEuzOAQUcUL+Em--
