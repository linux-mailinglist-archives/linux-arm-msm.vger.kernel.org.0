Return-Path: <linux-arm-msm+bounces-68568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67766B2151B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 21:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9261A1892D34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 19:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2803E2E2840;
	Mon, 11 Aug 2025 19:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loxe7TVv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB4E28467D;
	Mon, 11 Aug 2025 19:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754939251; cv=none; b=qWLHspJzozJs8l3GoR7cKNzMOyILdVA25KnGdIrquOShXv0+MKsqsIhIh4z0VrbBCgla1Za+31w/4COBsjSrLlQ5w+BLtbSBvG24VL63qaYDINGM77U5ZBmGBNI3p2QnNrZOAcU/vWMW5D6hNC3Q6dBi9IeuKahNVkP3RvIFBRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754939251; c=relaxed/simple;
	bh=iGpOrPiTcjSqjaJKYglayvOHuHZxT9a26u3piPV43Cc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uNbCwycfX/XzKt+IOvy2V29Rv5GOIwNofab6+i9ih6uTJGGxm4Ml1lR3QGYJKUJFIYHXJGq2mlypkqCWWWyysMshtrDLBf7Ty+k/oixtIGht/UyILXphwLkqDe9NitHIs1yxcH9ARkjNhcB25NsfmSyrjl4aC/sZod8NVQV4FWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loxe7TVv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89E69C4CEED;
	Mon, 11 Aug 2025 19:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754939250;
	bh=iGpOrPiTcjSqjaJKYglayvOHuHZxT9a26u3piPV43Cc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=loxe7TVv6lBBvMW0+RtpvQ/F17Y/icZv2CPmnWb6d2If7AXHqNYTm9+l6roWHyaXU
	 SWkz2IoqMcAJRGuh44t7yRAtP7nBuNGoDq+uC3jnYoEopUfNTNsgkWqn0sMqbkqkOh
	 gTnOaTk9GxFtAsUzVhRH59oLE8FEyWVSZ3+h4X4e3lFUmXc6GTB03S8Gr5e798FSUH
	 zI/li8KobgXqlXFuVsOYo6398DUO37q+cJWHKtHDZM8jyWBxcfs8iu1wLTbayvLUJy
	 F5v+FLoihElRpDQyi9E0agt4ceWg6Wib7MH9tOpxOtV4L8rMNbPDz0hEgH6DxPTvGX
	 lZAo8UYCLc0iw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DDECA0ED3;
	Mon, 11 Aug 2025 19:07:30 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Subject: [PATCH RESEND v4 0/3] Add initial device tree for Billion Capture+
Date: Mon, 11 Aug 2025 23:08:08 +0200
Message-Id: <20250811-rimob-initial-devicetree-v4-0-b3194f14aa33@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754946504; l=1749;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=iGpOrPiTcjSqjaJKYglayvOHuHZxT9a26u3piPV43Cc=;
 b=oa3QBVoZJAN/3rVhLcTZ0V7gnSVN1N86UmgFi3RK8fR+G6jrEQxwN7ELV8pDcO38mOmjDAVCu
 ZjcZPYShCtsBeEaYCOSj/kxEG9WyAgA8XY1R4BIBBGIqfK6bQLNQy89
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
Changes in v4:
- pick up tags (Rob);
- Link to v3: https://lore.kernel.org/r/20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com

Changes in v3:
- (patch 3/3): pick up tag (Konrad);
- Link to v2: https://lore.kernel.org/r/20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com

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



