Return-Path: <linux-arm-msm+bounces-83177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6FEC83950
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 07DF134A4FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDAD22DA750;
	Tue, 25 Nov 2025 06:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Zk6MyQBz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C992D94A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764053477; cv=none; b=i1xi2tieObT94WNoyB8ZaeafyI0Dirn1UcFcgrfG4KNQmRjQJ59v4AWS0HRyBnp0XWGcXM6unYUfdAJilInfouh5acGsNNYqytZxRh9yeEayD9SuNPwdMMfmG5hJmjePAtWJjCPYuKvMrimNrv+gjeLm+Dpj++z0YYtg0FRC0RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764053477; c=relaxed/simple;
	bh=myP9t/M0s1HOxL8j5RESJUEmJJGzpInLbX71tw+vB2E=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=VIzGmrtpgwt3CKNK/eQ3xJdIgwIL7qBzxCgl9tLExLm62qYn4CbD7aT6liFUa3VTel/JF5S//VboCIK1RAdWq0qjDbIpGrPfydJbRdUlMJgOJYuZq+0aWBdCyZ2BvWbp8FA7C5EBNgmphC794qHujZT+UDlp2LGsmJneJkq8BVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Zk6MyQBz; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764053463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gQW8nMaLRGDP+1eaBJ0GqDH7FnxtmP/dDngFs5V75Nc=;
	b=Zk6MyQBzI03GBNnrRNHdB6S/tLonmXEK42hwG7LGubtwJezLYYNw9k+3vXG38j4IkoAGuI
	GFJQ9rdrNkntEwK92gKPN9r7rSHVYDT+V1XXRbvGGuCuRP0Ga3S1zyjxhM2O6O/dDcPIdq
	6y7I8mOTaYn5o3xv5N4S5CPou9RfB/PXf9Jye2OSUXeteeRE03CDUxWuTBUf4FqPqKYFDQ
	oUY9vDDxckmquCKosIbvzWqO2zjlZPoQB8TNgPpSEQjcwvUz3cc32h6km7WMhMtM97DvBx
	7s6SMtkDfL/nLU32AabDMepA35zxo9E7eEUVuACKyqpnB+bXJCeWUKs0WE0Y2A==
Date: Tue, 25 Nov 2025 06:51:00 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <fae984c564f240b72bc65bf3eab679587a9d90c4@postmarketos.org>
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
In-Reply-To: <998d44a8500132bc48e6882a5f7b19b45286a965@postmarketos.org>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
 <f58493a9-6def-4610-9c3e-d6a877dc23d3@oss.qualcomm.com>
 <d38801bc77ad00442b1669ea252ae30a5c6af5b4@postmarketos.org>
 <7661d9d9-eca3-4708-8162-960df0d7f6c7@oss.qualcomm.com>
 <998d44a8500132bc48e6882a5f7b19b45286a965@postmarketos.org>
X-Migadu-Flow: FLOW_OUT

November 25, 2025 at 6:40 AM, "Paul Sajna" <sajattack@postmarketos.org ma=
ilto:sajattack@postmarketos.org?to=3D%22Paul%20Sajna%22%20%3Csajattack%40=
postmarketos.org%3E > wrote:


>=20
>=20October 2, 2025 at 9:37 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualco=
mm.com mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%2=
0%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
>=20
>=20>=20
>=20> On 10/2/25 6:51 AM, Paul Sajna wrote:
> >=20=20
>=20>=20=20
>=20>  October 1, 2025 at 9:14 AM, "Konrad Dybcio" <konrad.dybcio@oss.qua=
lcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%2=
2%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote
> >=20=20
>=20>=20=20
>=20>=20=20
>=20>  >=20
>=20>  > As the dt-checker points out, there is no such property
> >  >=20
>=20>  > If your wi-fi works regardless of that, you probably don't need
> >  > to set the one you intended to
> >  >=20
>=20>  > Konrad
> >  >=20
>=20>=20=20
>=20>  Perhaps this only exists in the postmarketos tree, but it definite=
ly exists, and doesn't work without it. I'll remove it for upstreaming fo=
r now but hopefully someone sorts that out. upstream.
> >=20=20
>=20>  So you didn't test the tree you sent? :/
> >=20=20
>=20>  fwiw
> >=20=20
>=20>  drivers/net/wireless/ath/ath10k/snoc.c:
> >  qcom,snoc-host-cap-8bit-quirk
> >=20=20
>=20>  Konrad
> >=20
>=20with qcom,snoc-host-cap-8bit-quirk I get=20
>=20```
> ath10k_snoc 18800000.wifi: msa info req rejected: 90
> ```
>=20
>=20without it I get=20
>=20```
> ath10k_snoc 18800000.wifi: host capability request rejected: 1
>=20
>=20```
>=20
>=20Please help me understand how I should proceed.
>

I guess I'll just voice my support in https://patchwork.kernel.org/projec=
t/ath10k/patch/1601058581-19461-1-git-send-email-amit.pundir@linaro.org/ =
for now.

