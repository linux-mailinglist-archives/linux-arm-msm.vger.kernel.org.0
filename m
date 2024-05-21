Return-Path: <linux-arm-msm+bounces-20158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 961158CB43B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 21:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C69EA1C22C2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 19:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2C1149004;
	Tue, 21 May 2024 19:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uANlyeA1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA8F14883E;
	Tue, 21 May 2024 19:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716319688; cv=none; b=PXE/1Vq7pe0zmLi4x3wsdp8qWyFLHh4PF2hI/eM1uEfvfdOJLWPtGQCv2MHGe5+HmqllxCngqghA7LAbqcBWQGp22xQcHSGwHow6NBhij396CuAP9visjRsZ8TMwV1GX4++uhEolwJxbF0rmPJs08pKusEbTQotEKBgX0B77ty8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716319688; c=relaxed/simple;
	bh=QdCjcD643RUyO8tlFPCb1ffV0ec22nruUwZWGVoqglI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fh+j5+2IhvK80GMSwAk4I90xuENIJQWf3PBRQl+GhY4zn8haVhq3gcpyNRbjFTgTQNzelEXlsYHn4bzzcfVt3CEdN911v7wS3fNQKchK66JWyLmAuMvZw5VGVXse4FeyBpl2EnCm1AXYbMXxDDCWph0L3CwbhBmaDA6D+FBMoe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uANlyeA1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE63C2BD11;
	Tue, 21 May 2024 19:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716319688;
	bh=QdCjcD643RUyO8tlFPCb1ffV0ec22nruUwZWGVoqglI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uANlyeA1wUG9sZcfpfs3Sg5RadKxxaFHAkG2IWGpSr17rP53rpi050ggsAUgWXiF7
	 HKTKD28AK9mOhcRTapmWHJwIapMquk5AO/Su8tgllQXMlPpC9wCeLGhbTCD/OnLn9C
	 UZ48o/ObTPa4facUZNkHfDium19MUl+ndPgu+EFedg4viHe1tQMNV1GWJHw7DUuo6K
	 AhMB0l+W81RtA/dfWyrSXWJ7UrMhNlMvwB/qbw6Ahwl1otR3qxc10KvJCx5/EauKGc
	 76tpc6XXEB6hivk2z5lRS7nxbKkK2/b6MXpBd8DY22BvBtsBvdYysD2/4Upxgpt0iR
	 mWPnao8qDpg4w==
Date: Tue, 21 May 2024 20:28:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Amrit Anand <quic_amrianan@quicinc.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	"Humphreys, Jonathan" <j-humphreys@ti.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Jon Hunter <jonathanh@nvidia.org>,
	Michal Simek <michal.simek@amd.com>,
	boot-architecture@lists.linaro.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RFC v3 1/9] libfdt: board-id: Implement board-id scoring
Message-ID: <20240521-sandal-onslaught-7762ee03ee96@spud>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <20240521-board-ids-v3-1-e6c71d05f4d2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/VAGjNX7xs4NY2oR"
Content-Disposition: inline
In-Reply-To: <20240521-board-ids-v3-1-e6c71d05f4d2@quicinc.com>


--/VAGjNX7xs4NY2oR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 11:37:58AM -0700, Elliot Berman wrote:
> The devicetree spec introduced a mechanism to match devicetree blobs to
> boards using firmware-provided identifiers.

Can you share a link to where the devicetree spec introduced this
mechanism? I don't recall seeing a PR to dt-schema for it nor did a
quick check of the devicetree specification repo show a PR adding it.

What am I missing?

Thanks,
Conor.

> Although the matching can be
> implemented by DTB loaders, having a canonical implementation makes it
> easier to integrate and ensure consistent behavior across ecosystems.
>=20
> I've not yet investigated swig/python support for the new functions; I
> would work on that before submitting the patch to libfdt.

--/VAGjNX7xs4NY2oR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkz1wQAKCRB4tDGHoIJi
0vFYAP9WMvsoswcDJD+UTfkJ6b8y5Cjs4GnAx5tucTG/l9Sz5QEAqRnqLSJOJlPJ
w8v63X+qH8czvA3bx/u5ncZ1naKV0Q8=
=Bg0r
-----END PGP SIGNATURE-----

--/VAGjNX7xs4NY2oR--

