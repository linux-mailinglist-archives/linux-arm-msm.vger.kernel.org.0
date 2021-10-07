Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43860425326
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 14:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241261AbhJGMhu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 08:37:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241238AbhJGMht (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 08:37:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AAFA360F93;
        Thu,  7 Oct 2021 12:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633610156;
        bh=6N4+qgtMfBxspS0JmtTqIeZ5IOVPp5soyqeLUMpHPSE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bRwwZH5wCt6PdnH0bLE8X/7hjayq5WPI7EROZPn9tThH7u3t2Hxayiw6SNgVRVWIb
         kLX4mR10NcyLQJ1rLJb9JbxknYSSszwmxPPu6k2AkRtvUivNxOVBejrnziraGKM9q2
         ayNJMrQzulHIkt3shn88BvD0zj5flvSn5jHEydatSmgTGDpSonvUqP3VUnH5S5XJLX
         i3bJWglcaO1aDY+RtFCu13LyKSObSSferLGNQCO/rqZ55U46w/W+eRXGaLdmzeCWAh
         kQRxPb32QwTLkOFpuBsaMxKdqGB7eNTjV0PjAz6lcSw+o+SnVcfImMtHGhFzz4w5cB
         gGImsO/t1tG+g==
Date:   Thu, 7 Oct 2021 13:35:53 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Jaroslav Kysela <perex@perex.cz>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v2 31/34] ASoC: codecs: wcd938x: Migrate to aggregate
 driver
Message-ID: <YV7pqY2FMaYy7Vkq@sirena.org.uk>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-32-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1Flv7GPR/yQ1psFZ"
Content-Disposition: inline
In-Reply-To: <20211006193819.2654854-32-swboyd@chromium.org>
X-Cookie: Colors may fade.
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--1Flv7GPR/yQ1psFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 06, 2021 at 12:38:16PM -0700, Stephen Boyd wrote:
> Use an aggregate driver instead of component ops so that we can get
> proper driver probe ordering of the aggregate device with respect to all
> the component devices that make up the aggregate device.

Acked-by: Mark Brown <broonie@kernel.org>

--1Flv7GPR/yQ1psFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFe6agACgkQJNaLcl1U
h9BXYwgAhSJ8+Nsp/fnvma50fxoPjfxJlaILrA7KNR4UFgO76J6jeemfnwtDi7DE
jGs0zTwsvrRHcoqkLmc0pDv/zDc4uKIQuudO34AtZ6VHq0ZZ4mAFoIITNIUQuQoH
8OSes8CDhwe6a7jZqIhk60LbcQPuW83UefDgPsqO6jHZXFDE52Ix/YAnYvj3gLE3
b5sfypPKzUgntV6rlsvZ88N7TJZFuQEFFaE5k/DBZmA6ksuZvzsCxiK4JKFgpqir
16b+m/CPV5x/KNkJ3RLTqOMkkIs7N0Uu/k7ykroYdkRe9qBTrUCyJpM7JtFO/Ix6
8pSYl3GgK/QD+f05XZ4Yj7VcQWESPQ==
=XOZo
-----END PGP SIGNATURE-----

--1Flv7GPR/yQ1psFZ--
