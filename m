Return-Path: <linux-arm-msm+bounces-25277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2699992766B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 14:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA2F5B213F7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 12:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269131AE841;
	Thu,  4 Jul 2024 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pybzrS8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FDB1ABC33;
	Thu,  4 Jul 2024 12:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720097520; cv=none; b=MGhAEIlQEtU1H/JXzFAFoeKFMejn1ukaBgDveac7rze+rORc3VQ1yx/LMOShqaHVE89VQFJZL+U4q/62N9YhtAlz1FE1sMjcBEFjcWAVGG/7UGOO/c2ZzNw8FCVUiTPKVhjtvhJwNLdS+t9WqzFgf5FzIhLkzSV98yYFv+KXp30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720097520; c=relaxed/simple;
	bh=YrQz5guExrbPSHzat/Q9thr7TCy8aJ+9lSVYR0+QNZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJuKmMFMJTuW51LhSuPcfP7OjMgGtvQB18nx4e4CIBv794FJGbZaEd7FNi4UAAN4s+us1+eM9tcDHZbOA+sbT/FqpJ44BAJdXjT5yvvkh9JDczcI/WqD+CFpS0jWvgV+B2QGjsYOt6TdyaAL9GRl3vpw6RDg/ch83wts/nPmEuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pybzrS8G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4402DC3277B;
	Thu,  4 Jul 2024 12:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720097519;
	bh=YrQz5guExrbPSHzat/Q9thr7TCy8aJ+9lSVYR0+QNZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pybzrS8G2NwCaHBvAcZ5ibY0zOdQ8v2euN1cTzu/jHiFVGO+9Kmdg4UwbF6yDRThp
	 YTDZvmby6E9wlcrh1izqRz8MkRLkrH/wLsdbaNOLjSijQNcZFhEUv3OHFswqviQDP1
	 EM3PDTLkJOWLMNHsSixLHmS9mQ/xi4IDVxMFMpoQTuMr1GKFTw1WA45TJgvqxJqpbF
	 gXASDTt9VHKp+pAbuaOmZo72A+95QupoPaLzxtluaeh92eGe/skM+kxXhfmVJhm58g
	 u/rjqAJCigMMDUVYMKdDBln4ITUCq9PcBDXISQ3N6rZ4wNV/m38yuKAjK8VGbxWeab
	 pN8UXnS/gDO8w==
Date: Thu, 4 Jul 2024 13:51:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Taniya Das <quic_tdas@quicinc.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: Re: [PATCH 3/8] dt-bindings: clock: qcom: Add SA8775P camera clock
 controller
Message-ID: <20240704-overdrive-clay-0b53fd231850@spud>
References: <20240612-sa8775p-mm-clock-controllers-v1-3-db295a846ee7@quicinc.com>
 <0fd113ef-67f9-4510-ab28-8b49089ef4ff@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OeYjdNP8qyimM1wo"
Content-Disposition: inline
In-Reply-To: <0fd113ef-67f9-4510-ab28-8b49089ef4ff@web.de>


--OeYjdNP8qyimM1wo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 02:20:51PM +0200, Markus Elfring wrote:
> =E2=80=A6
> > +++ b/include/dt-bindings/clock/qcom,sa8775p-camcc.h
> > @@ -0,0 +1,107 @@
> =E2=80=A6
> > +/* CAM_CC clocks */
> > +#define CAM_CC_CAMNOC_AXI_CLK					0
> > +#define CAM_CC_CAMNOC_AXI_CLK_SRC				1
> > +#define CAM_CC_CAMNOC_DCD_XO_CLK				2
> > +#define CAM_CC_CAMNOC_XO_CLK					3
> =E2=80=A6
>=20
> How do you think about to offer such information as an enumeration?

Please look into what binding headers are used for Markus.

Thanks,
Conor.

--OeYjdNP8qyimM1wo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoaayAAKCRB4tDGHoIJi
0m1WAP495Eo6blAMERF+1VgHmCUD5zy6kf7Txdvtoo5hCV8n3AD9EGiIUAKCoXQs
DMzGn9t9y+cVcWK5jp8A1DSu2keflAw=
=0Fcy
-----END PGP SIGNATURE-----

--OeYjdNP8qyimM1wo--

