Return-Path: <linux-arm-msm+bounces-4252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C13E080D404
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 18:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 445FF1F219FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 17:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF024E601;
	Mon, 11 Dec 2023 17:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cv1+xrqX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69294E1D6;
	Mon, 11 Dec 2023 17:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CFCC433C7;
	Mon, 11 Dec 2023 17:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702316193;
	bh=Ako3lvIvEUfiqGQJq4GqRqTsaTMhVesj9bhTZOv+avA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cv1+xrqXoHFbWdUJLTpczJTYJa5136QAg8p6zLoBASeDwSQPJEGvfqHhPkQJxwAsj
	 6BZCcIbYNQq+GeQVeC8BWl3x+b2c9DBWhroFbuc6z8B2F0+aZMJWp54PixQoKCDFGt
	 jgJdPnLwggbppAuLR4+FzYF9wW5JVFrPbAxWtF6SUCOydC3D6/h+geJ6K7D5WKIPm3
	 8UACbWFhw/YQlJ8eO9XeJko/Mdo0d5j6xeTtN+y0fKPEJpwirXmqHAawBrRHO5df/v
	 GLcstuYk1daow0GukEskHUbPRdWxB8LF0oILCP8MCoOGBqY2KwnKRFO1RujcWxhzxg
	 6wCX045ThnJsw==
Date: Mon, 11 Dec 2023 17:36:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100
 LPASS RX
Message-ID: <a210dd57-a22f-41ab-8e3b-93fa1fd03a0c@sirena.org.uk>
References: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
 <20231211-cardstock-elevator-3e19f9d41ac2@spud>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n42/ISRIigQDPDMF"
Content-Disposition: inline
In-Reply-To: <20231211-cardstock-elevator-3e19f9d41ac2@spud>
X-Cookie: Better dead than mellow.


--n42/ISRIigQDPDMF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 11, 2023 at 05:29:50PM +0000, Conor Dooley wrote:
> On Mon, Dec 11, 2023 at 01:31:01PM +0100, Krzysztof Kozlowski wrote:
> > Add bindings for Qualcomm X1E80100 SoC Low Power Audio SubSystem (LPASS)
> > RX macro codec, which looks like compatible with earlier SM8550.

> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> I wish you'd send cover letters when you send series of trivial patches
> like this that could be acked in one go.

In general any patch series should have at least a brief cover letter,
it makes everything work much better.

--n42/ISRIigQDPDMF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV3SJkACgkQJNaLcl1U
h9DAmwf9FAyBzWGolz41aTQV/iYxTZfK4ZqEsyyThB9fYsQrPLVGYOw5PHpUTeul
0d88h6YldHkaT+pffLxlmSlq0D8H2XmOSsSjKE0/8RCLSZL4V5MgOksiQzQxsBUV
Sbrz2hfDZqYhg5bis2VHpjwrfdXjY7lrpOtGwomGqaecaAm7swTu3tyL7Eh23dBF
w4MpjYr20bJnbt7qwi32NxvzETYnVm0JFaX1biUkJtHowZpi55Z+9XydwmRWlvJZ
w6G3K+++zd8Wo+ViR1pYaHWOxlvLB0RXP0kEZtIiCeNAiaSOlIDcGMVwkyVGcPfF
FBb4ujCnVVxe6GlilQfyEDfJThkmJA==
=8Yu8
-----END PGP SIGNATURE-----

--n42/ISRIigQDPDMF--

