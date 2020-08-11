Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20EAD241DF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 18:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbgHKQQH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 12:16:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:34800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728797AbgHKQQH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 12:16:07 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4171C206B5;
        Tue, 11 Aug 2020 16:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597162566;
        bh=0yGybgD9IL3gRoWDqSMgaHoVLjZvPfOQziQxPv1gUzs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SeNDbfoExQPUA34zj0XHGgYP86QWVpcMXgujtgsL9w8dTdX7/Zg/5KkShqYpCtChb
         //S7N8/2L8iXX3E62saYcst+JpZFGmQUBGXKft8Vo8A2I5JQVpzqDnI0dcT0ToQ7zr
         cB5UEhW7tv2zefd0F35d9ZS0pPgxd2VGL9ROIRyw=
Date:   Tue, 11 Aug 2020 17:15:39 +0100
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
Message-ID: <20200811161539.GK6967@sirena.org.uk>
References: <cover.1597160086.git.mchehab+huawei@kernel.org>
 <36a548c10ea8c75d13c3e796c4cee65132819ef1.1597160086.git.mchehab+huawei@kernel.org>
 <20200811155810.GH6967@sirena.org.uk>
 <20200811180837.2285c8b5@coco.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRokNccIwvMzawGl"
Content-Disposition: inline
In-Reply-To: <20200811180837.2285c8b5@coco.lan>
X-Cookie: Gravity is a myth, the Earth sucks.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--wRokNccIwvMzawGl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2020 at 06:08:37PM +0200, Mauro Carvalho Chehab wrote:
> Mark Brown <broonie@kernel.org> escreveu:

> > This is a single patch for three subsystems, please split it into per
> > subsystem patches.

> Ok, I'll split on a next version.=20

> Yet, it would be good to have all tree drivers applied via the same tree,
> as those drivers are needed altogether in order for this PMIC to work:

This is completely normal for MFD drivers, it's still much easier to
review things if individual subsystem maintainers can easily get to the
code for their subsystem, any Reviewed-bys or whatever can be sensibly
applies to relevant code and ideally people can apply patches as they're
ready if there's no build time dependencies or Kconfig symbols which
prevent build without the dependencies being merged.

--wRokNccIwvMzawGl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8yxCoACgkQJNaLcl1U
h9C3Jgf/VVfcbuWfx2m33vDnwyRvVhII/5u4hRIJK8ayFl3O6szxc/724CvRi+7m
GZqWDuj7W3iDnP1DDex058PR2FUCa3b+UrNXPL2167fi8VUe5mZTy67o047GV1MP
G9Kwhbwm5AB/nvkNBKjE3gMgm3BelrIQOs/u2ti374mh9xNoj3ocWIliViixg/aq
JPsfrI/XhRS0HU8OT+2TS2tINH71OLTv8iO+T+l2j8pHVwJgjE53XCPmOHdWxj3B
bmgCRSYZGqpBkfDOfxeeI3LbsHrXzjtwSlj10RcGY+oLN7nMb0OYuXcS7VhwX9d7
36uTnw1KNIlJ7igXm1EczUsVwF1GFQ==
=maAa
-----END PGP SIGNATURE-----

--wRokNccIwvMzawGl--
