Return-Path: <linux-arm-msm+bounces-37143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FB99BF1FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 16:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36FAD28574B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 15:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA331DED78;
	Wed,  6 Nov 2024 15:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oItdlH+d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2D32EAE0;
	Wed,  6 Nov 2024 15:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730907965; cv=none; b=ToHDB/ABKgBparZITKxRKF+5p4hlo71ubIdrgotwrt+17p0Ga+8o6Yu8VB0qxiohm7hI2Yy8YO26+oCgqNSYcqNz5GcOntE5OTpz4hEPhMG+T6FzL/SPSgN4+S6B6BYjdKhUhW/hZd7HcDPJ3tNPQ/whwSD42cbcAOqb34ETXOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730907965; c=relaxed/simple;
	bh=jGbCrzUbZp2u5YtIo0PP6eyDGzjxS7yYzEKG15LfYOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdNz4a2pYgSbYPDXEgdomDv2BwMPsenD+agD+sI7emw23DEHnLYtCt8psqZrxDQP0h1xZCnmhQI07JmeZEqSJNjYa/HWnLcH3dKrX8ZqXWsMyHeGbIo5M2wW1fwDlfaDrMALTlz6Ggg+ie0JblSKrj2fTB+XwizXT6e281QRaKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oItdlH+d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C976C4CEC6;
	Wed,  6 Nov 2024 15:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730907964;
	bh=jGbCrzUbZp2u5YtIo0PP6eyDGzjxS7yYzEKG15LfYOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oItdlH+dWk1lpp54VtYExAV+WCQGJpdcwNefEV2kzp9a7FSSklkL9mwp6KnpEV8jM
	 nK7/wg+VN3nStGQDb8lKGjShRNPO2b5nnx6vjiPhX3qG0GJd3h+1SNauH7jCCrXQUk
	 Hz9GojUCWXYrJq+ZEF4GvZmP9mAs0LG8uDdGrZb/3Vihh5NIgdlZyi49Gi33U4lI7V
	 5Ipmn6hfOKT2IoArSbi9+PHD5RPagD1FGaHORgYPY/tkCcHU2ofhLfucgXO/51xKbk
	 uBpVt9Bbrx8rbb/197ZeYqO9xPezzmRz2brB/WgXuOU4UHV0UT94vjaHTRCFCLLb4I
	 4jatGmTudy4tg==
Date: Wed, 6 Nov 2024 15:45:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_sravank@quicinc.com
Subject: Re: [PATCH V1 1/2] dt-bindings: crypto: qcom,prng: document QCS8300
Message-ID: <20241106-prenatal-skinhead-238bc24b9bca@spud>
References: <20241106110002.3054839-1-quic_yrangana@quicinc.com>
 <20241106110002.3054839-2-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9u2f3YU+sdQmMvdh"
Content-Disposition: inline
In-Reply-To: <20241106110002.3054839-2-quic_yrangana@quicinc.com>


--9u2f3YU+sdQmMvdh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 04:30:01PM +0530, Yuvaraj Ranganathan wrote:
> Document QCS8300 compatible for the True Random Number
> Generator.
>=20
> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--9u2f3YU+sdQmMvdh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyuPNwAKCRB4tDGHoIJi
0pzdAQCCvkhsQmr40/DG0V79izAaAFFa4GjPhhhyq5UNzLmyxgD/TQ4UYdVEnj3b
yEEEmpwU1KWEodXIG88B0IcT3d5xlQo=
=/19M
-----END PGP SIGNATURE-----

--9u2f3YU+sdQmMvdh--

