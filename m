Return-Path: <linux-arm-msm+bounces-1828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 275447F7146
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 11:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D605628148F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 10:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798C018C20;
	Fri, 24 Nov 2023 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EIQvHAcW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2D218AE5;
	Fri, 24 Nov 2023 10:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD8AC433C8;
	Fri, 24 Nov 2023 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700821150;
	bh=OEZjeJvaa0W7vSTE88cnpZau4Nam/6qChCui4cXBaN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EIQvHAcWdH+aWdppBQyEJjgBwjnj5PnnQhO+8xHsqSeB6JHVnW6G1hVn2zzCxm480
	 H5bD3Fi5C1IuNoVzMIG9SgfodwjThbhDJjL0fgsXBSA5YCYGM1T0QVnzvKjJSkfVcC
	 PvGPze6kTiRqJHjygRYv9msfNlebGeRIyr9LPvNKLPrmKxODAccrpw463vn+mwFbUC
	 umgQVa122MGu4N+Yb3ab54opcbQZ+YXPTMLDqnfbqRgk4ic+347sp+IYJ5s9us5mZB
	 6eYz6vPGdNc2JP4GhfqOrjurYebJVCs8OIu2U0SIUxn1IXKANYUGg1cXvQsN6R319N
	 vXJKMdOHPjiDw==
Date: Fri, 24 Nov 2023 10:19:07 +0000
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
Subject: Re: [PATCH 5/5] ASoC: codecs: Add WCD939x Codec driver
Message-ID: <ZWB4myckLrpBYLm+@finisterre.sirena.org.uk>
References: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-5-21d4ad9276de@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VQ2nRTjyMlGPMvXH"
Content-Disposition: inline
In-Reply-To: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-5-21d4ad9276de@linaro.org>
X-Cookie: Slow day.  Practice crawling.


--VQ2nRTjyMlGPMvXH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 23, 2023 at 03:49:15PM +0100, Neil Armstrong wrote:

> +	if (wcd939x->variant == WCD9390) {
> +		if (mode_val == CLS_H_HIFI || mode_val == CLS_AB_HIFI) {
> +			dev_info(component->dev, "%s: Invalid HPH Mode, default to CLS_H_ULP\n",
> +				 __func__);
> +			mode_val = CLS_H_ULP;
> +		}
> +	}
> +	if (mode_val == CLS_H_NORMAL) {
> +		dev_info(component->dev, "%s: Invalid HPH Mode, default to class_AB\n",
> +			 __func__);
> +		mode_val = CLS_H_ULP;
> +	}

This lets people spam the logs from userspace, why not just return an
error?

> +	if (hphr)
> +		wcd939x->comp2_enable = value;
> +	else
> +		wcd939x->comp1_enable = value;

Are there really no constraints on the values for these things?

> +static const struct snd_kcontrol_new wcd9390_snd_controls[] = {
> +	SOC_ENUM_EXT("EAR PA GAIN", wcd939x_ear_pa_gain_enum,
> +		     wcd939x_ear_pa_gain_get, wcd939x_ear_pa_gain_put),

Gains should be be named Volume.  Is there no TLV information?

> +static irqreturn_t wcd939x_wd_handle_irq(int irq, void *data)
> +{
> +	return IRQ_HANDLED;
> +}

Why even request the interrupt if it's just going to be ignored?

--VQ2nRTjyMlGPMvXH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVgeJoACgkQJNaLcl1U
h9AZqgf9ER6M6fjDX85XA+DwqPsutTqM7mFbCjQypc4RvoCAFr404QMv94Pqj49B
yVWWJEJ450NwalztnrIUsq8eTs9Fs/KpIhqEh202WlqHHd2EKGoAyHh6IEqF/yni
F1YbWwejYTdL+16hOhMCtr0AtdhxEOe74omNJNcePl/yWCLx14CAA/snSAgVObjQ
NO1Uhh1AgnAEO+S1jOvuGb3BzIor2UpcFNqhvKa6jkgRpEk/ZEUQjzJ/1bGdOF5r
ny1HRvZgIcwIKyioGRREjdPmIGHFg+gLe3+LESxVy32YhpKkWaqYa4UT2wcVgtTp
ej3yYYHUfeYQ6XtbWTd/o/wtzwlIWQ==
=IuYR
-----END PGP SIGNATURE-----

--VQ2nRTjyMlGPMvXH--

