Return-Path: <linux-arm-msm+bounces-67936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E77B1CA06
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 18:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D46B189BB4E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 16:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D182B29B8D9;
	Wed,  6 Aug 2025 16:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q69bAhWE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FF3296141;
	Wed,  6 Aug 2025 16:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754499072; cv=none; b=KwGyD5y3LRC3MiARq6/z59po0WhukUSCtDthoNuglDjJemlKK8Y59iyjQvQylAfr8EwTgejfjoWTS5elcdG0BPl9oXtVKQyjhuXR2pBlcWKlfcVvYOXsf59bgIyhIUia9NOSkTPcgmZNncgMYwDeYbp4WLqb25rceSC9qxOLTOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754499072; c=relaxed/simple;
	bh=URXTslLlgt9LuOCY77NXwIANbMuWh4Ebark9d01DQi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIlQdB9GURfyRKZXofipJpJDKjmOYFZlAGa3jQOMrW3eR78n9D2loIcRjhUJNhgfKgR5F1cAYFi/Xvt055dUWUaoXL2r9XgqXI2gqQjvncqmKQ+f57YItZaVTbantp8JI5sU2IeqHJD4Wc8xuSff49OYR0QoDnroyKM+yuyI5Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q69bAhWE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D81C4CEE7;
	Wed,  6 Aug 2025 16:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754499071;
	bh=URXTslLlgt9LuOCY77NXwIANbMuWh4Ebark9d01DQi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q69bAhWEJvXQo1WKYVksF6TV+05YhJAeFp8toPMf/RA39fFVtk5Txfkw7UnBRTfDX
	 qkySvTuS9YezAItuwAIVWNTxnfRD6SYcG9LJr4ieBjka6KLj+JcZOgbW1uruVnfSof
	 Xe1XZEuT556kMQjKVLu9WXibJGCkkwgjwQfYhOxuqMYh7E4OkXjM5xkcCkz3q7ZnJt
	 59u7nBuLJvFMk2xThRmw5Ov6rPKc5UL/lcLXEAvn4VdtqIUZnKuvyg9vFN+p3m+3OW
	 ayUaUxoJ1TR1TDzghUKoxmyOGpXDLB3oG1elILX03Ve1rsDSlsAn5ldU26zFUYlJYk
	 0P13cVBnkbs5A==
Date: Wed, 6 Aug 2025 17:51:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
	kishon@kernel.org, mani@kernel.org, conor+dt@kernel.org,
	bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH V1 4/4] phy: qcom-qmp-ufs: read max-microamp values from
 device tree
Message-ID: <fe2bc07c-8fe9-47fd-bcd7-c2f0ebbd596f@sirena.org.uk>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-5-quic_nitirawa@quicinc.com>
 <f368b6da-1aa3-4b8e-9106-3c29d4ab5c5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HlUTHESa6Nmwz3GM"
Content-Disposition: inline
In-Reply-To: <f368b6da-1aa3-4b8e-9106-3c29d4ab5c5e@oss.qualcomm.com>
X-Cookie: New customers only.


--HlUTHESa6Nmwz3GM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 06, 2025 at 05:58:30PM +0200, Konrad Dybcio wrote:
> On 8/6/25 5:43 PM, Nitin Rawat wrote:

> > Add support in QMP PHY driver to read optional vdda-phy-max-microamp
> > and vdda-pll-max-microamp properties from the device tree.

> > These properties define the expected maximum current (in microamps) for
> > each supply. The driver uses this information to configure regulators
> > more accurately and ensure they operate in the correct mode based on
> > client load requirements.

> > If the property is not present, the driver defaults load to
> > `QMP_VREG_UNUSED`.

> do you think having this in regulator core would make sense?

I'm not clear why the driver is trying to do this at all, the driver is
AFAICT making no other effort to manage the load at all.  We already
impose any constraints that are defined for a regulator while initially
parsing them so it's not clear to me what this is supposed to
accomplish, and it'll be broken if the supply is ever shared since it'll
set the load from this individual consumer to the maximum that's
permitted for the regulator as a whole.

--HlUTHESa6Nmwz3GM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiTh/cACgkQJNaLcl1U
h9BVEQf+Lx5n5FpPrf79MAF8jaJp37RXoLV6s7wH2llwQPEvWIrtLEg4jNRuV6IY
k9VEh+MCIB7BiC/DPphhdV34+/s4PVMiuKQ/v7CWoZco78ci8INgWou4U4Wx5tyC
CUEBE92Ss/+l01t2te+bDovSBFtankrBz1qktTf6DII/RWTUoW6SyDHYhQmiHeLR
IGDnkuzRH1j5L9qPN02nRhVf1jfQ4bOmhnr0Z24LqtjzIDPPwBkDiOOt11tVC26i
HA/RQmT8bniL6dWHcT6MrBDQBXnr4GQVASNOEjpEimMrh8cY/7CF5px+M8rPyuOs
91zPXG6hFwaCaJ2J2OfsZCgtFK8SDg==
=NQmr
-----END PGP SIGNATURE-----

--HlUTHESa6Nmwz3GM--

