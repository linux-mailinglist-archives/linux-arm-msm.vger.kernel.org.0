Return-Path: <linux-arm-msm+bounces-72632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1838B49899
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 20:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D00B57A424F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 18:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF9731CA42;
	Mon,  8 Sep 2025 18:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="JJ7/j/sx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C608F31C58B;
	Mon,  8 Sep 2025 18:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757357194; cv=none; b=drW6kbzhk9xnszLSWXnOOcu62v1n1iyOq0JbalWVjJWHkoQCfVVrk3Wr86Xl1cHyY5cxgNNxKJtFiOw923KGswwNUyDSlpyMOIm3v7gQs6zShLjJeZc0QUxga0c0tcpYfc3U/I+q6QH2jqIr7pdat1ZMuE/Hjls/pg00F6hbJOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757357194; c=relaxed/simple;
	bh=P0Faj80sRK7sTe75N6OS0zqQYV5haDySqE9JOh5yoWY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kxLwFOlrXhlPbHJVX7+QhGV5HMQ0rtXRc8prgDlAlO3vhJnt8gQpH+N5pkMrdKJwHApNBLyp7WpjRNGJSB8uPwKbtj4LJCudVjtpHHK3HzfMomkLmJ6QQJD88P0i9DDJwKe/XrUMIbNEvs1+TXtjXXPUUCw8gpCfO/gfKVJu/jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=JJ7/j/sx; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757357187; x=1757616387;
	bh=meaZ0rdIKuJL9vmUg7Nj6Px+Q4a3GEkns2WLKMdlXkw=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JJ7/j/sxXUHAmp+QwwEstrtxo1+h3Tx7GOAAL+RQ6v+AxjCII32D0rar3zR1KgR4p
	 yD67B84/ZYbBuq17sciwOI3fXX/pPdvuKcIvTiqT/LYBwuqIiK3RxE8xQYrKtN1Z1Z
	 QN6kZjxpXvo2TTWpcaqlaCAixIkoNSSdpPAkvDWWN+Pj5iOiLwAZzTixH1/USXwb/W
	 i1m3PGSnT+aVFiQF33Jhc0cRg5Y+V9nvUc2OZ1efQL6FMHTZpcGiavgxsK7gydngeR
	 coTp0e0HOGJ5fXDXiBxoYRW8a7pD7PqTZN/CMq8v/dP/LxFiqL6LRAb+nhqytMzRBk
	 aqDYSNKfOngPA==
X-Pm-Submission-Id: 4cLGBT5n8Cz1DDL6
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Subject: [PATCH 0/3] arm64: dts: qcom: x1-asus-zenbook-a14: LCD, WiFi for
 X1E support
Date: Mon, 08 Sep 2025 20:45:44 +0200
Message-Id: <20250908-zenbook-improvements-v1-0-43ecbbf39c60@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFgkv2gC/x3MQQqAIBBA0avErBPUiqyrRIusqYZQQ0Oi8O5Jy
 7f4/4WAnjBAX7zgMVIgZzNEWcC8T3ZDRks2SC4b3nHFHrTauYOROb2LaNBegQkl6lZXSlZKQ05
 Pjyvd/3YYU/oAP2sllmYAAAA=
X-Change-ID: 20250908-zenbook-improvements-18147b38238b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Aleksandrs Vinarskis <alex@vinarskis.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=P0Faj80sRK7sTe75N6OS0zqQYV5haDySqE9JOh5yoWY=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBn7VWpEVHgeim9tOjGvZGFGqCDfZOn7O7ec+7vIJrlVb
 cH9qzP2dJSyMIhxMciKKbJ0//ma1rVo7lqG6xrfYOawMoEMYeDiFICJ7JVm+O9XwhP/Omu+wMyL
 Ya1zVHbIqDin8j02enX75sXXdaFrbgkw/I9vtTy39WTKxYopv8L/+kzb65lw939DuvXyzJ87VFa
 XpDECAA==
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

Round of improvements for Asus Zenbook A14, two changes:
1. Support LCD option on X1 (UX3407QA) variant. Until now, 'edp-panel'
   was used for both X1/X1E models, for both OLED panels. The lower end
   model also comes with IPS, which unfortunately needs PWM brightness
   controls. Follow example of Lenovo t14s - create a dedicated DT with
   dedicated 'compatible'. To maintain backward compatibility, do not
   rename current devicetree nor the 'model'.

   As this results in 3 DTs for 3 variants of the laptop, change
   OLED variants from 'edp-panel' to respective drivers (it appears both
   panels happily work both in old and new setup). Compatible for the
   panels were added to linux-next some weeks ago.

2. Add WiFi nodes for X1E (UX3407RA) variant. Almost identical to
   UX3407QA but uses ath12k instead of ath11k. Was not addded during
   initial bring-up due to lack of hardware to verify WiFi's operation.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
Aleksandrs Vinarskis (3):
      dt-bindings: arm: qcom: Add Asus Zenbook A14 UX3407QA LCD/OLED variants
      arm64: dts: qcom: Rework X1-based Asus Zenbook A14's displays
      arm64: dts: qcom: x1e80100-asus-zenbook-a14: Enable WiFi, Bluetooth

 Documentation/devicetree/bindings/arm/qcom.yaml    |   8 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |   6 +-
 .../boot/dts/qcom/x1e80100-asus-zenbook-a14.dts    | 102 +++++++++++++++
 .../dts/qcom/x1p42100-asus-zenbook-a14-lcd.dts     |  62 +++++++++
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dts    | 133 +------------------
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   | 141 +++++++++++++++++++++
 7 files changed, 322 insertions(+), 132 deletions(-)
---
base-commit: 3e8e5822146bc396d2a7e5fbb7be13271665522a
change-id: 20250908-zenbook-improvements-18147b38238b

Best regards,
-- 
Aleksandrs Vinarskis <alex@vinarskis.com>


