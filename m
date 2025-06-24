Return-Path: <linux-arm-msm+bounces-62116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 432E3AE57DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 01:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8D90163EF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 23:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFDE223335;
	Mon, 23 Jun 2025 23:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vM6R90f6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C03D227EB9;
	Mon, 23 Jun 2025 23:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750720817; cv=none; b=duQ92i/BkW7SQ4TMMalPhJwB8hlrL8KJDFrS5wc9KI6YWuLdP3e6jwFtDutPg/UWkm1chgQ4N9GhDZlworUrGLLGnBPYws5B55I0AxqNC5jVWgpp0gr276sJXUAJWXHlWzM3B26M3LhnsMwu9ZGjzwswapaWXP0+AfIBMBVcoME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750720817; c=relaxed/simple;
	bh=foJ2K/ZpjDvVVoJeKpVYHYwLURY6EEUJZt1ly5Hact8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I3Cw9SUPCxcxYK7dEh6On1si3xirnI5JDfp7+4CFvP2XP9T36iDAPESu6JeNyORj8oXg13Nh62fmKrb1l9yA15dbvpxjOkkUUDILivKfKUcCp8zMLQlHa04VGLNPdNRMAoORteUYy7UkYLxflFG4Gzk2qmcg/Ew0HPag0HjRi8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vM6R90f6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34E9AC4CEEA;
	Mon, 23 Jun 2025 23:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750720817;
	bh=foJ2K/ZpjDvVVoJeKpVYHYwLURY6EEUJZt1ly5Hact8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=vM6R90f6jYI2o7AQShy2ejHEZhD0woW+xrqbePt5qfFAXMF2iiQiMWqK4NLt734QV
	 1IW2jk+UBQ6zZfimHFE9N904yTtlU7u4cLp5X19tdAPotx33M+LSBoSuO+jZoHKzf8
	 ji7J5mhMODNmOfB0GFrWSi3Aee2uD6yyXKkC7mFt+cLx/NVufG8kywZ6tQQ/STOb0P
	 rJDVwSJbIMmam9lEjrGEdS6JITGuPlsRvC3TfW0gFTfhf9lMLp/KGlbE6dxNyMgj31
	 wtaXXcN9FlrMPfRNG7CFml6LAZTXEEAVykeG/wV1xfYuZPctwTKyAzvm1TdqAaMnTK
	 Tmy9Dp/OXivpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B79C77B7F;
	Mon, 23 Jun 2025 23:20:17 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Subject: [PATCH v2 0/3] Add initial device tree for Billion Capture+
Date: Tue, 24 Jun 2025 03:20:04 +0200
Message-Id: <20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAET9WWgC/42NQQqDMBBFryKz7pQYMA1d9R7FRYyTOqCJTIK0i
 Hdv6gm6fB/e+ztkEqYM92YHoY0zp1hBXxrwk4svQh4rg1a6U0YrFF7SgBy5sJtxrIqnIkQ4Omt
 cN4Tg7QBVX4UCv8/0s688cS5JPufT1v7WP6JbiwotGXMjp9tg9WOVVFJcHM9Xnxboj+P4Ahk7X
 5jFAAAA
X-Change-ID: 20250620-rimob-initial-devicetree-da86a5bffc8b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750728014; l=1437;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=foJ2K/ZpjDvVVoJeKpVYHYwLURY6EEUJZt1ly5Hact8=;
 b=ZlOh7EirdRjDdQRdnpwH3jvcS6HklJ09V5r5PBOElv2NnZ+ZlhKZSCO14RRG3pdacvUTVvWdA
 xxWwUH80wZeAPAiHjA8m1aYolbDjyH72QCxLH/rdg0Q0AnJ0Hh3ItkE
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

Billion Capture+ is a handset using the MSM8953 SoC released in 2017
and sold by Flipkart.

Add a device tree with initial support for:

- GPIO keys
- SDHCI (internal and external storage)
- USB Device Mode
- Regulators
- Simple framebuffer

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
Changes in v2:
- (patch 3/3):
  - add unit address and label to qseecom (Luca);
  - reorder properties alphabetically in gpio-keys node (Konrad);
  - fix hex values in reg address and size cells: from 0x00 to 0x0 (Konrad);
  - add regulator-allow-set-load property to regulators supplying sdhc1/sdhc2. 
- Link to v1: https://lore.kernel.org/r/20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com

---
Cristian Cozzolino (3):
      dt-bindings: vendor-prefixes: Add Flipkart
      dt-bindings: arm: qcom: Add Billion Capture+
      arm64: dts: qcom: msm8953: Add device tree for Billion Capture+

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 255 +++++++++++++++++++++
 4 files changed, 259 insertions(+)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250620-rimob-initial-devicetree-da86a5bffc8b

Best regards,
-- 
Cristian Cozzolino <cristian_ci@protonmail.com>



