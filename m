Return-Path: <linux-arm-msm+bounces-87197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C472ECEE3B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 11:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F3243006AB4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 10:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D762DF13F;
	Fri,  2 Jan 2026 10:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TyJYirI1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793A12C0307;
	Fri,  2 Jan 2026 10:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767351594; cv=none; b=sKxaIz0yQkRBAV3Vvx0819eYemm8fsqulW1PkoLk4+PDTe9xx/bmHKRuUF8Ft5lK4oZBCY12Ckdk4RFUGVz1+Sq+Di91nEMQD6Ht2UvIJ2sbn6Ca/qkF2xA0XHG45EK44D95sVRXMyi/qXzv+Fpj1dN7NWW1y+UJqeZaCthDzeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767351594; c=relaxed/simple;
	bh=6gPu6eENDkutCJbkOrCwWD5UWV/8FhlTUlNBCYUpMKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZBcGb4uPW1nNOTV+1LGzxeHFaZv32uq8M0HRaytaiCAsrp8gwSV1zb7QOddXVrg14PdvyQicY7r3TBcxhUgiCuMtwMlevEMjY/3NMOdVDRpr7zS74ixlBbmVfP0KS1+Hki+9CQx9gjcNPMHfkzAKPwmGi3AAptNAKciriFDHsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TyJYirI1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2559C116B1;
	Fri,  2 Jan 2026 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351594;
	bh=6gPu6eENDkutCJbkOrCwWD5UWV/8FhlTUlNBCYUpMKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TyJYirI1SBWkiEP+w0xRF21PwA+TiUd+e88Ovccd/e1tGtZrfvr/9yks0U3QSpcVg
	 NNBCBFcaSP0TpQzMfUDIblrcteHmYfMC7mzkVIotO5RIv2MfbPKQfsI8HPtBGKZgY7
	 zZXfePmXlx7J1iMLpS9iegzWiows9mlqkhDRo/LtlKFlowPLRIyYvPD0U0GdqOKYE/
	 onvhC3ny1O+9T/1kulWzlnBbC61I9lqWE92QefTK0+7Rd3zZ70Vn6Rm4odamouBwxm
	 ll8pubr0SY9qKs8FKFu+BQCelXewUgB4ZlYJo4UbYfp48V0gneQAbM0bb2mcINNTbd
	 YHr26yX9JLHbw==
Date: Fri, 2 Jan 2026 11:59:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Add MSM8917
Message-ID: <20260102-offbeat-mega-poodle-82cdb1@quoll>
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <20251231-mss-v3-4-f80e8fade9ec@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251231-mss-v3-4-f80e8fade9ec@mainlining.org>

On Wed, Dec 31, 2025 at 05:30:14PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Add the compatible for MSS as found on the MSM8917 platform.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  .../devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml         | 5=
 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


