Return-Path: <linux-arm-msm+bounces-40490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 703309E53DF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 12:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EE90283F1A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24271F130D;
	Thu,  5 Dec 2024 11:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOkuFIbU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2331D63F6;
	Thu,  5 Dec 2024 11:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733398032; cv=none; b=UUZtOMrTfcdaLdA4lRXZnxtX3/3a1no5iFN2rPx1ARiiVMOtsPA2ryXwe+E2l6/jpAfhGb786K83TWfL0SdpdApF1Uz5aZ0Kzkke6p73jdt9VH85Xccitt7RYqbstSPCmnD5DsHuGLJ1om2A4RadFN3gAT3LUe2nrd1bpEG7MX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733398032; c=relaxed/simple;
	bh=AYs08EObt0eCzqYm9V5tzJ4x2kKzQT6Rus4el2bZdEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOnADjXA3wL2paBkgFQI8ro2oxBiU1G1hRnucnUK5+85+S+5QLaEj5Ub43BCucgU8Oq3Nzc6Q9eTI/1EtIpnWQEQvr14Tn+SonoP7ug4+WS/adsABvV55BdAjH9CQtJZDFc00HROn9LTw1QycpOLBnyTMMQp7Xd0P1AYTNyL4ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOkuFIbU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53445C4CED1;
	Thu,  5 Dec 2024 11:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733398032;
	bh=AYs08EObt0eCzqYm9V5tzJ4x2kKzQT6Rus4el2bZdEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HOkuFIbU1O+mhqQXEgIQPqe582T5K+K8UwLP6ycsEbLo3Xv0POj+U0biSEv5DecKP
	 hSXQsNRFdFsDpQFtgZlRhmzsoAJcfaYXkhIquTE8/ZxIWEcvjMVIlMqFJMUzGNZt7B
	 B5+2YNZVxMU7LsQF+SkF+TWGbsFNrz/hEPdzWRgBbyBeYlQZi4gyoX17TajC1YAqGe
	 /1XGSi7LWskaTwUP6+eR52N6NMwbJcLz8F+PPHehTXiZI8Xxo+j9SqYhLkyfyu+GVd
	 AqY9dLawmLdE3uzxPQYCt5RbFeHaQ8pl5CJkaQEgNVYC4zoYQ9/A7k8Fz/8LSOrpfA
	 aKPOtFJtwsxvA==
Date: Thu, 5 Dec 2024 11:27:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dzmitry Sankouski <dsankouski@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: codecs: wcd9335: Add define for number of DAIs
Message-ID: <3dd6b0e0-942a-4768-a4b6-50bcc0302090@sirena.org.uk>
References: <20241205084021.35610-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aQ65lVEGTMIKdCQ4"
Content-Disposition: inline
In-Reply-To: <20241205084021.35610-1-krzysztof.kozlowski@linaro.org>
X-Cookie: System checkpoint complete.


--aQ65lVEGTMIKdCQ4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2024 at 09:40:20AM +0100, Krzysztof Kozlowski wrote:

>  sound/soc/codecs/wcd9335.c | 2 ++
>  1 file changed, 2 insertions(+)

> +#define NUM_CODEC_DAIS          (AIF4_PB + 1)

Several other Qualcomm CODECs appear to use this define?

--aQ65lVEGTMIKdCQ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdRjggACgkQJNaLcl1U
h9CJRAf/SCPcpfJuyijaQZvEMrrh2MfnSwOq4MCDjJPgy4Hp001whksjUpZs9tit
cKHexXhZ34EBST9n+vMJpgSCQ60j1w2wASlClK7tsWz4LKHR38gHkzVHMakBvNzi
UVatGBAZHTSgQxgBGtThFQSGfOUOTNcJSo303gxk5ycUaTcqAIJa2X6Vh0ll/zrB
oNUUBivQPo1ncDuJZ5lSCpDFbm/BDx1QCrScokqbpj3D6iFGETYBF8I40rZD+u04
SkYBUgmJfHx4OZYROXPDc0SgPuKtCeumDdCNdOqd73wHoxIBV3FyWzLRiHMj59En
jTmZ6AAnX41dw+HtS7cTdzMQOQlllA==
=ggb1
-----END PGP SIGNATURE-----

--aQ65lVEGTMIKdCQ4--

