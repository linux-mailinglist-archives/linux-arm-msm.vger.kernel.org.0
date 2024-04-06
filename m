Return-Path: <linux-arm-msm+bounces-16629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AA089AA84
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Apr 2024 13:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE69F2827D2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Apr 2024 11:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A62928DB3;
	Sat,  6 Apr 2024 11:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="XJK4D9KT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch [185.70.40.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3E624219
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Apr 2024 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712402062; cv=none; b=de61rfUeerB4dCfnQ2wnkWLTUKgHpv/2XEeai3b7V5nVEC7op/iqwIHnXZlrKgaHVHic9kmxPMMXydKniSXU3hyOeafR2fZaOHSV66UVPxE781DkvXiZn8ECpFNN0X81bRk1QFiuSvB/GTnbe71Due7XyhOx7S0NCMAl5qbpp+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712402062; c=relaxed/simple;
	bh=3C7DZftyxSnn0rTfhltm6sKkocVJ5v0xMVJQDYSE0iw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VIzfV8oszb75dGoUjLcjA3EBSREblIkB30bxQJTInnKIZU1JepXhMEeyPJHfUT8GveNDwK7cA8lHH6goucqLO/JiZ+0+r7GUUGzyGrDEd8Nrc0FgRkEJdHQgz11k2yHfpEZgafaxoah159zZLlRrSWz8m1OTwkHdF1lCEUOULIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=XJK4D9KT; arc=none smtp.client-ip=185.70.40.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1712402057; x=1712661257;
	bh=Zv5ijIXBQXd7ATsnV92LCb66jrANS2OynezQJOtP7D4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XJK4D9KTfuKdqX7is1NQ3jGKP9gcT9/BtL0cOhHM5+oXH/xiavon3w5szOgWwNJHV
	 xjTWeneVsRLpX5KpE5X2eptC+vhndrNVzzvSqNnzbmvW0JB57JDYzDSPqYPhDQZdmj
	 Un4TIF7vBa/s/IQp0QAD4gQrnnguU57dLcsaInmROGI2tYjnk1vIpu1dfLKZNp1wn4
	 GuH7Zw+h8WHuU5VH9y0Hi7A1RIV2Rj/kLTAyQoicAQ+K9g29SVDAZPC7Oed44VaATw
	 LLvARdYGhnI22PvTei+upYAl3YVqHMzaUJI5sB19P25712oBbxrlRkURJ9k1vNpCvZ
	 vFB9S/FivrZCw==
Date: Sat, 06 Apr 2024 11:14:12 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 0/3] arm64: dts: qcom: msm8916-samsung-fortuna: Add accelerometer/magnetometer
Message-ID: <20240406111348.14358-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Some Grand Prime use a Bosch BMC150 accelerometer/magnetometer combo.
The chip provides two separate I2C devices for the accelerometer
and magnetometer that are already supported by the bmc150-accel
and bmc150-magn driver.
Some Grand Prime use a ST LSM303C accelerometer/magnetometer combo.
Core Prime LTE uses ST LIS2HH12 accelerometer.

Add support for them.
---
v2: fix accelerometer@1d: 'interrupt-names' does not match any of the regex=
es:
    'pinctrl-[0-9]+'


