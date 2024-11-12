Return-Path: <linux-arm-msm+bounces-37684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 270859C5FE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 19:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39BCFB2C645
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 17:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C232141A4;
	Tue, 12 Nov 2024 17:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZ8phrHB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9750E212F05;
	Tue, 12 Nov 2024 17:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731433983; cv=none; b=SCJ5yDiD5Z5CuWl5LTcuvRP2sAwazNcadF8HwcbPWrUlHMTFxIPIL8EZJl3troqzCxbgRf7PGY0OlqSxfDCrUgIpbQPS8WbVszteq4zdDoeB6BMKr7LkZsIcX0W70FU+nfdaA5jwmbqMgBbOwNHhoZQHvJQF2toZV6vHNzb/qaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731433983; c=relaxed/simple;
	bh=XqUNyTnAoGvRFc6NJPZM4dR65hK+xRVPAx60WZKWV8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N58ciHEklMV3LJqv6CPiZBQr2gJBnljlFVFMj+TM4u8ERB1r25Qo0iJ0krvfE9Lq6b+Wj49YfG07gxJK3AcYlygA44cEcQP4T2cATlzFwi7WdHBgVv0+2bTQz62nJ4mE5A3g/daY/bTFp0WTYkUyGzIvxfVIuaXCOW5txTk3vAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZ8phrHB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31227C4CECD;
	Tue, 12 Nov 2024 17:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731433983;
	bh=XqUNyTnAoGvRFc6NJPZM4dR65hK+xRVPAx60WZKWV8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HZ8phrHBXgWmY6Le3uWwD8HAdgijCmsUqHlhDEFOTv2h+sUwCGIKvJeU+Cnm1Dd8s
	 junEAQHfwv1QFWuPQ/A2AP8Zp/VF7q8NOP40eaeN/5lV9pfUcmSa4k0p72FgvaKDDT
	 MKQuGnSk/47MqHH4VhUOAOzPjFMl4Hex1sVg3fjVAQ2Gt5peQ9W/4VPWMG08mY7vGo
	 x0k42M2WmIQ7ugO1t7nWlwzC+D92/xoV56n0IrH8rURnFAkIUubgSko4UMKqJ7ov5r
	 eN1IMDMt8ctRwYSTNBxfCBgYJw4zLpRzH0SuJGE64sNzETVR42x0ewo3sj16bLDs3C
	 z4Z83R/RQJXQA==
Date: Tue, 12 Nov 2024 17:52:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
	andersson@kernel.org, konradybcio@kernel.org,
	dmitry.baryshkov@linaro.org, mantas@8devices.com,
	quic_rohiagar@quicinc.com, johan+linaro@kernel.org,
	quic_kriskura@quicinc.com, abel.vesa@linaro.org,
	quic_kbajaj@quicinc.com, quic_wcheng@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 5/6] dt-bindings: usb: qcom,dwc3: Add IPQ5424 to USB
 DWC3 bindings
Message-ID: <20241112-elderly-dole-796d0fdb373c@spud>
References: <20241112091355.2028018-1-quic_varada@quicinc.com>
 <20241112091355.2028018-6-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b67RiRvDG6Y2cJDb"
Content-Disposition: inline
In-Reply-To: <20241112091355.2028018-6-quic_varada@quicinc.com>


--b67RiRvDG6Y2cJDb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 02:43:54PM +0530, Varadarajan Narayanan wrote:
> Update dt-bindings to add IPQ5424 to USB DWC3 controller list.
>=20
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--b67RiRvDG6Y2cJDb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzOV+AAKCRB4tDGHoIJi
0hFaAQCvFgly9dNrOCutUGFvxUKQ846YGdIJo7xDmgt0KhovzAEA50rIU3ptcPUJ
7NP5qXgIXb0vtITBaxLJjOe5F6QwKA4=
=6Woy
-----END PGP SIGNATURE-----

--b67RiRvDG6Y2cJDb--

