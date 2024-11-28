Return-Path: <linux-arm-msm+bounces-39489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 382109DBBA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 18:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D503616432E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 17:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675601C07D9;
	Thu, 28 Nov 2024 17:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/fFVA9e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4669463;
	Thu, 28 Nov 2024 17:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732813965; cv=none; b=WjhVmMTeC1KGKqNsL0pHm4qnj+6jNjskfNu+r/u1BzSKpftI4wZ+s8DsFffDOJyMWV9Bs9wBNi2iCgOLCTOFDhcc06SUAvN9HUru1eIjvl5+UxG4ZG5dIva0y29onun2VU8GoBk9twbRPDQLaz1G+HTJk0VK/0CJlsQsQA6uMuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732813965; c=relaxed/simple;
	bh=obu6+yPQWfPFqgWAIwUui4SC29PIZhtWgr/lVg2Zhbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZ7A1c4qI2jFNjss8IJOF0KXmZBJQnq2EZY6UNDUPcoggVqihzJK2yVGnS7g382vIiqk2ymT6/A68d0/JVeymGbADf3hB7Cov46tZRRJF/MrG7HV+ISdKFoJrdl71W2D4utgv8Wk550jyNip9dgoyp8hmcQ1FbbOYB6fNr1NyWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/fFVA9e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB30C4CECE;
	Thu, 28 Nov 2024 17:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732813964;
	bh=obu6+yPQWfPFqgWAIwUui4SC29PIZhtWgr/lVg2Zhbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/fFVA9eMCnu3Xa4i9HhBIUQxPQ7SgMF5jW6ERMZNQ3Y0w0gjudJHVykRPGz/1Xd9
	 YOYru5yRVoiniaGqqJMH6jifXSP4le+0uCvQpL+Mf9dRVpyxYXX1x20NwDY6Pb2Tp3
	 gVubJJMBhXDTKndDt0mwNOj2Qf1Ka56F2Ggz6+nSL5qgSq0GifFvjJi3xve3+JEhKE
	 8KBCSa++Fnx/lnJpNSOa7BVeJCQFd7L7sJnwNEmCPLWh/3FoV5DsK56irgFQXOrG0l
	 UA+EYDgwJ7o/kRQP5iQ9buodrqRfYS5Gb5Dkx9+qNoQyKrrRMy9eGlPMsxPEbdCx8P
	 5fzMFjAVxKf5g==
Date: Thu, 28 Nov 2024 17:12:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,sm8550-dispcc: Add SM8750
 DISPCC
Message-ID: <20241128-serotonin-carwash-62ad0fb09c3a@spud>
References: <20241128-sm8750-dispcc-v1-0-120705a4015c@linaro.org>
 <20241128-sm8750-dispcc-v1-1-120705a4015c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bY94c2bZOlNH/+X1"
Content-Disposition: inline
In-Reply-To: <20241128-sm8750-dispcc-v1-1-120705a4015c@linaro.org>


--bY94c2bZOlNH/+X1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 04:07:59PM +0100, Krzysztof Kozlowski wrote:
> Add bindings for the Qualcomm SM8750 Display Clock Controller (DISPCC).
> Bindings are similar to existing SM8550 and SM8650 (same clock inputs),
> but the clock hierarchy is quite different and these are not compatible
> devices.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/clock/qcom,sm8550-dispcc.yaml         |   4 +-
>  include/dt-bindings/clock/qcom,sm8750-dispcc.h     | 112 +++++++++++++++=
++++++
>  2 files changed, 115 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.y=
aml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> index c57d55a9293c214c4c101902cdd9603074e2243d..30e4b46315752b93754ab2f94=
6c684e13b06ab93 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> @@ -12,11 +12,12 @@ maintainers:
> =20
>  description: |
>    Qualcomm display clock control module provides the clocks, resets and =
power
> -  domains on SM8550.
> +  domains on SM8550, SM8650, SM8750 and few other platforms.
> =20
>    See also:
>    - include/dt-bindings/clock/qcom,sm8550-dispcc.h
>    - include/dt-bindings/clock/qcom,sm8650-dispcc.h
> +  - include/dt-bindings/clock/qcom,sm8750-dispcc.h
>    - include/dt-bindings/clock/qcom,x1e80100-dispcc.h
> =20
>  properties:
> @@ -25,6 +26,7 @@ properties:
>        - qcom,sar2130p-dispcc
>        - qcom,sm8550-dispcc
>        - qcom,sm8650-dispcc
> +      - qcom,sm8750-dispcc
>        - qcom,x1e80100-dispcc
> =20
>    clocks:
> diff --git a/include/dt-bindings/clock/qcom,sm8750-dispcc.h b/include/dt-=
bindings/clock/qcom,sm8750-dispcc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..dafb5069c96a0c3f83c15f3c6=
1978e138baa886c
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm8750-dispcc.h
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2022, The Linux Foundation. All rights reserved.

This looks pretty questionable, how does something that was apparently
announced last month have a 2022 copyright from the Linux Foundation?

> + * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reser=
ved.
> + * Copyright (c) 2024, Linaro Ltd.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_SM8750_DISP_CC_H
> +#define _DT_BINDINGS_CLK_QCOM_SM8750_DISP_CC_H
> +
> +/* DISP_CC clocks */
> +#define DISP_CC_ESYNC0_CLK					0
> +#define DISP_CC_ESYNC0_CLK_SRC					1
> +#define DISP_CC_ESYNC1_CLK					2
> +#define DISP_CC_ESYNC1_CLK_SRC					3
> +#define DISP_CC_MDSS_ACCU_SHIFT_CLK				4
> +#define DISP_CC_MDSS_AHB1_CLK					5
> +#define DISP_CC_MDSS_AHB_CLK					6
> +#define DISP_CC_MDSS_AHB_CLK_SRC				7
> +#define DISP_CC_MDSS_BYTE0_CLK					8
> +#define DISP_CC_MDSS_BYTE0_CLK_SRC				9
> +#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				10
> +#define DISP_CC_MDSS_BYTE0_INTF_CLK				11
> +#define DISP_CC_MDSS_BYTE1_CLK					12
> +#define DISP_CC_MDSS_BYTE1_CLK_SRC				13
> +#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				14
> +#define DISP_CC_MDSS_BYTE1_INTF_CLK				15
> +#define DISP_CC_MDSS_DPTX0_AUX_CLK				16
> +#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				17
> +#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				18
> +#define DISP_CC_MDSS_DPTX0_LINK_CLK				19
> +#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				20
> +#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			21
> +#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			22
> +#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				23
> +#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			24
> +#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				25
> +#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			26
> +#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		27
> +#define DISP_CC_MDSS_DPTX1_AUX_CLK				28
> +#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				29
> +#define DISP_CC_MDSS_DPTX1_CRYPTO_CLK				30
> +#define DISP_CC_MDSS_DPTX1_LINK_CLK				31
> +#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				32
> +#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			33
> +#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			34
> +#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				35
> +#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			36
> +#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				37
> +#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			38
> +#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		39
> +#define DISP_CC_MDSS_DPTX2_AUX_CLK				40
> +#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				41
> +#define DISP_CC_MDSS_DPTX2_CRYPTO_CLK				42
> +#define DISP_CC_MDSS_DPTX2_LINK_CLK				43
> +#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				44
> +#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			45
> +#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			46
> +#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				47
> +#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			48
> +#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				49
> +#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			50
> +#define DISP_CC_MDSS_DPTX3_AUX_CLK				51
> +#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				52
> +#define DISP_CC_MDSS_DPTX3_CRYPTO_CLK				53
> +#define DISP_CC_MDSS_DPTX3_LINK_CLK				54
> +#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				55
> +#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			56
> +#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			57
> +#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				58
> +#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			59
> +#define DISP_CC_MDSS_ESC0_CLK					60
> +#define DISP_CC_MDSS_ESC0_CLK_SRC				61
> +#define DISP_CC_MDSS_ESC1_CLK					62
> +#define DISP_CC_MDSS_ESC1_CLK_SRC				63
> +#define DISP_CC_MDSS_MDP1_CLK					64
> +#define DISP_CC_MDSS_MDP_CLK					65
> +#define DISP_CC_MDSS_MDP_CLK_SRC				66
> +#define DISP_CC_MDSS_MDP_LUT1_CLK				67
> +#define DISP_CC_MDSS_MDP_LUT_CLK				68
> +#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				69
> +#define DISP_CC_MDSS_PCLK0_CLK					70
> +#define DISP_CC_MDSS_PCLK0_CLK_SRC				71
> +#define DISP_CC_MDSS_PCLK1_CLK					72
> +#define DISP_CC_MDSS_PCLK1_CLK_SRC				73
> +#define DISP_CC_MDSS_PCLK2_CLK					74
> +#define DISP_CC_MDSS_PCLK2_CLK_SRC				75
> +#define DISP_CC_MDSS_RSCC_AHB_CLK				76
> +#define DISP_CC_MDSS_RSCC_VSYNC_CLK				77
> +#define DISP_CC_MDSS_VSYNC1_CLK					78
> +#define DISP_CC_MDSS_VSYNC_CLK					79
> +#define DISP_CC_MDSS_VSYNC_CLK_SRC				80
> +#define DISP_CC_OSC_CLK						81
> +#define DISP_CC_OSC_CLK_SRC					82
> +#define DISP_CC_PLL0						83
> +#define DISP_CC_PLL1						84
> +#define DISP_CC_PLL2						85
> +#define DISP_CC_SLEEP_CLK					86
> +#define DISP_CC_SLEEP_CLK_SRC					87
> +#define DISP_CC_XO_CLK						88
> +#define DISP_CC_XO_CLK_SRC					89
> +
> +/* DISP_CC resets */
> +#define DISP_CC_MDSS_CORE_BCR					0
> +#define DISP_CC_MDSS_CORE_INT2_BCR				1
> +#define DISP_CC_MDSS_RSCC_BCR					2
> +
> +/* DISP_CC GDSCR */
> +#define MDSS_GDSC						0
> +#define MDSS_INT2_GDSC						1
> +
> +#endif
>=20
> --=20
> 2.43.0
>=20

--bY94c2bZOlNH/+X1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0ikiAAKCRB4tDGHoIJi
0hhOAQD8VomtMHxksZJO1DjfXQ69y1VOcE6aJIcdiBPGBt30AwD+MEiXu/CuD/Fi
0yxtbCKF9hLbcAQvPpoWNuTWLc6J1gg=
=1sJ8
-----END PGP SIGNATURE-----

--bY94c2bZOlNH/+X1--

