Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46CD747BE68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Dec 2021 11:48:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234986AbhLUKs2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 05:48:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236020AbhLUKs1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 05:48:27 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43D0DC06173F
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 02:48:27 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id q14so12414078qtx.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 02:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cVpCMMIi1tjA4OyGU3rx8gElgVfE4GySRfg8ryIMmN8=;
        b=DHZFqLHpwwECYpmpjSbAFv2g/RJz3+GU0X5y2BawrdsD77J66lM/hvG7zCuLm4XP9D
         Om/bxxHq1rH/77o3J5bQwIFROdoO/zsgpFgTwFXDIrJ07Zo3uV1EuRgSk6+SQiL/AwdN
         3mmCQCL1ewUNvC1z1SE3qIUT/vpZ6WEFR53g2sq5ob8QSmRUNYSdYE3C7XmTU4O945Db
         nRFV8gm6NBQesTjgBgqHkyd7KeXItxc1QJQ/LDYUVQXR0TEAEolCw+xA5jGTV3ud3Nb+
         0PhM72i1NCGntNKZaqImwJvM8yrA0U1mQ7xlAfx9FF69eD8ZM2FfSUxDihF3moKM0jEv
         KA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cVpCMMIi1tjA4OyGU3rx8gElgVfE4GySRfg8ryIMmN8=;
        b=jMLNWehvAWOMvkij1LugSw+BV7NexKoQQhSdMpjENkWonpIGxMo3Xbd7RJmineutCu
         3uIThorAmJFgqs+xdSzcmVE5ILPD9cNb0LNPmHoBKop/yMoY4T0x01iU9Y9LS057ZCGc
         0+rcI0gJcEcXZRsBcSMwd0Zn3Iran5YyE3EdoPaQgC2QVF1eHthroZbgKNsgWd2aXW+S
         txYEKbRwIBh+CvsX0Ef491cTYxHQp8i7ODmsh+w3wLysw9PAlQb9EFnEZQmUbdE0RnhD
         ghrt5+b4CEZGJafmxWk91YZzY8xM7w/dZM+CKmykHDuDiu2es4pLLQBiCUA51FkT5HS4
         NGbA==
X-Gm-Message-State: AOAM530svgTZBM6jXQuGMqubD5c+Wl2dgffRRdmMDGk+pYgUPBQEMKwu
        jRANDFl459sDB4Ti+hMJrWbBH0r4Q86JwwpeosaFNw==
X-Google-Smtp-Source: ABdhPJy5w19aks3xmmYqzkFSMv593adNRGFMJdwvmZYgaWKN4laOQIB1b5WBGEwlb18pBRmgHk1a22fe2/49SigiVcI=
X-Received: by 2002:a05:622a:3ca:: with SMTP id k10mr1644590qtx.130.1640083706051;
 Tue, 21 Dec 2021 02:48:26 -0800 (PST)
MIME-Version: 1.0
References: <20211221101319.7980-1-jose.exposito89@gmail.com> <20211221101319.7980-2-jose.exposito89@gmail.com>
In-Reply-To: <20211221101319.7980-2-jose.exposito89@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Dec 2021 13:48:15 +0300
Message-ID: <CAA8EJppMsqot1isnMYeSWVJm4tC-PoqUDL9jwd5HJ72tca0HQQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/plane: Mention format_mod_supported in IN_FORMATS docs
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     robdclark@gmail.com, maarten.lankhorst@linux.intel.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        tzimmermann@suse.de, maxime@cerno.tech, mripard@kernel.org,
        wens@csie.org, jernej.skrabec@gmail.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Dec 2021 at 13:13, Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmai=
l.com> wrote:
>
> Adding format modifiers without implementing the function
> "drm_plane_funcs.format_mod_supported" exposes an invalid IN_FORMATS
> blob with modifiers but no formats to user-space.

I think the fix should be applied to the generic code. The docs at
drm_plane.h clearly state that this callback is optional:

         * This optional hook is used for the DRM to determine if the given
         * format/modifier combination is valid for the plane. This allows =
the
         * DRM to generate the correct format bitmask (which formats apply =
to
         * which modifier), and to valdiate modifiers at atomic_check time.
         *
         * If not present, then any modifier in the plane's modifier
         * list is allowed with any of the plane's formats.

So, one should fix the core code in create_in_format_blob() to include
all combinations.

>
> This breaks the latest Weston [1]. For testing purposes, I extracted the
> affected code to a standalone program [2].
>
> Make clear in the IN_FORMATS documentation that implementing
> "format_mod_supported" is mandatory.

format_mod_supported() being optional or mandatory should be
documented in the format_mod_supported() docs, not in the IN_FORMAT
docs.

>
> [1] https://gitlab.freedesktop.org/wayland/weston/-/blob/9.0/libweston/ba=
ckend-drm/kms.c#L431
> [2] https://github.com/JoseExposito/drm-sandbox/blob/main/in_formats.c
>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/drm_plane.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 82afb854141b..347571f8909a 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -126,8 +126,11 @@
>   * IN_FORMATS:
>   *     Blob property which contains the set of buffer format and modifie=
r
>   *     pairs supported by this plane. The blob is a struct
> - *     drm_format_modifier_blob. Without this property the plane doesn't
> - *     support buffers with modifiers. Userspace cannot change this prop=
erty.
> + *     drm_format_modifier_blob and the drm_plane_funcs.format_mod_suppo=
rted
> + *     function must be implemented by the driver to determine if the gi=
ven
> + *     format/modifier combination is valid for the plane. Without this =
property
> + *     the plane doesn't support buffers with modifiers. Userspace canno=
t change
> + *     this property.
>   *
>   *     Note that userspace can check the &DRM_CAP_ADDFB2_MODIFIERS drive=
r
>   *     capability for general modifier support. If this flag is set then=
 every
> --
> 2.25.1
>


--=20
With best wishes
Dmitry
