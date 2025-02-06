Return-Path: <linux-arm-msm+bounces-47047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D45F3A2B08E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 19:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCFD5188BB0B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 18:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7921DE8A8;
	Thu,  6 Feb 2025 18:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coSja6AX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FA91A0BF3;
	Thu,  6 Feb 2025 18:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865766; cv=none; b=uQHZTnoI265qVYTSCC3NjMmYfEgLQWnVwqvvLdKY4QoJh35tDV5Q/eMOZ677WoOIpfnPRDaDMqeUudbVAEx+nypsDKbQbhift01gJxJ/xsF6nr5lvIlJ7Vy0dLiSmar+Cm6qovNfyEHW7jnhAAm0JaIUhX/pUA2XZLpck5PjMVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865766; c=relaxed/simple;
	bh=rkwyFkT1EbN8duRPnMT1XIUJb0V2Pm6NPMAaSFnGjjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRfwmEeF657OT0ZWPj6zODx3SgntQ2d1IMQwzn1Gh2h6N0zoBJ1UsuaClqxseFxFB60OVLsuIan4XbAVTiYl+HhWGCwbnam6CBC1aU1Mzu+ipb1tt5E8ZrztR6ftGsh3GLkTkXh4fceD+TMsTPpMep68HBtvjgrtO49nuZmMIQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coSja6AX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A21C4CEE2;
	Thu,  6 Feb 2025 18:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738865765;
	bh=rkwyFkT1EbN8duRPnMT1XIUJb0V2Pm6NPMAaSFnGjjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=coSja6AXd6MQfZbRyxD/E3sRpcknEZ03tVCc0Apa6QVlNHbXnBBink2aFeGLkNBAV
	 QleyaNLMjP0vjR9J7Dm25ZCb8pFgQuMVEa5CkW7Up4igdaxTlRDhnkIOAdliBl5Ncf
	 145TKdFDrlFdKLJpaKdfBntD5elYD/5O1Jzb6/Lx199vnVfZrhGDSjzpxUczbPHzKt
	 HJbzVEirIsDrcwMSPovznKofVpJ3sUmnjq6MNj7R4N07fjNEacLSYWXeTjHbothH7U
	 HpLeapf6NFJp3SB+CP6pHUorhCyzDkmfLZ0rxtySgPiUXh6wFDf+F6Z/INWTDYxc/J
	 8fgQlyoAZQiYQ==
Date: Thu, 6 Feb 2025 18:15:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: Add Parade PS8830 Type-C
 retimer bindings
Message-ID: <20250206-poison-handmade-091e9cb58c5e@spud>
References: <20250206-x1e80100-ps8830-v6-0-60b1e49cfa8d@linaro.org>
 <20250206-x1e80100-ps8830-v6-1-60b1e49cfa8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L1/lhnsuiEdnY/9A"
Content-Disposition: inline
In-Reply-To: <20250206-x1e80100-ps8830-v6-1-60b1e49cfa8d@linaro.org>


--L1/lhnsuiEdnY/9A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 11:28:27AM +0200, Abel Vesa wrote:
> The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
> controlled over I2C. It usually sits between a USB/DisplayPort PHY and the
> Type-C connector, and provides orientation and altmode handling.
>=20
> Currently, it is found on all boards featuring the Qualcomm Snapdragon
> X Elite SoCs.
>=20
> Document bindings for its new driver. Future-proof the schema for the
> PS8833 variant, which seems to be similar to PS8830.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

This seems fine, but usb switches aren't something I know much about..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--L1/lhnsuiEdnY/9A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6T8XwAKCRB4tDGHoIJi
0ht7APUXSyfjFXBWF/j++c7tfhr4QQa2rEII3S0K9QsNpJAYAQDa+n2lghR/tl1C
NbgIMl5r93WvXL9zcUxpyNf4YnW6Cg==
=eH4j
-----END PGP SIGNATURE-----

--L1/lhnsuiEdnY/9A--

