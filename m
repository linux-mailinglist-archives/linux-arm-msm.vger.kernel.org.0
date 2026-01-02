Return-Path: <linux-arm-msm+bounces-87198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A9DCEE3C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56A19300B2B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A772DFA2D;
	Fri,  2 Jan 2026 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZMhQ4zz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E60F2DF701;
	Fri,  2 Jan 2026 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767351620; cv=none; b=fSgSTNeQKc5qo38seC21bADzedA5e1hiWHuUYjnoAg5IJmjShf5m6rvC4zt/TQxl/VxesnvzUkKF+H+4kq4LpHJEFp9spQpXdTMkJJC4R7AdJaJIXYpBU9F230hKNgwwFmtuaUYp5+lCV84GJ0yt8rjZfk6gHSofjs4wXOrC49o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767351620; c=relaxed/simple;
	bh=TTdK6VZdkJdPikB2ukce0h8oqwxV6jMpbpWvuvRzY+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPDfVIYxfcilylJEggqcj3+HJ/ULofbroFS1hEmDUuN2YD9YSJ+POqyc7qmkgaHEkDsAlv1Z8MabD9jHTDCsIQcIFHUfTOGi+wQHhysWmaBbuF7TNPXt/Fl0hQFKEkhRXdGg2SvKS8wDmY/sUsz6U7S9UPWHKaj5lDd6ixR9d+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZMhQ4zz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D51C116B1;
	Fri,  2 Jan 2026 11:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351619;
	bh=TTdK6VZdkJdPikB2ukce0h8oqwxV6jMpbpWvuvRzY+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZMhQ4zzrK5D+tOL/bmf5vswrEEyic1+gFGAiTRlUkh7+7pG4meXuWd+FKQkYF0Wq
	 3cma180M5WojrIoDVKscCvWv6w7vusTs1yKi6dXmDoUsNJJEXQtcYRa9Ll+3GHu6fW
	 76/5gqPQibTRdgAXmmXsJQu7n8xhwMsk57DmhBV9nxhsaPY3RgWkNyh786kbtyGaR2
	 1mOLBGIGovVgJJvykL/by3XTPYxjKf9U/W8BNVZ7U9wt619Y0BYbNd28ezH78F2Fu7
	 uszDGqwr43zev9LyWwt6L7p1/crqOItYh0VOUecuyZr3g6LSWrBekjBdg/Rw33R46A
	 le6HhIHJ4jGhA==
Date: Fri, 2 Jan 2026 12:00:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Add MSM8937
Message-ID: <20260102-mighty-zebu-from-lemuria-878c2e@quoll>
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <20251231-mss-v3-6-f80e8fade9ec@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251231-mss-v3-6-f80e8fade9ec@mainlining.org>

On Wed, Dec 31, 2025 at 05:30:16PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Add the compatible for MSS as found on the MSM8937 platform.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml |=
 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


