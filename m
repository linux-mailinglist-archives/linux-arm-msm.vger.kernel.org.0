Return-Path: <linux-arm-msm+bounces-83164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E20F1C83824
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3F42B34C855
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0E1298CDE;
	Tue, 25 Nov 2025 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="c9psUhMV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51A3292B54
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764052867; cv=none; b=BYC/4/o6qYi1OhcC0G/dgghvlhxa5i9f+Pf6n9ZMXGseuYTvVWr9hzHrTzsbg4f3I8cSEcCpUBum4MKQkgPi07gBB0nQe5X43yXFxA7GH89Akll+/QeRiORMoqoc/tfIa6/nPZOeaDPvbP7sDEjxh4JZqOgWdQXG7BOJWuA+PQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764052867; c=relaxed/simple;
	bh=MHSN32g7JJOyd+8O5BZ5IgXTWk+XLgA51Mwe2VUTCxg=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=dW7YHVgNB/xJsnyzlg/hQRIvrugiV9AOojAR1aZGLEauPs9EssLQBYhuRdWjy9nic031A9Eh3WCZ00KMDHinL3O6cMSzab4QTdXOaRl5uRvDIOB0yEP2QYNmfT2qJgRHgBfK8SqBaWapRkSk0GhgqdYMpDyQ8bINOUVLgNmp58Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=c9psUhMV; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764052861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q7qGTon+mZZxFHOEJqUS8wjA79VPT85tm/oETKgfCr0=;
	b=c9psUhMVc5G/scJQdVZ2ue286V3W+Z1AOdE382wJ/d1vUnPylr9v0sQk1T2mHcftYjUvN1
	8qBXcButvb6zbIXw5HGNI9C9em1J5fktvmClg7Mf0q7L2RUSr5zGvNzsznUAMIzyjITzP5
	18DZgRDYT978wIXe7xUfBjkQAA8OeTMW9ZUut4yWXGxkz+l9wk0ElhVHEy0+wdPjUEi9Vu
	CXzcc0D08/fFUj3VVOBorV4ur8pN7XNkC/rJKefl17tbH6Hv/193Q6wzEuJnn43pCGVgvA
	fU25yldEL4WJaxt690eO6kabYRUcUVS5XFU/FkWxvAGhoEucyRKsU2y3kY/Q8g==
Date: Tue, 25 Nov 2025 06:40:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <998d44a8500132bc48e6882a5f7b19b45286a965@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <7661d9d9-eca3-4708-8162-960df0d7f6c7@oss.qualcomm.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
 <f58493a9-6def-4610-9c3e-d6a877dc23d3@oss.qualcomm.com>
 <d38801bc77ad00442b1669ea252ae30a5c6af5b4@postmarketos.org>
 <7661d9d9-eca3-4708-8162-960df0d7f6c7@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

October 2, 2025 at 9:37 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.c=
om mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%20%3C=
konrad.dybcio%40oss.qualcomm.com%3E > wrote:


>=20
>=20On 10/2/25 6:51 AM, Paul Sajna wrote:
>=20
>=20>=20
>=20> October 1, 2025 at 9:14 AM, "Konrad Dybcio" <konrad.dybcio@oss.qual=
comm.com mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22=
%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote
> >=20=20
>=20>=20=20
>=20>=20
>=20> >=20
>=20> > As the dt-checker points out, there is no such property
> > >=20
>=20> >  If your wi-fi works regardless of that, you probably don't need
> > >  to set the one you intended to
> > >=20
>=20> >  Konrad
> > >=20
>=20>=20=20
>=20>  Perhaps this only exists in the postmarketos tree, but it definite=
ly exists, and doesn't work without it. I'll remove it for upstreaming fo=
r now but hopefully someone sorts that out. upstream.
> >=20
>=20So you didn't test the tree you sent? :/
>=20
>=20fwiw
>=20
>=20drivers/net/wireless/ath/ath10k/snoc.c:
>  qcom,snoc-host-cap-8bit-quirk
>=20
>=20Konrad
>

with qcom,snoc-host-cap-8bit-quirk I get=20
```
ath10k_snoc=2018800000.wifi: msa info req rejected: 90
```

without it I get=20
```
ath10k_snoc=2018800000.wifi: host capability request rejected: 1

```

Please help me understand how I should proceed.

