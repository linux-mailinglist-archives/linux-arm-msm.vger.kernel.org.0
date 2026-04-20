Return-Path: <linux-arm-msm+bounces-103818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLkNHnJe5mnmvQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:12:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBAF430BA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 523EE30CFFCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B477364948;
	Mon, 20 Apr 2026 16:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nPJf+G8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AA0363C49;
	Mon, 20 Apr 2026 16:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776703455; cv=none; b=eMwavvqf2ajn6CqxGXt60QDX5Mae4BBSPHqEEAt9DKPhNUNKRSklHyMlEhU058KSs0+NJ8GLvg+zMwBlbw75WW75TRihJaUcHula1PycsAzT9perzsEOJxsX6+3f1rHNVXqAODX20CkHLipHqYKa4ZlZJrYgIKfH4EPZ7O7cHfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776703455; c=relaxed/simple;
	bh=1ntPEsTT6PvCrr7xUGP3cYD5TgC1Shos1ROli0m696Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6bPb8p8ZnMwTsKqkm8ibS17eucgHUSmrv5r33OlRk42JpPFO6PKuSQ220NG3lF5eTZILLMgqoZJFLbO3F4I6pi7vBIhkOIINgMURNGzmObBB2taYmq4z/sv0YuGjRfoxF0kWAyIrt11G8Vxsd5b1z6eun4AvMGg/trWYKmUZlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nPJf+G8T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07342C19425;
	Mon, 20 Apr 2026 16:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776703454;
	bh=1ntPEsTT6PvCrr7xUGP3cYD5TgC1Shos1ROli0m696Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nPJf+G8TwGrcUq0V8YPUgu57x972iCRSlxxFksR5FEOEIcy8fjOQDgcBJx1oqVAmH
	 z4X4N+GWyZadxlC898Uogq1OkGuWBcQQu69ojyQslNQlK2t0yQKplch40irkqFppwW
	 L38tSp2jPZgja445JGM+oSdgWChkbNXYT9rRjsbiLnUhVobvR/vO2EhPSW+7EbLXCB
	 vG2l4DPgiioAOvhZQjwNNSvmetwpZ1RpymbqSPomIhM9jAcfzBqs4XGVtURicas+c/
	 B+EytDesRiNQe6nZepYu71KR8r3OaidN6IRQnqQHnmLtyD20Yor3wyAObiXx+2/MnD
	 xhxXTBwR8adIQ==
Date: Mon, 20 Apr 2026 17:44:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] spi: qcom-qspi: Add interconnect support for
 memory path
Message-ID: <e7873eb0-bfcc-4ad2-8016-17b0db80feea@sirena.org.uk>
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-3-7de325a29010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bwAeXuYM9E8xVQPw"
Content-Disposition: inline
In-Reply-To: <20260420-spi-nor-v3-3-7de325a29010@oss.qualcomm.com>
X-Cookie: Sales tax applies.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103818-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 0FBAF430BA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--bwAeXuYM9E8xVQPw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 11:42:50AM +0530, Viken Dadhaniya wrote:
> The QSPI controller has two interconnect paths:
> 1. qspi-config: CPU to QSPI controller for register access
> 2. qspi-memory: QSPI controller to memory for DMA operations

> @@ -729,6 +737,11 @@ static int qcom_qspi_probe(struct platform_device *p=
dev)
>  		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_cpu_to_qspi),
>  				     "Failed to get cpu path\n");
> =20
> +	ctrl->icc_path_mem =3D devm_of_icc_get(dev, "qspi-memory");
> +	if (IS_ERR(ctrl->icc_path_mem))
> +		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_mem),
> +				     "Failed to get memory path\n");
> +

Does this handle missing qspi-memory properly?  It's not conditional on
the compatible so it'll run even for existing devices.

--bwAeXuYM9E8xVQPw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmV9gACgkQJNaLcl1U
h9Bj2Af/UoZAegaTBYDvZr4TigID7C5f0PRB5VbJEJeSG98ecetQSKeIzsw5kB6D
ZFZdDNWJZVFWfzwjXEP3r8zymF11muSDS5XGGxACpfneo4XFS4687PuXJiNHOWLK
y+CDCO2Wa6H5aEb/ApTU7+yxjLxtBdOcZRlJ8+cZbEOcIyj7zs8w+XjRN36iPmVL
vNmiinOsen69q7WDT/jktIQBUdo0/PPgoiRQAQcIwPWhLT1KD+yDSm+cR6HPDFO9
mTmvwUzgONY9gpLvsLJN5xwO+QGWbwbbBWjk2nysqwgwsHyb3GIlm5lVhmaXCDiL
075JxCdvmxU3XXixHWCgYOK/4QVrkQ==
=de6f
-----END PGP SIGNATURE-----

--bwAeXuYM9E8xVQPw--

