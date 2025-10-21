Return-Path: <linux-arm-msm+bounces-78085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F1ABF47F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 05:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D9A043509B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 03:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA08C1EB5FD;
	Tue, 21 Oct 2025 03:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="JuKGwTFa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD941F16B;
	Tue, 21 Oct 2025 03:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761016920; cv=none; b=ghSncDx3JkIUk0Vwp0s3YQi7OHnnFhOYYrDPUD3RINBXjmXEfY/p1eOFmghmhFSVgvaslSRE4K09dZtx0PAElKk2QSXcm8IhYbPC6YC2yldtd9GEmPnZ5l3Mt7gaJ5oIeon/STLqCmDQAmzGTJZ5S8PW7KXncwshT7IXZRerxKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761016920; c=relaxed/simple;
	bh=kpy3W3KmYTz6pOIyAUYRAp5lOnGa6xTDAN096KTZUYQ=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=VilvAo0XaWMdoXhHbCkUCnvLVpFjIp+9MBVhUcoxPzkENL2dYyhXM529MoRwRtpM3MI2cC0wp8iacQLDswUMjb2mMA2jHZx+iD3kLEiOd5ta5xTpRewp32Qr0rPVFYOMTxU2GEfiChr0Vs5cJDrYUPtnjxAEiQjirLFVCcoDvKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=JuKGwTFa; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1761016916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kpy3W3KmYTz6pOIyAUYRAp5lOnGa6xTDAN096KTZUYQ=;
	b=JuKGwTFaYnULDG+s+GOm1ktKMpfexM4vQ6rV9MKIC2NVmj0pJjLOG6FDlPJ+R4dQl9P+86
	OTzOzVBp/DgYeIGSrPhU3zHkepHsf17SvYfdSnKyFGroup2B2AWYglqDkooPkAW7zkKNv7
	7IqjZ9s7eNqbnZHWnqvDtv7lrR1f2ReHoSo0lswGZqlxeR8FQaRMLGGiWMjfdjFyTMa1oj
	OueVrE2eRRiUrDBsAGS1OnbpACF2Lxjo9J7h9bz/gKnDTbhu8RhgpdZGpok9AvqXO7Bo9Q
	z2LwsZsbLnMG16VAMIs/cNTr8+Bdr0KsTe/cTLvncNI8qhF4FLfNDvuI44wjaA==
Date: Tue, 21 Oct 2025 03:21:54 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <07611bad51014c3699966c0deb5edd7ce65c21aa@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Define guard pages within the
 rmtfs region
To: david@ixit.cz, "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof 
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, "David 
 Heidelberg" <david@ixit.cz>
In-Reply-To: <789a2ffa637842215084a39eeee94993a315ccbe@postmarketos.org>
References: <20251020-sdm845-use-guard-pages-v1-1-64d714f8bd73@ixit.cz>
 <789a2ffa637842215084a39eeee94993a315ccbe@postmarketos.org>
X-Migadu-Flow: FLOW_OUT

October 21, 2025 at 2:49 AM, "Paul Sajna" <sajattack@postmarketos.org mai=
lto:sajattack@postmarketos.org?to=3D%22Paul%20Sajna%22%20%3Csajattack%40p=
ostmarketos.org%3E > wrote:
> I tried something similar before and didn't have much luck with it. I'l=
l test your patch when I have time.

Your version works as far as I can tell.=20
ModemManager=20always reports sim-missing on judyln, so I can't fully tes=
t it, but no crashes and qrtr-lookup shows rmtfs is working.

Tested-By: Paul Sajna <sajattack@postmarketos.org>

