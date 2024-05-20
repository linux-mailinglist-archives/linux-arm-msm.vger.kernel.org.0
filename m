Return-Path: <linux-arm-msm+bounces-20075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 890E38C9FAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 17:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 142471F21A55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 15:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99502137750;
	Mon, 20 May 2024 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="PA7k3srR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0E755782
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716219013; cv=none; b=QPAYlJW8rPsHEOj4OFiy5TRw9LsgOVfru0C+Pc5aZ9gT+QnMjxJdSI/sxgyart0BXaFARDLzdhSDdip6Ir1D7gx72UleYm+dVTFir9tMG4YU7IA+/PpZxC4nXjdlWjmM4BmE2WSmW3YDFRv/Zc/A0r9nA4lT7p3a668f1RujeHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716219013; c=relaxed/simple;
	bh=Vu0vznjdWxs66nSkbS9cacJp9FhincaEtP6y7P6cQd8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ENhSuGUxba4Is9iHmjw3QEzAH6sPDQyTeWJpo4ZkMUggp9mTYjj/p4LzjCHlXzh6laoyPadqBg4qCiREU4DTWmMo7fTLokZq5iL263bJpsDWpwHYIfSaqT3T+VCEmB/2Eq3fD8Pp9bMwuQ7wYtPrE5wzB4LAJI+aTf6iaccMZWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=PA7k3srR; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Envelope-To: robh@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1716219009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=flQbjfqnjMGGLkGPgtwubHoIaR8WTP9vdHbSmZ1m2Bs=;
	b=PA7k3srRdv7Ot87pJeffHhgamxS+LVsiGZORzvmiaqIOHXU58Mrh0X7+S8ExpFajXO7xoQ
	S0TSAf62d7sympTeOzrXm1wJDxG4v0RSs2T0zwqpqwxtaGogGKGxrENG2JSFwnWIoymxHs
	NIeskTOeAOIc1Ky5UScKzsw18aaKCBafT149EZETfQZRyoLWfS3eD6vDEql0bRJzndJWvy
	CvgkgLg/XH907zkV7t4mcWYxbxdWD7H5RqNhztJBU/RFCZI++MYYfyVjohElabpAr2yP0V
	gMSWHwYud8WuIcyqlDGOoQdklnR8FdM6vybK6AF61bgP/6KM0ZQgLdacOiD3KQ==
X-Envelope-To: amartinz@shiftphones.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: luca.weiss@fairphone.com
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: andersson@kernel.org
X-Envelope-To: krzysztof.kozlowski@linaro.org
X-Envelope-To: caleb@postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Subject: [PATCH v2 0/2] qcom: initial support for the SHIFTphone 8
Date: Mon, 20 May 2024 17:29:40 +0200
Message-Id: <20240520-otter-bringup-v2-0-d717d1dab6b8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGRsS2YC/13MQQ7CIBCF4as0sxZDwQp25T1MF0gpncRAM1Sia
 bi72MSNy/8l79sgOUKXoG82IJcxYQw1xKEBO5vgHcOxNgguTrzjisV1dcTuhME/Fya1tpM0Rln
 TQf0s5CZ87d5tqD1jWiO9dz633/Un6T8pt4wzq7ka5XiR7XS+PjAYisdIHoZSygfTReqeqwAAA
 A==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Martinz <amartinz@shiftphones.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Caleb Connolly <caleb@postmarketos.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=Vu0vznjdWxs66nSkbS9cacJp9FhincaEtP6y7P6cQd8=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmS2yAGFfxWjWLHLcjMiOszvA68CXROR7bXORIn
 5oNNuwg1aqJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZktsgAAKCRAFgzErGV9k
 tmycD/9W6oyUOT4pwY+xWiUl96huz+0T0LDSk+g5l8Hg0Y5H29wcVNc6Gp7sk6R6TKaP5+WdNrc
 p9Y8Hz2zQHT4yFpecDQoCOn50/eXTa+zKUdueDC7VGinxTpypjslooNIKgC4usopO4UQZH9iYW0
 IybixkH3rtVgNAEbBaByUMe9NoXiELDHNZayfhdiryELdcS/qziU4zygfQeWLsCsMpsFVwSbjzE
 oqBMwTd28YglMiM8+dQpAhkMXnIdan3CMsTwJ5MuzlNpWttzdhJIRFrHwheNU6T6PbOgZdiT7j1
 0oRbN5yLZ1ibjZ0PixAi9ymRcAqiHseRhyd62HbLKU+tSxBMxCGMeMxIWD8OP+vWCFdYq1y0sxw
 0o5fXs17hL0MIqvNRN5SxQdMhBUka3nTiY3ACLuLnBVFkfEDuw4066eTcPOJmVc/5WgUs1KiMDC
 HvcN6R1ftuJg8PuLSj9TWWMfevvxDZQXH6GMs0nZe0aLayKJckBRVgtytAFHp/Jw8cVoJab9xk8
 w1q2kQ9OSkLDZEG/76D5tML/+/ZRye20S1MOv1Nm1k/gAaDpN10THuQQWlmk8obAzCdlYFr1w2c
 f5ZDpz7KhcSaa2OCNG9dN80CEoW9IF+e2SQ3owiYwxcowr63aPWrAg3AHgPWDcikI4Yh918zDeG
 u3/ODIEcVOFRStQ==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT

The SHIFTphone 8 is an upcoming QCM6490 smartphone, it has the following
features:

* 12GB of RAM, 512GB UFS storage
* 1080p display.
* Hardware kill switches for cameras and microphones
* UART access via type-c SBU pins (enabled by an internal switch)

Initial support includes:

* Framebuffer display
* UFS and sdcard storage
* Battery monitoring and USB role switching via pmic glink
* Bluetooth
* Thermals

Wifi works but requires some commits to be reverted to prevent a
firmware crash.

The serial port on the device can be accessed via the usb-cereal
adapter, it must first be enabled by flipping the switch under the
display. Additional info can be found on the postmarketOS wiki page.

https://wiki.postmarketos.org/wiki/SHIFT_SHIFTphone_8_(shift-otter)

---
Changes in v2:
- Fix authorship
- Address Luca's feedback
- Link to v1: https://lore.kernel.org/r/20240508-otter-bringup-v1-0-c807d3d931f6@linaro.org

---
Caleb Connolly (2):
      dt-bindings: arm: qcom: Add QCM6490 SHIFTphone 8
      arm64: dts: qcom: add QCM6490 SHIFTphone 8

 Documentation/devicetree/bindings/arm/qcom.yaml  |   1 +
 arch/arm64/boot/dts/qcom/Makefile                |   1 +
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 923 +++++++++++++++++++++++
 3 files changed, 925 insertions(+)
---
change-id: 20240507-otter-bringup-388cf3aa7ca5
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6

// Caleb (they/them)


