Return-Path: <linux-arm-msm+bounces-84412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDFACA5092
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 20:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A52D319630D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 18:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823D92F693C;
	Thu,  4 Dec 2025 18:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="SeeJ3ZNp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDF233DEDD
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 18:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764874071; cv=none; b=GwD7IoqnooCYRmnTp542YDKfgZQG4PJFKQMXz1uzsQAVA2V7C8G2jQ6Z2GQHJmHI+8ui0fJR6H7G4J6NeyoSk9+AdP8ATbMFfvUUMmzxh10nzCAM24Us+zPzaLrtc/2BjPsjBDW21o3ytqrl8odzDbOKHYbZ0r/5GUWG6Lht8JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764874071; c=relaxed/simple;
	bh=noPUV3bu79z3qlWu5jYSIMg//1Eh+wIJG9XWK6Aw/tc=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=VpiTGe38h6j1jTTOPJ3xFU2DmNUHRx6KrIxTXclnyMnbcY/+SaS7Tng8Nwx8tyHKrEriV8iJ9OKcJ/rs9n6c5cmvOr5G2JNMC33DjhYORrKHteFp3dAZCq36TAEclzRaJI0v18XFPqLIhHjD0lOtrSvcJnAF81LV2h+IziNNNzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=SeeJ3ZNp; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764874055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFIyOFl4s3TiXZ1x3OnNe6v2Uon+vzAZW3MjiFsYDiE=;
	b=SeeJ3ZNp2b8pbXmzpfThcPq5PTYnsTv8k9S8yTUQOt4q8rHTliKWqREOM56S7QxuGcjiAo
	F1gEnszIWzKS6UDNlouJxoGpDWEwRGmtZBq2jVUtZ8dDRVf4+/D0XczFDr7KWmSGRbyEOH
	aaUtPKuwBXv9vOHfq/hgSQN+jDKzPbZs5648IoWimVLxgBCM7Gl/F2WnhsAr+Jy+B79j7l
	KrWAjWAqo27Gjlk5KpMISQQm0UtOYeCepD6tFEWhxVtO3lrBIhYev3RSlJt4ESfEBtY1DB
	mLm28zBLE52yOOnH/vLO04l3jU7lLv+35RCupGVc7mZQHatjp/qM0iABgX8FnA==
Date: Thu, 04 Dec 2025 18:47:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <7909626f3116fcb9feb25b77820a98da56e1283a@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, "Amir Dahan"
 <system64fumo@tuta.io>, "Christopher Brown" <crispybrown@gmail.com>
In-Reply-To: <84a17875-0542-47cf-ac4b-5af7bbdc5edf@oss.qualcomm.com>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-10-80c1ffca8487@postmarketos.org>
 <84a17875-0542-47cf-ac4b-5af7bbdc5edf@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

December 4, 2025 at 12:50 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm=
.com mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%20%=
3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:


>=20
>=20On 12/3/25 10:40 AM, Paul Sajna wrote:
>=20
>=20>=20
>=20> These regulators are required for the LCD
> >=20=20
>=20>  Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> >  ---
> >  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >=20=20
>=20>  diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/=
arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> >  index 8b88f75b36af..cdaf84de5e6c 100644
> >  --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> >  +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> >  @@ -56,10 +56,27 @@ zap-shader {
> >  };
> >  };
> >=20=20
>=20>  +&ibb {
> >  + regulator-min-microvolt =3D <5500000>;
> >  + regulator-max-microvolt =3D <5700000>;
> >=20
>=20These ranges seem much more reasonable, although I would still
> expect there's a single operational voltage - unless the panel driver
> is supposed to call regulator_set_voltage() in some different power
> modes?
>=20
>=20Konrad
>

So min/max both 55? Or is there another property I should use?
I wasn't sure if that would be physically hard for the regulator to maint=
ain such precision, so I cross-referenced some other DTs in the qcom fold=
er and found this 200mv allowance in one of the sony devices.

