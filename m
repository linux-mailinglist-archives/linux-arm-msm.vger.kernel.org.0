Return-Path: <linux-arm-msm+bounces-76985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 504F4BD28C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D13794EF83A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205B82FF163;
	Mon, 13 Oct 2025 10:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3YuApJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E495B2FF158;
	Mon, 13 Oct 2025 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760351069; cv=none; b=IAxBNRZJHeaPiCTjnP0B05GETKi/oYKCU8hJahtyo6P9/+ij4qw+f7FUCD41VsxEDgWgGqfg7Qczaqx+4/IdEnnjbFwaRFkDxp/RV6rlb4jZCvl7EvZFKwLAcNUXyvEw36zMJlrYbqFds8IRx5iK8CDyMaNXOJNg8y2JfIqQuwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760351069; c=relaxed/simple;
	bh=cC1nASt5eHxqU6LR14TJQaGjepkYHmYbcqg7t5Fm+D4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uh/B0+4Ge0PhAs/PClQDMGiHT0gXd2mQ46R542HIlmqp4LJoAAcQaju0W7rjFwQxeJPskLZd2ThBzTUVG/5Bdxug5cQwyWfjmmw8VGJlgxGlcOmKeOr8L2OZVRKeuarJ+Fm48JEQVp/xBEiEtcEL2eKZO+iFRQM/c2Ikc3eGjfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3YuApJT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB7EC4CEF8;
	Mon, 13 Oct 2025 10:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760351068;
	bh=cC1nASt5eHxqU6LR14TJQaGjepkYHmYbcqg7t5Fm+D4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H3YuApJTJiNXce5WAStYOSESlyoP9hwUj7HfBZ5IcQOPZ4udyGgJZURuIBJgseWDz
	 Y0EIzeQcp1/bCjDOMGNemLki72wAITLABmlS29QAoXmE66pZnvfyOQWzC/PApUye+L
	 xJSq37+oJ/dAGLdSK4Wfxemvuh9kHur1KEamFoc5HjLKnbRjh7vXDmw2YTxFq86OjN
	 IN8O0210nttqXS/H+hBlL3xDo2+jERcU/CtJrkkP/gAkfrxR22Kf+YpSOUvVY7OKvX
	 l1ZuB0PC5DMdrBUJKxt+yMvAuHAFZ46YXN/2TEMUavJqDmWUIBOOFi0yJ8RhT3OpRg
	 D2jGktMu/HoMQ==
Date: Mon, 13 Oct 2025 11:24:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] ASoC: qcom: audioreach: Add support for Speaker
 Protection module
Message-ID: <66845d7a-934a-49ba-821d-362dd9cd7e2b@sirena.org.uk>
References: <20251008104448.117167-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6lXtNBlW3HD6Y3eU"
Content-Disposition: inline
In-Reply-To: <20251008104448.117167-3-krzysztof.kozlowski@linaro.org>
X-Cookie: To err is humor.


--6lXtNBlW3HD6Y3eU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 08, 2025 at 07:44:49PM +0900, Krzysztof Kozlowski wrote:
> Speaker Protection is capability of ADSP to adjust the gain during
> playback to different speakers and their temperature.  This allows good
> playback without blowing the speakers up.

This doesn't apply against current code, please check and resend.

--6lXtNBlW3HD6Y3eU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjs01YACgkQJNaLcl1U
h9A8Dgf/a/V95VejXXifw6yhSP8NFnM0V47oezOMceLl1QgnBbm/a+yjcpjseB4D
Bsvr+aI6iedmGXrarZfsNkYHnMhX+AfJwWWwau/OXltYYEQ/hyBj+B9UCxGbJ7Fv
jPZHMGmZkv96AreDXLVPvYER7HFl44nWTJShAJiIYI7SLUWTl+94yxqW7l1s/9Ee
5iIVOf8GafFPS8FAHZFQ0tRTN0UyjkjeDO+jEL9YMLB24wavm7TtmK46VigX/G/Y
3yKWCk4mjOIsbDbpXNb0SxVafIlcY2yMwtWCIuAj7ZNhSQeMEM5EAGaIVP/gZ7vP
vle3wl3VGZPr0Rjps7xB1luAMk9lBA==
=4Vos
-----END PGP SIGNATURE-----

--6lXtNBlW3HD6Y3eU--

