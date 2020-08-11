Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1432B241DB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 17:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728844AbgHKP6k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 11:58:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:53960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728797AbgHKP6j (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 11:58:39 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6473920756;
        Tue, 11 Aug 2020 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597161519;
        bh=8n/01n12WvJeXrMtt8X3n/lThM/2bNJzmPG1/GiBxD4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ehnKMjK+y2G4JLAfH72T5hWivRxjXsYnRitWYNtBDqBEJDjlWWy2wKsrLFmIhUmR7
         61lovTjNqZdfPsccku6Jmhw6CSChuK2ieMkdeYot/cWu2UWE9piATQWpwhlNlFqYaQ
         AuwxOaqy2wrscHjjr8nMCJPTJ/hAGuU1rYC6Pb60=
Date:   Tue, 11 Aug 2020 16:58:10 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mayulong <mayulong1@huawei.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 02/33] spmi, regulator, mfd: add drivers for hikey970
 SPMI PMIC
Message-ID: <20200811155810.GH6967@sirena.org.uk>
References: <cover.1597160086.git.mchehab+huawei@kernel.org>
 <36a548c10ea8c75d13c3e796c4cee65132819ef1.1597160086.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7J16OGEJ/mt06A90"
Content-Disposition: inline
In-Reply-To: <36a548c10ea8c75d13c3e796c4cee65132819ef1.1597160086.git.mchehab+huawei@kernel.org>
X-Cookie: Gravity is a myth, the Earth sucks.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--7J16OGEJ/mt06A90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 11, 2020 at 05:41:28PM +0200, Mauro Carvalho Chehab wrote:

>  drivers/mfd/hisi_pmic_spmi.c            | 759 ++++++++++++++++++++++++
>  drivers/regulator/hisi_regulator_spmi.c | 741 +++++++++++++++++++++++
>  drivers/spmi/hisi-spmi-controller.c     | 390 ++++++++++++
>  include/linux/mfd/hisi_pmic.h           | 165 ++++++

This is a single patch for three subsystems, please split it into per
subsystem patches.

--7J16OGEJ/mt06A90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8ywBIACgkQJNaLcl1U
h9B0Gwf/bkoBYa45gS5d+/J8udbJcc+WYRzVIKPxRylg0boztmS4vPcb8+5CtDfl
GrbTgKABmZSFuRKtvtklBEO6yP0XWxFLr2TDMY8KNtWrGVHrQJjUGf9yiAajPHCa
FNVWRx5W/G06HKz0O3m500FTHjoo1UZvgXUVFdeSIqXjzkPWslrqNBUVQYqdmaYR
2r+gmSwkJbuBaF4tAu7u2+I7WoV2K3+cpD2qXlcH0hKoSq1iC4N832zbql7EDDXc
gybUOo9smxzpZjSzw3Cl3o08PXDr7VCAHsUO8JOe81T61ayc3H58wCaLE40WTfT5
JvnSzZonmPI3fyrOLqmJ3Djw32wn0A==
=vU2i
-----END PGP SIGNATURE-----

--7J16OGEJ/mt06A90--
