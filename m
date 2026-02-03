Return-Path: <linux-arm-msm+bounces-91700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJpCCpcjgmnPPgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 17:34:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1338DC0A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 17:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D2B03304BC32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 16:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0233D2FE7;
	Tue,  3 Feb 2026 16:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXVCtWlq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8752B3D1CA8;
	Tue,  3 Feb 2026 16:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770136232; cv=none; b=QWSBmqd9sJQQSlfTek/wHR5KSzL7OT3EQ/YdvQwSlfwzXJyPu73H/EkVONxR8zBz7BsuHqYxbcvIS1C+dysicmXCx0o/c/XLopk4UjcrSzwtFS6CuqzHUJMqrE2hR/D7Bsp2Utkjk2Hp9rZM0JjewTR8rJg6iRWAIZlDs1NB/6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770136232; c=relaxed/simple;
	bh=/BQwojtZUFGwRzXnl3YOUE8bYUgmbvvgBigNeu4S2Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=litMdWFklCNWkLXyPrfnwJP8hIw4/u0zGZKorktISd3deg9egl8Q6S+HK1Fzq42z6z4DSnwfwpdA/YCBhoNWvqof7pejvq15XGOvw8dd/d06nM/lpj/iZaaW0/7eYRyJt4/fNRVsWs84Mx1NF6wYfuKx2ZiN7gHuZV9Z5DCOZcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXVCtWlq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FFFC16AAE;
	Tue,  3 Feb 2026 16:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770136232;
	bh=/BQwojtZUFGwRzXnl3YOUE8bYUgmbvvgBigNeu4S2Vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eXVCtWlqpVVdUwKTPTE9D6ZbJ37vNyPhp2ILSxoumBXcE2GuZtNZCaVO0tGPPFa7w
	 EXTRL99Mqx6DP6Wu3R/I82Ep9uEcPt0CHv3Q742Q5hEtYantLl361HaCucO/tMwS4n
	 xBMePreR5knlnpM0mnk78Wc3i0OkfOxo4lJzKiHNBYwf5tMVMQXNjR6w4E8mArajjr
	 AiKmeSziBlVNjEVf06hrPYy/Bisw0CW7im3R90/vbhk2iZ5G7/kYRdZTLsebOSBDEY
	 O6oV5cAXRUiSu2zy32gcAGZ2nEyrW2miaMfhgZiX4azZ7gaO/g79spNeVyKWQOtR+r
	 L+QRkYuzW0emg==
Date: Tue, 3 Feb 2026 16:30:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Saikiran <bjsaikiran@gmail.com>, lgirdwood@gmail.com,
	andersson@kernel.org, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: qcom,rpmh: Allow
 regulator-off-on-delay-us
Message-ID: <7da1e3e3-18d7-45f8-9168-481ce8e4493c@sirena.org.uk>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260127190211.14312-2-bjsaikiran@gmail.com>
 <20260129174829.GA1324020-robh@kernel.org>
 <355213ef-106c-4383-88e7-9b40f5b1c1ef@sirena.org.uk>
 <fa760b2f-4b8c-46d5-90b9-2ad9e69ebf04@oss.qualcomm.com>
 <20260203162005.ui7sl4t5m32jwas6@hu-kamalw-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KzM4c284YdjZFFsI"
Content-Disposition: inline
In-Reply-To: <20260203162005.ui7sl4t5m32jwas6@hu-kamalw-hyd.qualcomm.com>
X-Cookie: Do you know Montana?
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91700-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F1338DC0A6
X-Rspamd-Action: no action


--KzM4c284YdjZFFsI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 03, 2026 at 09:50:05PM +0530, Kamal Wadhwa wrote:

> But I'm wondering if this is really a 'slow discharge' issue, because if the
> caps discharge slowly.. shouldn't the rails be turning back ON faster
> compared to when they are completely discharged (fast discharge case without
> bulk caps)?

The issue is that some of the supplies fall to a level where they cause
disruption to the devices using them but not far enough to put them back
into a power on reset state, the device browns out somehow (I'm guessing
some retained state is corrupted).  Ideally they'd have POR circuits
that handle this case well but apparently that's not the case.

--KzM4c284YdjZFFsI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmCIqIACgkQJNaLcl1U
h9AfbQf/aw5X3CMOprXvD8dHwduRIxp13+qV8bVay0bxXPDkAsaJMBq07PqMWcuG
MYqPc8+6LfhN8N+29nyNte9bi0x0ls7KHYeokJnMUW+o9Q63J5r58nJ1Ee/iDnUb
hJrJs/SSgEQQlTa+CDJxfr9WG4mcgFWl3nK5Wd3PoSdKpq2v7VO2LKCthTLgNRcg
jIGjcQeGnWH3aUDO8RYaH+Wx4GfQCRvnnNOaUA52kCGd3t01ufeSg596wTbpkT+Z
MCVaXGVhKrJ+f9cKH8eBvZ4GHYjrvNnnEG+1DG8+N9UAv04dvBViPFmdO2JgGkWq
0cUCqFZXhF4VFrsfQI+gGEX5YijEaw==
=Tsjh
-----END PGP SIGNATURE-----

--KzM4c284YdjZFFsI--

