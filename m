Return-Path: <linux-arm-msm+bounces-115701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BtntCAMSRWrK6QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:11:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1486EDE4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:11:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LfhwzKjI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115701-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115701-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADEA43335EA2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 12:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE78481673;
	Wed,  1 Jul 2026 12:26:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E205481644;
	Wed,  1 Jul 2026 12:26:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908808; cv=none; b=gi5Cw48ye/8x5yD+e12yU2xvAR+ps8Wmj70/iHf5gXLId8w18kKSs6oXnIB11jhAk0dPTK8VAhF6PSFWjxMgl3M+mF+aK5Ks8MUU46xq/srn0QvUlnVjtI7eQPKlgLLMRehVHHmwnjQjwXwtP+tJW7WWhAuPo8oK3M8zvgO7XSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908808; c=relaxed/simple;
	bh=GS76Wwm9YAF1UZr1a9Vc3sWYHAAD/DqvFgLPc6onfrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbq/wLzpqOKd8+WkEWwFiEWDD3bcjCW29BvhzQorU8Rg6Ucdl9P6OxZEeNMB59U5Ne908T60xjXdoFnEl0BRCVjsniy8H3oyYrfdfAN2Ko07NOKnayg8ZJzY+EWsifvjLX1Cbz2oOgPupp8X+2UIGXMtId6pZ/0n3+vlEweGQaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfhwzKjI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202201F000E9;
	Wed,  1 Jul 2026 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782908807;
	bh=N6kwCdWJBKPVdEt2jNaPpGQsVTRJbFu2V70/cjRIUSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LfhwzKjIgvYEo+DtBKmLhAyQhpBerPQlhdbFYRi7/bxUIwyYgreJJkAmpjaf0+5p9
	 oeDHA0jDyOSJlKS+SY2Spjwb4+R/gq0I5eMjv0/hX+8Y0DcxxyGlmwq2zBNbjxKm0r
	 1slrM/MjdT8iOUDtdzRCl0kqpVHS0Gbm88RnHTEmH8r2IBs+8uFghLDsx8D2wSQakx
	 TVli7/Fx11KGwUzUXgIWaPUL/ExC4NsV7A/G7d4S2ZYQ591PQh008B7p0lAe/Vo7tA
	 fKVLYhBoKJF3g+u/uP8UvZ8ZMjg/qqNG84iUVxxotXPdWSCnczopmgDEwvveeAFvlQ
	 3tYB2XZlb0j6w==
Date: Wed, 1 Jul 2026 13:26:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/11] dt-bindings: sound: qcom,qaif-cpu: Add binding
Message-ID: <03377bc3-5328-4f38-add7-026ceaf56f1e@sirena.org.uk>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cny0c8Dr8y1s+2mj"
Content-Disposition: inline
In-Reply-To: <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
X-Cookie: Do unto others before they undo you.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-115701-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D1486EDE4B


--cny0c8Dr8y1s+2mj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2026 at 04:27:47PM +0530, Harendra Gautam wrote:
> Add a dt-bindings header for the Qualcomm Audio Interface (QAIF) controller
> DAI IDs. This provides shared constants for devicetree sound-dai references
> and QAIF aif-interface reg values instead of using raw numeric IDs.

> Depends-on: [PATCH 0/4] clk: qcom: Add Audio Core clock controller
>   support on Qualcomm Shikra SoC
>   https://lore.kernel.org/linux-clk/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com/

Is this an actual dependency of some kind or is this just something
that's randomly on the same board?  We do seem to be getting an awful
lot of serieses from Qualcomm with some random unclear stack of in
flight dependencies of various kinds which is not particularly helpful.

> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> +patternProperties:
> +  "^aif-interface@[0-9a-f]+$":
> +    type: object
> +    description:
> +      AIF interface configuration child node. The compatible string
> +      identifies the serial protocol the interface is wired for on the
> +      board. The unit address matches the hardware AIF interface index.
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,qaif-pcm-dai
> +          - qcom,qaif-tdm-dai
> +          - qcom,qaif-mi2s-dai

This just sounds like a generic serial port being programmed to
different formats, why do we need all these compatibles?

> +      reg:
> +        maxItems: 1
> +        description: |
> +          Hardware AIF interface index (AUD_INTFa block index). This value
> +          also serves as the ALSA DAI ID; it corresponds directly to the
> +          QAIF_MI2S_TDM_AIFn constants in <dt-bindings/sound/qcom,qaif.h>
> +          (e.g. reg = <2> selects QAIF_MI2S_TDM_AIF2).

Details of Linux software interfaces should not be in the DT.

> +      qcom,qaif-aif-sync-mode:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2]
> +        description:
> +          Defines the FRAME SYNC mode for the audio interface.
> +            0 = SHORT - FRAME SYNC is high for 1 INTF clock cycle per frame
> +            1 = ONE_SLOT - FRAME SYNC is high for 1 slot per frame (pulse
> +                stretched by MIN(RPCM_WIDTH, TPCM_WIDTH))
> +            2 = LONG - FRAME SYNC is high for half the frame duration

This is a detail of how the various interface formats are specified,
just specify interface formats in a standard manner.  Similar issues
apply to many other properties here, it really feels like this is just
inventing things from scratch rather than working like other audio
bindings and using standard properties.

> +          Sync clock/frame source. Independent of sync-mode;
> +          all combinations of sync-mode and sync-src are valid.
> +            0 = External source (slave)
> +            1 = Internal source (master)

Consumer and provider.

--cny0c8Dr8y1s+2mj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpFB4EACgkQJNaLcl1U
h9A0ogf+K3E919LqhxSrvQkn1qD3wEBOvTAIPg73+xCPCPAU1UmX4hBt2u35g1d3
rURfvBC0O9ZwO/5/9mGMyYuOJJXnNpi1XTaCPUeg7sHNJj6IaB63F2tCgVojW8u+
OK6Ejl9qZA0RO12oP6hoB50b3hn5qJEHVKthHoTC8otzsM5CRdXZd3+ia6Y0okqg
RRkjp77NfahPDNlpH+9P2y/+SoBrmouhZwx7RlL3LoSf40kJPR6nimecVBHiydy4
PAKG44CwI9u6fRc/csLiGBhaohYkpqmy7YHbu5QnTZrFqMANT99c+AVjompd6hVd
ymNVDhEYCUbwgkjr/3Nh3gRa3xaVIA==
=D5Yx
-----END PGP SIGNATURE-----

--cny0c8Dr8y1s+2mj--

