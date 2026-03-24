Return-Path: <linux-arm-msm+bounces-99716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHeJFzXSwmllmgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 19:04:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2198F31A725
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 19:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAFFE3021D2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 18:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215BB34EF08;
	Tue, 24 Mar 2026 18:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3W+Iuw3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF70A3264F2;
	Tue, 24 Mar 2026 18:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774375472; cv=none; b=pPW6qpyYnt/dI8mebYcFCD9VzjhI/N5x+QHo0dToDBMInqjdEvj4D8iCPWbsGez3I4slX+cP3pcVzHTpaNjADwc2SQZ/ydGIJBh0V0VyovhxQGvla0cAUNgFwc/nNCqiGQ0LrVh+BwUBNNor1SqcUBtL24INVilO6h+RFnIkiXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774375472; c=relaxed/simple;
	bh=OYZsLgQDlG26AVq4Gf0fccKiiV8nU+VV+OROLS0nlJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHlEl18z2MaAZWJ/ybt49CNdRu1jaILF8P81Dz07VoDUr3R+PHGvzMNS93NV5R7rXZJ4b0Mj7hM2tvKlFY5yTiz5wJunqURfaBnHGOfLKLtYI0zckGEOthrs9X+Mnc56AT7OLbgjgbPm6UAk0OLZShJDuoywXmi1wbG4l0FUBmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3W+Iuw3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4CBC2BC87;
	Tue, 24 Mar 2026 18:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774375471;
	bh=OYZsLgQDlG26AVq4Gf0fccKiiV8nU+VV+OROLS0nlJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e3W+Iuw3rwIQrBIzzAb3EZCFdVxED+q8mDSK7V+yfLHPdRO/M5LuX1xxTduQEtrWx
	 PGiZgh/t/1JMqxwZWkEzOO48xWHFDIUVH941aIH1WrReS698jhzj8Nj99+LU8MOLnq
	 Zf1F1lpOsWw70LafzMB1LmBxwsuMQfJYDAQ5zGD7a6i3J+UkL7keWdGECzMsZTXOjw
	 u7wWrTQbl8UB33l8rHxk998qGYQ5tfcZEkfyf0gmiA39kZACyajSHrEfm/fxam+FIx
	 7L8WBB3ILlIwEUsmBE1IQBFoCmtKTY2FwtpaZVXi48Ph1PaUtf7MtBYSNy/bXUbY+z
	 uad4o7C+QkUsg==
Date: Tue, 24 Mar 2026 18:04:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	srini@kernel.org, val@packett.cool, mailingradian@gmail.com
Subject: Re: [PATCH v7 01/13] ASoC: qcom: q6apm: move component registration
 to unmanaged version
Message-ID: <981a6253-5005-4281-88fb-3ef6361dfb76@sirena.org.uk>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260323223845.2126142-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6dh4h213CunPYLhE"
Content-Disposition: inline
In-Reply-To: <20260323223845.2126142-2-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Forest fires cause Smokey Bears.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99716-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2198F31A725
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--6dh4h213CunPYLhE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 10:38:33PM +0000, Srinivas Kandagatla wrote:

> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -747,7 +747,7 @@ static int apm_probe(gpr_device_t *gdev)
> =20
>  	q6apm_get_apm_state(apm);
> =20
> -	ret =3D devm_snd_soc_register_component(dev, &q6apm_audio_component, NU=
LL, 0);
> +	ret =3D snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0=
);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to register q6apm: %d\n", ret);
>  		return ret;
> @@ -756,6 +756,11 @@ static int apm_probe(gpr_device_t *gdev)
>  	return of_platform_populate(dev->of_node, NULL, NULL, dev);
>  }

Given that of_platform_populate() can fail we now need unwinding for the
component registration here with the removal of devm_

--6dh4h213CunPYLhE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnC0igACgkQJNaLcl1U
h9DibQf+ICzY1rSvmqjBO7MgjC//+FtF2xc5zFAiMN3e4FXppzqGg4Jz8A5a0ADO
ORd5uLabn7rdAwYxku4pUNYA0crSnBYbk903Ei1YGVh5oNbUTiYo8bfGcub/lix7
ClHczUIsaA/8eMEhZyRV5HvOTz8YmwbtRw4dz7qpNMGkit0kgLU4MNiD/vDepSr8
CSWWNGLvBUD5cyJDDGUPYCTxW9dKp/52Vc3+QVn2mtlcXsBOPcdCx+dQ5+82WlAf
2jWNlZxjti0iHbvJVHPbdl9OD1hstkb+yZaVzplr3UOjlWDTw/ds8s4lW7zwj5q/
vQi614/QAKn1ZsMGegXRc8pXYmbwnA==
=84GS
-----END PGP SIGNATURE-----

--6dh4h213CunPYLhE--

