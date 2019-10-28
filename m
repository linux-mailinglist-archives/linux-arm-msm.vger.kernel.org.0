Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9545E7A05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2019 21:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbfJ1UXx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Oct 2019 16:23:53 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:53014 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727802AbfJ1UXw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Oct 2019 16:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=hM5PVIIqqVq5fwywAG6+qMv33PfDYrlxmKHuPbTQ250=; b=BvxYLSFlN4uSU6TP6JH49MaHF
        rhVAF/Inqm/8dPGMCCkVFs4bY78XCNPLxHgSlAJ38ziryR9uineNgBGFBFCMmrKP+bZkPcE4CBteh
        clB4Jz1x70+eO5daDc9K2W0TrI/Tnclr0ZJIEhDMHS7sL57Vo1Mu/sJdoJYa7I1NtFUDM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iPBYJ-0000aD-FG; Mon, 28 Oct 2019 20:23:47 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 75BFD27403EE; Mon, 28 Oct 2019 20:23:46 +0000 (GMT)
Date:   Mon, 28 Oct 2019 20:23:46 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Will Deacon <will@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: next/master boot: 257 boots: 8 failed, 237 passed with 8
 offline, 2 untried/unknown, 2 conflicts (next-20191028)
Message-ID: <20191028202346.GJ5015@sirena.co.uk>
References: <5db7032c.1c69fb81.888b0.b521@mx.google.com>
 <20191028174857.GG5015@sirena.co.uk>
 <20191028184019.GR571@minitux>
 <20191028191121.GH5015@sirena.co.uk>
 <20191028200219.GS571@minitux>
 <20191028201418.GA8317@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MzdA25v054BPvyZa"
Content-Disposition: inline
In-Reply-To: <20191028201418.GA8317@willie-the-truck>
X-Cookie: The Moral Majority is neither.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--MzdA25v054BPvyZa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 28, 2019 at 08:14:18PM +0000, Will Deacon wrote:

> Hmm. Is this a recent thing? Neither kpti nor the snapdragon 820 are

It's in mainline, don't seem to have any results from Bjorn's lab for
stable.

> particular new. Might be worth checking that CONFIG_QCOM_FALKOR_ERRATUM_1003
> is enabled and getting patched in at runtime -- we had hardware issues
> during kpti development with this CPU.

It's enabled in defconfig:

	https://storage.kernelci.org/next/master/next-20191028/arm64/defconfig/gcc-8/kernel.config

but I can't see any sign that it's been announced in the boot log:

	https://storage.kernelci.org/next/master/next-20191028/arm64/defconfig/gcc-8/lab-bjorn/boot-apq8096-db820c.html

so that might be it.

--MzdA25v054BPvyZa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl23TlEACgkQJNaLcl1U
h9D4YQf/R7oiiKxoyTMcJZqf4+ByFkIfsceWfH/DEWTi6HliacqU29h9sdfiPbKR
/0ugF+thK7yv3XsVF8Lg0Aq6zXjZal8cQvaB5oB1gPic5T+eSLMgeTYQ/UKWsNgm
iGUcAtPlCcg0/qiR57niJ7mfsPRTWslow1a9D/f1Ud8APQ8JHCLipD1KsE/Ek8oQ
SRFWsqkG0BZwZMPlKaQ5Yus+sdu70JJ3e5tS8H+btjgjIhywI2YpFsBcrhRsoHCk
I5z6bOkVXnKI6p0z3SN+SCKLoONqvYcZHps9b5sGcWPPwmzIv2dY+/YSLlAdnFY3
5D1Ls44JbkZ8lNO1snUDwI8TrFJXxw==
=sP0T
-----END PGP SIGNATURE-----

--MzdA25v054BPvyZa--
