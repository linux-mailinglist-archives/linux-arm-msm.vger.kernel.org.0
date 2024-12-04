Return-Path: <linux-arm-msm+bounces-40345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD0C9E42C5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 19:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C20012859A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 18:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103C02066D3;
	Wed,  4 Dec 2024 17:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/jv1T6H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74B02066CF;
	Wed,  4 Dec 2024 17:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733334396; cv=none; b=F8nRdUArmTQRzqUhniRtHnVP3CmzJRvjx0G4JLNWFFRA52lSUWypp/Sp4UfdE8AKVmSG69+0tAbbvJBEhaszRpybMpFsGOOR4ZF1FQpUfLJvvNfjJdyX4TdQzN81MFWLZtCOPMKSz7+9ZCuaXZHwmRUCTFStV1sV4uVgnL7uifI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733334396; c=relaxed/simple;
	bh=wUa+JkE2RUtcqn7XNNQ88PQJGiolCj0UUBSyZYkVs/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hahKqMe26gS0Ir/MbNxWXr61Azt2GX1FLwyBQa2O9ZrGqKQdc4wxzN2lMB3rlROLn3rFszxvtualxG/CHzinvzR088x5IaWAYBFQ1xai9sCdiW06p7AP/eYVSZOq+JEBcsI55/Chz9IGmxH9+EieUutXWnnWRS5bC+Sac4r9e98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/jv1T6H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE55C4CEDF;
	Wed,  4 Dec 2024 17:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733334395;
	bh=wUa+JkE2RUtcqn7XNNQ88PQJGiolCj0UUBSyZYkVs/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/jv1T6HGttJoVwQj+dv1IxBoqkNPGxDDEIBL+Ki8fseJf5lUNL3/0vJ0mrjrhuH1
	 jyVBpRnv5nNWZvjCWyJgK5v/XczKmpTAZ8hP7OiY2WbDq7BnttOHECgOoAuk6QhJc3
	 40KuZvH1P0S0ajqIQE6hsGPeqcV50jBBtUCb/3hSkOPhF9FzPHXNd3UQDZlkPr5Dj/
	 hcIVJ+UloxFnx/h/Ps8fHbv/p0msrJvQIzL4YVIePHVVGDxig61pb6Y7SIcD/nLZ1B
	 67d//HSwZEcoL9ShtMqlFgz2ODOjH0z4EyUV8xhlrEidhmmLQpbA6hGoa6cGxNg55i
	 MEXaEav2R4/7A==
Date: Wed, 4 Dec 2024 17:46:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, robimarko@gmail.com,
	quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH 1/2] dt-bindings: firmware: qcom,scm: Document ipq5424 SCM
Message-ID: <20241204-detest-overshoot-90470523378e@spud>
References: <20241204133627.1341760-1-quic_mmanikan@quicinc.com>
 <20241204133627.1341760-2-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fACjiKA501eq81FY"
Content-Disposition: inline
In-Reply-To: <20241204133627.1341760-2-quic_mmanikan@quicinc.com>


--fACjiKA501eq81FY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2024 at 07:06:26PM +0530, Manikanta Mylavarapu wrote:
> Document the scm compatible for ipq5424 SoC.
>=20
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--fACjiKA501eq81FY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1CVdgAKCRB4tDGHoIJi
0lpAAQDZVcAqQ52MB0o3a09WHlt3q3vdFrKpd6C1WbNoxlInxwD9EfMysKFmg2Rr
orEuyI106kKxJCu9Yxwi8VAaG1QfbAA=
=HZK3
-----END PGP SIGNATURE-----

--fACjiKA501eq81FY--

