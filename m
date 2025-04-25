Return-Path: <linux-arm-msm+bounces-55774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B31A9D396
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 22:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 467D9189A68D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626DA22259C;
	Fri, 25 Apr 2025 20:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfSm/T6/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2156D189B80;
	Fri, 25 Apr 2025 20:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614580; cv=none; b=FCUyz2eBJIDO0XTD+HrtG5d4f8qlDjmM9fnlTz+9kJFN52NEoyTzwgd2+33HC0VXJ6adwjaI90QF/IOrcy19rQ1kgJud8VKz/qbQ/6CqHQwoEqu+KPPQuCGSjnKI2m2EZt2+9QIULa0xe8kKBN31N9i9JyzvG4XF8lUEdPzYRUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614580; c=relaxed/simple;
	bh=T8fYF24SwYfu9rErGNxqBq2jkVKo0vdh4XoZjEwljK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTLiWX79Kf8OcynbjrCunvRth2AlrUN898wYwiP68zHmekv4fGed7z+DFBCbzhc3qqF5Tq1zR6iNpFhnhCQwF0Z6xLBlXUhsNMv4m5kxvJpN2QIwTf1BHDSOCzDBJEgcyHT/BQizjfDKR+FdBwaHz+SgY2eK9VmPH+Ti1XrMqeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfSm/T6/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D301AC4CEE4;
	Fri, 25 Apr 2025 20:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745614575;
	bh=T8fYF24SwYfu9rErGNxqBq2jkVKo0vdh4XoZjEwljK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CfSm/T6/esF2jtxHiPEPXjIBobhYAsv2+tXl2IfgpjaJeNefSSfFxqxL9kD6QDGvP
	 a5mzsBVqtplL/E/7NA3HkVG339eQtwtoRR+5zqA2hwKQmD1V/q54gRzs+ov39XXD1k
	 lgu4rufRPt63LBbtS1lvSnfBQ96rivGatMUpzqUqaJXABX4BN8sqw2h/jyCkqfcOE/
	 6f6MGiZZRSTuzZdv3WIVU5ZuWPZRdpfMI/2ijchgFiE4JoAu1Snp9tW83o0GaCR5LB
	 leswjaZW8hEeRkGWR3QSqlBajZhjshUSTM4lLXbgdT03jr8+rXtyhFIyBCRihUvWpr
	 18EodjpUiCVFQ==
Date: Fri, 25 Apr 2025 21:56:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
Message-ID: <d65b5d50-d0f5-43b9-b657-3fcb455efbbe@sirena.org.uk>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
 <36904d64-68e1-43b2-baed-50b5fddc2bcb@sirena.org.uk>
 <D9FXE4TJ23QB.1CS3D6PU2FGMR@fairphone.com>
 <ccca5e19-5a4e-423b-923e-ea0de6682752@sirena.org.uk>
 <D9G0JHKZ0RXB.3LI5UGS7QTVQN@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uwgD5b/ZvDIIBNta"
Content-Disposition: inline
In-Reply-To: <D9G0JHKZ0RXB.3LI5UGS7QTVQN@fairphone.com>
X-Cookie: Debug is human, de-fix divine.


--uwgD5b/ZvDIIBNta
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 25, 2025 at 10:47:42PM +0200, Luca Weiss wrote:
> On Fri Apr 25, 2025 at 9:03 PM CEST, Mark Brown wrote:

> > Or base it on my tree and let things get sorted in the merge, I don't
> > know what the conflicts might be?

> For this patch here it might be okay but patch 3/5 from this series very
> much depends on the patch in Greg's tree, given it refactors/expands on
> the USB_RX if there. Resolving this through merge wouldn't be very
> pretty.

Well, unfortunately Greg didn't put things on a branch so yeah waiting
for next release might be easiest.

--uwgD5b/ZvDIIBNta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgL9ugACgkQJNaLcl1U
h9DXQAf+JaH2w6iyAMP0Bjh76NxowG+Y8EcaCQPReo9JeAOyppcpfB4NnjGm1uNL
upySVWVCRrkZWXbmUTIINtq21b5f23HllaDiB6tV7hig27nhWVixom/DydlPRdvg
1Itqw6ge9SDFd2AJ5Pao9mKwC62RaeRKqBFX3CwPnIEgokaoPZJwTVwWCO6UzAAg
duA2KDdSy0R2aLXN8hMlrv1YIGxKmuX2Si5a1rk1zqfKC7Hja+Eu/9GENzUdsI2t
agMzo/YxmoeZBFKhaUUAcsNSUE4OYrebbAw8NkzNwwPJp1W32xOIhE43MfdEhYpq
qYkie4IDHDQ3G1+BngZVG7woqsxCzQ==
=Hj7X
-----END PGP SIGNATURE-----

--uwgD5b/ZvDIIBNta--

