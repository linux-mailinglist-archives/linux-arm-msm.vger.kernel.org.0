Return-Path: <linux-arm-msm+bounces-45678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4A5A17CD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 12:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07D50164C56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 11:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A275D1F1319;
	Tue, 21 Jan 2025 11:16:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61891BBBEA;
	Tue, 21 Jan 2025 11:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737458175; cv=none; b=c0A9DT9w1TIKmaorgqMcvOoOg04SXudPrc1mvgUUYLC/xfxzEbK1DXXhg1gw0WC/vSaHdTjVPaooaY5sK+XB4lMvEn4YEMH3tuUhrXj8saStteVdS5qhsj9mZoeMuYzyRgtw0zSJG2E20a8/A3wpYmi8YfxJ8fIjCYJBVRkWZb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737458175; c=relaxed/simple;
	bh=rQT8lxkiAOLFyzoZOxOlLOMYHlb9xir2NeN6od/wMWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrO9IG1QnbfVA6M/ewLI5/Uq+LLUdu22CtjHUu6J4JGhijBDo9dRtOZeZ8ZBfCrvgpitTYYJBZgIYH2nE1G/TUwyWhfWQIlclEg4fxuDO0rF1mK5drfEvtHN7A/4ZKB/A50FaH4VrYlU1ULth/kSu3e/JdhoPpOW34C7Ibk4hBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-29ff039dab2so3035343fac.3;
        Tue, 21 Jan 2025 03:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737458172; x=1738062972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXUdfGyq4c5FX1gamn0gc9cnARR4WPDnFMac/C/Y36A=;
        b=JmYetBktuj/IhyjjNTlmwO90BMR67EOVRI7CSiQnPBp+1r/ZjTiaS8XlUYNI1NHEMV
         7bh+Aij+y5W/27UvhFLy+yXCtnWuvKMNgj++vQjytuCLBS/jyywdG8g1VYQxLFVWrd/C
         WUeqYB4UOzRP8x7nmGHRHaQqJ+3w846t+JiIEE6o4cxt76NTCLfcpyYQy4g+n38Eg3VP
         N1n3HkhQTWK5kpJmfZNrlotm0eQGTXbt2Ay7vOdUinQ0s3/RN4+YfUjsONskhHK776IC
         z7HYGJ/xsRJ2PSMXaYdlNlUGwW4Kl3NgU3PfimSJxQtg6vI3bQHOJWTKJHVLWw7yWSsR
         2RGA==
X-Forwarded-Encrypted: i=1; AJvYcCU1JDj3H8NTBdOXL0Du5DXW6SetBDrpK4K2utF5RNMv/Avq1RMbVnb1r/FOG/k5OMyLYAeS2kkjLRB2qtc=@vger.kernel.org, AJvYcCW8rOh8dHC+CS+U+GML0HlLaROHb+BWXv9hGL1FcJko0dYHDWY5HJNThy71eYqPRYsbTo7lFCX7r6VBfhcBzZmGnVc=@vger.kernel.org, AJvYcCXY97DXBtrK3c8V5feWFwOtWO03KDqzRTtRWU3jyccMf3XuRq5jw/imI3OND+GKKl4Xl0rYJvD9RYdMNBb8@vger.kernel.org, AJvYcCXpg5JRpnxAqUEvCMg5x6JIdsMeMYYxGHccO5FCh5Oyx5Uz93T9IMmpq5seU6c82VQ9J11k32rhN9K7MLEh@vger.kernel.org
X-Gm-Message-State: AOJu0YzLO25BSUQoxvrteXRUQjxc0GDNkcTpkzPFrfgz6nc49zGR8o0b
	TnDMI1mQaO/YgCuBortLkqL5QbDbRVVG8kdxo1tbKv9K/Q+zeE6O6/Iq35ep
X-Gm-Gg: ASbGncs2pNDmb4RPGKSHG+RFjVg+5YZXl01FTMsKvN4pV1nSHcCBwjWeOx5fxz3fvuF
	CH9vq/O2AmN02+8Z2FKuvajhnMXtXWCItNUbtZyR2+nMLFgZ4wgeOfkFvxql8oDTKypmPAfnRdE
	9lgjMXb3cU7yyfCcRzD9XDXtpispKXGRkQ0isTCn2XWpii5eYCUezyvk2UBGBVJepOLtmdFvg4G
	8zvmPRPaEBVXtrOyhj/5e64jvqTOHtR19+iEtFv5uGldqp18GHpWDOHDb0AY7580pTK0/V5s6FG
	WnyNVE5v0bJNHoFwnG3rfxBViAKCmZil
X-Google-Smtp-Source: AGHT+IGCiozG912G0w8Xb/iaQxOPDOUZCqhHDGWPhNnONO9I9MjGXtzqyt5ZE+f+YV0OwmycOa1pbw==
X-Received: by 2002:a05:6870:7e87:b0:28c:8476:dd76 with SMTP id 586e51a60fabf-2b1c0c54085mr10832893fac.29.1737458172093;
        Tue, 21 Jan 2025 03:16:12 -0800 (PST)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b1b8c8aa58sm3609779fac.9.2025.01.21.03.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 03:16:10 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-29ff039dab2so3035324fac.3;
        Tue, 21 Jan 2025 03:16:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGGWYo7/9sq9zGz/JVCs9euXkiomDHjwkQAXWRQca+hURJBgG1y2Qs6NbMm/mz5SRG8U4SYDissVM0L+4=@vger.kernel.org, AJvYcCWLfA1DzHqlGjjmVEMWq/e9N2JGkd2IpLyPHu8ix6GkGyvJKypF29uPO8xIJlV6Nh8ILxwX9CPSkG/UsFRGZaaU5WI=@vger.kernel.org, AJvYcCX/9TuzMztbz9cRObH1fHgSPGVkkq/1gmgenCutvXxUv8WmLvoZkDgTgMnskfa04qgh5BHqx1hQUyw1dh0P@vger.kernel.org, AJvYcCXBoSNywyvjX+b2YfaVcBxQXjfwSzpVKGJ6dUN3TPbS/7/sgDbAa8MFFB85U6I7ol9Fa7WZZi2Ri9FGvb0f@vger.kernel.org
X-Received: by 2002:a05:6102:1625:b0:4b2:ad50:a99c with SMTP id
 ada2fe7eead31-4b690b86c0fmr12441756137.2.1737457837255; Tue, 21 Jan 2025
 03:10:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
 <173624946815.1500596.321177900833598022.b4-ty@linaro.org>
 <CAMuHMdVwcaY2Fgpf7GYhBrE5B+AEg=v0BH4OjMXgnp=wqjxmKg@mail.gmail.com> <CAA8EJpos0HQpr9P4XRkto0Jy+Anf1xEH2xhEU8wtCyUQd+XwMg@mail.gmail.com>
In-Reply-To: <CAA8EJpos0HQpr9P4XRkto0Jy+Anf1xEH2xhEU8wtCyUQd+XwMg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jan 2025 12:10:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-9F9aypY_XeU3y=dn3AAxjFrZO+H+=hbMF7nGrTLAQQ@mail.gmail.com>
X-Gm-Features: AbW1kvZBx44easXhFOatWXKdq1_QMeY-mb30d2zlnMs06wKR4MmvmnSlyypmVlE
Message-ID: <CAMuHMdW-9F9aypY_XeU3y=dn3AAxjFrZO+H+=hbMF7nGrTLAQQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
	Martyn Welch <martyn.welch@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Jani Nikula <jani.nikula@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

CC sfr

On Tue, Jan 21, 2025 at 11:44=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Tue, 21 Jan 2025 at 11:13, Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
> > On Tue, Jan 7, 2025 at 12:31=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > > On Sat, 14 Dec 2024 15:37:04 +0200, Dmitry Baryshkov wrote:
> > > > While working on the generic mode_valid() implementation for the HD=
MI
> > > > Connector framework I noticed that unlike other DRM objects
> > > > drm_connector accepts non-const pointer to struct drm_display_mode,
> > > > while obviously mode_valid() isn't expected to modify the argument.
> > > >
> > > > Mass-change the DRM framework code to pass const argument to that
> > > > callback.
> > > >
> > > > [...]
> > >
> > > Applied to drm-misc-next, thanks!
> > >
> > > [1/5] drm/encoder_slave: make mode_valid accept const struct drm_disp=
lay_mode
> > >       commit: 7a5cd45fab0a2671aa4ea6d8fb80cea268387176
> > > [2/5] drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid=
()
> > >       commit: b255ce4388e09f14311e7912d0ccd45a14a08d66
> > > [3/5] drm/sti: hda: pass const struct drm_display_mode* to hda_get_mo=
de_idx()
> > >       commit: 5f011b442006ccb29044263df10843de80fc0b14
> > > [4/5] drm/connector: make mode_valid_ctx take a const struct drm_disp=
lay_mode
> > >       commit: 66df9debcb29d14802912ed79a9cf9ba721b51a4
> > > [5/5] drm/connector: make mode_valid take a const struct drm_display_=
mode
> > >       commit: 26d6fd81916e62d2b0568d9756e5f9c33f0f9b7a
> >
> > I cannot find these in drm-misc or drm-next, but they are in drm-tip?
>
> These are in drm-misc/drm-misc-next, the commit IDs are a part of the
> Git history.
>
> > The last one due to commit 2bdc721917cf141f ("Merge remote-tracking
> > branch 'drm-misc/drm-misc-next' into drm-tip").
> >
> > What am I missing?
> > Thanks!
>
> It might be some kind of misinteraction between drm-misc-next vs
> drm-misc-next-fixes vs merge window. Let me recheck dim rebuild-tip.

I indeed see the commit in
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/include=
/drm/drm_modeset_helper_vtables.h?ref_type=3Dheads

[diving deeper]

So I missed the change from the for-linux-next to the drm-misc-next
branch.  Hence I fetched only the former, and was using a stale
version of the latter.

Apparently Stephen is also using the old branches for linux-next:

    drm-misc-fixes git
https://gitlab.freedesktop.org/drm/misc/kernel.git#for-linux-next-fixes
    drm-misc git
https://gitlab.freedesktop.org/drm/misc/kernel.git#for-linux-next

I believe the latter should be drm-misc-next.
Should the former be drm-misc-fixes or drm-misc-next-fixes? Or both?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

