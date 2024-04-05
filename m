Return-Path: <linux-arm-msm+bounces-16520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F09899C61
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 14:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F258E1C208FE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 12:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAD416C849;
	Fri,  5 Apr 2024 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="vz3s3Gjl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DF716C6B7
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712318909; cv=none; b=LHyGxcBN4In6t6gRrkLQtItm/S3vBT6g4lIOOXaO+q53+4Su9rrBaxtr+TVB/JSuqOWa09EmmR1Zri8V68GlAKY71s3fED78T+VHSm5STXTXxyTuh6/dVllbJmvp2dSM8XUlooxqQwF2EsIvx3iBE9iQiQBW+fjS/fRh1XMED5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712318909; c=relaxed/simple;
	bh=2NWgb6rcnPGIUDm043jKPEbY0VbfO1iygjvicmP6pBQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Y6M6qQE9zVpi8c1g/rcK3HPocygHauHobaUmzWfu+cr4fQgbgi0ip3z45S9eKDhjvd2BezbygdT4VVhFJXrz8oW9UxX4kJd6j/CDBnGeGyjiaJflh/4GWsgBkyEjd9FyO6reVuVOSECHdzRm7Zclin1oJm6mt2UiFIvKIs2rEKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=vz3s3Gjl; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1712318904; x=1712578104;
	bh=2NWgb6rcnPGIUDm043jKPEbY0VbfO1iygjvicmP6pBQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=vz3s3GjlOaaQldZ8FntuoHkVCX5NEFs4y8qUVV+qeqHuGI867mH2BxPzEXJAMI9TA
	 3cre88N0Qu13re72MomHFzaffaRTOzEjCRz8e5+Mehnm/kuotIjD0L0/XxG5W8m8El
	 X0jLwjpxFzr8Hxnu5CA7DUeOkw5chZ5GZ+/eyDNETfjr0eNl7ELkMiIdYUdh7iDIGd
	 cqsvmUb4VGyaZPNyhfUA9kieHEz4xwLZVZVYU1IHRHEy4jXooJg1dNuZqL79j4T2j0
	 db7DHclHD6QcAtLVbd+e9EeSKU1raYY15d7LGFaBlmkXwbqlUT1u8nYIc/zyP5dWV1
	 Ci7Mfs4dx8baQ==
Date: Fri, 05 Apr 2024 12:08:19 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 0/3] arm64: dts: qcom: msm8916-samsung-fortuna: Add accelerometer/magnetometer
Message-ID: <20240405120803.20754-1-raymondhackley@protonmail.com>
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


