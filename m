Return-Path: <linux-arm-msm+bounces-84027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5327C99FDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 05:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9918C3A34C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 04:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD49281369;
	Tue,  2 Dec 2025 04:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="e2S3pqLk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98453176ADE
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 04:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764649307; cv=none; b=EpnpvxL0vvyjNNpRLqSCr+/ES5AiH2cGiu7brvBdd7Gyn7ReEBKubM98OJ5xvNmufECRu+lKp4KTa662O4j4C3DbPTP6lioLznJdctP3CoLC4g8mRalVpQZVcMx3j+y3JVot8gw+pMDGjaIH0ESAbOA4SOgWLnHvNemAhn/16/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764649307; c=relaxed/simple;
	bh=H7JiUbr0grbD/OuMUxd8lM1sXrcva3VeiRYfJNqlcBo=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=hxLjKgJlYfEGatOXMZ5HynHdegT3RaTqYJ04HephwZqEiOxtqwDdNUL9d10xE1k1YOUhfyvffbWbx7QfQ7Gdz6hbtEH5A8eWfqWUNfOkISYHQiIsZAvOra0XQWpWu3eO/AVQYdKCWHDniDL5jqZWHB5nv7dUB53XrBJpqs3M0x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=e2S3pqLk; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764649302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7JiUbr0grbD/OuMUxd8lM1sXrcva3VeiRYfJNqlcBo=;
	b=e2S3pqLkqd4uKG23Rjeb08tGQKrixyD/ymVYVpV0f1bv8zLEbAyl0jkW4hHyDVz9RYVkXE
	uDF/Ls9BZ97bDRzrwZHeAXuShHmcI5TWvfn70+15fvKl5032vIIISIkgGt4NqAi1C+HDed
	JxuYXKrw2wVK90VYHIC81nr2A5LZbUKRycJysSTi2U4/udmzv3KbXWBqskxR13CgutCtAl
	Q90HTiO3wgcmBgv9jP/06C/Z0ZcM7DkrX33+eGcSj9ru+Wy8BMf22D8TX07JhSIvJUbL8A
	vciHByRY+CdyFl4l0jYjhKmKGoivV4LKOWts/0C2qf4xItUSXhdu3ZzePDmGFw==
Date: Tue, 02 Dec 2025 04:21:40 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <cb37445326732dc1c17e80d245c8a29ba3f5aee6@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v4 10/12] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <09e5d84c-39b7-45a9-b7d7-9beb54fb2f3f@oss.qualcomm.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-10-a5a60500b267@postmarketos.org>
 <09e5d84c-39b7-45a9-b7d7-9beb54fb2f3f@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

December 1, 2025 at 12:38 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm=
.com mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%20%=
3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:

> Sorry for not responding earlier, you can retrieve the actual volt
> numbers from the hardware by reading
>=20
>=20PMI8998_IBB_REG_BASE + REG_LABIBB_VOLTAGE =3D 0xdc41
>=20
>=20ibb_uV =3D 1.4 + .1 * val
>=20
>=20PMI8998_LAB_REG_BASE + REG_LABIBB_VOLTAGE =3D 0xde41
>=20
>=20lab_uV =3D 4.6 + .1 * val
>=20
>=20Konrad
>

I found it in sysfs along the lines of your previous suggestion instead.

```
1|judyln:/ # cat /sys/kernel/debug/regulator/c440000.qcom,spmi:qcom,pmi89=
98@3:qpnp-labibb-regulator-ibb_reg/voltage
5500000
judyln:/ # cat /sys/kernel/debug/regulator/c440000.qcom,spmi:qcom,pmi8998=
@3:qpnp-labibb-regulator-lab_reg/voltage
5500000
```

