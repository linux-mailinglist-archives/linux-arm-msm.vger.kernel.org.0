Return-Path: <linux-arm-msm+bounces-90861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFbVJPn6eGlfuQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:50:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E32F898A5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8F9D302F245
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EDD3218B3;
	Tue, 27 Jan 2026 17:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sk5yBySp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6C02FFFB7;
	Tue, 27 Jan 2026 17:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769536236; cv=none; b=aJ0A+oU9Lgux0Pnjw26ZUFHtUVkqlOwJqpQtNCd+9+4kQ9ZuuWuFQREDmZqF+K9SsYclZ3Alo0sLMthuzZ3+d6QOw0B0ZkXQdVpBKRDr809pNvnwNBa1en33A/RMwRGXbBOdJUemgReJJm6B0Z9B9rsdIImhXRRVUs9y50P6yfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769536236; c=relaxed/simple;
	bh=fKhueR2w2rNClmDKeudOGA3VTIfKKhdYxoZ5x2LjLcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnKx2JcUgHeHtFZPoxzYUoIKdTmvSLQOkykm8JPVhcRqCOr+9SPgAZTaveeW9zeYCFoG/QOKfcfToYIamx82L4vQZUSmb9nt+xPNH46JojYBnRtvuI00e4XrJcLo+LTJmaR4djliDjbWFYgmQk1OIURm+DYq9OMnK7Ie/3l+7CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sk5yBySp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F797C116D0;
	Tue, 27 Jan 2026 17:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769536235;
	bh=fKhueR2w2rNClmDKeudOGA3VTIfKKhdYxoZ5x2LjLcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sk5yBySp7LH9u2wZcXCGPtxo2ckziptyXinwwmeCphbDvovjFJTJ19I9lIzBv1W1h
	 Mz+ZDnzZyMeheXcIhxMFlpedwrc7IdYnwKKIVxUlJ2M1+MAKoFzIba37CFT+I+5a9l
	 TzVW3lqy+7i7QRBehP36DPblOaPmM4FoZvA0gf7MvZf/PJcp8EfuR5mFZf++fHfjMV
	 pB+5yt0SIUuA54HYW0/KPaqiD0TSmbeUlmk300U4jq4OrYZcuFeBASYIBI2QMvFF48
	 ofq2Ko7zCoX9aD0icuYS0Kiw5kevGvDM1o6G7rYCBO6HzX3E2eKu9VeRpeVox/Ujvm
	 fwj1JCdGWHnUg==
Date: Tue, 27 Jan 2026 17:50:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Saikiran B <bjsaikiran@gmail.com>
Cc: lgirdwood@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom-rpmh: Add support for
 regulator-off-on-delay-us
Message-ID: <3fa57258-96ac-431d-ac3f-1c5de8295f82@sirena.org.uk>
References: <20260127172757.75221-1-bjsaikiran@gmail.com>
 <20260127172757.75221-2-bjsaikiran@gmail.com>
 <2b8945c1-4372-4023-a15b-9187b9f23418@sirena.org.uk>
 <CAAFDt1vLkiy6vHxqbKrrxUqNb=rocOjhU=HZ9+f6BmycUnxpQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PWOubrtCGXzzLo0/"
Content-Disposition: inline
In-Reply-To: <CAAFDt1vLkiy6vHxqbKrrxUqNb=rocOjhU=HZ9+f6BmycUnxpQg@mail.gmail.com>
X-Cookie: I brake for chezlogs!
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90861-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E32F898A5E
X-Rspamd-Action: no action


--PWOubrtCGXzzLo0/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 27, 2026 at 11:13:45PM +0530, Saikiran B wrote:

> > What exactly are we talking about in terms of the actual configuration here...

> These are LDOs (LDO1, LDO3 and LDO7) powering camera sensors on the
> Lenovo Yoga Slim 7x.
> The issue is platform-specific: this board has large bulk capacitors
> on the camera rails. When the LDO is disabled, the voltage decays very
> slowly (passive discharge), taking some time (Still testing various
> timings) to reach a safe reset level. If we re-enable the rail before
> this discharge completes, the sensor experiences a brownout and fails
> to initialize.

OK, that makes sense - please include this description in the commit
log.

> > This would at a minimum need the bindings for the regulators on the affected platforms to be updated.

> Understood. I missed the binding update. I will prepare a patch to
> update Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> to allow this property.

Great, sounds good.

--PWOubrtCGXzzLo0/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml4+uYACgkQJNaLcl1U
h9BtJgf+LksO3ko0It+91z9P53nHKrGPY6TbpynjUY1BvFPWtv/EHW2hZDxrRxNm
Hbj/ZeDlAtkd32K4M5bEGKs7XctC4zYYHQQlX9s3FXVCwFbor4fuoNegbuf0/KDL
aEFnKHAZ0osrTZBuT1bhD31QZpTDtAjqIgmWP38QbnGMUzyuSYKFt3dmNbIRRZ26
6P3O355tozq2CpVepoBdbxTbEnipXQJ5fuEqKgt2TJAXn1S0lR+FArJtzUAOzRFQ
orcr3zBRq1MaWvKFW925HvSovU0xa/56O4L9MRGmfder/eZSkkdPNOBXWfanej93
z8O97iEI3fNjO6y8uM5+I0Jb9f6KHw==
=PLA0
-----END PGP SIGNATURE-----

--PWOubrtCGXzzLo0/--

