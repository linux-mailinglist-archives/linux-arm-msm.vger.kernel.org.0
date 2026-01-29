Return-Path: <linux-arm-msm+bounces-91206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAi1JPaje2kVHgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 19:16:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD8EB3796
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 19:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 643C430490CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 18:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242792F28EB;
	Thu, 29 Jan 2026 18:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2maD5Ec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F383D1CBEB9;
	Thu, 29 Jan 2026 18:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769710523; cv=none; b=gc9UEM2YbWsQ9JNonLHlOKmwK6lkSgXee0M5mA2LyWo/syO92O4md3ujJpLJHfI1xu7yHdqlcGr1g6dYKYjR+ZaofpKVrxranq64iNzvnRCvIRv8FxWDPB1eRPHHvOCOcC9OZb7Sznuo5+j0WhcCTaZFx8gS/LjuJTdijhhDcHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769710523; c=relaxed/simple;
	bh=iETuq0FcBrWbKBFkIVI0dxFP8LdwSUQoJaAMD5EV09Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rl7YB8Ti+YjpoHDKB/KyYsgsE8+W+B0+dQMMaPzwbvhLbqdyGPWxY/+N0C6Oow9jFQs8U+hcx1SXp5kuDr4/RmJbwJ/nFMeZ/gnyS7BgS8V/+kguwh7z/Uc10HVBGWpKD18NPoJWd/vLgYlN+R23h165Zh2WNXGTo+21UHplYYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2maD5Ec; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14FFC4CEF7;
	Thu, 29 Jan 2026 18:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769710522;
	bh=iETuq0FcBrWbKBFkIVI0dxFP8LdwSUQoJaAMD5EV09Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i2maD5EcD8so5e6pQMcEsL/BunApK2ogETjDqv4uT7GCfkoqhOidpUm/sI+zhM0lq
	 y8/i9+L6vPzPD63XU8Vf55J89rd+fDXd5Fm7/IVU3/hbGYLWpq9FCCiT34SjQc5ole
	 TejrrdnNd7EPMgV3j0YcL46My3Z91o8ZfvEworsJEwKnLva2B6it8O1oGV1ivh4qTd
	 pCZCrggHuxAZdtW4c5MdQjpJaldAJ4+xe6m6TO1/4Ytio9EAaX1XCA9+bM5yLIdA73
	 F9aY/p9o5yK5u3gSCsMtReWfCWzxOCnTqY7ynhOoKvyv4y10S5aoGW3FeWq09Q4car
	 lMIyEWDodi/5A==
Date: Thu, 29 Jan 2026 18:15:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Saikiran <bjsaikiran@gmail.com>, lgirdwood@gmail.com,
	andersson@kernel.org, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: qcom,rpmh: Allow
 regulator-off-on-delay-us
Message-ID: <355213ef-106c-4383-88e7-9b40f5b1c1ef@sirena.org.uk>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260127190211.14312-2-bjsaikiran@gmail.com>
 <20260129174829.GA1324020-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mmz4Acyk31lT35TL"
Content-Disposition: inline
In-Reply-To: <20260129174829.GA1324020-robh@kernel.org>
X-Cookie: You have taken yourself too seriously.
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91206-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: EBD8EB3796
X-Rspamd-Action: no action


--mmz4Acyk31lT35TL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 11:49:42AM -0600, Rob Herring wrote:
> On Wed, Jan 28, 2026 at 12:32:10AM +0530, Saikiran wrote:

> > This property is required for platforms where specific rails (like came=
ra
> > LDOs) rely on passive discharge and need a mandatory off-time constraint
> > enforced by the regulator core.

> Does enforcing some off time on all your regulators cause some negative=
=20
> impact on the ones that don't need it? If turning them back on is=20
> performance critical maybe don't turn them off in the first place.

You might see something like unexpectedly long delays resuming a runtime
suspended device.  Generally I'd say that if the delays needed for
something like this are long enough for anyone to notice they're long
enough to be disruptive.

Having said that I believe an active discharge feature in the hardware
has been identified and is being investigated, that's generally a vastly
better solution all round so hopefully this change isn't needed at all.

--mmz4Acyk31lT35TL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7o7UACgkQJNaLcl1U
h9CSmQf7BXmmzGk5uYxATvw5nlUKwL3vgkQZ/x/t9b4AiRELOv/3fXptQZEdOZJe
rX1WCkiS1jQ0+nZ9mG/fmdaT2Oc1uLdB7qQBNzyH8rKTk6rFhwKrxkm1jnucfj4A
E5t5aLcn4k/urO0T+/2OEluq+3H/m6w8jaGdvADWertrhqxEg0T7RJHTE1Mi4VZJ
Y5DMTiDV0K3r4ywMLsP94K7z+8oQVJstAy2GCuLmgao85+qibz77T44YP5vPDKgS
S+Go4+FuJw+mLpD7zrQICgBGqouJnFWXJ/vmNUBOeJjIOzLAe2FHDZuUJCF6zl9a
HP2D56xlQ1LCE/TsY82Y+jX2skcjvA==
=AjTd
-----END PGP SIGNATURE-----

--mmz4Acyk31lT35TL--

