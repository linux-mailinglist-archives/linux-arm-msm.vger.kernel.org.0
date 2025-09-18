Return-Path: <linux-arm-msm+bounces-74004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C673BB82960
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 03:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80A3A3A6DCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 01:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B017E24677A;
	Thu, 18 Sep 2025 01:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="da7QlpJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F095C226861
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 01:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758160367; cv=none; b=WXLAaB5g20+IQ54H1XcAULEDqezOc3sNyjQRzoiHcILUztqhXhfrRieiRvol4YLT6iGMJfBKug6m94Ca7ovHAHbZh9GhDLqOPKA9kpxKzkfsa5mUrh/oiAh1wSzj7TwbT2JONwRgYktz3GpNZq3fK8AnWh10bMj9VBCLxArqp6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758160367; c=relaxed/simple;
	bh=gp9ayNNoq4T4DfTabvZOohvuLN5xYQ3hwWz9yAwroEM=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=N+xcVrWd+Bf4nd/+IkYjm6gVEeQLFWHBZW1DIJ2vgdUDEFy2e5QPwHnnj6yOBR5BxeKE74YHVAofOSZTmmW2ZwHssctWIWRMaTu/WcEYJlnBOeKFmv2/NYNTA7EPR1DQAQfEp5hsd2dXyeqODIvvpQLLk6yD5If1kFhZIWDgRq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=da7QlpJ8; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1758160363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gp9ayNNoq4T4DfTabvZOohvuLN5xYQ3hwWz9yAwroEM=;
	b=da7QlpJ8KoU1Xp6ks+FY9pu8QfLseCQCxmWc4P8+BDI+RFrCrZuphODSl4MutV9gw7A9iX
	z/IGgMMOJlwo/StUH4SpaVknHUMxKSTcC5/5ETG20xwPyu/Q4R8qBYON4E67IobeE3WDfZ
	PZHWe1fIN3XMmxhG46VH2aQC/ovSo/DctNTidKARRUs3kC4LL8uenrTD/3C4/xIFoPko5H
	E5kZHIfxRmzUVH+eh0spSMu0IsOuWdqngsumozEG3SDwCbnH3yO1WACNmPoVuC72BV18oM
	3cy133aVShUBxju0fd3kd73Gb5ei02iDzxOvYF0IWUWudniYvGdREFeF/H7xiA==
Date: Thu, 18 Sep 2025 01:52:41 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <bdd15d7bd1c86a1166d4f406d7ec1d99ddae6bbf@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v2 06/13] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <003840ad-b5a7-40da-800f-1fd880b8f831@oss.qualcomm.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-6-5e16e60263af@postmarketos.org>
 <003840ad-b5a7-40da-800f-1fd880b8f831@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

September 17, 2025 at 1:51 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcom=
m.com mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%20=
%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> You're changing all of these paths.. have the previous ones ever
> been used, e.g. in pmOS, to the best of your knowledge?
>=20
>=20Konrad
>
The previous values have been used in pmos, but I can fix the firmware pa=
ckage when it comes time for pmos to sync this back.

