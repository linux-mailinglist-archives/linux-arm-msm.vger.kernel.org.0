Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABAF1FCD96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 14:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgFQMke (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 08:40:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:50068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725964AbgFQMke (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 08:40:34 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 703C620DD4;
        Wed, 17 Jun 2020 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592397633;
        bh=L++2pqqcClpU9mPgWdwwA260YxhqLgIQOBMLvdueqUU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wrdJkg1VSnmORU6g1UOqTFJAgbYx94MFEgjLYhzxh30EcpiMJB/0y95yHC8Rcm3uS
         2mFdY38oT/rlih3MoIYqV2wsITqH3KOYSUhhvY1sUm/67FghxZAl/qrVEqvCAg3AON
         XQmLu4xQT1zqs4FQNpVz+p8G4LXhvhZqs7XUnBQY=
Date:   Wed, 17 Jun 2020 13:40:31 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        Nisha Kumari <nishakumari@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v4 4/5] regulator: qcom: Add labibb driver
Message-ID: <20200617124031.GG4613@sirena.org.uk>
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
 <20200602100924.26256-5-sumit.semwal@linaro.org>
 <20200602113241.GE5684@sirena.org.uk>
 <CAO_48GGgNUGosN2PiL=U5JkR3Bh5wNK3N4xYYML1UwmdfDPRww@mail.gmail.com>
 <20200602122554.GG5684@sirena.org.uk>
 <CAO_48GFwEHBGmz0QvN+pXFSyHC9+7=0aoJLHF4uupGSx2TcSvA@mail.gmail.com>
 <20200617114721.GD4613@sirena.org.uk>
 <CAO_48GF9pKZCCof170TvB0ubOkecDzcGhtUUuY_Td78L1J338A@mail.gmail.com>
 <20200617120601.GE4613@sirena.org.uk>
 <CAO_48GGhX-AxjvvvPKRMc+LQ_Uws1s_b4Q+aHokVv2RxcpObQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GUPx2O/K0ibUojHx"
Content-Disposition: inline
In-Reply-To: <CAO_48GGhX-AxjvvvPKRMc+LQ_Uws1s_b4Q+aHokVv2RxcpObQw@mail.gmail.com>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--GUPx2O/K0ibUojHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 17, 2020 at 05:39:26PM +0530, Sumit Semwal wrote:
> On Wed, 17 Jun 2020 at 17:36, Mark Brown <broonie@kernel.org> wrote:

> > That seems...  interesting.  Are you sure the regulator has fully ramped
> > when STATUS1 starts flagging?

> On a consumer device, I am not sure I have any way of checking that,
> but if there's some way you'd like me to validate it, I'll be happy
> to.

Without any way of validating what's going on or information on the
hardware I'd be inclined to go with whatever reports more slowly for
safety.

--GUPx2O/K0ibUojHx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7qDz4ACgkQJNaLcl1U
h9BUTQf+KRqV/mXMamOWLACdLW5gZH6Y09B9TTc3Tz2fPQsNFYJnIhlDLeu8fT1+
9B1QCd6Uu+8YxtlaD9d013/bapXRVVrx+6Lge3xyghKGc4UYljifwI5aSnP/+KbK
WdtJ803eBe1inc0yg03o5OzrwKtd3Q48bIaOJuApqz6Jww5o7bZ4lglbMfv56f0n
HsD1z0i0zX83BewbLqxTWWxv8u4DrrS1+o3EqzzK2dgUwKFmCR/ZJ8RHZeVS20vJ
WGHc8n8fV5EjIuUHlqJ5lOl/+C07FCI1UrLSYA+16MiAmPbmaWlEXzKl0/m3yj8k
/FZh8gFCDt0cewJTYyDX/huTVOwNdA==
=AigS
-----END PGP SIGNATURE-----

--GUPx2O/K0ibUojHx--
