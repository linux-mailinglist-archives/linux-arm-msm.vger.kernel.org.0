Return-Path: <linux-arm-msm+bounces-101534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOk/HmNTzmmEmwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:30:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8633388545
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 261DC309D9E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 11:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606063D6462;
	Thu,  2 Apr 2026 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OesrNw3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B705C3CA4A9;
	Thu,  2 Apr 2026 11:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775129014; cv=none; b=eAI2VF+/80tLk05B9HeJCBUm1F6XKRCPNo4YgcE4+xYBqIEpG48dky9y2jnnqSfDe72Xc5AY5n1sNtaYWRKBV3+xKSEFPr0dg15b4mwlwdJwsGRVLaAqSDs39zY6Y6c2H7/euYXw5ziHc3GzOvjVvHqasHNWZRBqctQkAc4Op1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775129014; c=relaxed/simple;
	bh=wRNRQbcaVLcFPqKCEC19+jCD5o4QjwrwTLAdJiPRC94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6KKEnA4ewCPKU7yzQuj1txhQMlF1GMncB/NOwAPcHdrLlKFu4N3t6imbslQqchwBSuYf1PswfZsxe3Jp6rcHYZ6BbeofhkQDB63vu98MzYSxOWcAk0BWps1gMCYanium/gBUS/jM1yPojoBkiY5l8nbY+3QaaFXkcfE/lmMXRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OesrNw3Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B680C116C6;
	Thu,  2 Apr 2026 11:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775129014;
	bh=wRNRQbcaVLcFPqKCEC19+jCD5o4QjwrwTLAdJiPRC94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OesrNw3ZLTmDaJx5lLQkHwigx/p7tOvWEkh//frYhHK5YzCnZe1qx7xQxIOirnlyY
	 wLNAkAAV2Ngbny8GLTXUaL4BmaSLvkzT62B+AmBF9QmaY42WbyVlEXe6qALfAZPY4s
	 xe2KXPmDaLRzgxmxEt4AF7QDqeDRh0j9wbYDyK3EQZF7SNIE0j/Bf329H1Hivz9kdl
	 Ge2iQIsEjejIN6lMOBhlt0V0zyM5ZSDnzX5rEQAnrtFC7nhqt0sRyRBYkYaKn9qxYO
	 qYyefhCrSeLv9YZ/9I2lf5RBG6Sx+NUXe2UBT7YlcjHZacm6g25+zxuvov14i4icBh
	 JwPsrl9gbf+4A==
Date: Thu, 2 Apr 2026 12:23:28 +0100
From: Mark Brown <broonie@kernel.org>
To: "karthik.s" <karthik.s@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: codecs: wcd937x: Add conditional regulator
 control for wcd937x
Message-ID: <fea78031-e570-4348-a4b3-d113b5749fec@sirena.org.uk>
References: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K5vVp8HOB34veIQP"
Content-Disposition: inline
In-Reply-To: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
X-Cookie: <doogie> dpkg has bugs?  no way!
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
	TAGGED_FROM(0.00)[bounces-101534-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D8633388545
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--K5vVp8HOB34veIQP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2026 at 12:52:56PM +0530, karthik.s wrote:
> Add has_always_on_supplies for managing regulators. Indicates that the
> codec power supplies are provided by the board as always-on rails and
> are not switchable by the codec or its associated regulators. This implies
> that the codec supply regulators are always enabled by the system and
> must not be requested or enabled by the codec driver.

Same issue, why would we want this?

--K5vVp8HOB34veIQP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOUbAACgkQJNaLcl1U
h9CL1Qf+IR8sUMSpWh/JHq7ajsAWkzrl5ent1j3pgNh9rHFuaOjFzxNXx/mZKcfX
qBdx9/xYt8cWejfxfr9ziQDtQYKnxxF+mUmh4/d52NYE3vsY1rEEFDJ2j+TgYrk6
2fiVKjwAK0FB2mig8BbvERUXhLtAefKXHuywpqYP4jQ7rzMsNSO+j3TH7AN2I65e
gVt7oXqhyI5tymLr1WzhHO57OT6mK1KHYz0C/4ctNLbyh6SidAZEaGS/rfsbJ2eA
z6xwz5IZeyrFWDbLJl6818EvSTjK4ZgN1CmYFGcUsd5xjlQkdbhzjrq2ltjiPQxh
vuRot1PvDPNY+j0jaFjlCMg5nAScwA==
=3UR5
-----END PGP SIGNATURE-----

--K5vVp8HOB34veIQP--

