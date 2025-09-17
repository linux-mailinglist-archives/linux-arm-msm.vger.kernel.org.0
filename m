Return-Path: <linux-arm-msm+bounces-73908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 048CCB7CC76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 962CC18858C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 11:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490AC35690C;
	Wed, 17 Sep 2025 11:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSfaV//+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0802F5A2A;
	Wed, 17 Sep 2025 11:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758109190; cv=none; b=bopWPYnkVX+hl3XEx5R1MOnTb7MWJedTke9d7VCJQ5ovteQHWNpIWi0KhUzKwj49XuFMlMkimo0DsZjg0m5+iYT2o8IqK0KR1+gbHOORdiHtN+PU+5gqMH7Gfxf8YB0GbsmXzZOxWqEu+HkH6STBswAXd1ne9OtS17wW5jqCKP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758109190; c=relaxed/simple;
	bh=JPMCEaWQxLA38lC24FQ0rxlTNPnKwalzKyJK8yfHqok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGLHeJt2XyrYpMUMphFv01J7xVNuodJfpYJDlfvlKOktoE7bvobYlaJLVfIM4KOF9V7deXQaf01O/zBRMRRM2fwi1ZIadcBGrB2Zug/WIaS7DVlYc9uXARzOO1i2mVDrKH9xcnf6M+9X1VPu4ORUeGX4lUbXGsI9qQ7Em7CNwrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSfaV//+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AE5C4CEF0;
	Wed, 17 Sep 2025 11:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758109189;
	bh=JPMCEaWQxLA38lC24FQ0rxlTNPnKwalzKyJK8yfHqok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GSfaV//+EoCRIjS4mrDlxg3qfGvWgJYLsUgBCXyoHFfaJDTMcGncpK8t0IiLP/n2A
	 5KX+jNiPHe5EafQMCpzRzRHkqRBFZ+hC5zxTugVnGns9yKlvzUwTc4VJw3shhzcUo6
	 NheeyNNDYAhwj76lcwJqSUCsZ30QrO4OeVKOkkXSBJqmyXPMUy4w6EedpMEGAxTDs2
	 uuR2uoVUe2vBGwowApwptg5R7OnZxh5lArH85tlKkQ0QNciA/QG8UMQDytjPhbap04
	 Vc9epzNOIweg9UQ4XAR7VGqfK6bqojrFm1yR8+OLkkUqLuTC82GDJ16f/0OJmKaYKC
	 0Ceo9ToVT9oeg==
Date: Wed, 17 Sep 2025 12:39:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Patrick Lai <plai@qti.qualcomm.com>,
	Annemarie Porter <annemari@quicinc.com>,
	srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel@oss.qualcomm.com,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH v3 3/3] ASoC: qcom: qdsp6/audioreach: add support for
 offloading raw opus playback
Message-ID: <1e29ebfc-9b0d-4f3e-a034-64e102273de0@sirena.org.uk>
References: <20250917-opus_codec_rfc_v1-v3-0-7737ad40132e@linaro.org>
 <20250917-opus_codec_rfc_v1-v3-3-7737ad40132e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5+aHDuhDSkVtN+Z2"
Content-Disposition: inline
In-Reply-To: <20250917-opus_codec_rfc_v1-v3-3-7737ad40132e@linaro.org>
X-Cookie: Lake Erie died for your sins.


--5+aHDuhDSkVtN+Z2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 17, 2025 at 08:32:52AM +0100, Alexey Klimov wrote:
> Add support for OPUS module, OPUS format ID, media format payload struct
> and make it all recognizable by audioreach compress playback path.

Acked-by: Mark Brown <broonie@kernel.org>

--5+aHDuhDSkVtN+Z2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjKnf8ACgkQJNaLcl1U
h9DVBAf/SyeCSpGrRfF5GOjjzgqmyrK1Yj6K1rb9dMZb8HNgOvLxADwW6TQyMiDI
wcbW54qUqw1cnGF5bmUUeKOUibxfwENLv6pLTtRSAEkRE0cKXEFKKgwA2lVmvUuy
oY1K115xjV/Db91tPeOT2MURM0riH8mCCutuKSiYsyWsy05IkyTx78e/Apus2nEo
51DaTk2bhg/4DOl5CCawWnDjDXr/fqTtyiVgoYTewAvvij8gSCRpJI9l6yfMcUpq
fEgqDCBDtUf72kisQmFUo/w2vqBUbAAEuaY7SzD/4edfp7lJvxfZRGmq420VvTK3
pF1sFsjTRokQUCRU5dCPukVfAf/Mwg==
=dm9f
-----END PGP SIGNATURE-----

--5+aHDuhDSkVtN+Z2--

