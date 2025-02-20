Return-Path: <linux-arm-msm+bounces-48692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B55DA3DC9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 421718614E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 14:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC051FC7E8;
	Thu, 20 Feb 2025 14:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfG7Hkzk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AF91FBEA7;
	Thu, 20 Feb 2025 14:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061090; cv=none; b=k4PylWCXcqix2HGhLZF7P02dxeR3/dqT3APWBykhtJEeHC9aUxtzvCSt+4yoehh20CimUKgrFaCLkuSDF4e/xJINe0zetpDyhjNgKhS6/9FiNagFYDMyr2O4rHuC0oIYlaq0lkKVNaUHUY5Wsd9Y4vyqck1vVBGQb03QxDyoANg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061090; c=relaxed/simple;
	bh=rxskcT7jKFiywspCy0YwO4Ukcf4MyTckgqpNNxukoSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loQuPxW6pZ4k0fQeWMJvKvafgpMGLXdZ8la0VlZ52gGUeHrtW2pDxk7NAeSNRFwC20kbUH6MNnHBnLeKGTB+/MpK1+5NvkMVQkViGLNSjHX98AtB7UmVQlCftO9v5L06VD7TDbHJR1pXleR05k4UYMXGREkEdLF0v+i0pdz/AK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfG7Hkzk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78674C4CED1;
	Thu, 20 Feb 2025 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740061090;
	bh=rxskcT7jKFiywspCy0YwO4Ukcf4MyTckgqpNNxukoSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hfG7HkzkvQvZwqnCu4SLgT/iGxXcUE4dX1OScn7QGjZjmgz0PGS6HOjFhYLbrADC5
	 /FCLE+6iq8fkYDJ/zduNZvkR8pJYFVPyxPrXv3vtkyS/iONdoxYGi3rZ6AOZm0oI6I
	 kh2QQX3+PPrN7WDVdE7gbsvWPhrea5G/QiMSoA7O0Esz5+Vl2QEo/uxBC25tmIAdPs
	 m5jNOja2cMHyxVbhRgSsaCOZzPZc6alWzG5Ump/8wAg1qAq1OI+dsz7KufPgYN0PdL
	 jSnIylpEPAoREHCv2DYJAyV1sVxfgCo8QqkXQ61hCo0EproJM6gg/EfvzOyFwc0/DB
	 bUjmhQjt6jsXw==
Date: Thu, 20 Feb 2025 14:18:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] nvmem: core: verify cell's raw_len
Message-ID: <Z7c5niuwR3TVTQrj@finisterre.sirena.org.uk>
References: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
 <20250109-sar2130p-nvmem-v4-2-633739fe5f11@linaro.org>
 <Z7Xv9lNc6ckJVtKc@finisterre.sirena.org.uk>
 <CAA8EJpp-mE2w_c3K08+8AR3Mn1r8X58FRXvAUFALQ-u2ppoKgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1dVZm3pFhaNe1viM"
Content-Disposition: inline
In-Reply-To: <CAA8EJpp-mE2w_c3K08+8AR3Mn1r8X58FRXvAUFALQ-u2ppoKgw@mail.gmail.com>
X-Cookie: Editing is a rewording activity.


--1dVZm3pFhaNe1viM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2025 at 05:14:43PM +0200, Dmitry Baryshkov wrote:
> On Wed, 19 Feb 2025 at 16:51, Mark Brown <broonie@kernel.org> wrote:
> > On Thu, Jan 09, 2025 at 06:35:46AM +0200, Dmitry Baryshkov wrote:

> > > Check that the NVMEM cell's raw_len is a aligned to word_size. Otherwise
> > > Otherwise drivers might face incomplete read while accessing the last
> > > part of the NVMEM cell.

> > I'm seeing a bunch of failures on i.MX platforms in -next which bisect
> > to this patch.  For example on the i.MX6q based UDOOq various things
> > including the ethernet fail to come up due to the efuse not appearing:

> > [    1.735264] nvmem imx-ocotp0: cell mac-addr raw len 6 unaligned to nvmem word size 4
> > [    1.735289] imx_ocotp 21bc000.efuse: probe with driver imx_ocotp failed with error -22

> This looks like an error on the i.MX platforms. The raw_len must be
> aligned to word size. I think the easiest fix is to implement the
> .fixup_dt_cell_info() callback like I did for the qfprom driver.

That sounds pluasible, but as things stand we've got a regression on
these platforms - taking out ethernet breaks NFS boot apart from
anything else.  I'd also be a bit concerned that there might be other
users with issues, does this need an audit of users before trying to
enforce this requirement?

--1dVZm3pFhaNe1viM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme3OZ0ACgkQJNaLcl1U
h9CR9Af+PKScD+QrhJJPzXmYa5zvi8OWNOsVRYQHd0O+qVTxLf+g/JGZiazQ3twk
CRFIipyBWKEPjZ/61m9GKEi57ITYQPh5bG3EZRXL5XAU1v99u11+dFS13dULOhGf
3QQsV+rdfPNaGtZIjZJNycLdCckClq3yJpDuPREeIMKAu+mPy6HOT+n/3LAd350O
dPs4Ql07ZjRw23USloCsuK0sLfsbKD0OWGi12YcKBd+Ck/BuaH1PV5bROiPokMf2
dl7wyawZ/FL7/Ob30h53I0eaMNeyYGSMgWSDmvGtPfluuJcDNyO64pqsRB+MB2Yg
aYfgKPWyJ2ZGDxvbLKjqXL4ZBfWIIw==
=dMez
-----END PGP SIGNATURE-----

--1dVZm3pFhaNe1viM--

