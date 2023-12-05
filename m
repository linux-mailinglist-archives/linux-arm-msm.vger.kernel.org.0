Return-Path: <linux-arm-msm+bounces-3466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 875B58059A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 17:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CDAAB20B0C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 16:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5B363DCC;
	Tue,  5 Dec 2023 16:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OP4Ih/nD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D3863DFB
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 16:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834ECC433CA;
	Tue,  5 Dec 2023 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701792827;
	bh=gXKpb1Ixf2kg9FnJXAETERZ9m2h20VDJnVskmUtO3dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OP4Ih/nDAMDspXT+dgYEbiY5NAmkiwT1Iw1fWLbvRTsxKIaJX3ZbjbA1r1aDobgIy
	 QadYjgwl86seHhdUOxwebxf/yoaRHs/dLHcKn4GKwYWztznaqi2XiReutw0jgf8si7
	 aVfN6aB2wyGPtprIt99w1aEdT55sUXJWb2VltRE4o92qV5KoHfrkszWXVq3A4Qr+/r
	 kofrPDin14Sr/tXQHCAdDF0S+YF3Kzfq5SWbTosVxxx6Pk1ruQeuzODeeXu0MY09u3
	 OVkp/TSE8/9h/Z7L6+p5mX9/Q7+VJlbPxPIIY58TmQMw+qCPwXRedZFzpjsxgCKdpD
	 9Fjmyxrx5/i/Q==
Date: Tue, 5 Dec 2023 16:13:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND v2 1/3] drm/encoder: register per-encoder debugfs
 dir
Message-ID: <9ecab61b-1e79-464b-b3e2-ff3af8aee537@sirena.org.uk>
References: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
 <20231203115315.1306124-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U5bczdTbx5m9sjAu"
Content-Disposition: inline
In-Reply-To: <20231203115315.1306124-2-dmitry.baryshkov@linaro.org>
X-Cookie: Fremen add life to spice!


--U5bczdTbx5m9sjAu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 03, 2023 at 02:53:13PM +0300, Dmitry Baryshkov wrote:

> Each of connectors and CRTCs used by the DRM device provides debugfs
> directory, which is used by several standard debugfs files and can
> further be extended by the driver. Add such generic debugfs directories
> for encoder.

Today's -next fails to boot an imx_v6_v7_defconfig on at least the UDOO
dual and quad platforms, based on i.MX6DL and i.MX6Q respectively.
multi_v7_defconfig looks fine on the same boards, it's just the i.MX
specific config that's failing.  Nothing else in my CI appears impacted.
We get a NULL pointer defererence while bringing up the display
subsystem:

[    1.392715] imx-drm display-subsystem: bound imx-ipuv3-crtc.7 (ops 0xc0f9a490)
[    1.400013] imx-drm display-subsystem: bound 120000.hdmi (ops 0xc0f9af80)
[    1.407193] 8<--- cut here ---
[    1.410256] Unable to handle kernel NULL pointer dereference at virtual address 00000010 when read

...

[    1.891882]  drm_debugfs_encoder_add from drm_encoder_register_all+0x20/0x60
[    1.898954]  drm_encoder_register_all from drm_modeset_register_all+0x34/0x70
[    1.906116]  drm_modeset_register_all from drm_dev_register+0x140/0x288
[    1.912765]  drm_dev_register from imx_drm_bind+0xd0/0x128
[    1.918284]  imx_drm_bind from try_to_bring_up_aggregate_device+0x164/0x1c4
[    1.925275]  try_to_bring_up_aggregate_device from __component_add+0x90/0x13c

Full log at:

   https://lava.sirena.org.uk/scheduler/job/308781

A bisect identfied this patch (in -next as caf525ed45b4960b4) as being
the commit that introduced the issue, bisect log below.  I've not done
any other investigation but the commit does seem plausibly related to
the backtrace in the oops.

git bisect start
# good: [cc1b39317a57120651840e79b535594ee09f5768] Merge branch 'for-linux-next-fixes' of git://anongit.freedesktop.org/drm/drm-misc
git bisect good cc1b39317a57120651840e79b535594ee09f5768
# bad: [0f5f12ac05f36f117e793656c3f560625e927f1b] Add linux-next specific files for 20231205
git bisect bad 0f5f12ac05f36f117e793656c3f560625e927f1b
# good: [8390406ed4d9d360bc404a5a3e9b82f335a8d417] Merge branch 'main' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
git bisect good 8390406ed4d9d360bc404a5a3e9b82f335a8d417
# bad: [b948f47bf8abdaf87f74c553b589c50567090aa2] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git
git bisect bad b948f47bf8abdaf87f74c553b589c50567090aa2
# bad: [dce94061f0d02f5ab355390a6e63d3dbea938b72] drm/v3d: Fix missing error code in v3d_submit_cpu_ioctl()
git bisect bad dce94061f0d02f5ab355390a6e63d3dbea938b72
# good: [0d3abd456be45369235dd75793ce26f07900044c] drm/imagination: vm: fix drm_gpuvm reference count
git bisect good 0d3abd456be45369235dd75793ce26f07900044c
# good: [f52ffea0745943bb6af674f30f4243b3721b7cd6] drm/i915/iosf: Drop unused APIs
git bisect good f52ffea0745943bb6af674f30f4243b3721b7cd6
# good: [b101d08451de6eaebd1a840e4885ce7ce73656ad] drm/nouveau: Removes unnecessary args check in nouveau_uvmm_sm_prepare
git bisect good b101d08451de6eaebd1a840e4885ce7ce73656ad
# good: [63ee44540205d993854f143a5ab1d7d9e63ffcf1] dma-buf/sync_file: Add SET_DEADLINE ioctl
git bisect good 63ee44540205d993854f143a5ab1d7d9e63ffcf1
# good: [e4256751df4a0a3860f181588ee730dd19cb0c30] drm/display/dp: Add the remaining Square PHY patterns DPCD register definitions
git bisect good e4256751df4a0a3860f181588ee730dd19cb0c30
# good: [2bcca96abfbf89d26fc10fc92e40532bb2ae8891] soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
git bisect good 2bcca96abfbf89d26fc10fc92e40532bb2ae8891
# bad: [b881ba8faa5c7689eb1cb487ad891c46dbbed0e8] Revert "drm/atomic: Move framebuffer checks to helper"
git bisect bad b881ba8faa5c7689eb1cb487ad891c46dbbed0e8
# bad: [caf525ed45b4960b450cbd4e811d9b247bc2586c] drm/encoder: register per-encoder debugfs dir
git bisect bad caf525ed45b4960b450cbd4e811d9b247bc2586c
# good: [7d9f1b72b29698e3030c2b163522cf4aa91b47e9] usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
git bisect good 7d9f1b72b29698e3030c2b163522cf4aa91b47e9
# first bad commit: [caf525ed45b4960b450cbd4e811d9b247bc2586c] drm/encoder: register per-encoder debugfs dir

--U5bczdTbx5m9sjAu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVvTDQACgkQJNaLcl1U
h9B9Jgf/WPHhqNwJhTNvSD4NXPpB5o+4CieBO6XfTA8kEhXRzDthZ28KMxz7pZ29
LuAQGuqimxLjAbwA34t9HaKwk9r0JA49fx50eDVQzmKRazHgTkt0w5DJOE0vf/j9
NZbDDcdRw2lnWQt6VLfdU/ExB1M5zv8xcZwyYts5U7Ebq7+NuEG+7Ogha5L29M1K
qijDIO2G6+TNRuRHgsKUPZbNRmvxLuIicsqmKaBPYv/NgEOYXMplmpBzX79xy8Q7
PNuYWba5DM6iJGrpM7j7DQDvZFebnbErK8APtAvuzxZvRa1iKXuc3nxQXTwv9x21
AfyqIIwzmEYS2Pnlboh0QnVornaQMg==
=dug8
-----END PGP SIGNATURE-----

--U5bczdTbx5m9sjAu--

