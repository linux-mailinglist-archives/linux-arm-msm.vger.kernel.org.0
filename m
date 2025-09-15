Return-Path: <linux-arm-msm+bounces-73460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A806B56D5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A63A189B411
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9919A1A314D;
	Mon, 15 Sep 2025 00:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Nj9PSxR8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5BE19F40A;
	Mon, 15 Sep 2025 00:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757896102; cv=none; b=JwqLftBY3xW2LVKO6jG6qLAb336T4cQXLsmch5KYohUQL4xip+6PIoL9NImEaZngyQNJwXtOD9naxIuBQ6AvStRylESIoTkIbjotKWuIpXNwUfrZeYimvEJQwjgAEod7BAnC1cs91jf2QwA5LLv6CzgW5ZPHdMHHBLKCycyyNj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757896102; c=relaxed/simple;
	bh=5YTMd9J0z4N1BpB0c5Bzm6PRxqhIgnyBanN4JtW24T8=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=bRz5WYzePL6ZU2CsIUEaSaOQLj3G6/1Vq9gI8oYeZAJI08SGt8oRcClmL/1mZQsUhLfN9IJkrD77fpU1qabrGdGYudLhKo3L1okI2ih6n4NfK+yk8d67KZs3JJ6GiTzSAeKo/J9Vzy0xOphyJRPpdekStlOLzi8PF0BSW6rGfGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Nj9PSxR8; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1757896095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmxpugomka4k0gzMFtaAgykbR7wYWWtstaPj66IdJXY=;
	b=Nj9PSxR8+s2+CNj5mIeosxrKtGmOgkWLZWuOnvDOHUDuJ1SSpWQKLI/hTmoATCbwDYyjDP
	feLAv9v9YYp78F2nhVW9+YOO09x6xT3U9iZLXqzuWqhNz3jL5MrV6HK8i9ZJTQYtRoKH7r
	28t5KTXa9JYrCVgLDGa9wazeBBMLG3nKCXjrAXQe4oKqk+4vQeUhRaqMIhyE9ZPL9zkl57
	Xr16a6Pcdwj1aE8NgEBzciiy7975X857pUNL4UWWtCLvTW70cuAobKvE8zoO7aVSz/miM6
	ZMO5Ay/zozbm+uMEHckUC1RjHw8Qdn9WaDsvlGKJstfqr2sibgwXZgtdnlgS3A==
Date: Mon, 15 Sep 2025 00:28:12 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <b1c76081ea77fb7da59fcb6ff38ff6208f048d26@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH 01/11] arm64: dts: qcom: sdm845-lg-common: Add uarts and
 Bluetooth
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "David Heidelberg" <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <djduil6xb65qxmjp5qrxliskjii2nbijnd4w4rwsz4d7nmpo4f@crut3ib4hu6y>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
 <20250913-judyln-dts-v1-1-23b4b7790dce@postmarketos.org>
 <djduil6xb65qxmjp5qrxliskjii2nbijnd4w4rwsz4d7nmpo4f@crut3ib4hu6y>
X-Migadu-Flow: FLOW_OUT

>=20
>=20Why do you need a special NV file? Please include BT information into
> the commit message. Also, if qca_read_fw_board_id() returns a sensible
> information on this board, it would be better to fix btqca driver to
> apply board ID on WCN399x boards too.
>=20
>=20>=20
>=20> + */
> >  + firmware-name =3D "judyln/crnv21.bin";
> >  + };
> >  +};
> >=20=20
>=20>  --=20
>=20>  2.51.0
> >=20
>=20--=20
>=20With best wishes
> Dmitry
>=20

I'm=20not sure if it's necessary, but it seems to be standard practice fo=
r all the devices to have their own NV.
https://i.imgur.com/MD3o3k2.png

