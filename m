Return-Path: <linux-arm-msm+bounces-77461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C78BE0511
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 21:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B1BA63537C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 19:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B62302CCD;
	Wed, 15 Oct 2025 19:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mb9w4PZa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B752BDC3B;
	Wed, 15 Oct 2025 19:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760555379; cv=none; b=Yzj8FaU7IOndW7HvtlQ7YfnosOrcGxIfmQQZF9sc2voFwzjZOkQn3qBj9FJYXH7yyflMmsCPS/xtAJWx9U1qarge30TLmNWlbRN3wzbCv17s9cqamXF9v4Oluf+r14dMW/18LpCmKkFiG3THKcSYxHArtquqx27Y9K/XNxTNTL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760555379; c=relaxed/simple;
	bh=WwwXtbAybha3ZLb6O/IGC6PpjE2KyRiKGEVICuAujsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpf5imTZ6srmuUWjCmx3b+6WSj9iCaFeOAgVk29qlmG9Lpc9DTdBM0FMdSkrSTNMbXsIsk22pw4gdPzbHX/Aw1CFmQXXJWIH01lOinU+rgAuoneu6R5Sp24ZrvuJvtigizsoMccRI4G6ylmGOmSVgeb/GiTqJjvQrYz/90UaO6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mb9w4PZa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02FAC4CEF8;
	Wed, 15 Oct 2025 19:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760555379;
	bh=WwwXtbAybha3ZLb6O/IGC6PpjE2KyRiKGEVICuAujsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mb9w4PZamSvMwkj5Q/1eUT1San+uCbMMNeL6JIjr4yT4V9EI4C0j1UjLBWKn+7HvL
	 ZAS841iK6XpqRVu62Enyamca4tOQE/2gtb8vkrkj6xJDDMUv7BeZequoGSkkKB4ZsI
	 Arb4TTjQFhS28CSRqSkmS6UGA6xZFtjhtcqFEQ/p6rIGtU9jmrIAR/3aafQcuicdhY
	 VV6BYOydBosXSCizIFmfOlPhb+cJtaD8OYgZnwIsmfhz3Rwok+sr+kGlX39VebwENQ
	 6teBLyPhs17sB5gDQ/j4PRWXFsfDi8BIYE/GAEDyFUJlQMBHp8yuFD0UHcV0zyF+MK
	 oPGncWYI28v4w==
Date: Wed, 15 Oct 2025 20:09:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] rpmh-regulators: Update rpmh-regulator driver and
 dt-bindings for Glymur
Message-ID: <022305e8-a2ea-4013-9ee0-41e83e5f41bc@sirena.org.uk>
References: <20250918-glymur-rpmh-regulator-driver-v3-0-184c09678be3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ASrrcNOedjRtYOLD"
Content-Disposition: inline
In-Reply-To: <20250918-glymur-rpmh-regulator-driver-v3-0-184c09678be3@oss.qualcomm.com>
X-Cookie: Long life is in store for you.


--ASrrcNOedjRtYOLD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 18, 2025 at 02:57:00PM +0530, Kamal Wadhwa wrote:
> This series contains patches to update rpmh-regulator driver and
> dt-bindings for supporting the PMIC voltage regulators present on the
> boards with Qualcomm's next gen compute SoC - Glymur.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--ASrrcNOedjRtYOLD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjv8WwACgkQJNaLcl1U
h9AARwf+P2aR6rY0tK0PJGHF5nRvv5/IN1Tp/IS6+yqv8I8YqGUbUeoKbZIngyCS
a131hECghbQXTgxfwlB1R6fltTtSRkGlyDjQJvToxNWKn+S+UWqUfcgnh8dppypu
t5pGvr0RFRbIEFvgWVkNUy+8H1w4PCCSV4jQQlJMGCeJxrIdLIB0jzcPd1pji6os
4QBU0zm5/wrciZtkfu5hAJZIw7qFpbIESMcl/hBfAMHjamGSxIUCPbADsbJY1aGY
ZvUSJjlow7mbUkxaK6kHRv4TUPimRFdZe8Ap06Zfl1YzmZM6vhbbbTlYNItPgVvr
NDqr5M+8OhEhyv84/sUD//hFrRyo1g==
=AZ3I
-----END PGP SIGNATURE-----

--ASrrcNOedjRtYOLD--

