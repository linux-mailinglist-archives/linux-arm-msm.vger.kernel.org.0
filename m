Return-Path: <linux-arm-msm+bounces-2924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D04C801075
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 17:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D4741C20C12
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A800D3C065;
	Fri,  1 Dec 2023 16:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqkLVWvE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7922B1DA50;
	Fri,  1 Dec 2023 16:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D10C433C9;
	Fri,  1 Dec 2023 16:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701449177;
	bh=LFxpOweV7KVhHEesZpu+S1zzkJsuWf07I3KrLAutqs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GqkLVWvE/Dk4oW6RsREi2JzmNu2WivSa24e+YqDv01BLNe8eoLZDQjCrMDPRHBHF1
	 Jii8aN5YItrcg7bA7JLNwLNT7B1F36xrV1lTG++opE+eW2yQz0IyV/kxTjtdWe6uKl
	 spmKDScf9fbukaDmt3BQXmuhsOjrOhRu939AKtI7l1vl8bfYQ2yvW+0bPj/v7Atvl6
	 mZYCT5WpQ8iPjNeX7ENlYjz4S0rZFGhnuh2gEr71DfpSJQM1af1s0gfv+waNnG47Fh
	 j8kC4t5PbGm8QvtaKSw1vqZJFw5O0UDXbjxPl1iufsqn7y5vQOykysZWCpLftzWpma
	 68wXM0zVIan1Q==
Date: Fri, 1 Dec 2023 16:46:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>,
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
Message-ID: <20231201-thrive-gully-5260ab07b352@spud>
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MfDi0fzK8bz3SQxU"
Content-Disposition: inline
In-Reply-To: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>


--MfDi0fzK8bz3SQxU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2023 at 07:44:22PM +0100, Krzysztof Kozlowski wrote:
> +Indentation
> +-----------
> +
> +1. Use indentation according to :ref:`codingstyle`.

One thing Jonathan mentioned before to me was to drop this :ref: stuff.
| > +:ref:`devicetree-abi` more information on the ABI.
|=20
| ...can just be written as "Please see
| Documentation/devicetree/bindings/ABI.rst".  The cross-reference link
| will be generated as expected, and readers of the plain-text docs don't
| have to go grepping to find the reference.
https://lore.kernel.org/all/87bki23rbx.fsf@meer.lwn.net/

Apparently the doc generation scripting can automagically do the right
thing here:
https://docs.kernel.org/process/maintainer-soc.html#devicetree-abi-stability

Cheers,
Conor.

--MfDi0fzK8bz3SQxU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWoN0QAKCRB4tDGHoIJi
0j9wAQDnyvYZgmaO0R7WxLXB+G3r+OjlxJNGnsVe1AuYO3IFJAD7BhbA4vqCT0nw
+WHXQA71Ia5T1lkozqxKhBUILq7PPAw=
=V0a1
-----END PGP SIGNATURE-----

--MfDi0fzK8bz3SQxU--

