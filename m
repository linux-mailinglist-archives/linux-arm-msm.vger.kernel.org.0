Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE0F7E78FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2019 20:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729288AbfJ1TLb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Oct 2019 15:11:31 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44388 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728941AbfJ1TLa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Oct 2019 15:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=H65QiY81RMquPvhrPwqy1YKHRso/og8MYpWdT+cfpUE=; b=JgaBfRxhKnfU3JB/4oSp19No0
        SCRsHeuK3eCgMCi4JRpL98Kb+zpnJg0KLgHzyGMP8tjHmO8hJ+T4BCTMSrs5KFl7/zd2HfEdABIj5
        BhITGRPcG5y6hT7IEmSpd5ziECXAH8GVQ01CanaIxfD/j8I95CpiBqlPPrlKHw7REW80E=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iPAQE-0000Rt-TE; Mon, 28 Oct 2019 19:11:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 17ACD27403EE; Mon, 28 Oct 2019 19:11:22 +0000 (GMT)
Date:   Mon, 28 Oct 2019 19:11:21 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Subject: Re: next/master boot: 257 boots: 8 failed, 237 passed with 8
 offline, 2 untried/unknown, 2 conflicts (next-20191028)
Message-ID: <20191028191121.GH5015@sirena.co.uk>
References: <5db7032c.1c69fb81.888b0.b521@mx.google.com>
 <20191028174857.GG5015@sirena.co.uk>
 <20191028184019.GR571@minitux>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Hlh2aiwFLCZwGcpw"
Content-Disposition: inline
In-Reply-To: <20191028184019.GR571@minitux>
X-Cookie: The Moral Majority is neither.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--Hlh2aiwFLCZwGcpw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 28, 2019 at 11:40:19AM -0700, Bjorn Andersson wrote:
> On Mon 28 Oct 10:48 PDT 2019, Mark Brown wrote:
> > On Mon, Oct 28, 2019 at 08:03:08AM -0700, kernelci.org bot wrote:

> > Today's -next (anf Friday's) fails to boot on db820c:

> > >     defconfig:
> > >         gcc-8:
> > >             apq8096-db820c: 1 failed lab

> > It looks like it deadlocks somewhere, the last things in the log are a
> > failure to start ufshcd-qcom and then an RCU stall some time later:

> db820c has been failing intermittently for a while now, it seems that
> booting with kpti enabled causes something to go wrong. There are
> nothing strange in the kernel logs and ftrace seems to indicate that all
> the CPUs are idling nicely.

Oh dear.  Adding Catalin and Will.  Is it definitely KPTI that's
triggering stuff?  It did turn up some bugs on other systems, though
it's a bit strange it's only manifesting in KernelCI...

--Hlh2aiwFLCZwGcpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl23PVkACgkQJNaLcl1U
h9AEVQf/YobSNC+8kYOgtMjIo5OBkeEQ+9zsfOsrTA0kUw/x8P2H0ahek60NH+ik
l9M9nDhLhPUBCJym6nN+cS1kJcMnnCAEm+Q+d/7Di3mq0iqkIuPzNMHNOU16OHaV
DRbUIISgaEjDkj4vcB8jiUrmTUslsdZUuxfSQqbxWRW6QgxXpnaNy+WT0n4JLIZe
mmWUot73N9ag1m5RIfoua/8FwvOHMrwqr76TzJ/TP1w2vvLw8Qo7TJqu3vgyabS2
oJ7ig+iVzASx3dXTnNHM0vs6GUpr50rU0Pwusg4w7dgJIrlaoGrBTDf8Yi373abg
We1+BlrFcQW63WkfxcWIaApVIpvQWw==
=NPuH
-----END PGP SIGNATURE-----

--Hlh2aiwFLCZwGcpw--
