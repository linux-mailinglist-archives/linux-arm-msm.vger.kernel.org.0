Return-Path: <linux-arm-msm+bounces-87196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CDECEE3AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 11:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0CD8300908A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 10:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D1B2DF132;
	Fri,  2 Jan 2026 10:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OugyS8t6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A01F2D7DD5;
	Fri,  2 Jan 2026 10:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767351528; cv=none; b=PXPCjOsjKXLbECqfOpTCrfkKLzc4FHrLo/ZMPFZB9DmJPlJjw6p2DSiYFCs2f5wE9lgSj3osmvD5UMHZ1lqOAE2TVi6VsjZA1fFtLcp2FQsvMcArKHd7g+psIaboxUuTaOPa8VSt5qLqmthKW9OulZKRwkGDlWWfYG3HND8L1Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767351528; c=relaxed/simple;
	bh=f7KEs7uqu3mjK7qSi1bqsjP5YQwse1uJDwnsAXg75dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSc9EQ4G1dnqTF936E1/CYnKF42wtd5kI9IkndVOpixdQH+7jb026Nzgzy5hTZEarPXCPDinAyy/6pGZF0n5IXpU5GQMtuVutbMMyWu3Ktp04RIt7YINMPSqkCNdPe4B7S05/EO/bojDkw40d6Yel+OcMxGnSVK/pTWoHmwIGTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OugyS8t6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CA2C116B1;
	Fri,  2 Jan 2026 10:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351528;
	bh=f7KEs7uqu3mjK7qSi1bqsjP5YQwse1uJDwnsAXg75dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OugyS8t6Dez1Z1kpkF2PV/LchT0HQXvPYPbuy/5tY8IxhrX1QTdt92baLVR0w+Vwa
	 JAykQ9l3IWgnmgfalLPS2/s61kCWs76gOdAV3YPUQHYOCipXr6a10L9QtFv3xUb486
	 C8IoGSuVIg+v4nEpf6jHRExHvJvQp5Qc1s+k0yPNztgycKrn1mCiTu1I0qVqZE8iRK
	 BLHawhzSPlp1WrrBs4feqCZjZFy/sBl8zyEcLJiJzsvCskIymYdb4pXrrpdrlqz54B
	 gtJuMVDj9lhCnyxsNOc1jRZgcNOXEJD39aZJRAgdGj5M36v7AzDvvUz+yMpJsoxzBn
	 A+zz3ZjMcEQIA==
Date: Fri, 2 Jan 2026 11:58:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Add MDM9607
Message-ID: <20260102-rigorous-clever-marten-d6da73@quoll>
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <20251231-mss-v3-2-f80e8fade9ec@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251231-mss-v3-2-f80e8fade9ec@mainlining.org>

On Wed, Dec 31, 2025 at 05:30:12PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Add the compatible for MSS as found on the MDM9607 platform.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml |=
 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


