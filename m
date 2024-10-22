Return-Path: <linux-arm-msm+bounces-35463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6659AB409
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 18:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 066EDB225B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 16:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2731BC9F6;
	Tue, 22 Oct 2024 16:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLAFqO9f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21E578C8B;
	Tue, 22 Oct 2024 16:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729614658; cv=none; b=fNTa2AXSViGfhXJJl8nF9njlG2/1P9e0yGO9mY/yQIMHzjVDQKkAVwMsINwgIfaQJW+4M3x6dqFeyc4dyBQ24hQ9O9V8A7lZjO26HBYu4bNEBFIt5hQd7i6XC8a6P78sXFSRsj11eI1rMpABbJ9O/3yt1OgcVuJILPNZBBLO/+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729614658; c=relaxed/simple;
	bh=GFBpsnrLl+ggJcH0qBjNggqqFfoYPvgmXvN+kMvJ73s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HY3IfouuqDrEr2K94b7ty8mGa+pC/5KICkQMJKo0tVMf5VXPDBliL2sPSX5/KAWQRxHhxX07y+ukFNP26ghHsRf1UV+OAiZBUVYvJzr5ECAlwczn5KRglYdhaqwtijqQLHNhQaDAlM/kMG4mFuCOmuCiiRF9Nd8eO19lAnYYDT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLAFqO9f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4397BC4CEF4;
	Tue, 22 Oct 2024 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729614658;
	bh=GFBpsnrLl+ggJcH0qBjNggqqFfoYPvgmXvN+kMvJ73s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kLAFqO9fTxEyUZJt4leRUcR29md6XNGm0WjSob6u9WpqvtGsVerRgv4IIYjvcu/4L
	 NmKe2k0lwdzOS1mEOA29ckVCGYkHh3kmedf9AWOhIeUvPKpLjvOz8GzfH6phoA2Wh1
	 V023mSJ5rXrQz2aRTiR3vGW7l67K7A/8bFVJPD7fJCrVbXkkJssORn2wOt3Wfn2+zm
	 8TGAaKmyx4j/Nxa7SmuYsDBgcobEtIJ3uZvqWIw3k8XFN/HUIReMDQ/86qJRFWvv36
	 0RnLwLV9MWzw5f9h95IZ24/Pv9y7fI8qb+3ZNFQIa5NGVNLuQBj61a0ErK4AiFkmAl
	 9Wo9Rp6dtzmDw==
Date: Tue, 22 Oct 2024 17:30:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: Add Parade PS8830 Type-C
 retimer bindings
Message-ID: <20241022-consoling-settle-efcb2d3fa8c0@spud>
References: <20241022-x1e80100-ps8830-v3-0-68a95f351e99@linaro.org>
 <20241022-x1e80100-ps8830-v3-1-68a95f351e99@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bkcrg67es91vbYDS"
Content-Disposition: inline
In-Reply-To: <20241022-x1e80100-ps8830-v3-1-68a95f351e99@linaro.org>


--Bkcrg67es91vbYDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 01:26:54PM +0300, Abel Vesa wrote:
> Document bindings for the Parade PS8830 Type-C retimer. This retimer is
> currently found on all boards featuring Qualcomm Snapdragon X Elite SoCs
> and it is needed to provide altmode muxing between DP and USB, but also
> connector orientation handling between.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../devicetree/bindings/usb/parade,ps8830.yaml     | 129 +++++++++++++++=
++++++
>  1 file changed, 129 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/D=
ocumentation/devicetree/bindings/usb/parade,ps8830.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ee4c69eca6066e4da0373fad6=
c25d6e9fff83366
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Parade PS8830 USB and DisplayPort Retimer
> +
> +maintainers:
> +  - Abel Vesa <abel.vesa@linaro.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - parade,ps8830
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XO Clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +
> +  ps8830,boot-on:

The prefix here should be the vendor, not the model. How come whether or
not it is enabled at boot cannot be detected at runtime?

--Bkcrg67es91vbYDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxfTPQAKCRB4tDGHoIJi
0ix3APsFe72ThBvEC1l3BIdaZ6BLbN8pLkjNsZ89RxknFCEOAQD+NcySRlutx2qH
MHZ/3YeiaAaO45e8rXZSb+V7dtrTRA4=
=uogR
-----END PGP SIGNATURE-----

--Bkcrg67es91vbYDS--

