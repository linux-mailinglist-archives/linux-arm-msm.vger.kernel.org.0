Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEDD226D9B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 12:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgIQK4c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 06:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgIQK41 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 06:56:27 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C80C06174A;
        Thu, 17 Sep 2020 03:56:25 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id m6so1583900wrn.0;
        Thu, 17 Sep 2020 03:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=T7o1O276VNvFCMXreEbeFlPYMFMj08O5QtDTtLf9+io=;
        b=QB6L5K889Bo72oCmXlPEd6RO0QFJaiOuUuQYNXSbkbKHLE0z4jthWl14REa3WCR0Bt
         7IHiIFNeD/Ta+yo/4I3eoGqh6G9kDPeQAYogqalpiHtq8aE0N2vVL/nLfC8G7fyUISnI
         HqZvSuiNmgZzkTOCBFRSXTB+sPRscquK8BzaCBsBZW04/6qzVITT/XTRzNX58D5ubsqj
         EBCDdFzw/4/+qKJ5jqHMFDrIQ6SPZ7RFWRnZTqbCA2A8CuvrZLIiZY8CyMBMGu+cZPGz
         +Xk5dHOFs8kS9Gn7mKXA7wGo6jD27ynEwYEI2R76ZDPCy8bCgvVnpggr26rleQIwiHel
         X5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T7o1O276VNvFCMXreEbeFlPYMFMj08O5QtDTtLf9+io=;
        b=DmSlINLMxb0KEyiiBjVcuhWqY6vBU4ln0E4YkSKfJYgfqNgDHZIJCm7/R+/XvqGpfq
         w1Tan50t+ZFkpcv2USxct9kvA6OXj1Wzb94y0Dpy15PhHYd0GK24Nzr7Rv8gzRPbJ1wL
         egVvpb6dQyoFY6VpX/usojAGH3AywHHzCyD5yAjCtels+EsuM91OiP5aJhD9VdMLOafy
         5NPEwJnfEpIJINUN8MFI+61bl8W2oU8GOyjp4GHr23qHi1q9X3tBSBI4iX0sozBxeOo4
         rYd9Vs4osGzlGpHIH786gb+NhYJzUrL8xnYmPFT2LoikY/+Or68U/tVmaFpMkSTAFv+L
         rIRQ==
X-Gm-Message-State: AOAM530doNITuIpbOurnttu8PIjA2cciIUbXLnzUKaoGcecjGwHfstvU
        WWiGwR/2mX5SFJByhU/pCEc=
X-Google-Smtp-Source: ABdhPJwg7nkwQTaRBQuWwl0RcZSkUXHrdUc9WYlLoauvclz9jtCse6f5SG7t61si5y3RH63KecEA/w==
X-Received: by 2002:adf:e711:: with SMTP id c17mr32158269wrm.359.1600340183749;
        Thu, 17 Sep 2020 03:56:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id d83sm10820463wmf.23.2020.09.17.03.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:56:22 -0700 (PDT)
Date:   Thu, 17 Sep 2020 12:56:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        l.stach@pengutronix.de, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
        tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com,
        heiko@sntech.de, jonathanh@nvidia.com,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
        laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
        sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
        tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
        andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
        xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
        chris@chris-wilson.co.uk, matthew.auld@intel.com,
        tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com,
        sam@ravnborg.org, miaoqinglang@huawei.com,
        emil.velikov@collabora.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 14/21] drm/tegra: Introduce GEM object functions
Message-ID: <20200917105620.GK3515672@ulmo>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-15-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NqNl6FRZtoRUn5bW"
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-15-tzimmermann@suse.de>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--NqNl6FRZtoRUn5bW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 04:59:51PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in tegra.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tegra/drm.c | 4 ----
>  drivers/gpu/drm/tegra/gem.c | 8 ++++++++
>  2 files changed, 8 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--NqNl6FRZtoRUn5bW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jQNQACgkQ3SOs138+
s6HfWQ//YmrWsVV1CJUAgb5t2QX4pCrujVRekVE/g1njlA/b4hb8UrTwixaZox4k
Y6ALc4RAngHpnPoebK9HTtI7eQ6gV3NzTvOZN432iqInp8UuFdrqwY9hkRcS5ak9
gNSHqMgl0BAkIdZ7VM5EWvVcbSkWsGbOR2uTx45m3hieqf80Jlyto/yqcH8yHm0Y
dNhlRIxSS23lHF4c79jOtCPyJjF2DaErfz+qFiFLmdV60AjeCfl6LZZSuSNSbSNv
Ht8OICXXHv9dKx6IbgyAAJIf77DsMDyXHzNC6YxoBH1c1X3JgEinuNaj8h+ZXxrT
klWtayTZ15xforiBumJH+Zi23DA+95v6eigfHDVje5APtRHxDgdnNOhW6zRF049I
powiLvCaS10xJVB7+4DlXmvdJTRaw8jNMcOYR0Yyg5fwrbkjkHyFsi2iQyzclBEJ
KM5kjLzpgBQpaEgpsCqxY0TJ0/bU/VdL532UpAyCK7D9RxN8sdhfU7A4xuwwAeNP
t63YCPEKs9kd0rKW4W6tUOEm9IeNiHL0CL55oYNDUNk0ddTtmdlQkFKSOfDbGBwe
X3RtJeu0oG5S40RXucqy2J4BJO5tKcymjFb3xqjaCP8nDF3ozvgmq/Hu4+MWkeL7
b/rNCCE8o02rDlLqOHqxccc+bQXs6tQBkwI0mESWxpdRfBPoyt8=
=1YYz
-----END PGP SIGNATURE-----

--NqNl6FRZtoRUn5bW--
