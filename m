Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C97757A8B3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 20:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjITSK4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 14:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjITSKz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 14:10:55 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30200B9;
        Wed, 20 Sep 2023 11:10:49 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5315b70c50dso6309a12.2;
        Wed, 20 Sep 2023 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695233447; x=1695838247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFCwoqBEbTb9cUmKdEpc9iM6eMktMquvdsWTtPGs36w=;
        b=RnyXTvw6oPw3HcZgORHXFZ4AKW/Hesk7tGCul11KWOR1BWzf+FwG/YV1jXYiigve2J
         iKELSQc1nAI7JQ2YoyGvUuVk83afJ72mYJoW6NS4t8YSa4yUIVP5K3pfeOoetYuzs2cn
         d8YIoC6Gd+OPYwvvG+6BuDU07QLRJo+rYwE4jh1ILWMNf+j/az0A3d0tYktZg9RsiqCR
         tg69gjLMH9ltTddxsnHj2mujio5urC4J3daKbLeXV72hllT9UfbUGEWmBym5HUYFb4V4
         IoePBOWZChiNHXkR29qNoZ/i9j6QRdzjiVtjLKorJKHDUmWm3TkGbbdAyQIB8vNAP5FX
         H2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695233447; x=1695838247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFCwoqBEbTb9cUmKdEpc9iM6eMktMquvdsWTtPGs36w=;
        b=HyAihSfLpQJ08vHuGe3jXRGaDOm+rgY9Awdn9NEspHS8ifa8SLDyn9yRZBEOX3Oj82
         OLoLeeLZwEP2ChB+XUZZKUOOS7CV1Nkxg4AVqATRhjYE6ldYhL4PUGZOORzGPHihEv6U
         C+Zrt4d6ZQgiijvPh3SR6jk+T4i9v43tojgjTuXR2HrB9HCya60Xitp2e/17nAdt1Hyt
         ASC8T3nWka3ztKVlyN/pKgs1V+NL/wMAlEYOxqL5/1lnlmIUypjK33Osuq7YKPvnyIyE
         k5o6phD40KDpHkd2apOwN1BuZL2CnegDQPvLXdB7lm1Jt3gc0VHG4b9d7pHXdqnxWlcu
         mNqg==
X-Gm-Message-State: AOJu0YxSjOkBR1tmmzXbo+dX4xo1Klp+m34b6t1/+E0zDFyO/kw56oei
        w1SkxEqvM5b5ujKkNdhMzXrm6itnKXfsLEmsMUjrD9NzMftztw==
X-Google-Smtp-Source: AGHT+IGvrluFGLkEXJRZqnM83QzVou0ohq417mcDyZKqSZ2203UauDMV6yRgSkkwhgNihOIKvhs8X5Bh211MUr/TDrc=
X-Received: by 2002:aa7:c995:0:b0:52f:a42a:85a3 with SMTP id
 c21-20020aa7c995000000b0052fa42a85a3mr3053452edt.0.1695233447334; Wed, 20 Sep
 2023 11:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230920180526.137369-1-robdclark@gmail.com>
In-Reply-To: <20230920180526.137369-1-robdclark@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 20 Sep 2023 11:10:35 -0700
Message-ID: <CAF6AEGvUOX-D+-vwov-FDp46rJdo8wq1Do-9Gj3k5v313wVJhA@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: Uprev IGT to pull in fixes
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Helen Koike <helen.koike@collabora.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Daniel Stone <daniels@collabora.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Rockchip SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" 
        <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 20, 2023 at 11:06=E2=80=AFAM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> There have been a few igt test fixes compared to the commit that we were
> currently using.  Pull in a newer igt and update expectations.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml               |  2 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |  4 ++--
>  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt   | 11 -----------
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt   |  2 +-
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt   |  1 -
>  drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt | 18 +-----------------
>  .../drm/ci/xfails/rockchip-rk3288-fails.txt    |  2 ++
>  7 files changed, 7 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab=
-ci.yml
> index 2c4df53f5dfe..3ecb5879e80f 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>    UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>    TARGET_BRANCH: drm-next
>
> -  IGT_VERSION: 471bfababd070e1dac0ebb87470ac4f2ae85e663
> +  IGT_VERSION: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7
>
>    DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner=
.git
>    DEQP_RUNNER_GIT_TAG: v0.15.0
> diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/=
gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
> index bd9392536e7c..bab21930a0d4 100644
> --- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
> @@ -1,7 +1,6 @@
>  kms_addfb_basic@bad-pitch-65536,Fail
>  kms_addfb_basic@bo-too-small,Fail
>  kms_async_flips@invalid-async-flip,Fail
> -kms_atomic@plane-immutable-zpos,Fail
>  kms_atomic_transition@plane-toggle-modeset-transition,Fail
>  kms_bw@linear-tiling-1-displays-2560x1440p,Fail
>  kms_bw@linear-tiling-1-displays-3840x2160p,Fail
> @@ -11,9 +10,10 @@ kms_color@degamma,Fail
>  kms_cursor_crc@cursor-size-change,Fail
>  kms_cursor_crc@pipe-A-cursor-size-change,Fail
>  kms_cursor_crc@pipe-B-cursor-size-change,Fail
> -kms_cursor_legacy@forked-move,Fail
>  kms_hdr@bpc-switch,Fail
>  kms_hdr@bpc-switch-dpms,Fail
>  kms_plane_multiple@atomic-pipe-A-tiling-none,Fail
>  kms_rmfb@close-fd,Fail
>  kms_rotation_crc@primary-rotation-180,Fail
> +kms_flip@flip-vs-modeset-vs-hang,Fail
> +kms_flip@flip-vs-panning-vs-hang,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt b/drivers/gpu/d=
rm/ci/xfails/i915-apl-fails.txt
> index 46397ce38d5a..2e3b7c5dac3c 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
> @@ -8,13 +8,6 @@ kms_bw@linear-tiling-3-displays-3840x2160p,Fail
>  kms_bw@linear-tiling-4-displays-1920x1080p,Fail
>  kms_bw@linear-tiling-4-displays-2560x1440p,Fail
>  kms_bw@linear-tiling-4-displays-3840x2160p,Fail
> -kms_color@ctm-0-25,Fail
> -kms_color@ctm-0-50,Fail
> -kms_color@ctm-0-75,Fail
> -kms_color@ctm-max,Fail
> -kms_color@ctm-negative,Fail
> -kms_color@ctm-red-to-blue,Fail
> -kms_color@ctm-signed,Fail
>  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
> @@ -38,8 +31,6 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-ups=
caling,Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,=
Fail
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fai=
l
>  kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
> -kms_hdmi_inject@inject-4k,Timeout
> -kms_plane@plane-position-hole,Timeout
>  kms_plane_alpha_blend@alpha-basic,Fail
>  kms_plane_alpha_blend@alpha-opaque-fb,Fail
>  kms_plane_alpha_blend@alpha-transparent-fb,Fail
> @@ -53,6 +44,4 @@ kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
>  kms_plane_alpha_blend@pipe-C-alpha-opaque-fb,Fail
>  kms_plane_alpha_blend@pipe-C-alpha-transparent-fb,Fail
>  kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
> -kms_plane_multiple@tiling-y,Timeout
> -kms_pwrite_crc,Timeout
>  kms_sysfs_edid_timing,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/d=
rm/ci/xfails/i915-cml-fails.txt
> index 6139b410e767..13c0a25fc627 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
> @@ -1,4 +1,3 @@
> -kms_color@ctm-0-25,Fail
>  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
> @@ -16,3 +15,4 @@ kms_plane_alpha_blend@alpha-basic,Fail
>  kms_plane_alpha_blend@alpha-opaque-fb,Fail
>  kms_plane_alpha_blend@alpha-transparent-fb,Fail
>  kms_plane_alpha_blend@constant-alpha-max,Fail
> +kms_async_flips@crc,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/d=
rm/ci/xfails/i915-tgl-fails.txt
> index a6da5544e198..27bfca1c6f2c 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
> @@ -8,7 +8,6 @@ kms_bw@linear-tiling-4-displays-3840x2160p,Fail
>  kms_bw@linear-tiling-5-displays-1920x1080p,Fail
>  kms_bw@linear-tiling-5-displays-2560x1440p,Fail
>  kms_bw@linear-tiling-5-displays-3840x2160p,Fail
> -kms_color@ctm-0-25,Fail
>  kms_flip@flip-vs-panning-vs-hang,Timeout
>  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
>  kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt b/drivers/gpu=
/drm/ci/xfails/msm-sc7180-skips.txt
> index 410e0eeb3161..e59a2fddfde0 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt

Side note, I noticed for sc7180-skips (and a lot of other boards) we have:

# Suspend to RAM seems to be broken on this machine
.*suspend.*

Locally I've not had problems with the suspend tests, I'm guessing the
actual issue is usb-ethernet vs nfsroot.  But maybe the filesys for
igt jobs is small enough that we can do initramfs instead?  Someone
should probably confirm what the root issue is and update the
comments, so developers aren't thinking that suspend is something that
needs to be debugged

BR,
-R


> @@ -4,20 +4,4 @@
>  # Test incorrectly assumes that CTM support implies gamma/degamma
>  # LUT support.  None of the subtests handle the case of only having
>  # CTM support
> -kms_color.*
> -
> -# 4k@60 is not supported on this hw, but driver doesn't handle it
> -# too gracefully.. https://gitlab.freedesktop.org/drm/msm/-/issues/15
> -kms_bw@linear-tiling-.*-displays-3840x2160p
> -
> -# Until igt fix lands: https://patchwork.freedesktop.org/patch/493175/
> -kms_bw@linear-tiling-2.*
> -kms_bw@linear-tiling-3.*
> -kms_bw@linear-tiling-4.*
> -kms_bw@linear-tiling-5.*
> -kms_bw@linear-tiling-6.*
> -
> -# igt fix posted: https://patchwork.freedesktop.org/patch/499926/
> -# failure mode is flakey due to randomization but fails frequently
> -# enough to be detected as a Crash or occasionally UnexpectedPass.
> -kms_plane_multiple@atomic-pipe-A-tiling-none
> +#kms_color.*
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/driver=
s/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
> index 2a1baa948e12..15ac861a58bf 100644
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
> @@ -46,3 +46,5 @@ kms_properties@connector-properties-legacy,Crash
>  kms_properties@get_properties-sanity-atomic,Crash
>  kms_properties@get_properties-sanity-non-atomic,Crash
>  kms_setmode@invalid-clone-single-crtc,Crash
> +kms_flip@flip-vs-modeset-vs-hang,Crash
> +kms_flip@flip-vs-panning-vs-hang,Crash
> --
> 2.41.0
>
