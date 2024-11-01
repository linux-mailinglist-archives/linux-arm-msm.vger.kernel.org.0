Return-Path: <linux-arm-msm+bounces-36740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6752F9B919C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 14:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 976E91C21DBD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 13:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318B119F424;
	Fri,  1 Nov 2024 13:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWqETSSs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB65C15F40B;
	Fri,  1 Nov 2024 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730466765; cv=none; b=KplccZQqzd64RNfvUR17LjYSnkKLSXVixiltI0eOf2QNFf5sCA9zj42m+HWsH0JHzbA0d5nTC0E1kAbFYbkDZ9WY3EXHoTyAaQHbsrvCmn/jCgFN5wpWhQnnYqixt6Idg5xtl/77toDWrk3kupUVw6n3IxY3UNHicTunwvkuPIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730466765; c=relaxed/simple;
	bh=c8aKn77VsKXGS88J79oTdumhoNUJfSRYQUoaGMJD+JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBoPllYqNfDEkrA3jPedn0QM1ockg4bTjje5fDy6S+XQ4xr/hVu7zLv3JZH77LLSIh0EwQSiHVnAYZc1xTrRS+HemcOKcmte4SbhDmkeseMUbpmNBcTHntMLoNTE4JbYUHCglVuWtOVTMEUK25TCexHReR8xLnlfKau7RuSp+Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWqETSSs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F5EC4CECD;
	Fri,  1 Nov 2024 13:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730466764;
	bh=c8aKn77VsKXGS88J79oTdumhoNUJfSRYQUoaGMJD+JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWqETSSsCPX7fyTdCEFWSDmT+l/yQF5NXYAVq1GB7Ozr/DujSfiLBfuA/ANDbnxHd
	 uT4PJcVi71sPFb2yO2TRY+uIKTcbvcdO2pSdejBA5yga35C/o0+cNYEs2+W90cAHQS
	 C/35NxPzKQVfSjluMDlWGrI7UNRU9HNofXNSN91LvgpWvwo7O1tJG2Ss96pc64RG0O
	 WfPK2OKF6HiP2oJV7Noln8UJLC9/AMq9Y3Se5nlX8tMjRwUYCuP6igc/sIBAW02GNB
	 GW+E4AKkwPc9+0lXu53PFtVblRVT9g1sFYIV1D492uLS3Zjq9xPszb3/wAAns6SSdA
	 7X4TxD/fpntDw==
Date: Fri, 1 Nov 2024 13:12:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
	srinivas.kandagatla@linaro.org, tiwai@suse.com, lgirdwood@gmail.com,
	perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 07/10] ASoC: codecs: add wsa881x-i2c amplifier codec
 driver
Message-ID: <1b5a24ac-e4be-4cb9-8546-6e2c39b6f9ed@sirena.org.uk>
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-8-alexey.klimov@linaro.org>
 <jqsa7lsypf62uqjydqbyspvtnt7iuwxclfwuyatgee2zgduwvd@4wwagvovam4k>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6EfuedNwPIPEYRju"
Content-Disposition: inline
In-Reply-To: <jqsa7lsypf62uqjydqbyspvtnt7iuwxclfwuyatgee2zgduwvd@4wwagvovam4k>
X-Cookie: We read to say that we have read.


--6EfuedNwPIPEYRju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 01, 2024 at 09:12:56AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 01, 2024 at 05:31:51AM +0000, Alexey Klimov wrote:
> > Add support to analog mode of WSA8810/WSA8815 Class-D Smart Speaker
> > family of amplifiers. Such amplifiers is primarily interfaced with
> > SoundWire but they also support analog mode which is configurable
> > by setting one of the pins to high/low. In such case the WSA881X
> > amplifier is configurable only using i2c.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--6EfuedNwPIPEYRju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmck08UACgkQJNaLcl1U
h9Cn6Qf/dM/KBXqN2le/ErGbKs52OLuikoCz0PQ3uRuncRhSFYdnNXeK7NbAshRm
c33XUphqxFcUm5/yorrkxHSrvGNlwPhk0226TEgo1HLfnIBV7pXLNxSe9PWBAAlF
rJaxbr54HWlp6zp4M3t2KiBqFPFHUqW48qSOtIOj8JVXoQ9pzeih6bmnukgrzuy0
0HfDyGUHGsf8OYfFQyrdlnfP7hL+k6TCBt/VIKbbW9uRcV/jdxazSkkOkSMGv+67
KJcC/chf5+EZcOD0gImJh+oIRl7EuukC9QsJudvXB/YzZa+cBe9vXYxudT0uN4DJ
7RupeQodDF1yN2+mpffBAn9N7C5qSw==
=FsoI
-----END PGP SIGNATURE-----

--6EfuedNwPIPEYRju--

