Return-Path: <linux-arm-msm+bounces-63834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EEDAFA1C0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 22:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93D317B0B9A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 20:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD0123B602;
	Sat,  5 Jul 2025 20:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwZ4Xgu/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82C4136349;
	Sat,  5 Jul 2025 20:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751747536; cv=none; b=bphXENFaqhIyW9tdgfilqEc1kHb93KiIEd5EUEGHikj9feG0EnKQZvYL4bcTujPmms8+SV131aluILeV47632mGMi3GyPss3II9zjdzTreIRL678LtaBcWIoufU8hD55q4XCpJPd6n4Nv3x/XJ64lc5RRYeccA0TPLPuwXuX/dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751747536; c=relaxed/simple;
	bh=T315NsZpD0PY64MoVHiLfFXWMu8FJAXT9C23gwraGvk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FroZU7HjUjaur5UfXOjR/7D4wCBkTxrAnZePX9RTWd+h0YH++Figz3gGg7YsrUu17oktiOPCqUWMSzLCSLYkSsPsDFBy12A5z4Ge+NC/XID5Lkd0HiLORkdxR07oI1Oo0ce8zbxN6d4wCAqovbPTWjIFxqrLfKLZYKeFQiWWpFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwZ4Xgu/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 416BCC4CEE7;
	Sat,  5 Jul 2025 20:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751747536;
	bh=T315NsZpD0PY64MoVHiLfFXWMu8FJAXT9C23gwraGvk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mwZ4Xgu/mL/RYFpM01SADn611ltNVXqfUnGMThEdbwspumaWOctykji6np5Ug+Yl9
	 pcEf53DvIeWpdfof5UaABIoJBJhIG5ADi7fjIforfusMkL/aiOQMB9pLgYifLQ9g4j
	 mRqAeUSPih7Eqx1IXoFrLCzQ0FgFeitpJbpoLDsv65A8CiB1xD/n+6OwIq+Vh1JeEb
	 DbYoFVSt0jmXfwSGTertYQe9MoxxTqVo+dpxBDxdrwwodbWDfuNjYGeDYo2Zmpc5wv
	 qM0rAVggp5z4/KYBqFy65/U87qbSYNgkRbNGXBixNj1loYiINl284+bC1Uwlpu6Eg1
	 oP6pNk0gtzalg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3C3C83F07;
	Sat,  5 Jul 2025 20:32:16 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v4 0/3] arm64: dts: qcom: x1-hp-x14: Add support for
 X1P42100 HP Omnibook X14
Date: Sat, 05 Jul 2025 22:31:53 +0200
Message-Id: <20250705-hp-x14-x1p-v4-0-1c351dbeaf18@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL+LaWgC/33OTQ7CIBQE4Ks0rMXw3+LKexgXpYCQNNJAJdWmd
 5d2pYl18RbzkvkyM0gmepPAqZpBNNknH+4lsEMFOtfebwZ6XTIgiHBUIwLdACfMyg3QKEosE1J
 oKUApDNFYP23Y5Vqy82kM8bnZGa/fn0zGEEGCJeXCNJSg+hx6nToXQp9C/xjLonRU/gVWM5N9h
 xSntVzxptFY1vKvQz8d+uXQzbEGI6pYWbXrLMvyBvL/7DdBAQAA
X-Change-ID: 20250702-hp-x14-x1p-eb32f4696d96
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751747534; l=2465;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=T315NsZpD0PY64MoVHiLfFXWMu8FJAXT9C23gwraGvk=;
 b=9SQH6RXV6gUVN4z6ZlxStjsbRix6VdOv4nfUVyD9Omp8wABWkK4cpmchArWR542I038mpoAST
 uOeNQUsZW/YAcc9lsXVti+coNiRYdn1kCABM+ePUe05B4yVrLvyb7f0
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

This patch series adds support for the HP Omnibook X Laptop 14-fe1xxx. [1]

Since this is actually the same model as the 14-fe0xxx, but with an
X1P-42-100 SoC (Purwa), it needs a slightly different device tree.
To have as minimal duplicate definition as possible, the hp X14 gets 
commonalized into a dtsi (and it stays compatible to the derived 
device trees, like the Ultrabook G1q). 

The supported features are the same as for the original Omnibook X14:

- Keyboard (no function keys though)
- Display
- PWM brightness control
- Touchpad
- Touchscreen
- PCIe ports (pcie4, pcie6a)
- USB type-c, type-a
- WCN6855 Wifi-6E
- WCN6855 Bluetooth
- ADSP and CDSP
- X1 GPU
- GPIO Keys (Lid switch)
- Audio definition (works via USB and with internal speakers)

[1]: https://www.hp.com/us-en/shop/pdp/hp-omnibook-x-laptop-next-gen-ai-pc-14-fe100-14-a4nd1av-1#techSpecs

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Changes in v4:
- leave the qcom,jp-omnibook-x14 ABI unchanged, reuse it for the -fe0 variant
- hacked b4 to create an easier reviewable patch: https://lore.kernel.org/all/20250705-format-harder-v1-1-55c5342be55c@oldschoolsolutions.biz
- Link to v3: https://lore.kernel.org/r/20250703-hp-x14-x1p-v3-0-affe103b4356@oldschoolsolutions.biz

Changes in v3:
- removed copyright strings
- amended changed commit message  
- Link to v2: https://lore.kernel.org/r/20250702-hp-x14-x1p-v2-0-af5b588d1979@oldschoolsolutions.biz

Changes in v2:
- remove pm8010 handling
- Link to v1: https://lore.kernel.org/r/20250702-hp-x14-x1p-v1-0-219356e83207@oldschoolsolutions.biz

---
Jens Glathe (3):
      dt-bindings: arm: qcom: Split HP Omnibook X14 AI in SoC variants
      arm64: dts: qcom: x1-hp-x14: Commonalize HP Omnibook X14 device tree
      arm64: dts: qcom: x1-hp-x14: Add support for X1P42100 HP Omnibook X14

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   | 1549 ++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1542 +------------------
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |   40 +
 5 files changed, 1594 insertions(+), 1540 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250702-hp-x14-x1p-eb32f4696d96

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



