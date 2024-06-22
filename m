Return-Path: <linux-arm-msm+bounces-23701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A77449133AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 14:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 540F21F22DF1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 12:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A104C155A34;
	Sat, 22 Jun 2024 12:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGwqTCfN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5375A788;
	Sat, 22 Jun 2024 12:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719057883; cv=none; b=NCcCokxRn18A7R8HsnKYMiJ89/tov/mNPGONzntB9Z/GmyVbRXxumbSfnN2e6bpdHhz5/vEUQ2vUBke3ImvJSXPKnbzye+h4n9/mC6dXfCwZNyasl4aLWP2gNOZyDRgyPIR7Qo+NI3s80SjU59laTz91KQczk6mcFrs0ER5+XyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719057883; c=relaxed/simple;
	bh=gHXGvBgK568bw5yKHgo4d06z16zyVxoZ1+5iiiLU6YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BW0JIML/lsu7a84SdEW4neJd+jD5ts7jE366DeFwXG+IQoaOR/rJ9V7dKFAkW5mGqpCuAG4TcKGMenoIltL934I8KqHqwfE+X6+yVmWp6o8LK/SK4U6nXi4t69+RCjJA4ugNUjLqcC7WEr2IZmYS7KLHM/OCc6wW7Aey5wnQ9cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGwqTCfN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088A0C3277B;
	Sat, 22 Jun 2024 12:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719057883;
	bh=gHXGvBgK568bw5yKHgo4d06z16zyVxoZ1+5iiiLU6YY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FGwqTCfNI31uH6LMkiz3CplOcH3NtaXFmSGsliViJh201V/o3uyr9TUlsqLnlrlEL
	 OlsgONpuy/GNOEROvEm5dnNWj2Kn7SjYJ0ysCnX5YJpbnPKe3FISakgBTaSU28iHXF
	 5g+iM67r1ejUBcFqkERenq4uGxH0gyE1MibAoxMNEWedev0nsAGBCb9iY7bc0esS3p
	 Xg1RqxUWBl68v5rEW6gSxZaI+hz86NbE9fHAJ6buJM30zOwRa6Y5rWxE7W975YiyJF
	 eDhPhpuymPeoEudPRBHrzIB3aABJ6vtrJXKQWS4VlMMR24c+HvQCWPouhbFJAdUAF1
	 6ChlKk60mvKRQ==
Date: Sat, 22 Jun 2024 13:04:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Valeriy Klimin <vdos63@gmail.com>
Cc: ~postmarketos/upstreaming <~postmarketos/upstreaming@lists.sr.ht>,
	phone-devel <phone-devel@vger.kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Sony Xperia Z3 Compact
Message-ID: <20240622-deed-scoured-1e9d8b7daf78@spud>
References: <20240621-sony-aries-v2-0-dddf10722522@gmail.com>
 <20240621-sony-aries-v2-1-dddf10722522@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mKvs2+QReqB7IbFJ"
Content-Disposition: inline
In-Reply-To: <20240621-sony-aries-v2-1-dddf10722522@gmail.com>


--mKvs2+QReqB7IbFJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 05:26:42PM +0300, Valeriy Klimin wrote:
> Add the compatible for this device.
>=20
> Signed-off-by: Valeriy Klimin <vdos63@gmail.com>


Acked-by: Conor Dooley <conor.dooley@microchip.com>

--mKvs2+QReqB7IbFJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZna91gAKCRB4tDGHoIJi
0pomAP9yB8o4DQu/GP9IKl4EZsnjQADcLBgZXvmQTIGpI+CZFAEA8C7kOsoPuTrf
3kr3JkuKWXhEduxBj9rFGVrMuSp8jAY=
=Oc+E
-----END PGP SIGNATURE-----

--mKvs2+QReqB7IbFJ--

