Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E995234C497
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 09:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhC2HJI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 03:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhC2HIh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 03:08:37 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0CFC061574;
        Mon, 29 Mar 2021 00:08:36 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id y6so13055613eds.1;
        Mon, 29 Mar 2021 00:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nsgDV40GpgMjdMBehMLStcFSCLaYlMp03YLRRXFE+RA=;
        b=VxMZ7dSGQEdi8XOeWO1BicR5PJXdG9cKLNO6DN3n22tMui9UBI2ot+5PlRjW6qjCKv
         kkBbSAt5V7Y3j3LRRAHs9H5M1AASRp+Z0Hk5xJi1S4YuPya4yGJbKEyVjLVJwaF7yUSG
         0dSr68sCJPigikcaTg4rQNISm5kZwfHkO1AA63bJmhSuCZoeaHbDHPH+bG98njKUO51r
         DWrZ9E5rabkL5rid66HlEq5PRQ6BbxQFNZiGztlvB/wDoo+FZaaKJ62YGqEi6DgrVzKY
         XHDB4llTrEMZTZoCXYzTSsygURQ0muMvLDFU3XRquFpzxTG+7rsX+wseLGmMjJiteyf9
         vZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nsgDV40GpgMjdMBehMLStcFSCLaYlMp03YLRRXFE+RA=;
        b=tdip2buGRf29y4+MwXp0v/MwDugYpV+YyVY5sxMD2p2iivXHD3LKoLvbJLOzRdMnRS
         h0ZSD+A9F9ucwccv5SEn07/lkIxxakcsSI3Y0BXBXV55DUczIjU4MbE1Ff5Z6ziKM5Be
         Td4e9DyMW2dvuRjKFsRxW3O1Ym91MeYxQm8A7f5Qksr603zvL1/THMyEIAlt2n6w37xc
         QI7UDIptbGB0uHazMa/sYaYXVdA6BVyUEJ4gzVOY2xATGkn39bkSJqaf/164IYpcEi4R
         TjCESYDaauw0XUQC/uuDFv6QfOufW9wy/3n7WsICuWDaSQfE3dJV2KH2SfOFJXVq3BGx
         VEgA==
X-Gm-Message-State: AOAM533HsrbrTcI+OgU/m/eB8mc21iqHt23oeENO58uzqYYmLBt/bduz
        xmO8YkB3pxSxKivEVr700ts=
X-Google-Smtp-Source: ABdhPJwEJT/07GJdbFQtJ2P6vX8qiUN2z0P2wCX/J/CoVqW4cmKzRx2ZrUQ7oHNCPgeOgptcmNi0Rw==
X-Received: by 2002:a05:6402:31a7:: with SMTP id dj7mr27411505edb.33.1617001715049;
        Mon, 29 Mar 2021 00:08:35 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n16sm8443196edr.42.2021.03.29.00.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 00:08:34 -0700 (PDT)
Date:   Mon, 29 Mar 2021 09:08:59 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Lyude Paul <lyude@redhat.com>
Cc:     nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Ben Skeggs <bskeggs@redhat.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Oleg Vasilev <oleg.vasilev@intel.com>,
        Mikita Lipski <mikita.lipski@amd.com>,
        Eryk Brol <eryk.brol@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>,
        Chris Park <Chris.Park@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>, Joe Perches <joe@perches.com>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Swapnil Jakhade <sjakhade@cadence.com>,
        Yuti Amonkar <yamonkar@cadence.com>,
        Jyri Sarha <jsarha@ti.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Matt Roper <matthew.d.roper@intel.com>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR NVIDIA TEGRA" 
        <linux-tegra@vger.kernel.org>,
        "moderated list:ARM/ZYNQ ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 05/20] drm/dp: Add backpointer to drm_device in
 drm_dp_aux
Message-ID: <YGF9C284EOaf/WZP@orome.fritz.box>
References: <20210326203807.105754-1-lyude@redhat.com>
 <20210326203807.105754-6-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="S4O2kq+aHqU/5PJ1"
Content-Disposition: inline
In-Reply-To: <20210326203807.105754-6-lyude@redhat.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--S4O2kq+aHqU/5PJ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 04:37:52PM -0400, Lyude Paul wrote:
> This is something that we've wanted for a while now: the ability to
> actually look up the respective drm_device for a given drm_dp_aux struct.
> This will also allow us to transition over to using the drm_dbg_*() helpe=
rs
> for debug message printing, as we'll finally have a drm_device to referen=
ce
> for doing so.
>=20
> Note that there is one limitation with this - because some DP AUX adapters
> exist as platform devices which are initialized independently of their
> respective DRM devices, one cannot rely on drm_dp_aux->drm_dev to always =
be
> non-NULL until drm_dp_aux_register() has been called. We make sure to poi=
nt
> this out in the documentation for struct drm_dp_aux.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
[...]
>  drivers/gpu/drm/tegra/dpaux.c                            | 1 +
[...]

Acked-by: Thierry Reding <treding@nvidia.com>

--S4O2kq+aHqU/5PJ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBhfQgACgkQ3SOs138+
s6HzSQ/9Eo9S9xJvfEMo3ZsjRgZiCwhHpK8p3ntNKOfVV0ipfpeo8vw4YguhWC10
loGRu6CMa+hJqNW3xt/Bhjsj3Wu15gLGcW2igvKlQIr8aNWpssLD3lNELgd2ousG
82a+SF/3ljYs/060sFVCTK782CM+kNBw0ODjoohQjNoO++D1Rr2T0oq85DR8SKcu
K+dCQR1V/D7bwL9d2/M9UHM4i9hlOkGUKkFOre0x9FyFeOAAXu4q7dfOg9FCkcU/
4nIFE8mzWkW4o/fNLiF757dB2llZXxOl+pXNOBye31oslqZxGI6tkJQsvof4sODq
s9Eo0qjPjR0rIXZDkVJCScM7yOH2PrzCiVQFTLutTBVuJ6vDd3dmnyzOzRMeqU8h
CRcPTECPt3lP77XvqptSH/qdGiylAy0nnIwbw+9/Q7ZZ4KQM6e9pcj/fiSqOocdv
bz044P8GPgO18yExiKM4xun4K9t6vJ6MckuHTZEG+16DrRsj6ybdxjBosdBiDN2T
OyusX77/sl2KXr9fHW+tWwrDavb7GJ8jpJzZqyxUJa5Tb/ZeVzoScwiSfsLV62Nb
JXM8KHUhdfKqOa9Yefaf2O4yGFwcF6PLpKlTPw73PlNqEyhxEBLDqFgb5q2pEXLF
uo9LCn/Bju7B/15eqK58g9OAN7no8PxXCmaiO7y6w4fjqsFPTjI=
=4qxj
-----END PGP SIGNATURE-----

--S4O2kq+aHqU/5PJ1--
