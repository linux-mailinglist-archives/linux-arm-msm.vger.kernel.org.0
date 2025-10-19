Return-Path: <linux-arm-msm+bounces-77932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F21C4BEEA00
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 18:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C70A53497AA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 16:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635402E8B93;
	Sun, 19 Oct 2025 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="LTF6yo0y";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="IdtVmqoC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB4F2ECE85;
	Sun, 19 Oct 2025 16:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760891244; cv=none; b=m9Lt1ur7hsjYc/QWECJkWs5Gdurmh0laZm9+oTX6cxASIX8HGFjR4adBhz0WgPbGhYU0azNd7/sFpN3cMITiS6PiMr6JC6LnHqJ+bwpBEKrqf6OhLVhH7qb0QST7KSe4okebMwlS9l14j0Y/PGNtk3weUDSp+R2ejGEuu7uTsw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760891244; c=relaxed/simple;
	bh=BQ9IFJKbESKzjwKtQB3OgNBpaLL0lRHeebGjF1hqPEM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N6fZAWLt957KwZF91TDxm+mFei5NEbuGIyMzGJ49S9e1qlokfpQ5+w0fCKuo186f9qflGoIUTe5HPeRBDyZQGeOt8BNsQD4OlnJarWQgCArvLVWi8jTPRwiwAXQwORAgcZu/KM/yy8aHOOQX77Uce1SUb8C2LkSxFBBRqgO+i8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=LTF6yo0y; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=IdtVmqoC; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1760891234; bh=w0QWjLgqUUCHSyCq5XlwrWc
	zRcUMNVXdkhnMa3UOQ50=; b=LTF6yo0yn80JyuiLERwcVqAqsIY4D0KHmLCXnfDEdb33ri6otp
	+y9yIF14F4T5PweTpUnF30Vf8dkFqFXWPDa+DgSvh0X62YQa5tGgEhdBQoN5OtAY02O3PpHT3DJ
	gJ5cFXJbmN6ddPGGbMrpGrNX1DsEk1ymosPfy+nc1++y5xSHOgBl1ODpHGgckJTyPtu37ZCCSTx
	QKKuZ2NZWcHLissdWMWtOumyreDPJRq0CpzHO1kOwFc0UA2P9LLEktplhMLMTl79qQnHHh70T0X
	AeXZHAs8tAyNbnaKdZzJY/EIgXBHcv/zxoyQ6u3KLeuOgverK7sz3E/x7FNFuwjOVrg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1760891234; bh=w0QWjLgqUUCHSyCq5XlwrWc
	zRcUMNVXdkhnMa3UOQ50=; b=IdtVmqoCo398ORp5qLy7n8M7MuHSmxdUTQyBAbBHZUN0RCWzs0
	DDvO4lJ3K/jaRP/jJ3YlBqliuhe6NAN+S1Aw==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH 0/2] arm64: dts: qcom: Add support for SDM660 CDSP and ADSP
 FastRPC
Date: Sun, 19 Oct 2025 19:27:05 +0300
Message-Id: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-0-9ab5f2865a6e@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkR9WgC/2WNyQrCMBRFfyVkbSBTM/2KdJFRs+hgUotQ+u+mV
 nDh5sK5vHfuBmssOVZowAZLXHPN09iAXAD0dzveIsqhMaSYdgQTjR5+GlANgxAY+VBnZI8IS0U
 qWeeExIypCNv/XGLKr4/72p9c4uPZJpaz/C0Y8PWrf3+nbeiEEtISZVZ6mJ2tEbW7IS8GaJaYs
 44zggNPSTJMpfc8KUkkp4oHrqW0PsF+39/EGOOm7wAAAA==
X-Change-ID: 20251019-qcom-sdm660-cdsp-adsp-dts-8fabb670338e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760891233; l=985;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=BQ9IFJKbESKzjwKtQB3OgNBpaLL0lRHeebGjF1hqPEM=;
 b=cZCTb/Ux8XMQy/3l3CkoSZjY0xE2rcvYrNmHKcb7BS9PMMqMjpMIcPtl641wunLMx3DCutuHA
 at3rk7TVfDrC8cjIruNYaYCHCcxd18a8X8cFXYWpijSBjBDqohjq9qS
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

This series adds support for SDM660 CDSP remoteproc and also adds
FastRPC support for ADSP.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Nickolay Goppen (2):
      arm64: dts: qcom: sdm630/660: Add CDSP-related nodes
      arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP

 arch/arm64/boot/dts/qcom/sdm630.dtsi |  40 ++++++++-
 arch/arm64/boot/dts/qcom/sdm636.dtsi |  14 ++++
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 152 +++++++++++++++++++++++++++++++++++
 3 files changed, 205 insertions(+), 1 deletion(-)
---
base-commit: 93f3bab4310d4ff73027cc4f87174284d4977acf
change-id: 20251019-qcom-sdm660-cdsp-adsp-dts-8fabb670338e
prerequisite-change-id: 20251018-qcom-sdm660-cdsp-59ad56867a18:v2
prerequisite-patch-id: a8c9703aec1663b8226556ba1770bd6c5b4ef060
prerequisite-patch-id: 5a49b179c69e045e8003f28e8ef0e6e003c0064a
prerequisite-patch-id: dd158e1214a7e73ac0a8f1da9d3face61ad7d5bd

Best regards,
-- 
Nickolay Goppen <setotau@mainlining.org>


