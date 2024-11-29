Return-Path: <linux-arm-msm+bounces-39613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B35AF9DE98A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 16:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52DB7B22516
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 15:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E412145B00;
	Fri, 29 Nov 2024 15:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6xjrSBO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C5482D66;
	Fri, 29 Nov 2024 15:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732894431; cv=none; b=hJ8AenMqsn7wv07oghzH4ZmEBnULx3UGYJTnhRFyt7Qh+dk1IiynLgZpcXPA8XvbR1HOTyRKwsMqfjsItTkMPHIYwcqeTMRraz7tvBdUnraraDEQLY4j7cbSbdj92wwNr/RdCakN6ez5H9vzdqDLqtrPS1+Md3N3yP2krHFC4bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732894431; c=relaxed/simple;
	bh=pwYTMiV9PIf9qH8kgFwZp1YSVxRhW/cYgoj7lfu0J+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQ4XVChw8zJqddz7SqxapngPm4Cp1ycF7rFO9ol+sZk1HcsHdUGMrvt/IjeqElsIIFvLGGN5h9BDxqHqVc8ApGlIqutBVZdRMgT5agzbnHmWmFel2olGGztkghoteiGah8dL2lmLbD/5iN3hfvZfVXwEjkWeJGxNl5zXFyhh8BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6xjrSBO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2B1C4CECF;
	Fri, 29 Nov 2024 15:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732894431;
	bh=pwYTMiV9PIf9qH8kgFwZp1YSVxRhW/cYgoj7lfu0J+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B6xjrSBOzNKq6NvcNFXDNYLh+8/NrgtWdo9SkvB/ieouKgTiXYfzUkoHaeOS0T5CY
	 IJsRFaKspWa485swf11g+kv6ZcL9zE+gxA9NRQGW0VboT7L1LDKBBqy1fFJ0PE75oU
	 YqHBq3FIalRyVkbcwimGAqMgsEdeFFrDWxq75ZrV3DO2f2zy98M6yN5NCovcYCxYh9
	 4vUmMb3sDyzAsOWxPbzTbzhH2t6htM5jBih/61G7rKrA+RHlNXkhNdRwLwrMoJVHec
	 ULPjuzxrsudovawh/KAfZ+bo9Tw5sjaC0SBM3YzNgHU+UTdhls4x++L5pN4pavxQxa
	 9HlacWpzPT/sA==
Date: Fri, 29 Nov 2024 15:33:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,sm8550-dispcc: Add SM8750
 DISPCC
Message-ID: <20241129-tribunal-baguette-5720d4ace82d@spud>
References: <20241128-sm8750-dispcc-v1-0-120705a4015c@linaro.org>
 <20241128-sm8750-dispcc-v1-1-120705a4015c@linaro.org>
 <20241128-serotonin-carwash-62ad0fb09c3a@spud>
 <55ceb6e2-3642-41b2-9428-ca92b8a43487@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fM8fp/4QEKBc9kM5"
Content-Disposition: inline
In-Reply-To: <55ceb6e2-3642-41b2-9428-ca92b8a43487@kernel.org>


--fM8fp/4QEKBc9kM5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 06:38:48PM +0100, Krzysztof Kozlowski wrote:
> On 28/11/2024 18:12, Conor Dooley wrote:
> >> =20
> >>    clocks:
> >> diff --git a/include/dt-bindings/clock/qcom,sm8750-dispcc.h b/include/=
dt-bindings/clock/qcom,sm8750-dispcc.h
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..dafb5069c96a0c3f83c15f=
3c61978e138baa886c
> >> --- /dev/null
> >> +++ b/include/dt-bindings/clock/qcom,sm8750-dispcc.h
> >> @@ -0,0 +1,112 @@
> >> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >> +/*
> >> + * Copyright (c) 2022, The Linux Foundation. All rights reserved.
> >=20
> > This looks pretty questionable, how does something that was apparently
> > announced last month have a 2022 copyright from the Linux Foundation?
> >=20
> I copied the binding header from downstream sources, which had above
> copyrights. Rest of the changes - driver and bindings - are my work.

Weird, and probably not correct, but w/e.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--fM8fp/4QEKBc9kM5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0ne2gAKCRB4tDGHoIJi
0h/SAQCPImhQQCsB5ZOhJ+At6G/Fm6f7SFtmH/r2330HNovrcQD/Uk0ojl8bRj8z
GIZ5Xbd+19cmNewJpj6CtswVyhaBlAw=
=3Txw
-----END PGP SIGNATURE-----

--fM8fp/4QEKBc9kM5--

