Return-Path: <linux-arm-msm+bounces-56175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8B1AA3C06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 01:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4787F4C79E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 23:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DB1276026;
	Tue, 29 Apr 2025 23:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OR1OAfO6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC4626C3A7;
	Tue, 29 Apr 2025 23:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969176; cv=none; b=V+8Vb+RGecmfDm7v2Y4Dphm8oIu+0H9xDyZU9Rh8mT5nxEXL8szVJjIe4jsaIZijO61pJGF+N3XpZbNF1k2Ws02RhIw7/mmIQbZOZCcKm7TnyHipZlU26R1JvvEPaEIz/c9VvZ9+8K8n76z3qluqxs6SSBwlP90GF/aW+Ohzlg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969176; c=relaxed/simple;
	bh=0Rks6peMxs7eDZIvPhMdNhHf1iK3EkkS3GgpG3YmI+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhOyRIho0j5lGHhtqnsQzdDU4Y3sh+a+XYh8XzGqlmsj8SEgwJGsIo3ZAMvzyYm5v7v11xBI7moYXoWJDSBsXobDEhRIQb9JjPeIZerUZCdnYbaqb+EsE7WJd/mATcX3JDgicP43x/LFdw2qBvLl7+kTinzQ+fjiSyNQ5c1bpvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OR1OAfO6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9005C4CEE3;
	Tue, 29 Apr 2025 23:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745969176;
	bh=0Rks6peMxs7eDZIvPhMdNhHf1iK3EkkS3GgpG3YmI+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OR1OAfO6XErABlcFrbUxlJUPCmRlktygqSHNkmhEI/EQhIwFKyYhl/XSX9LQGluyM
	 8tOiElDW1FrZNP1T4RcHHsT03pmFSARUTGN7HYBMq86AAM4Q1MOGfl7K6QlEALBvGc
	 ubHYeB/kFgXMFqJVQCfT0lhz/ztR5YC2tIejyvXlAuu5LtgWSeLDJxk/2U1l/3OF9e
	 HS+LFoc7336syRVYSjtBrAR+Fnj1wHwARs3xPb8hZhdpJYlTopA8nyW6qvPDwfso45
	 xiagRn1agrf4HG8RL2eteDKYgIsae+96ykw2jRLxBp7MFktw/+OODBDwdsGckTFwgh
	 5f52PLU+dEbiw==
Received: by venus (Postfix, from userid 1000)
	id 0482A1805AD; Wed, 30 Apr 2025 01:26:14 +0200 (CEST)
Date: Wed, 30 Apr 2025 01:26:13 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Xilin Wu <wuxilin123@gmail.com>, Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
	Srinivas Kandagatla <srini@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
Message-ID: <wsdhqocld54ygjrnn6etydorcg6j6uko4ner2dawoomflvu3bp@tq5jbqcahip4>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="joovzil73wpiaaae"
Content-Disposition: inline
In-Reply-To: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>


--joovzil73wpiaaae
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
MIME-Version: 1.0

Hi,

On Tue, Apr 29, 2025 at 10:42:28AM +0300, Abel Vesa wrote:
> It all started with the support for CRD back when we had different
> compatibles for eDP and DP. Meanwhile, that has been sorted out and it
> is now figured out at runtime while using only the DP compatible.
>=20
> It's almost funny how this got copied over from CRD and spread to all
> X Elite platforms.
>=20
> TBH, the best reason to drop it ASAP is to make sure this doesn't spread
> beyond X Elite to newer platforms.
>=20
> Functionally nothing changes.

Looking at the diff I wonder if this part should also be simplified:

/delete-property/ #sound-dai-cells;

This is done by all upstream X1E boards, so maybe just drop the
#sound-dai-cells directly in x1e80100.dtsi?

Greetings,

-- Sebastian

--joovzil73wpiaaae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmgRYBIACgkQ2O7X88g7
+poM2w//YDAA1ANiEKvaeCjg4SZIux/y+AZJwyA2EsR95xI+0CFYrJEkFc6ZSltR
D8YTHlGuJ/Rz6jSXiCsVyCoS2si3PuO7qwIiVBOTGcSAHZB9un+FJg2h5hKAU1nX
PDvMnHd0AfPM+5PnglymfYsrLCwJZSJ2FifMpeothuRAeKnkoA9p74MjqfnWVv1+
/EHzVEUejNfViKOBXqQHQptzWq2ZB3PcTnTu0VB7EaeSe8+bhfN1BD3HcYjkJIOp
Kz2X6YGIePKiU5U1N0taIcA/eh8ab94L5aNpO/nroqrj0UxfHo1fYdZpEZZVU0zD
2u3z06Z2095rZFItMop2wQemB0Z0/GpcJ4bFQH3Ad1QQAzRIlSQy2LmCvp+koNB2
D4JZWfBx6gbXjyMHSQ3EEXJjQau45IIqWJ1gqIE2712M1hfdAhJC2adgQjBK5AeL
F3Nvrjz5Tk38U0/gQYF1SckcsQobFZj2seNOP/jQL+0ynkqADykgrp0R5AqCY4VQ
NY6gyQah/yEyt1ezP38dbz4Sh41RVxXkQOyRuw1jeAtj1NFlo16UiP5yRiO6ovL3
XvEkvjuZDNif1sbPGJZJOOHpc6KHv1WZY4FvOFNRSRK6M7dsSEItr3wFQcbFirqu
28DdYGcCQ4uZfDcls1K/ApsT+yWt5QDO/VSvOGseKDJuC1dCbac=
=RlXt
-----END PGP SIGNATURE-----

--joovzil73wpiaaae--

