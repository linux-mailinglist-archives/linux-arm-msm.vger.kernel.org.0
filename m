Return-Path: <linux-arm-msm+bounces-19870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9DE8C6287
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 10:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85BA31F2268A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 08:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989DA48CF2;
	Wed, 15 May 2024 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="m3oS2t/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8684EB20;
	Wed, 15 May 2024 08:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715760499; cv=none; b=tMMmsfmjcMgbPzJPwxQjLBJ0Dgb/Lh8a89slUrmc3NWPAyoQt4h9ikqer/9/d1PZQOIynS/jqw7mw1LgdoJHmpYeMksyJuiXbKX+uShTd9ucb+MxRbG9O/9FZWRiWgUEv2Z2hRZhxH5Na20FPfbQM/6Ws/TLsXd3wtCByJhzo1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715760499; c=relaxed/simple;
	bh=ISZ3fTteUQt+jNRqMsfE9P36f5Ae8fxuIWCwjmwYRuU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZKvQWYIUIr6OkYO0y4+8FrVc9TSls9c42zckU2spzeCkB+bXn19XtxaEu3lk58s55ZRqvqLRnP0Tg9bnBryHBRbdCUHLiLLC9fMhCUaqb2TqdCQ1EGD9SqneBV4jaggsXOZXCcOlaYwyorVThbJKIVrh9MObS9Eq8j76qiFgKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=m3oS2t/2; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715760497; x=1747296497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ISZ3fTteUQt+jNRqMsfE9P36f5Ae8fxuIWCwjmwYRuU=;
  b=m3oS2t/2uq5BenM+Rk94NOaUcZj/4vPxnyWjkSjzwsxexVCr9XgDtVFP
   uhFPTUf9BxGvAxB8Jfv2+ixDmifWAQ8dJ3aV2ND2KKhcqnP9yDcPrWu/p
   81wuGfo9iwKc/FusYkgKWS86AXVn5kcvjWmbTawkneozhF7nwwOd66fmD
   PpYXd4KNcDX/VzdpXmUJMt8EdS26EwZZF4HZIHMQixl3D1TM0IZC/Anbw
   JC+4lajEqARtfOSImzZ0KERRaFX6BuWNNcU3Llp/TM9/i9OCWcnj924VO
   3T0lFnbghkb9oonEYljwbnGRt2IUcBn3JRiZ3ie+/2ccosA6UBv1dobQK
   Q==;
X-CSE-ConnectionGUID: 8FUt1So8SUq1alFbgrCf/g==
X-CSE-MsgGUID: nFOsYrWkQwmyMdwyZsdujQ==
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="asc'?scan'208";a="27054082"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2024 01:08:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 01:08:00 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 15 May 2024 01:07:57 -0700
Date: Wed, 15 May 2024 09:07:44 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Conor Dooley <conor@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Bart Van Assche
	<bvanassche@acm.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Andy
 Gross <agross@kernel.org>, <cros-qcom-dts-watchers@chromium.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: ufs: qcom: Use 'ufshc' as the node name
 for UFS controller nodes
Message-ID: <20240515-untying-overbite-87bc0e55c673@wendy>
References: <20240514-ufs-nodename-fix-v1-0-4c55483ac401@linaro.org>
 <20240514-ufs-nodename-fix-v1-1-4c55483ac401@linaro.org>
 <20240514-buggy-sighing-1573000e3f52@spud>
 <20240515075005.GC2445@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0PrHBhdITe+orsbZ"
Content-Disposition: inline
In-Reply-To: <20240515075005.GC2445@thinkpad>

--0PrHBhdITe+orsbZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 09:50:05AM +0200, Manivannan Sadhasivam wrote:
> On Tue, May 14, 2024 at 07:50:15PM +0100, Conor Dooley wrote:
> > On Tue, May 14, 2024 at 03:08:40PM +0200, Manivannan Sadhasivam wrote:
> > > Devicetree binding has documented the node name for UFS controllers as
> > > 'ufshc'. So let's use it instead of 'ufs' which is for the UFS device=
s.
> >=20
> > Can you point out where that's been documented?
>=20
> Typo here. s/Devicetree binding/Devicetree spec
>=20
> https://github.com/devicetree-org/devicetree-specification/blob/main/sour=
ce/chapter2-devicetree-basics.rst#generic-names-recommendation

Ah, that makes sense. I grepped for it in the kernel tree and didn't see
anything so I was a bit confused..

--0PrHBhdITe+orsbZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkRtUAAKCRB4tDGHoIJi
0iVdAQDJP7Srq1zIAZLzGjcqUl3letkDDesMsZYgWhkHjOcebgEA32t2E/3vsLqw
1x6/xtoqbnEcVFZArsEOJQLZghwMOg8=
=TIvU
-----END PGP SIGNATURE-----

--0PrHBhdITe+orsbZ--

