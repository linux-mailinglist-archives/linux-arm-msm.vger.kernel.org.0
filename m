Return-Path: <linux-arm-msm+bounces-89434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F50ED3356D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 32E923016222
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 15:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66D633E346;
	Fri, 16 Jan 2026 15:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="AysNId5Q";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="R1ErBm+N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92FD336ECC;
	Fri, 16 Jan 2026 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578921; cv=none; b=RhDWwPvOkZqI0LimyVlbUEmqCgLdehfX2l4h3A2QG0HLfqtg0zfyUZX4eOqy68G/wCgYqa3CIA6wgkXusd54ZKLHWxnKLluw1xdNU3Hi8sqmsqRvAGQ7SJfHqrnvom/4N1vbN36NWZeM2a4pZh8Z+Tsthw4KjlPsOJos+NTThPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578921; c=relaxed/simple;
	bh=0a7Ln2IQ+ULHMcFlg3pO/pu1NhhH2XNCYS7MzyzCSMU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=faM3I/yi1T4XoFl6DUrVTsqZ3YNNffu5341TIDGR6x8j/I2TqnXDFtTrmUUJX8YLpPg89pz0Js8O4PFqiMyOau/fsjdm/FoFLOVuldHU9iNK9jdBowVICF+aqcfQSRpVS45i6Hpr1mi2H9CGc9oX/6Z/l2mGvzRF15jgIgCNTw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=AysNId5Q; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=R1ErBm+N; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1768578901; bh=N9G4ZZoCgxEpfbozwnENOe3
	fyIB/koZiAJncSp/Rc6A=; b=AysNId5QDNvmT1YvwE+x+8EP1OEw5n5GDzMeNyvxyYRe+b3dXb
	SFlCPTv24LzVBG8bldXmK6xwkK5PR/ifUWBEMNEqPh/+jmphEBeDI+54RWXuqKiUQtpyzRAOWKl
	1UkO1yP5964UXUpLN9nCBOmqd29Nq5UdE9y7x+S33NoK3E/mxf4VtBrNtHowZUMgqwYhNKP6Zbd
	FCQzlfn7LIoDVLnHputahpG4phV2aMiBCHcsmKE3VuELkidRuP0hxpT+TZy23DX2HDjrUubTFLn
	oGyJPDMAQ+egdkmmra3ehBaR5PEXBYoQwos2AKQKt034zYuOSIKbBnKlYiu1lEgVv9Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1768578901; bh=N9G4ZZoCgxEpfbozwnENOe3
	fyIB/koZiAJncSp/Rc6A=; b=R1ErBm+Nox4z8T+BSE6w0jcDIMyr2KkY7yjdFb5qJsR7dRzUZO
	D5Arc19cLJC1dDxNDR3cLG3D02YHcEBIg1Cw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v2 0/7] Initial Redmi Note 8T support and more
Date: Fri, 16 Jan 2026 16:54:42 +0100
Message-Id: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Oy26DMBBFfwV5XSPb9SsoqvIfVRYGxmQUwI1NS
 EKUf68h6qabke6V5tzzJAkiQiJV8SQRZkwYxhzER0Gakxs7oNjmTAQTmnHO6R1dGJDesO/DjUp
 plRKeCaMFyT8/ETzeN973MecTpinEx4af+dr+kcQ/0swpoxakNNrujP60h8Hh2OOIY1eG2JHj6
 82PcLlmzek9QgZIyW2aVbHPbMWF2HEpLNOlkJxZSwU9x+WRlin48hyWvJbOeAgplZer65swDGU
 +X6t/7RLQtcGpKrzkpjbeNzV40xpds9ZazRS3XrHWAQMDClqX1V6/xgh6BkkBAAA=
X-Change-ID: 20260111-xiaomi-willow-448552f02762
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gabriel Gonzales <semfault@disroot.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768578900; l=2335;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=0a7Ln2IQ+ULHMcFlg3pO/pu1NhhH2XNCYS7MzyzCSMU=;
 b=5PLRU611elBsIRKYDhIELXU9upt7+sSL4vzm3BngkYsDv/SmYD3LuTr4kLOo276zVtoovizM7
 rYweg/ImwBqBB9N1IaT0TVaXwhIU2qHwgg3rqY1ze0wZiTghR/GuglF
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Redmi Note 8 and 8T are sibling devices the only difference
is Redmi Note 8T have NFC.
This patch series is commonizing Redmi Note 8 devicetree
for a base for both devices.

The patch series also contains some fixes for Redmi Note 8:
- Fix reserved memory ranges, they were wrongly defined.
- Remove board-id, board-id is not neccessary for the bootloader.
- Fix reserved-gpio-ranges the reserved ranges was wrongly
defined what caused the device crash on the boot.
- Remove unnecessary usb-extcon, gpio102 is related to DisplayPort
what is not supported by these devices.
- Use memory-region property for framebuffer.

Depends on:
[1] https://lore.kernel.org/all/20251229142806.241088-2-krzysztof.kozlowski@oss.qualcomm.com/

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- Fix copyright in sm6125-xiaomi-ginkgo.dts as requested.
- Use memory-region property for the framebuffer.
- Add comment about the NFC.
- Remove msm-id change in favor of [1].
- Link to v1: https://lore.kernel.org/r/20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org

---
Barnabás Czémán (7):
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove board-id
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct reserved memory ranges
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Set memory-region for framebuffer
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved gpio ranges
      dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8T
      arm64: dts: qcom: Add Redmi Note 8T

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +-
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 301 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  | 285 +------------------
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts  |  15 +
 5 files changed, 320 insertions(+), 285 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260111-xiaomi-willow-448552f02762
prerequisite-message-id: <20251229142806.241088-2-krzysztof.kozlowski@oss.qualcomm.com>
prerequisite-patch-id: 1bc49c0e2bec1a47667df776e1ab265b0699ea35

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


