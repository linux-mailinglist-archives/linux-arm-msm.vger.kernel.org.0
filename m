Return-Path: <linux-arm-msm+bounces-68021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F896B1D946
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 15:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5E331705AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 13:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C8825D21A;
	Thu,  7 Aug 2025 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZq6qTtt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AFC25DAF0;
	Thu,  7 Aug 2025 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754574305; cv=none; b=bLk4DhZMH69VebRq5vXOgIoh2A+V1sluxyPv2/ch8Slt4T6R/d/2hWvW5IJ6Z759+RLju7NaAnVzPGLnkcbiqB59/HJk5ZGAqHtwrDG7CTLg2Qli0rvM/JxKAJUAZYHg0KEdHf7T+HCXeq7SCD/UaO2RxKFonbKQN7hW8o4UvRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754574305; c=relaxed/simple;
	bh=C9ZTC2V4f6Krh0DfrGNI8J67KB1RXxeKMeyb+CQylsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZnJEwht4N68r+GFeahlgKqKA73e/rNaqlufZIbavrJj6YERw0S1m+aNymy7a3OQ16KsuZShrXh+9HFviJ3WZXLWS7D7jf+oQNfEKYALA7KJz3TUMicws2cc0m1wXo21+1k+vY5IyXpDj/i6zTeFM3+6GVVT5pPgHY8BbxycXY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZq6qTtt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A24CC4CEEB;
	Thu,  7 Aug 2025 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754574305;
	bh=C9ZTC2V4f6Krh0DfrGNI8J67KB1RXxeKMeyb+CQylsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mZq6qTtt97Mtn+Uldg4voJ3qdLR8kAiZxKCJ7pvjgr2NOlzjVSLJtW0nvT0uF8SGp
	 IB9ThGlxViuyE8IgpAl349YaDT2LmEMeJWmK4X5IALumsNUSyQtsZJUalkMGcSKmYr
	 /WTcRzfv8CvbChDtYcUTiorjYtm4cFD3E9xNNfC2G5YuofPBH7q0n1xAQtohbNb541
	 yaWHTcO+27V4rhkwxeYk0G7bxqtEYMBLOWJrE8mdv6AI3+OLVonfrm1o6wKbu9pnrL
	 HcEIl3GRRspSfSXs6e/Jit+T1aK+lJEzluJGoByBtcHTBOmXU66X4Y9pXbea702b9H
	 pVg+NT7OK6SeQ==
Date: Thu, 7 Aug 2025 14:44:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
	kishon@kernel.org, mani@kernel.org, conor+dt@kernel.org,
	bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH V1 4/4] phy: qcom-qmp-ufs: read max-microamp values from
 device tree
Message-ID: <acf89420-743b-4178-ac05-d4ca492bfee3@sirena.org.uk>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-5-quic_nitirawa@quicinc.com>
 <f368b6da-1aa3-4b8e-9106-3c29d4ab5c5e@oss.qualcomm.com>
 <fe2bc07c-8fe9-47fd-bcd7-c2f0ebbd596f@sirena.org.uk>
 <aed1de56-fafe-4ccc-b542-69400b574def@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LPspi1OYnjr8G9Mq"
Content-Disposition: inline
In-Reply-To: <aed1de56-fafe-4ccc-b542-69400b574def@oss.qualcomm.com>
X-Cookie: Real Users hate Real Programmers.


--LPspi1OYnjr8G9Mq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 03:06:01PM +0200, Konrad Dybcio wrote:
> On 8/6/25 6:51 PM, Mark Brown wrote:

> > I'm not clear why the driver is trying to do this at all, the driver is
> > AFAICT making no other effort to manage the load at all.  We already
> > impose any constraints that are defined for a regulator while initially
> > parsing them so it's not clear to me what this is supposed to
> > accomplish, and it'll be broken if the supply is ever shared since it'll
> > set the load from this individual consumer to the maximum that's
> > permitted for the regulator as a whole.

> Qualcomm regulators feature a low- and a high-power mode. As one may
> imagine, low- is preferred, and high- needs to be engaged if we go
> over a current threshold.

Sure, but the driver is like I say doing nothing to actively manage the
current reporting.  It's just pulling a random number not specific to
the device (the max-microamp configuration is part of the constraints
which apply to the regualtor as a whole) out of the DT and throwing it
at the framework.

> The specific regulator instances in question are often shared between
> a couple PHYs (UFS, PCIe, USB..) and we need to convey to the
> framework how much each consumer requires (and consumers can of course
> go on/off at runtime). The current value varies between platforms, so
> we want to read from DT.

In that case this will definitely encounter the bug I mentioned above
where it's trying to read the maximum load permitted for the regulator
as a whole and report it as the load from this one specific device.

> The intended use is to set the load requirement and then only en/disable
> the consumer, so that the current load is updated in core (like in the
> kerneldoc of _regulator_handle_consumer_enable())

> My question was about moving the custom parsing of
> $supplyname-max-micromap introduced in this patch into the regulator
> core, as this seems like a rather common problem.

Wait, is this supposed to be some new property that you want to
standardise?  I didn't see a proposal for that, it's not something that
currently exists - the only standard properties that currently exist are
for the regulator as a whole. =20

I'm not super convinced this is a particularly common issue, most
devices perform pretty much the same regardless of the board design so
the driver should just know their peak consumption and it's becoming
less and less common for regulators to need software help to adapt to
loads.  The main use case these days seems to be for safety (eg,
constraining how much can be drawn via a USB port) which seems like it'd
either be for the full supply or just known by the driver.

--LPspi1OYnjr8G9Mq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiUrdkACgkQJNaLcl1U
h9BNGQf9GbS9mdCYh2Eh2IQodPUt5Q9D+YNr3KqV5S+1Vv5ylf9uh1NDYdTgwCFA
uxhVIvleyp9Sg69zLOYlacB6se0YXE2MrzdnhTpdlYogxM87SFY0uCFvkRsuVkd6
a6QQknpbzpWXqtXh6XXLuUmlzVY8v5OaddoCOAFRtwjP8jWGmOWg899ZfkBpUA4I
rZEIpyHyKXLwHH80d/vc/zZAhJOkG0L5kJwNPRXoV3eHpaj7rxbhNVa63qvioxlY
ilgx7wgo32i/BHUxyRCkrDMYX+Zyb16wygKoIDmgGQiz2sCLj1Icyt4UOGwUApXa
fmo0UcAZqA5z+vjYxBU2gvvqE/VFyQ==
=CqME
-----END PGP SIGNATURE-----

--LPspi1OYnjr8G9Mq--

