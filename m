Return-Path: <linux-arm-msm+bounces-1744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7707F659B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 18:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ABBA281D20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 17:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A3F405F1;
	Thu, 23 Nov 2023 17:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3dFS4mk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1D733CF7;
	Thu, 23 Nov 2023 17:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32238C433D9;
	Thu, 23 Nov 2023 17:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700761104;
	bh=Yw6Y36ErXAJIavqLBexXl3lguY2vTWpO+ADAlK9isC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3dFS4mk9+zqoMSDzNRYX4a7q0zN2SB+nJXO53+w3a+g9Hjmc5PF3JytQHH+okqDe
	 OKdoDF2lSatcZdn4fOZom7H2C/OJ6jpgoWOYexLTXRt2iYpdU2kyt0OgJyECkY5EB3
	 1QUubQpzlv5VJu/Tdqdtbk7+e/4PJAZzUU4b4Zo1cKPTnGJB/3SXrnPnEjLAlghs/3
	 btsfc3dxxGMxsQLEJ8Pj7dG74en7eo7GTTGmP3tg7hxuTLWgfDErgFGy0MAZMOUa2K
	 sE5bJRtTerrBgxq/PWfZSfFON6od6oWddYy9kxyonTBoAP4hiqt2BQz0CXLogFZAUx
	 W3qlONMHoBSJQ==
Date: Thu, 23 Nov 2023 17:38:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] ASoC: codec: wcd-mbhc-v2: add support when connected
 behind an USB-C audio mux
Message-ID: <ZV+ODbskjFe5louc@finisterre.sirena.org.uk>
References: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-3-21d4ad9276de@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zYYvbpAWCNy9mneV"
Content-Disposition: inline
In-Reply-To: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-3-21d4ad9276de@linaro.org>
X-Cookie: Slow day.  Practice crawling.


--zYYvbpAWCNy9mneV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 23, 2023 at 03:49:13PM +0100, Neil Armstrong wrote:

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(wcd_mbhc_typec_report_unplug);

ASoC is generally EXPORT_SYMBOL_GPL.

--zYYvbpAWCNy9mneV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVfjgwACgkQJNaLcl1U
h9Borgf/WCcOu17PlfQEP8LcwwF7WliMIbDFpt7Sn3t6UjtZ4dG8lxo/wdWm3/zC
9a4IqCgD7yJT+N6iGTEzfXw4G9ql6x0QKA3eJhLPlcDHPUhm7K0Hk0NJZUltNSve
FScbROkncl72dzXhp3xmED1Xx+S+9lcLgQBE+LS8cYH6ifUPIe2zY2PLdzw1XQT7
jajx1PGVE7trmzx9cymbbNAGbL2At5yqdR/biX3O6ckzY3kkNThWIwAdPedZdn/S
kr/daf4kTS0ciuGI2RdeI6ZxhXt+BDEeW3Nf2pOF1ezaSnPm89GeoufjrkE3uIQm
XvoszEBrtSkSv7oM0ASB2XyrRjkH1w==
=aPTl
-----END PGP SIGNATURE-----

--zYYvbpAWCNy9mneV--

