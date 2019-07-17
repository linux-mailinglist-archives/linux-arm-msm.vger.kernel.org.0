Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF66F6BC22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2019 14:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfGQMKM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jul 2019 08:10:12 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52558 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfGQMKL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jul 2019 08:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=qmxMA4RysSder1S8jth4T88OnOSpbEJIB7B7uYAKJ/k=; b=pB3L39CVsuPDMnhecIfwxK/7y
        6zijNytb9GS/FdpG5XK1GF2d5b/FVdLzjzPEKTVLo9mHBWpKkd2gxAbl6GkE0i5qoMRJDsHedy3Wi
        FJiAbn9Zvp2HtpvyywWuITIXy2bgVP58BPUwNQwBwXBAoSZ/OIMCK5FtZeR/LsQDkoBpk=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hnil1-0000X0-A6; Wed, 17 Jul 2019 12:10:03 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 2DEFA2742BFD; Wed, 17 Jul 2019 13:10:02 +0100 (BST)
Date:   Wed, 17 Jul 2019 13:10:02 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: next/master boot: 265 boots: 17 failed, 243 passed with 4
 offline, 1 conflict (next-20190717)
Message-ID: <20190717121002.GD4459@sirena.org.uk>
References: <5d2f063c.1c69fb81.69fe8.9d45@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g7w8+K/95kPelPD2"
Content-Disposition: inline
In-Reply-To: <5d2f063c.1c69fb81.69fe8.9d45@mx.google.com>
X-Cookie: Fremen add life to spice!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 17, 2019 at 04:27:56AM -0700, kernelci.org bot wrote:

Today's -next fails to boot on a couple of apq8064 boards:

> arm:
>     qcom_defconfig:
>         gcc-8:
>             qcom-apq8064-cm-qs600: 1 failed lab
>             qcom-apq8064-ifc6410: 1 failed lab

In both cases it looks like the error handling when we fail to get the
firmware for the GPU is broken, we get a crash in the initialization
code shortly after failing to load some firmware:

[    4.608279] msm 5100000.mdp: Direct firmware load for qcom/a300_pm4.fw failed with error -2
[    4.614916] msm 5100000.mdp: [drm:adreno_request_fw] *ERROR* failed to load a300_pm4.fw
[    4.623229] 8<--- cut here ---
[    4.631111] Unable to handle kernel NULL pointer dereference at virtual address 00000088

...

[    4.665947] Workqueue: events deferred_probe_work_func
[    4.670532] PC is at msm_open+0x64/0x90
[    4.675656] LR is at _raw_write_unlock+0x20/0x4c

...

[    4.949553] [] (msm_open) from [] (drm_file_alloc+0x134/0x21c)
[    4.957703] [] (drm_file_alloc) from [] (drm_client_init+0xa8/0x124)
[    4.965162] [] (drm_client_init) from [] (drm_fb_helper_init.part.0+0x30/0x3c)
[    4.973411] [] (drm_fb_helper_init.part.0) from [] (msm_fbdev_init+0x50/0xb4)
[    4.982173] [] (msm_fbdev_init) from [] (msm_drm_bind+0x560/0x638)

Full details (including full boot logs) at:

	https://kernelci.org/boot/id/5d2ede2359b514a54b49e91b/
	https://kernelci.org/boot/id/5d2ede2759b514a54749e91d/

--g7w8+K/95kPelPD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0vEBkACgkQJNaLcl1U
h9Co9gf+IDIziv1tHjw50lc9hVtreMOZovfMw97vrZm8A56pu4VqAnxQWEbrQT3N
GIsAuEBoVxKY9QqzuncJg2s8M7eG8GKWpYAlA2xRL529zE/X0tnghCGhH+l41YJD
k+n2FyTAuTjL9j+prJQp6Xh28oehhSInPXGQojQ9CRaADlz6/VdCEVs26gAqd5lr
ziNZM/reduAjcGMw8V2aN1YWOTF+5BYH5C/awPogOnnMzU4ZHLzmRzNw7MwhSJ1Q
paK64FL4syNmOOi0NSY+y0i+ttt36EpT94FTMBGdbkY7jQG7/cJlFejvdM0PJxEq
k6/P+cMknnw/K05T+HazXJtgUdA+Dw==
=Fsap
-----END PGP SIGNATURE-----

--g7w8+K/95kPelPD2--
