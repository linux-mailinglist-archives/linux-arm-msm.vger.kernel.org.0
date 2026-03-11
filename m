Return-Path: <linux-arm-msm+bounces-97047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPi/DgiusWmzEQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:01:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA402685F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2A043048747
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3EC221FCD;
	Wed, 11 Mar 2026 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frk/CePd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9A32116E0;
	Wed, 11 Mar 2026 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773252099; cv=none; b=JfdRYlG43Kj0DiW37aeBOrVv7jiO3Fo/fTiTXVyfrxjHTRN/wKIOin1rVXZiM4iaKrNQWf6HEIRwrOz29CnIIvHm80yYpUH/7fUv26stE8eMXpqbU+0x4BCgrCwWVQY9IGEtTO3fRWgZ1aaGn/cuJr4THPQ+51GkNy2COV5xW5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773252099; c=relaxed/simple;
	bh=3yWJLZ6GD/dmWHpKPnwlQPmYIRRZb9sfs9HOE709OMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WugJjzmzFUSwdO9W/IJokIo/NZ3FhydKT/LmFpwL+aZp5/gUfqLieJ4fWcmHEJ8W0X0Qhfz5fJRRKVdu/5nYjZHxSnVbxMl+Ck8A7Mu5Y7Db11MXSVOTtcMCIpdT/LWZnHJazD3Y4gAECg3O6pcTPbwPATHi6KEr3juIIN3ulRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frk/CePd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20AFC4CEF7;
	Wed, 11 Mar 2026 18:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773252099;
	bh=3yWJLZ6GD/dmWHpKPnwlQPmYIRRZb9sfs9HOE709OMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=frk/CePd+U5812zAX29sI8YOCqz8vMR9Ia7CzLsw0NNdHN4DlpSmRpXI5m4qdxm2S
	 QibXU93M97zLnR2UTk7XBWuVBHBzo1lpdmjlZHxwRj06iZcB2vmCV8RGTI+VszQfqn
	 blhKo0EbHk4gm9TVSUs/L4l4d0lfE0S7YjkOwdiZFYa6huKB7K+Reyw9AteNN18mOx
	 oxTCdorLYp7VgtX5tpxAzGa3ydWpWn5sPEjs4QzsivX7Sgzk0Ik0pr4z/j4Qsker3P
	 PMYtx+UejyOrWHNLkhjjPf44IwR6tQr+A3Tr63BSy8W4XFHpJiFm9YyX2diN9JSQOq
	 AiNGBrzarfsAg==
Date: Wed, 11 Mar 2026 18:01:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add
 Bluetooth
Message-ID: <20260311-come-olive-7bbc8f6536e1@spud>
References: <20230421-fp4-bluetooth-v2-0-3de840d5483e@fairphone.com>
 <20230421-fp4-bluetooth-v2-4-3de840d5483e@fairphone.com>
 <20260310-maritime-silly-05e7b7e03aa6@spud>
 <DGZSPC64B8K5.3HBPHWMWXR482@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0kPLRKqAFXYbgZvV"
Content-Disposition: inline
In-Reply-To: <DGZSPC64B8K5.3HBPHWMWXR482@fairphone.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97047-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[davemloft.net,google.com,kernel.org,redhat.com,linaro.org,holtmann.org,gmail.com,lists.sr.ht,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AEA402685F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--0kPLRKqAFXYbgZvV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 09:04:20AM +0100, Luca Weiss wrote:
> On Tue Mar 10, 2026 at 7:02 PM CET, Conor Dooley wrote:
> > On Fri, May 12, 2023 at 03:58:26PM +0200, Luca Weiss wrote:
> >
> >> +&qup_uart1_cts {
> >> +	/*
> >> +	 * Configure a bias-bus-hold on CTS to lower power
> >> +	 * usage when Bluetooth is turned off. Bus hold will
> >> +	 * maintain a low power state regardless of whether
> >> +	 * the Bluetooth module drives the pin in either
> >> +	 * direction or leaves the pin fully unpowered.
> >> +	 */
> >> +	bias-bus-hold;
> >> +};
> >> +
> >> +&qup_uart1_rts {
> >> +	/* We'll drive RTS, so no pull */
> >> +	drive-strength =3D <2>;
> >> +	bias-disable;
> >> +};
> >> +
> >> +&qup_uart1_rx {
> >> +	/*
> >> +	 * Configure a pull-up on RX. This is needed to avoid
> >> +	 * garbage data when the TX pin of the Bluetooth module is
> >> +	 * in tri-state (module powered off or not driving the
> >> +	 * signal yet).
> >> +	 */
> >> +	bias-pull-up;
> >> +};
> >> +
> >> +&qup_uart1_tx {
> >> +	/* We'll drive TX, so no pull */
> >> +	drive-strength =3D <2>;
> >> +	bias-disable;
> >> +};
> >
> > I recently made some changes to pincfg-node.yaml to detect if there's
> > conflicting properties used, and these got detected. Should these not
> > do what has been done on the msm8998-xiaomi-sagit, and delete the
> > inherited bias-foo from the dtsi?
> > &blsp1_i2c5_sleep {
> > 	/delete-property/ bias-pull-up;
> > 	bias-disable;
> > };
>=20
> Yes, you're completely right.
>=20
> In the final dtb qup-uart1-{cts,rts,rx,tx}-default-state contain two
> bias-* properties, this must be wrong.
>=20
> Thanks for pointing this out, I'll prepare a patch soon!


Cool, guess it just worked for you because of either property ordering
or how linux parsed it.

--0kPLRKqAFXYbgZvV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabGt/QAKCRB4tDGHoIJi
0tHSAP9RJhZFjBy79D1QA4/Y8GvUh6dcjQSJvmheIyZevV3mgwEAkrgsg1dqN3vO
SUrSbqWC3nY+WuhQ8enPQB6kw6udSAM=
=RVbj
-----END PGP SIGNATURE-----

--0kPLRKqAFXYbgZvV--

