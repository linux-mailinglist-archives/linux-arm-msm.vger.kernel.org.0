Return-Path: <linux-arm-msm+bounces-84023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B3BC99EAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 03:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 431834E1CCF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 02:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6526D22F75E;
	Tue,  2 Dec 2025 02:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="PZL4yxOA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E85618A6DB
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 02:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764643973; cv=none; b=uAARhg175zyisOQmsrNJOvI2pJbmbAITgiDj5SzlZvqzMP3n8ZpsWPMx3s3ajKNf0oMdhNyK54/50hmZ7kdn7om787TpPVokvMjwQpykmgGlsd36pgDBgp0KXfyO0smVvnmy4v59OvoqdPEzLBPz/JzZMeIGFTBo7eR7BBEvn4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764643973; c=relaxed/simple;
	bh=UamFA+0PqzOcf5Yr33ZU/28rTtULvRklTxT6YMNEWrI=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=K9qf93g4lq12eYBttwytaU6YPuIUO7dLfI165meJLtToZM+xJtIaV3eoY52/DvEb95TxMl1atwLzPy1YleFJNts77ttUT4htmpTj/l20X2Ap4PHbZ/YBRaAPCkYN2zRiGlDJ7xaGTx8FBqKKxz9aW2YupQKRGiZYJuI+CyBwBH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=PZL4yxOA; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764643959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UamFA+0PqzOcf5Yr33ZU/28rTtULvRklTxT6YMNEWrI=;
	b=PZL4yxOAplES6oWC8H5/NfbpxBuQXvSjGzLxJ43I3HGI/tUv+tOtPNbEGhQDixMxOGL7gf
	EUKXhVG5nKi/qf1vx7pkUHvNGBG49QRbUuGZOSANA/C+m0ip27NzthuSpouWs6FurcPX5b
	DiIlb64OWVxsLNo5lwrRQe/lTMf5KPfUWEF1p24vDQaLHlu3GNH2KA/xPmO91iKYMcRVos
	EMPk9lKYXOpyH9X47gIw0oX+yhwFe6oMnEXAnMw2nem0RJ3TjGAXpQX+gti8Jn7Hhi/Nf4
	L+cM0EL2F8QoCfCLt9GXdJnDsmz7yBlFXmjhr6/f3isU7WRGzHmFJ5NZbXapWQ==
Date: Tue, 02 Dec 2025 02:52:35 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <6c96f1ea3e156db82435909992995b424817bc37@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self'
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <0d98d501-85cd-4647-8d1f-126242c220a5@oss.qualcomm.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-11-b14cf9e9a928@postmarketos.org>
 <68a07e54-9f0e-4938-803b-64d6f0c31e5e@oss.qualcomm.com>
 <c95cc75a560d5773c298537f6078949d32d22007@postmarketos.org>
 <0d98d501-85cd-4647-8d1f-126242c220a5@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

December 1, 2025 at 12:54 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm=
.com mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%20%=
3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:

> IDK if it's super related, but some phones have additional mechanisms
> for detecting (particulary the secondary) SIM - any chance yours is a
> dual-SIM and you can try using the other slot?
>=20
>=20Konrad
>

No such luck.=20

I=20think the device might have a second sim slot shared with the sdcard =
(if I put it sideways in the sdcard tray, there seems to be a bit of a gr=
oove there).

But the sim is detected by qmicli in the main slot I was using before, Mo=
demManager just can't tell if it's locked or not.

The SIM is not detected at all in the sideways sdcard slot.

