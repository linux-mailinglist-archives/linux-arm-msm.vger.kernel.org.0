Return-Path: <linux-arm-msm+bounces-24525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A5491AFB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 21:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B897B2531F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 19:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B71F446D1;
	Thu, 27 Jun 2024 19:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Ir1xUpDt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10EE2E62D
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 19:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719516653; cv=none; b=pG/1MCuCwsdk85WgC+lgFkzOunIfcbTBMIb3HFihTs2AfI3oooWKXO6tVQaAiLbG6bGpErQ79e5akMn4X3jxRUmjoQxuqx6KtE9Bz4Ksp3RURgLNBP2WF5ly8AL0fIIl9J9berls+X8EZbjtCm1lPtI3RapeHHNYfYsqjAMQf6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719516653; c=relaxed/simple;
	bh=jdGZZuUjU6IKdN0QMbYKEeaNSzN3j5RR+CNHFENctXg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XCA9kr5Cf1qMSdzsdbUOurQvCZ+vYpYetTrzj7y8DYsJtyaJMa2PLXfqUOlTrUNRtxdxnQBOm1DPEvnBIGhtzsw40UmTADL//wst9JFJq2tXZGdaI5korUCK+oqPPABZ7N887QNEA+KXHxZMbGayfijIkesQWbm0RQellAwPWsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Ir1xUpDt; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1719516636; x=1719775836;
	bh=RU8R7UnTgn6eP1AZKbglvITXdxEQ2SMjUq+6xyiXaQs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Ir1xUpDtQL7CxvRvCG1Owj2g79oEAUR18FcZ6bqaPgB2n7M8VxgekDU2xl/mmkAy5
	 44aaauqztYdNqQXJ357N0sPd+AomUWvljKmKhJ60nmlAyly4cSjK4AH1DUy91QAcrC
	 9SOdGYpkTdilQMMZ5hiphJg7HtqxtZx7czy3Db0ZNbCxx5icUv/AYCLI3xfFSTn1xV
	 rp97KmWW9fE8vGpoap6pY4vX3QWXSZKECWqEeuK4xLjukQAWPNTS7bxrhuQpoo4YPt
	 plGjcNZBYerNsYjr9yw4SSlGxZvpNQpMaQAOQBCqCbv8Ww9H6pQ/r19oTfxLR9lqQn
	 TCBUb++pzOx7A==
Date: Thu, 27 Jun 2024 19:30:30 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 0/2] ARM: dts: qcom-msm8226-samsung-ms013g: Add initial device tree
Message-ID: <20240627193013.1800-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: bb4aba257863566582ee4be550506691c60cfa84
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Samsung Galaxy Grand 2 is a phone based on MSM8226. It's similar to the
other Samsung devices based on MSM8226 with only a few minor differences.

The device trees contain initial support with:
 - GPIO keys
 - Regulator haptic
 - SDHCI (internal and external storage)
 - UART (on USB connector via the TI TSU6721 MUIC)
 - Regulators
 - Touchscreen
 - Accelerometer

---
v2: Adjust l3, l15, l22 and l27 regulator voltages. Sort nodes.
    Set regulator-allow-set-load for vqmmc supplies.



