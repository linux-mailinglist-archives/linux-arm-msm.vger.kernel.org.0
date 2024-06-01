Return-Path: <linux-arm-msm+bounces-21375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4857D8D6F91
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2024 13:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46230B221AF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2024 11:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2171B2F873;
	Sat,  1 Jun 2024 11:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="mDHXjVaA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478D6365;
	Sat,  1 Jun 2024 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717242835; cv=none; b=grWb4QwBKnPAh8nKt9uEDNpCPuuuKKEf2YycI4dp5+Qp61rqjH/E+1TQN6UmKAMgUs9uxKgB+tmZwqwD28DYilmwQg6YytzN7N0ro8QwJhCtd+bbDPmrHXDbylsX6APimTtCRSSwSQ4ELnfgcmEQfw8Z6tcXpbjR/aHf6K7izqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717242835; c=relaxed/simple;
	bh=PdnLYCmmE5nov31Q1GMGmkrrW4cbOZEfyTbCiV4zdV8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iFU8iUA4av2P9oQNJtkaevKgJ0u85J5CqPocRg6ecihiqKX8VAeGNpwYmPHv6GEMv50BRa4ub0mywc1qMt/vu1iJdBvRNg2zNdpiHPwq8EORSCuMTu3UVqmW8RkeEZEG21aK7h0Q+bq5AMVXwSoXQB+RVlWUTYsrk3Vd5byVUGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=mDHXjVaA; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1717242825; x=1717502025;
	bh=PdnLYCmmE5nov31Q1GMGmkrrW4cbOZEfyTbCiV4zdV8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mDHXjVaA2vCZ7XgNqjDI05y6whSFzmchbSfkGIlbvwKMf9i09peywsuUnAFspYvKr
	 buqfcKII8hZXr1LjNvSGPth0TT5yBmwtk4ElN/681tSlC1h2offLFVWZJgOByfjqax
	 wxishZNth/tDicTiW46qb5TycNnlilz9jhVzrxSqJp8maeSdfiFsOrJQPvEe61ZLrR
	 vB2F/pMp22D6ci/mCwr9qo0BEHR01fOv1FzkaWqyh6LQA3KF/CaobBvftHvvwXH9FD
	 BChzEcLH3Ox04yK9cdj8M6uIc1RyOmwtLawiZg71YV9EVtOsiVJpZBfU6JVX4GfYPS
	 0AwjbjNApc01g==
Date: Sat, 01 Jun 2024 11:53:38 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Siddharth Manthan <siddharth.manthan@gmail.com>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 0/3] arm64: dts: qcom: msm8916-samsung-fortuna: Add msm8916-samsung-fortuna/rossa: Add S3FWRN5 NFC and RT5033 PMIC/charger
Message-ID: <20240601115321.25314-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 6d3c47b5f0e095a6b2829bbced80f601634dce0f
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Some variants of Samsung Galaxy Core Prime LTE / Grand Prime LTE have
a Samsung S3FWRN5 NFC chip that works quite well with the s3fwrn5 driver
in the Linux NFC subsystem.

All of Samsung Galaxy Core Prime LTE/ Grand Prime have Richtek RT5033 PMIC
and charger.

Add support for them.


