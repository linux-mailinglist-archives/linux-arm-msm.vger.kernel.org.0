Return-Path: <linux-arm-msm+bounces-101322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJwbB2EEzWnhZQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:41:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 059CB379A1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B30031243F0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AE43F54BE;
	Wed,  1 Apr 2026 11:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHOMeTnT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF1433436A;
	Wed,  1 Apr 2026 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042719; cv=none; b=kCh00dopk219qDxjU999m4kfNCi9+i1eceo3ZCwwloXZPMfPplVFxhfBKz+C2jH9kAQhF7H946eq+G/Vh6IU9YrpTeOaeTt/+6R3evEYVUgJijn+z58g41W7r98j8RsqbbPRDB62z/BldId4jCU/+3Pd8nzQjzdkSnOCxRkdyNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042719; c=relaxed/simple;
	bh=cmgKYNwe61nBGvUwmhV6W2mBYIrAwRrr/oxSk69wJeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fs8U/b5LPwXEpMg7wJkmkAqnr7kQma318zFVFZS8qC1ov4pVFWAqYDnR011ZDFesZpb2UDHNsowBp5l2FpsltNwtBpDy2UK9JZ70ZOgbTM69f9KzLBAIBPMx8yclPKAKNBiR9ErWmBpzXIoO2tHGrUr6w6/FBiWZGyjoDXIUXdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHOMeTnT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FC5C4CEF7;
	Wed,  1 Apr 2026 11:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775042718;
	bh=cmgKYNwe61nBGvUwmhV6W2mBYIrAwRrr/oxSk69wJeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gHOMeTnTJ7NCdHCfsKKgIZZyiuLpyBp6Jpk7nScygN29C4AC1laxKscUD2GIbk4Mr
	 UhBiVN5bwK36obHGksOu8+ltKTN5XNHJfFOwlprCnq7BxD6pIMw0r5I7nePglTNEXW
	 z69nMGGed1rI4mOWU16+cZlEFCenHVKCCncyb71eWbjDC5RfNpwYBRjIGd8U2yginM
	 Tj1R3FbbGEIHvzjvqzVC9M9fnjIkItaNsYG69ujrXN9kC6ZMcD8DTnfFUz+Ckr+FZP
	 cGP2iAzOcHSr7gRoF5sa+LgGmukVEDUGtuMCiX6tbPh40nDOUkut9NBEu1N9sQhRSU
	 mU+9fPrVj4bSw==
Date: Wed, 1 Apr 2026 12:25:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	srini@kernel.org, val@packett.cool, mailingradian@gmail.com
Subject: Re: [PATCH v8 08/13] ASoC: qcom: q6dsp: Add Senary MI2S audio
 interface support
Message-ID: <38eb807e-8467-4d7b-9094-3007d0ba9c89@sirena.org.uk>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260330082105.278055-9-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m73g4xnFGfsS0+ob"
Content-Disposition: inline
In-Reply-To: <20260330082105.278055-9-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Famous last words:
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101322-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sirena.org.uk:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 059CB379A1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--m73g4xnFGfsS0+ob
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 08:21:00AM +0000, Srinivas Kandagatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>=20
> Introduces support for the Senary MI2S audio interface in the Qualcomm
> q6dsp. Add new AFE port IDs for Senary MI2S RX and TX and include the
> necessary mappings in the port configuration  to allow audio routing
> over the Senary MI2S interface.

This breaks the build:

In file included from /build/stage/linux/include/dt-bindings/sound/qcom,q6a=
fe.h:7,
                 from /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:5:
/build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:153:3=
3: error: array index in initializer exceeds array bounds
  153 | #define SENARY_MI2S_RX          147
      |                                 ^~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:723:10: note: in expansion =
of macro =E2=80=98SENARY_MI2S_RX=E2=80=99
  723 |         [SENARY_MI2S_RX]  =3D  { AFE_PORT_ID_SENARY_MI2S_RX,
      |          ^~~~~~~~~~~~~~
/build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:153:3=
3: note: (near initialization for =E2=80=98port_maps=E2=80=99)
  153 | #define SENARY_MI2S_RX          147
      |                                 ^~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:723:10: note: in expansion =
of macro =E2=80=98SENARY_MI2S_RX=E2=80=99
  723 |         [SENARY_MI2S_RX]  =3D  { AFE_PORT_ID_SENARY_MI2S_RX,
      |          ^~~~~~~~~~~~~~
/build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:154:3=
3: error: array index in initializer exceeds array bounds
  154 | #define SENARY_MI2S_TX          148
      |                                 ^~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:725:10: note: in expansion =
of macro =E2=80=98SENARY_MI2S_TX=E2=80=99
  725 |         [SENARY_MI2S_TX] =3D   { AFE_PORT_ID_SENARY_MI2S_TX,
      |          ^~~~~~~~~~~~~~
/build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:154:3=
3: note: (near initialization for =E2=80=98port_maps=E2=80=99)
  154 | #define SENARY_MI2S_TX          148
      |                                 ^~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:725:10: note: in expansion =
of macro =E2=80=98SENARY_MI2S_TX=E2=80=99
  725 |         [SENARY_MI2S_TX] =3D   { AFE_PORT_ID_SENARY_MI2S_TX,
      |          ^~~~~~~~~~~~~~


--m73g4xnFGfsS0+ob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnNAJcACgkQJNaLcl1U
h9Db1Qf/ZFVV1E+LHBb2RDzhVMoE0/w92XMZpGtqUAwLMwoB1DjhvQiftjOITTX/
rj4NC1KT7FVh/IV9AiOCzgYZNBz5D1/vItP57hTksFF2Yg39v1H6x7zGLYxmLJ1W
fzu7rmVoBO+BMtNpDDg8XTEVkjQkwhwf68/Q7za616Lz0KsmmS+MaO5qnxNReGTP
9Odsx4EcQ/md+qzKMgLUSY8ekC7nfHTfqxnYMDvHabLnN2L/+BVQxqoVIJOHg0+4
9HRV6dx0bKuy6NPhScDgBnOSDMEyPBxnVP0zbDkwJ4GtxjQmU7GggSUeDzysLMN0
Qz1YJeRLIynfWCgrbWQwjtvvqI07hA==
=RNl2
-----END PGP SIGNATURE-----

--m73g4xnFGfsS0+ob--

