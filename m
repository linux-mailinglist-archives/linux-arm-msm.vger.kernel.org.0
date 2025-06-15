Return-Path: <linux-arm-msm+bounces-61329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EDBADA394
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 22:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12D1C18900E8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 20:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1222C27F74C;
	Sun, 15 Jun 2025 20:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7ArhAgM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C2F29A2;
	Sun, 15 Jun 2025 20:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750019750; cv=none; b=eGkja5ZMu74rHINySrQQ6HBP0wwZsziJDXKiIXIpCKYM4HpPGMe4JdP1/1v5WKXEwXqzGhrvOZJ63o9W/6EzRb2qJz+n3DksckUB0oi4T4LwL3uFhqvbMMljUiD3Zl2h5V0Yiv8rx7ZvsHI6+AeVJwQdFdqlsS0+1XXMn3KYdNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750019750; c=relaxed/simple;
	bh=SBC2qdWRPcC2wPKUJVvs1+BF12UOwaCCeZuIbZRDQZg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hJZDVmA+AH0ESKZwwccjHOeiHtPWSkY/CCo+BQm9nVXSG+X3oRCGquLTCqw0tztWpfU/8US07R/G9X+2N2dY/ljYMgrxrmFh84eedFl81ZD4mHlmrHHG2Zl7J6ywS/gHNK2Yn2C5v9SwNoMP10EldkIWHxw5BXP9rY/ywKJfQTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j7ArhAgM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44EA1C4CEE3;
	Sun, 15 Jun 2025 20:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750019749;
	bh=SBC2qdWRPcC2wPKUJVvs1+BF12UOwaCCeZuIbZRDQZg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=j7ArhAgMJq/WhC8y5Xwvuvw6YwMNI+p0TA+QDk9V9zWiYMMnVTyah5mMwCn+8Yqob
	 9GUtoH9sTQJVGE2wQZ0c+1nW8gA/kEfM/tYV/jNIYLhBUBbIpw5a9E04mO7ImUy7Dg
	 eTXejvho+/Bfx/QuSELev+u5v0P6IETG25ORS/yd16K25wUR7bAZUY3zZbsatztiEJ
	 9hPrDvLt7OckVVPvAjbAWnVay0tyMUOiOmK71kd4+Wn3Gp6snQBO1KBj5zXGo2ojyW
	 65cnirzfwkAA9CH1HmEquz7wlGvH7ZVOaKy/dqEhCUtNz3bRJ1gNBSNP4Ob0Z3i8XL
	 j1AgRIIyPkQ6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BD2C71151;
	Sun, 15 Jun 2025 20:35:49 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v2 0/4] arm64: dts: qcom: msm8976-longcheer-l9360: Add
 initial device tree
Date: Sun, 15 Jun 2025 22:35:02 +0200
Message-Id: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHYuT2gC/0XMQQ6CMBCF4auQWVvTDkKNK+9hWEAZZBID2IEGJ
 b27lcS4/F9evg2EPJPAJdvAU2DhcUiBhwxcXw93UtymBtRY6NKgap5rMT0WUa1FMqYrztY6SPf
 JU8frTt2q1D3LPPrXLgfzXX9I/keCUVph47A95VbburzWE89vcf2RFqhijB9P0WBxogAAAA==
X-Change-ID: 20250612-bqx5plus-d72e11f5877c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750019747; l=1306;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=SBC2qdWRPcC2wPKUJVvs1+BF12UOwaCCeZuIbZRDQZg=;
 b=OHSlQmNFjvIRKLd4dGtpIC39Fiza3MjyiAjR8nEKqyJxjjXzYoNLnhhxuEosVwmXYi/LozfHd
 1wDqJ3NJr3CD60afO8lKntyR2bmhTs/sgS5PhM5WTaPz8nINmB8XCFu
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

This dts adds support for BQ Aquaris X5 Plus (Longcheer L9360) released
in 2016.

Add a device tree with initial support for:

- GPIO keys
- NFC
- SDHCI
- Status LED
- Touchscreen

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
Changes in v2:
- Add Fixes and R-b tag
- Move sdc2 GPIO definitions into msm8976.dtsi (new patch)
- Remove comments from rmi4 nodes
- Don't touch tz-app memory region. Currently, the bigger size seems
  not necessary.
- Link to v1: https://lore.kernel.org/r/20250613-bqx5plus-v1-0-2bc2d43707a6@apitzsch.eu

---
André Apitzsch (4):
      arm64: dts: qcom: msm8976: Make blsp_dma controlled-remotely
      dt-bindings: arm: qcom: Add MSM8976 BQ Aquaris X5 Plus
      arm64: dts: qcom: msm8976: Add sdc2 GPIOs
      arm64: dts: qcom: msm8976-longcheer-l9360: Add initial device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |   5 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/msm8976-longcheer-l9360.dts      | 490 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |  38 ++
 4 files changed, 534 insertions(+)
---
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20250612-bqx5plus-d72e11f5877c

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



