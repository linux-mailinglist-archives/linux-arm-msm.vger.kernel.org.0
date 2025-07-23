Return-Path: <linux-arm-msm+bounces-66260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D52B0F079
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 069575671FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC122C1581;
	Wed, 23 Jul 2025 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="af/NNxOA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44F22F43;
	Wed, 23 Jul 2025 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753268233; cv=none; b=pNJ/KkA4ALWq+dZRAbaU5baODQVzD86rWBp5qaK0ye2EJOXnw/W2VtOn16TgOp6zZqv36vYnuvQ5R3oaILRtnzAxD7r/MGD0iRwG2KO5+HELLMbhYiEqaF4m++5fMzFlAPMhKOLFBEIaqHzvDYGARpx3TEulSWqxfiJD40ilX9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753268233; c=relaxed/simple;
	bh=HPsGtUKKZvPNP07XhtoQM/WjzCSSAlQSwl7BLAUuzGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyXxu3tczCHoefpwfCumlfCGKsgLSxz7CjAC25SK/jUXEzRzawHSxNZTvjFwgLjI94NbSkEkq6eRhIu00PFSSy066GyIcphB4AhbCLCts5gaps9CnUGmclQrnwsqOAR5o7RmOoKZoRw7t8XwS8+9IFEMIkoTsMU7PXyJuMmLb4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=af/NNxOA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F38C4CEE7;
	Wed, 23 Jul 2025 10:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753268232;
	bh=HPsGtUKKZvPNP07XhtoQM/WjzCSSAlQSwl7BLAUuzGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=af/NNxOAf7vkY2Qkhg/2CVlGUjT3tytfv7qNetZXTTP3vPPAPkUhOQX0szainxmK5
	 /wYTkMlGlX/Ye86ZXKiMTAcrSvPS3EDOexlOm5S8BmrbagIIrFLok7omjbuxfyCkX2
	 UXyqjgxY0Aw4N5pT2pDNZ81pNzRuFIA+okVKz20F1twdR65ZJHjQl6bji0LPk3RKIN
	 3rlt0tfYiUecvAKd9MICy5NrbcvjPd56OfzHgqmCigQf9k6Y+tPrOwCIGzTveZF0i9
	 BZhwvo2RQkR9ZzDyQs9lNGiV99OIl0PntSvZw0eHqgJX//YBHemSwfEmd4wwiblD3l
	 po7xtEadje8jA==
Date: Wed, 23 Jul 2025 11:57:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] Enable USB audio offloading on Fairphone 4
 smartphone
Message-ID: <ac3f1eb2-5830-4bda-bc57-c4d29c22aba0@sirena.org.uk>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <DBDAPORDD5IM.1BHXPK225E2PP@fairphone.com>
 <DBHIM4SA3OIK.PXX6HMDE93B8@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8K78IXY0YL/xImel"
Content-Disposition: inline
In-Reply-To: <DBHIM4SA3OIK.PXX6HMDE93B8@fairphone.com>
X-Cookie: List was current at time of printing.


--8K78IXY0YL/xImel
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 08:22:06AM +0200, Luca Weiss wrote:
> On Wed Jul 16, 2025 at 9:19 AM CEST, Luca Weiss wrote:

> > All dependencies for the patches have been applied already, so this
> > series can land as well!

> Is it still possible to pick up the sound patches (1-3) for 6.17? Dts
> has been applied already.

As previously discussed they won't apply until after the merge window.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--8K78IXY0YL/xImel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiAv/8ACgkQJNaLcl1U
h9Ae+Qf9G/KwU8POqV7s+PHu9EJIvX3PgyE7+ZWydn1B7bO0xyVfXy2RZ6ZLGm28
mgg0FS/VFFIqQTykM5vO351ex1cy+nEZO6kvnfsQQ8cDPDFDJWFt+/+m/zswUOdw
hJX/r5h4zyEeK9D3txuoNdAPlFME5joMd/leV9t7kK2YbTrKTPJrirRmD/wgprrd
Cj/cNM/FIdHz3kLO/pII4QwtzXu4yF2urjbhGL/DxtSOppC9U+SyXojqLZRnbKlo
DOjRD1lRseVnqfCyeeK+ws1plUxKs3YIG7WwbgHY2fzu0pbkYP+3VeHN5yNmECnU
M7UWqNYsEgV8ihrNAY/RqsR/tDxmFg==
=UFog
-----END PGP SIGNATURE-----

--8K78IXY0YL/xImel--

