Return-Path: <linux-arm-msm+bounces-106293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M/HIeNO/GlOOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:35:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F05724E4EAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03734313FA32
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E630F34753B;
	Thu,  7 May 2026 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwTjc7X0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23DF326928;
	Thu,  7 May 2026 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142214; cv=none; b=Pq54r9HbbNJNwlST/qjZsT7HB1teDlRopCyl9VXv9w5ii1Nd35Vcrw45s267Ym6tgShjC38+iegcaf0c4HLEiKs6KMyVP46iWghieCDISsGtAzzUBpgFklM5qbL5VlInWF8e5DH80CuouTbaBpV9mbxEtYUlnjSI+QytMI0NdqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142214; c=relaxed/simple;
	bh=eu9zt6YxagJW/K/I0Y7owYGEMYtSmx6zORkO8Si+3BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNnLyOUFAjata6lBxxBQLMOwHZb+HEUO5hMzqisespGCPUb4s0qSXXFAFAk8ZN92p5uikOnwIo5Cohrysrl/8bvudmlBUUQugaZiIKdvxGW3w1Kiv++5dKqFiVQGcMHKC1ItCU2RLUavmE9zRL4SmWvWZ1R1//ECJN1BUcZBCyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwTjc7X0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4389BC2BCB2;
	Thu,  7 May 2026 08:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778142214;
	bh=eu9zt6YxagJW/K/I0Y7owYGEMYtSmx6zORkO8Si+3BA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WwTjc7X0g23y8pp1gqSpdiIa6q4nE9eIqZ0NJsqF+j3VQmpBv+2zZkAUKpV4LdrqT
	 t3YXP66rK+P6jlj9KM3U4BLKTjmFNkXh8aV8RUrlya3IlF/1fGyvJ6vUSPohPS0nJS
	 BZZXV3T5Mhc3RWK3NKgSnYbdyV7HI2tvsb7zJ+XodEGml1XhRzfzu44I0IaxI3cUqx
	 hJjIjXvk7qTf50h/AvYR4K+Gr52gguVh708D3JI1Jij4nM+OB7JpzJP2OE1evrvlX/
	 3DEjQ9rhsULM6vv6/Rf7pHB4yPBjQe0pY9mmUdLZIqcY2GRE8P+vUO/m27ZbDUQtpB
	 qBRNI8qe4eWTw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BBF731AC5891; Thu, 07 May 2026 09:23:31 +0100 (BST)
Date: Thu, 7 May 2026 17:23:31 +0900
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Antoine Bernard <zalnir@proton.me>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/6] ASoC: qcom: qdsp6: q6afe: fix clk vote response
 type mismatch
Message-ID: <afxMA7CwyvLR8T1O@sirena.co.uk>
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-2-val@packett.cool>
 <afvWsfgIz9Q-_cjH@sirena.co.uk>
 <35b45fd0-fffb-455b-b19d-5c29cc955563@packett.cool>
 <afv17gUZnHdXgyF_@sirena.co.uk>
 <fafc85f2-ede0-47db-9961-f34b2536a93a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cOpj82fb3KjqKU2o"
Content-Disposition: inline
In-Reply-To: <fafc85f2-ede0-47db-9961-f34b2536a93a@oss.qualcomm.com>
X-Cookie: Truckers welcome.
X-Rspamd-Queue-Id: F05724E4EAE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[packett.cool,kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,machinesoul.in,fairphone.com,proton.me,lists.sr.ht,vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106293-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


--cOpj82fb3KjqKU2o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2026 at 10:03:29AM +0200, Konrad Dybcio wrote:
> On 5/7/26 4:16 AM, Mark Brown wrote:

> > Nor me, if the mail doesn't end up in my inbox then I'm going to have no
> > idea that it exists.  You need to not only write a cover letter, but
> > also send it to the relevant maintainers just like the patches.

> (which the b4 tool will do for you)

> https://b4.docs.kernel.org/

TBH so will git send-email - it's a pretty unusual flow won't do this.

--cOpj82fb3KjqKU2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn8TAIACgkQJNaLcl1U
h9AQSQf/U4gtudrrKU5lUDH5iQs3SP9+uMMrvSTgcKlwpuX5h5ohEwyoXyG/4FKZ
rtHdE4Sti8hwGAiPZ/xIdREbYYdigfJf7wle+0e+cLcSS+/XjMLtIVd1xMSdQf/2
/YPvryqmxqbtfuHSF9DnAsMydxyW7nLlheAYPnw2AztDMgVYJ7ekI+MKdteyQF2j
e5guWun9I7ra5wP5f4rwgfu8hP7sGIhikwYZZTW6bXoqEJ2WAqXSyWlImdFGdWdP
EVekFDArgr/1GAQN52VqOcggi+i0hnAjVurFQAStgMsPwE6j3Htt8BYRaSszYnzX
9dnZPmZmL8OpIWtIIaArinEG6R/YCg==
=iXEr
-----END PGP SIGNATURE-----

--cOpj82fb3KjqKU2o--

