Return-Path: <linux-arm-msm+bounces-73477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F28AB56F18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 05:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0598E7A6755
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 03:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B2722422E;
	Mon, 15 Sep 2025 03:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="qXXbASE7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687D1CA4B
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757908679; cv=none; b=VgYa9xDAIAOrzDtIi8lPYkaddH0wv2wZfwhnKUVK7UJS8ulMqCFJ4x41WAHPFeB7M6kx0CKX8vodLUZcG9FmnizTJ+BWVT73vZt/X7AFQuuB8RigDu3GyXRAA2cY6eGHU4YRGJ+XPmC+ziXyesKzmokISBsuhFyrISKUTw6zSkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757908679; c=relaxed/simple;
	bh=2Xy01XqySfn+Gv/0l4aBAQRgNe8n22jq6YtIPRhmVVM=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=AlVSMmfIblkRsgsGWCiP8xqalR5uTnupljX0nLgoq91M39SZor06EQH3xKiuXyCvvWIHYhJl48invhtDBkXYZjwvCz6fG72XJdB1u27mYGn/BDOBaT02h+0VUET8RWTcDvk48wuGS1PpBjVFMeATJpprNZ8zTM8Z3HBKvpbVNFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=qXXbASE7; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1757908674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=01flalOamoG8hGUPx26c1ucCPVzgbdkNlwwmTmDrQFs=;
	b=qXXbASE7At01fnFcdzc1pBah8q4Vi+SS4WF834N1x3NhUZuvTpxJEY7mcj9F1oF8EtOzdO
	e94bVM424bH7VE8lxe5URc32rQXnMfVfb2JA/iDIbDw8crYeUO/e7fMzLQjo9OQxxjiXIo
	tBCiTmFcvWjxRAjcaYUXDsur7D/LIcKmNvBE9imwmLAzqxZDE3xKmxfCWIp9P0m+RuWtPp
	9bnsnkS7ZpZBw2v8rD60TI7rykoGlAO64YtpgwvQwcySunbQpcYJiVeu2/uwhPf95BRXu0
	NXPJONbtB8iILFnENksjMyJ9Gzyi0rF/x6ZznhE0Gs8x7EPE00OmpfgNu6N4Gg==
Date: Mon, 15 Sep 2025 03:57:52 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <f692c6e6e7406648a5b35e17fb22ec74641207e6@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sdm845-lg-common: Add wifi node
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "David Heidelberg" <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <rfp5oukqbnrzva6ewg4ehilpt4cm2xybmo2adtcbpqsliwfe5q@d5ayeglq7vz5>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
 <20250913-judyln-dts-v1-6-23b4b7790dce@postmarketos.org>
 <rfp5oukqbnrzva6ewg4ehilpt4cm2xybmo2adtcbpqsliwfe5q@d5ayeglq7vz5>
X-Migadu-Flow: FLOW_OUT

September 15, 2025 at 12:32 AM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.=
qualcomm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=3D%22Dmitry%20Ba=
ryshkov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:
>=20
>=20Was it submitted for inclusion? Please follow the process described a=
t
> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boar=
dfiles.html
>=20
>=20>=20
>=20> +
> >  + status =3D "okay";
> >  +};
> >=20=20
>=20>  --=20
>=20>  2.51.0
> >=20
>=20--=20
>=20With best wishes
> Dmitry
>

Will do in a separate patch.

