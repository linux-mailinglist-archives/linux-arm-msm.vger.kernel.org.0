Return-Path: <linux-arm-msm+bounces-34734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D807A9A21B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 14:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F38B1F24477
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 12:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F6A1DC1B0;
	Thu, 17 Oct 2024 12:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4w6yPT3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EE91D88D7;
	Thu, 17 Oct 2024 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729166460; cv=none; b=A+OgY5BbPCPei/duHbF9QwGE150QiPVPt8BFMQtZlpU28e41opLqpgw//mrBf7nUj9WT3jG5Rb/RNDNLUm1CA5WdeZ7TmrQSBsbekT+qkuzs/LKbI/5nZ2dezXpKp99xvtU9t2ziqOgHTBSjyTGqgfQmUy/xIyD6vw+K5u2nVFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729166460; c=relaxed/simple;
	bh=Lq5bsJFDUWvad5T0uiQGeRMenMI6v23zITJKBVgyHDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1kY8zbSYSNOCwBCemluvFWTmAjJBvweeS0Qzw5W0DDkc4+/wF/XlgUUwv+Rk2wnODlRGdRT8dW+b8MTya71JYvHX4QYvnlNReL1z325FQJ7UxyBz8jaKt2+g1RgDEWFE1/4h8+OQsg1223kGTN90rZeLqGaMfegQNV12XAYtLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4w6yPT3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEBB9C4CEC3;
	Thu, 17 Oct 2024 12:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729166459;
	bh=Lq5bsJFDUWvad5T0uiQGeRMenMI6v23zITJKBVgyHDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4w6yPT3yJD/bsJd/ZkvhRqMyhio2cBqy5iP0mNDnLcuy2s22iQi/Tmwelva2R81P
	 +mqjVdBPnshDXO+v6sPzaUNvqJYaPTFSLaKyWlvX+PPJ00zg02CRXwbbqUDi29jk8N
	 UxUmAXKpRDKnEBzlNxoCH+qpI8kFlgIAMje0vnrbuFAKLbBDW2ZZSHaBmn2q9EmwRq
	 MPkhUH49Tadsbt7btJ8B18vs2yJ8g5lHcg/CWUErSndyCLMZZBfbhGo0AcOWgRsX0c
	 aCDlhw+x5sYrlUPX7xnidxjgMcZY2mnnnFPPh3bFibUcsIZEC90AxhnP9qA+sl8uHl
	 jJKaRl60UiHyg==
Date: Thu, 17 Oct 2024 13:00:53 +0100
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
Message-ID: <a14e5488-d0e8-4f04-b419-0b4c566219bf@sirena.org.uk>
References: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org>
 <20241007-x1e80100-pwrseq-qcp-v1-3-f7166510ab17@linaro.org>
 <ZweftESPrJNEsqGE@hovoldconsulting.com>
 <Zwj539cN2DJ7nd3A@linaro.org>
 <Zw5fzNZ_xCwPyw4G@hovoldconsulting.com>
 <Zw_dE1rQ-Ljsh-sY@linaro.org>
 <CAMRc=MfUEfKHkAVvtGODxvJ-BdL+kX7uDgW+1y4QW3Kc5mpX+w@mail.gmail.com>
 <cde15d83-6059-47bc-94d6-2a88ba95e5ae@sirena.org.uk>
 <CAMRc=MddPDFaw6vYo1FzXHbUsLyr2QKT6oy2i68ZCdJdFWCJww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wDvrxtDPKSAoYDD5"
Content-Disposition: inline
In-Reply-To: <CAMRc=MddPDFaw6vYo1FzXHbUsLyr2QKT6oy2i68ZCdJdFWCJww@mail.gmail.com>
X-Cookie: One picture is worth 128K words.


--wDvrxtDPKSAoYDD5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 01:28:00PM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 17, 2024 at 12:59=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:

> > Fix your driver to request the supplies that actually exist on the
> > device rather than just some random supplies you hope will work?

> Let me rephrase: the device has this supply but on this particular
> board nothing is connected to it. It does sound to me like an example
> of an "optional" supply. Do you have anything against making it
> possible to define optional supplies when using the bulk regulator
> APIs?

Oh, right - please if asking questions ask a complete question rather
than having a long email thread and adding an "any thoughts" at the end
which makes it unclear what the actual question is.  In general the
expectation for optional supplies is that you will need to do something
different depending on if the supply is there, that will tend to mean
that it's fairly natural to do a separate request for it as well.
What's the concrete use case here?

--wDvrxtDPKSAoYDD5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcQ/HUACgkQJNaLcl1U
h9AlUgf/a+6QvMECSleIoCzj/+SOHAB3hBaVVWT7nAhgXOlczOug9t4lcpUBurlw
ULMhgu0MNz8bHMYHb22hnKBbfE+tIlGo8l3yb/hK3zszHfJiRwj68puiLs9n0ltK
XPMvUTPZunyFIZHL+HgdQcY1AynelXawMvfZRIAPoz0KfEOy1EEoleVUoAcdF0Nk
R2ppe32gbm9wzWAjFELRc+E/TWC/r457KYaNz+k75iEhrWmG3+CyjG+3FYlfVgXs
zhndkfjHKHzdM/wApj0Zhrfp+zXTELyzK1TO2qkPRCYa7X06fYjIStPl/aAG9ufm
V1mjvh7VtXFDVO6w9ovkFuCZR/oecg==
=NiuG
-----END PGP SIGNATURE-----

--wDvrxtDPKSAoYDD5--

