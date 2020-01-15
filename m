Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 964B513D09A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2020 00:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730385AbgAOXSb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 18:18:31 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:33945 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgAOXSa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 18:18:30 -0500
Received: by mail-qv1-f67.google.com with SMTP id o18so8237746qvf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 15:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UpvlowCsrupkOKWs9KxGBnIKBt8PC3L4e1k91b9xY8g=;
        b=ggiCur99WNdd3h4Jf4LjYSQuVDYl4E6Qhn75niLIA1NPB53AMADsLKzA2B0KWaFAgK
         WFdXvlt8+DPByk1ih4xrHxBRcbkgz8qO9bswwNFGfsUZbRPo6b31am0pz1xefAjLntlP
         uS2VLS0/f9yaf0r1KeNFzFOIWhIAWTtphEDLkK0QbnbDqESvryo3WHfDJWJp/YgjeMX8
         G4rJ5JOftvLz/NJO6YhYNgP5TPucnRvGTEhwzgTGl3mcbiN7czbucknxIere/2OP3t5W
         X7kxJchchRsKbf3x3F4QS9BWapPAyaftRs+PH7uwnZWV5h0kpf6jYwM0+M6v3GOQosJF
         H8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UpvlowCsrupkOKWs9KxGBnIKBt8PC3L4e1k91b9xY8g=;
        b=QMN2z/ZRyKhCTyVACenkBw56gYkM3E1ceG4x73ERHh/d0k92iv4gYxcGXAQLF+4MXf
         9PFWH/rlHvDuaVILo076KzNsjGQ15Bjl+q1cKXQAMgLquldqIjk/55qcR9VtvGMjYWIS
         tdewdj7fWm+Ro/b6F3BycRrtns1hJXyx0x062i2lli9xTkAJF9LnGnR9HfzQcbBdH0VI
         0xF60o8cTXUisdmr3z050YMI0OXIN86G67e+8nE/tZyvU2WrNLZSNWeeSc0uHpLbJjRk
         AIGSMpYhaEXGOApOIpCknx2+O48RpzHpVYpDzqvl3nWjIIep/ip2n5rmKYM4n4f6QQBH
         MOOQ==
X-Gm-Message-State: APjAAAUX4HT2GcSHt4mF0yXh/0xA6Gg4LJX8x9WmTFuH8ADi6ndvJ45T
        7XtPPR4b1jKUWDXcM8KVLDI=
X-Google-Smtp-Source: APXvYqx/GPl8/eYOnPUqiqDbqgb1g3EZTxvoIVWy4jSW/CyzNiZv5vi33T3StFjkwqyaO4BHiF+Vxw==
X-Received: by 2002:a05:6214:20c:: with SMTP id i12mr28835407qvt.48.1579130309513;
        Wed, 15 Jan 2020 15:18:29 -0800 (PST)
Received: from smtp.gmail.com ([165.204.55.250])
        by smtp.gmail.com with ESMTPSA id d5sm10518385qtk.96.2020.01.15.15.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 15:18:28 -0800 (PST)
Date:   Wed, 15 Jan 2020 18:18:23 -0500
From:   Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
        christian.koenig@amd.com, David1.Zhou@amd.com,
        maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
        robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
        vincent.abriou@st.com, yannick.fertre@st.com,
        philippe.cornu@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, eric@anholt.net, hamohammed.sa@gmail.com,
        linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
        bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 19/21] drm/vkms: Convert to CRTC VBLANK callbacks
Message-ID: <20200115231823.v6uyxtgxnfgwmsqq@smtp.gmail.com>
References: <20200115121652.7050-1-tzimmermann@suse.de>
 <20200115121652.7050-20-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mkcm5mxh5ewyz3eu"
Content-Disposition: inline
In-Reply-To: <20200115121652.7050-20-tzimmermann@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--mkcm5mxh5ewyz3eu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the patch, I reviewed and tested it. Everything looks fine
for VKMS.

Reviewed-by: Rodrigo Siqueira <rodrigosiqueira@gmail.com>
Tested-by: Rodrigo Siqueira <rodrigosiqueira@gmail.com>

On 01/15, Thomas Zimmermann wrote:
> VBLANK callbacks in struct drm_driver are deprecated in favor of
> their equivalents in struct drm_crtc_funcs. Convert vkms over.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 9 ++++++---
>  drivers/gpu/drm/vkms/vkms_drv.c  | 1 -
>  drivers/gpu/drm/vkms/vkms_drv.h  | 4 ----
>  3 files changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms=
_crtc.c
> index 74f703b8d22a..ac85e17428f8 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -76,10 +76,12 @@ static void vkms_disable_vblank(struct drm_crtc *crtc)
>  	hrtimer_cancel(&out->vblank_hrtimer);
>  }
> =20
> -bool vkms_get_vblank_timestamp(struct drm_device *dev, unsigned int pipe,
> -			       int *max_error, ktime_t *vblank_time,
> -			       bool in_vblank_irq)
> +static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
> +				      int *max_error, ktime_t *vblank_time,
> +				      bool in_vblank_irq)
>  {
> +	struct drm_device *dev =3D crtc->dev;
> +	unsigned int pipe =3D crtc->index;
>  	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(dev);
>  	struct vkms_output *output =3D &vkmsdev->output;
>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> @@ -154,6 +156,7 @@ static const struct drm_crtc_funcs vkms_crtc_funcs =
=3D {
>  	.atomic_destroy_state   =3D vkms_atomic_crtc_destroy_state,
>  	.enable_vblank		=3D vkms_enable_vblank,
>  	.disable_vblank		=3D vkms_disable_vblank,
> +	.get_vblank_timestamp	=3D vkms_get_vblank_timestamp,
>  	.get_crc_sources	=3D vkms_get_crc_sources,
>  	.set_crc_source		=3D vkms_set_crc_source,
>  	.verify_crc_source	=3D vkms_verify_crc_source,
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 25bd7519295f..860de052e820 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -103,7 +103,6 @@ static struct drm_driver vkms_driver =3D {
>  	.dumb_create		=3D vkms_dumb_create,
>  	.gem_vm_ops		=3D &vkms_gem_vm_ops,
>  	.gem_free_object_unlocked =3D vkms_gem_free_object,
> -	.get_vblank_timestamp	=3D vkms_get_vblank_timestamp,
>  	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
>  	.gem_prime_import_sg_table =3D vkms_prime_import_sg_table,
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 7d52e24564db..eda04ffba7b1 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -111,10 +111,6 @@ struct vkms_gem_object {
>  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  		   struct drm_plane *primary, struct drm_plane *cursor);
> =20
> -bool vkms_get_vblank_timestamp(struct drm_device *dev, unsigned int pipe,
> -			       int *max_error, ktime_t *vblank_time,
> -			       bool in_vblank_irq);
> -
>  int vkms_output_init(struct vkms_device *vkmsdev, int index);
> =20
>  struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> --=20
> 2.24.1
>=20

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--mkcm5mxh5ewyz3eu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl4fnb8ACgkQWJzP/com
vP/gKw/+MnM27NT0QpqQpa6WMwn9PCq/07UFLOG7BuTGP2CvZOJv8Tma7U6bu9Sf
Z3IwiMYNJV8FJtwdRd+BTThIYGPTtofxsJ2R3ybhUj/VEeUaEhC2ifzwVrphEePR
3/b4QFlf/vrMfsdJSOSam6vvaiI+jE4X1ZASrUKbcl5w9KeBhs2VmcwVKmtqQgaD
YHWIWUwiwsd544GltP+mx7qxZ5+ZHVC+OuJq/GNzhwD9MyXTliBcM6nov+FPV/HE
aT4WrhBCiDHhISO9sTYPqiV6Vo7XV6sPzDMFncNqueMwP4qQr/mFebxPtlUtPYOO
jwg0ZTq/6KL+QeJM55Ygg0cvVUvG14G8ZSktb4s7rPRWE4k7/DZWP2w/xP1xVsoP
H+Q2jvjTV1qu+G2A7vtP2gYBsCx7WoYfIoR045pAIEKEz5FLF38GFY04uS/T0M3u
eez0yNDC1EojMWeTTPM5Lm7MCUPx7sR6V14gGDDVs/QBmZpgyJkWj4unYBCwk9Ge
oMSZkUhnnJT4FutLRaJk0awg7iMw7yj4XNJgKB1vEVwS2/RkJ6jrgw/PoihwOBLZ
Gmm6Ys+btER/e9zHA+u8Z5z0guAkI8r9H8ikMtqSza6RipedsEIrncLV8U2l+hwT
ooPnCySDn8Xkw985ZR+/UW0I+FjjWDVdn3jmwcyRZ99fksmbvkY=
=KRlQ
-----END PGP SIGNATURE-----

--mkcm5mxh5ewyz3eu--
