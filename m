Return-Path: <linux-arm-msm+bounces-84411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B63ACA5119
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 20:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B69231C6E72
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 19:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC3F3570C7;
	Thu,  4 Dec 2025 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="KIP9J59y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A503559F4
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 18:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764873466; cv=none; b=SB6xofLKXjnoQSMoeY3vK06GiyuiC6SwnGfIjc1hz+VKVm4zehB9Mku1LGccBGj841C0JyC+iXehxnM1x18bd01BRfWtpVJky7vdqCi7m/uT7cLIGWE3l2oLKkWHULOnmqiF9HPjul/g+P+GH/RswqgwJ7ei4TajNGdsjPk0evA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764873466; c=relaxed/simple;
	bh=mjfCykPDt4+Yl33MEnaXxjY4AGc2VemJzbkpW0G3cU8=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=LBhg9JWoS0foy2gcCsDwjjz2XV48D/tO7h/UvJBGFE2QuMaBCZLaAumYXM7nYMqxWmoFVvcGyV2QUz7Arr09muT/Mo7D1JgHLnfKIWvNFZ2AEMY++3cWKXiY9bkPMykAS1b5hsiabLXZUIG3DBJvUsZcRHPUHW6v5HMhTPG819E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=KIP9J59y; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764873451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mjfCykPDt4+Yl33MEnaXxjY4AGc2VemJzbkpW0G3cU8=;
	b=KIP9J59yNYwUPmlfb7GWIGBrRQKsbucWANNrisazhU3gaFYvrD3+YPJkFZNa0mTHbDIIOD
	w7Y9ZhO2KUvJFFg0a826hVuKVOJCrE/l8JGp2HmtsCA8USdTqb5EKko1NtW8bSGWnbE3HL
	66eUdFFHRqUpzIWPtVfqcJfHliOlVWx4k2v/pUdqZ6xdwXaJD+okMFbc6l3ALZXIedUZNQ
	j9sWaaBACWfcm3pepTlm8TYMFNk/FGmc5erATQE1NlrCGiHvDAu1iMxIGd4xktoMYD3Nc/
	PKElCgseqx4bDgEfwu9cUZ7kDKLy641fBBUxALA8u1vwclRNciR7LlmxE1XlNw==
Date: Thu, 04 Dec 2025 18:37:24 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <2b03a898bf57cc87b78e3a90b210ed3d3f832efb@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <d8a3a30a-d627-4085-bab0-b73a2eeaa12b@oss.qualcomm.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-9-a5a60500b267@postmarketos.org>
 <62ce91326c0e1d5aef1ad5ecad9b99695f983347@postmarketos.org>
 <863db415-51e0-4c54-85bf-ac6a168758e0@oss.qualcomm.com>
 <9cdccbb5a3fb10a2d7de1e1d17d36018f40b18a1@postmarketos.org>
 <d8a3a30a-d627-4085-bab0-b73a2eeaa12b@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

December 4, 2025 at 9:17 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.=
com mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%20%3=
Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:

> led-sources is parsed into a bitmap and written into REG_MODULE_EN,
> this doesn't translate into anything that's userspace-visible
>=20
>=20That would instead be the case if you defined a pair of LEDs under
> the device node (which is valid if there's two separate ones, such
> as for some phones with a back and front LED flash)
>=20
>=20Konrad
>

so it should be led-sources =3D <1 2> or something? Under a single node?

