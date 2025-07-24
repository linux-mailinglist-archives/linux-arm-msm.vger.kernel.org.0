Return-Path: <linux-arm-msm+bounces-66592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1239AB10D8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10A6D1C2205A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D5F2DE6EF;
	Thu, 24 Jul 2025 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KndptGXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83796292B57;
	Thu, 24 Jul 2025 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367370; cv=none; b=nyRry4V7yTKF+2qEl6aFy/Uxxy7e0G27nWQ7gXCngW9OU5V0rtz8bMSt3kj94D7KtFnr/kcGeXLN6Glyu+MkgfiNlXpgyIzDO0BRCZj/KDQ0lrK0UahQDwqyosGGuq1QWoOx9POuj8yeTN6AgFK8Gbqp3WQAXdeoKFJJX/L2uvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367370; c=relaxed/simple;
	bh=7VX2itWOcXpvY3nn3ti5LM94rjYHSoaLYQDUiyB29+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSj4s63o3MjTUoKIhGsJzCwl5Q9SH5G0Gk7JdKhM4vEjPme5ys0BeTq88pyS/zWcAsOuscg8q3MJ0qQBXqq2dp9uUI/a1ZlzSCjchkM3CAOoSCvhuC/Dal0SiGPYlp3tWLbQBaaTM3TNL+7uhxiGhNUM+dO8a6W6bFCMFkHctRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KndptGXC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFDFC4CEED;
	Thu, 24 Jul 2025 14:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753367370;
	bh=7VX2itWOcXpvY3nn3ti5LM94rjYHSoaLYQDUiyB29+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KndptGXC44YzRQ1o42dM4tVQ4RVb3DQiuTGhLqAeIBvdO4a8nKo7wb1hCUbptWXns
	 eQSRVLoYBvo5ylR8MklW1aP6kQRt4+VyqPCc1fXz+op/jS7vLkXJ2uhg65yW9/ejo5
	 5WTi6j3tQpBuKJKTjeLlEpIVx9r1oEwtpHYsPqHSdVcMPc3ImkvP8IZujJ936t87Sa
	 Tb2yteIgNN0p4ogc4MjCdy0FLjP3v3N7uU+RL58x5J7+CspaZHaA25LYX4d/S8akGD
	 fiU5DlFPjifNDgqsWNn8wCskf3MJi65j2ShdahCLaIcUvLHN5Nzb8YQZRpPqWGKFod
	 M1tDY6b3WhCOg==
Date: Thu, 24 Jul 2025 15:29:24 +0100
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	srini@kernel.org, lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: lpass-wsa: remove un-used
 include
Message-ID: <819847f4-58fc-4582-bfd1-97acacc15eb8@sirena.org.uk>
References: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250724134229.103001-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cTp8vNF1hsa2O5Mm"
Content-Disposition: inline
In-Reply-To: <20250724134229.103001-2-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Did I say 2?  I lied.


--cTp8vNF1hsa2O5Mm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 02:42:28PM +0100, srinivas.kandagatla@oss.qualcomm.=
com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>=20
> qcom,sm8250-lpass-aoncc.h is really not used in the bindings, this patch
> removes it, this also enables us to cleanup some of the dead code in
> kernel.

Acked-by: Mark Brown <broonie@kernel.org>

--cTp8vNF1hsa2O5Mm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiCQ0QACgkQJNaLcl1U
h9Cy0Af+JgACvHsilDNzOv6s1Ws8zu3+J3TDOWI3J9QN1qvc19qT4RG4H7EZHyo7
q6/cZyQyIEnTGURHbAEykTcywrOkwimYeTkJm00JFNumi8W0/qSGA0evEEcs59VL
krrLtF3veYQDhtxY0mWT2uSTzmBJXLmFndp3NZ7ik8WQfFjoTOfynOd3e+vi0hgt
bnest3mHz1vdLNdFG+YRd8OiL3swcMGfFot693Bq+csPgymhfvZbs0JUOtIO9h2S
zT3WdqQ4sXhTXvFDX3YkG/3oLMxO3iBLkeF1G9k+4Or+vXqsU9B7VpBjOx1mAbbh
fNVPr/dXRpp21MjP9BlWs846KQDW+g==
=M2EQ
-----END PGP SIGNATURE-----

--cTp8vNF1hsa2O5Mm--

