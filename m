Return-Path: <linux-arm-msm+bounces-84167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ECFC9E482
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 09:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D4CCD348E38
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 08:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3CE2D59F7;
	Wed,  3 Dec 2025 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="YiBP9WYk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7482D593D
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 08:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764751340; cv=none; b=Oz9ubIHUZ9gPoXkWhT1vCe42s3JceHC8ZuUGPXDQSnTIultlUb4H0XUdB3f1cD7iCsmuhSTKuA4F+wDvqEOM2l835VFIFEB2at3FkbVDQfo8mTek99i7blyTEAyV7xypzJRRpQb0kfOl//efj94hegkOTFed2rWgIdFv2Rf+/yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764751340; c=relaxed/simple;
	bh=9Gtg9yrrdOx9RykPQgYvPeDHdGSuTO70GsVTYKk97VA=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=dn/hlyLM7ubwnULFlhSIZtzLQPh8dd5fCSfmIA79I1FbgBPbAdEtQa5wBtFpLaEmoKhhRQVqpcP4VGpmg27hfjVvWoZUXiZR6gEoB4KhUGcVNychaMRIXhAkD+PqMJnF7jdlzV+SN053X248tirxG3wzA95R/dlEbwyayuDToWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=YiBP9WYk; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764751326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gKNtN35oFunegKJ9D5vKYukJNsyouuo6xWcGRsdsAOo=;
	b=YiBP9WYkQoC8cLS/z0GOSoKnr+RC2XQbVROg2RZzG2uzhzXXzu8at2PxMYpOLYPqXfFQ6i
	egxh7IaWIdmQvqmoWEYiRXqP37w1jPE0lpOdGRLNkcrMX+sl58OkOOI4Q30MhTaJyY+gpW
	0jNqpf5PgJlkSQU2Es5fYY+6Tb+Go2l/bRKeTWLsXSsEdryOoKhDrSDn6SC+CzT4Lyy1RC
	2jQhbRBOPOzwdF00svBinexahNUz4iEKCXKuKTpBzTT5O6umbzmfTMX71dlOtwwzyLCYUO
	kMItNTu41+kEZP7BbW544kervk+CZ+oH+XY+VGWL7I3Jv6f2qJLelWUrxgryJw==
Date: Wed, 03 Dec 2025 08:42:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <164f88c182ff8e17a0d544effc7d64cdd73cd4eb@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: sdm845-lg-common: remove
 framebuffer reserved-mem
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <1d56eccf-1978-43c2-afcf-03ca88acc0e2@oss.qualcomm.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-12-a5a60500b267@postmarketos.org>
 <adcac270-3668-4b17-b430-d67ef311dd7c@oss.qualcomm.com>
 <803c48742755394d6eabc34ac73a42b36615cc01@postmarketos.org>
 <1d56eccf-1978-43c2-afcf-03ca88acc0e2@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

December 2, 2025 at 10:34 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm=
.com mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%20%=
3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:


>=20
>=20On 12/2/25 5:41 AM, Paul Sajna wrote:
>=20
>=20>=20
>=20> December 1, 2025 at 12:41 PM, "Konrad Dybcio" <konrad.dybcio@oss.qu=
alcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%=
22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> >=20=20
>=20>=20=20
>=20>=20
>=20> >=20
>=20> > On 11/25/25 9:12 AM, Paul Sajna wrote:
> > >=20
>=20>  It causes this warning
> >=20=20
>=20>  [ 0.000000] OF: reserved mem: OVERLAP DETECTED!
> >  framebuffer@9d400000 mailto:framebuffer@9d400000=20
>=20>  (0x000000009d400000--0x000000009f800000) overlaps with
> >  memory@9d400000 mailto:memory@9d400000 (0x000000009d400000--0x000000=
009f800000)
> >=20=20
>=20>  Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> >  ---
> >=20
>=20> >=20
>=20> > It's defined for both devices that include this dtsi.. perhaps yo=
u
> > >  could remove it from there
> > >=20
>=20> >  Konrad
> > >=20
>=20>=20=20
>=20>  I don't have a judyp to test with and prefer to limit scope.
> >=20
>=20This is a mechanical change
>=20
>=20Konrad
>

Sorry, I tried to have a look at what you meant but didn't quite understa=
nd. In this patch I changed the dtsi that is included by both already. I =
don't see any other reserved-mem nodes in judyp. Do you mean I should rem=
ove the framebuffer from judyp? I don't think that's wise since a panel d=
river isn't added as far as I know.

