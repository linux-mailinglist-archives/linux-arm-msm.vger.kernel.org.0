Return-Path: <linux-arm-msm+bounces-28531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F577951FEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 18:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A1091C22676
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 16:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9A41B9B31;
	Wed, 14 Aug 2024 16:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlPPE9IV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF381B8EBA;
	Wed, 14 Aug 2024 16:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723652837; cv=none; b=oC30oLjWJW4mYjLEK9CQMnKA/u8vVRi7yafMi2qJMKFqISNsQQus+mhKavAB+3+G3WvV6MqgOrcLEaaIhSnD4v1bEp0wAsEulj+kBPeSWVXfTai2IUPXnJuG/ooEB68U5u6ZgORMcw7U1/p5IP2SIPoSLzO54rfmafKBbk6W8gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723652837; c=relaxed/simple;
	bh=pqGQl+izTiWglHhGrxn7rXF875Ag88NurrlXo0pbZ5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uCRXfSYCshnxR3TLcQQPZ+I2XaBK3lEzmIwvcfruoJ7f7LIpiOwpe2ELViZ/Ra7G0HtO7j9aDESwuX9MYC56YYYVSK8HPbVNDEG1lscFGHnI9xYdG0nN+XwycBi6otpbQlN8r6Xwlfgxy6YJA4h2pAMETBkvpXascE/pXRmhy68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlPPE9IV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BBAC116B1;
	Wed, 14 Aug 2024 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723652837;
	bh=pqGQl+izTiWglHhGrxn7rXF875Ag88NurrlXo0pbZ5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nlPPE9IVvMKd27uLotj6fs17H3rjty7MMnRa8wQkeC4+7jC96McTsi0qj6/sx0q6W
	 acA6XAqRDeYtxa/o8vCja65e87R+Rc1uUbMfXJyRPx6HZ85bAU5X+I5nRPaCB4QphR
	 R+cd3cg3Pr9X2UiDEB5RqkxrD/LffsGYLhcwTBxc2RW9XiipZWhSbttBF/7fGUoGtP
	 o98u94HloROzxxnaMN69p2FUPAbci3iT0ZlUJrr2ChdfzIRrC2E8YFrt0GSLMjC1uS
	 ch/Q6ErtWrtreV/9wvzNR/RJpDJI+tHYzB+VtUQCsZQidCJhid10LZTp+tMYg/Nhz4
	 sfS5iWHYCHpSg==
Date: Wed, 14 Aug 2024 17:27:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH 1/3] dt-bindings: clock: gcc-msm8998: Add Q6 and LPASS
 clocks definitions
Message-ID: <20240814-worshiper-spectrum-eb346085602e@spud>
References: <20240814-lpass-v1-0-a5bb8f9dfa8b@freebox.fr>
 <20240814-lpass-v1-1-a5bb8f9dfa8b@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R6a1287U5OqN1/Cx"
Content-Disposition: inline
In-Reply-To: <20240814-lpass-v1-1-a5bb8f9dfa8b@freebox.fr>


--R6a1287U5OqN1/Cx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 06:20:22PM +0200, Marc Gonzalez wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.or=
g>
>=20
> Add definitions for the Q6 BIMC, LPASS core and adsp smmu clocks,
> required to enable audio functionality on MSM8998.
>=20
> Add the GDSC definitions for the LPASS_ADSP_GDSC and LPASS_CORE_GDSC
> as a final step to enable the required clock tree for the lpass iommu
> and for the audio dsp itself.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--R6a1287U5OqN1/Cx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrza3wAKCRB4tDGHoIJi
0nzMAP4vNKo1UfM9n16jMx09MFzpFwb3qXYERfPOClO89r4/OgEAt5Ds68B2we+V
1iWaAIYpLEHt83X+OkNRmMmEl677+Q8=
=Dz1A
-----END PGP SIGNATURE-----

--R6a1287U5OqN1/Cx--

