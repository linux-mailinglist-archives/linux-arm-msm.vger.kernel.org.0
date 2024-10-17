Return-Path: <linux-arm-msm+bounces-34751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 105499A23B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 15:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40E201C2569F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 13:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6581DDA2E;
	Thu, 17 Oct 2024 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhnRMrqy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC631D414F;
	Thu, 17 Oct 2024 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729171326; cv=none; b=K4nMBfcybI3sZ33yQTtdlP3Iitt2WhWwPBwOOIKpQ5GMVe3yCPFdKdYf+FAF7zRtZl660mP8gYFEUCRFagTZNB+SNuaT3tD99kzRcH0020+APo48N1U4Qx3Uo864qJDrYgS47lVtHs7jnYLM+h0AgRKdGeWiOy6I53XdwQdnqsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729171326; c=relaxed/simple;
	bh=YEWLovNTfR2Yjoh50Yrs342zOr30abLwFZjLtnK2bjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBDe+AhNonAFW/nfTP6+96Dcw+AyLMQa094+EOOYyElOApmmw8jTLC6LhM8qSDiUOOvZPOqbpVqhoecze3YdUu0ov/BmQhm5o5PGoUzWKuojynELzChCQXhm3cmXyX9LDGQUrULxavJWKQhEjroJW+PQXn+JXHF062oA6VwK65g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhnRMrqy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0049CC4CEC5;
	Thu, 17 Oct 2024 13:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729171326;
	bh=YEWLovNTfR2Yjoh50Yrs342zOr30abLwFZjLtnK2bjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OhnRMrqyCNyepnmEad2tOlrrc8m37uT50yZBkbP4PLFnrF1zBBfRjbZ+uRhFXvEoi
	 sVWo1HgM6NQf2uAccCGoB6kx1QecrgChaGlYddNVK4ruXSUGdEewXzUl+kwqfTgIUO
	 CxVXA2bAMbfnqRzpRlU5keTuL6oD+3f4zybMF2MrD6TP7UsrldQ7XIx5U0eys7IRcx
	 mPMaTBVOm70NbKmjdCjjhdhnVvt0H7CgzhbBmo1g/hZI87XhIydRevgLpeuuGu50vi
	 ArYk4ZLR25KHk0DG4lNpHKbka71I3BCxTrgXKHHlc6xQoR/tpt3N8KA0q0YvWVUA8T
	 v39doHjqxAHww==
Date: Thu, 17 Oct 2024 14:22:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
Message-ID: <f125c7d5-5f85-4ff6-999b-2098ff3103f9@sirena.org.uk>
References: <20241007-x1e80100-pwrseq-qcp-v1-3-f7166510ab17@linaro.org>
 <ZweftESPrJNEsqGE@hovoldconsulting.com>
 <Zwj539cN2DJ7nd3A@linaro.org>
 <Zw5fzNZ_xCwPyw4G@hovoldconsulting.com>
 <Zw_dE1rQ-Ljsh-sY@linaro.org>
 <CAMRc=MfUEfKHkAVvtGODxvJ-BdL+kX7uDgW+1y4QW3Kc5mpX+w@mail.gmail.com>
 <cde15d83-6059-47bc-94d6-2a88ba95e5ae@sirena.org.uk>
 <CAMRc=MddPDFaw6vYo1FzXHbUsLyr2QKT6oy2i68ZCdJdFWCJww@mail.gmail.com>
 <a14e5488-d0e8-4f04-b419-0b4c566219bf@sirena.org.uk>
 <CAMRc=MeYDi0_+y7a-KQhh=ft4rstng5H24LJBgsJg1BdXfc-nQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n2gD1yr3HYcMMdzy"
Content-Disposition: inline
In-Reply-To: <CAMRc=MeYDi0_+y7a-KQhh=ft4rstng5H24LJBgsJg1BdXfc-nQ@mail.gmail.com>
X-Cookie: One picture is worth 128K words.


--n2gD1yr3HYcMMdzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 17, 2024 at 02:21:08PM +0200, Bartosz Golaszewski wrote:

> A device is wired differently on different platforms. It requests a
> bunch of supplies using devm_regulator_bulk_get(). One of them is
> unconnected on one of the platforms resulting in the "using dummy
> regulator" warning.

> Concrete use-case is: make all but one regulator mandatory when
> calling regulator_bulk_get(). My proposal is extending struct
> regulator_bulk_data with a boolean flag called "optional" which would
> result in the underlying _regulator_get() receiving the OPTIONAL_GET
> flag only for the regulators that are marked as such.

Sure, but doesn't the device need to know that this supply isn't
connected - if we can just ignore the result then why bother powering
the supply on at all?

--n2gD1yr3HYcMMdzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcRD3gACgkQJNaLcl1U
h9DoIgf/Y+0jxK5/t6n/HarefvAOzATQamisrmCyJ/uDRyQhMfatLC1+lTveGobd
6pBFd1Hg+TcKq4J3Hx7h+PRuZYb+m6SVLjKX5oXMV58OgGuYVWBIMLdcKYs+AxEn
0ZNOxWqwRv/NKbEfUqMlV0oxn8d5bRLUzlJDZkI4k/m5Z0x6w8B7fKL2/ZCwX7i5
S4eU21u8YkVTGW0rrApgz9BeufGMWix/tw14FOxFTzufpx6sR+t7urJUtUbf9QF4
kdieO9o4KXB+2tddld8DNTEvp+srR77yCKvWbZqL67V8tAbRGcOhJBGI7YsRRssL
v77kDvn8q9lCFPmj6E5lLNg4ob0d4A==
=wMGr
-----END PGP SIGNATURE-----

--n2gD1yr3HYcMMdzy--

