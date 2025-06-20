Return-Path: <linux-arm-msm+bounces-61908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAE6AE22FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 21:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42B264A5134
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 19:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDC52264BB;
	Fri, 20 Jun 2025 19:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I75LGAVC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F62B30E853;
	Fri, 20 Jun 2025 19:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750449091; cv=none; b=kAVPoW8aPVep8LeFjj5geyUP09qUGwTKvKaEZ3hBJpFL2VpjwC4/QuemPRia4vInVN+ksPNL3mxtWFCasnowX8Lrwfm9BriFl8WZ1rnNJ0yE6oNtoP0xHJWcsXL4xg/EajtW43207OzD6x4kNCyl7CSuP2p9c4O3rkr2mTNu/d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750449091; c=relaxed/simple;
	bh=enGQ4aWwrJ6GnlC2/iNO0rknwLb2cAAwftwuvIy8kpA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XAXkRziJP9/krtMiFmFBJ/k10You+38aRHroyMjYg4FZ8D/2tSwOlv8Om7K/JgEm8sGnrZKk2yd6tGNi63v6xH5YSnxsleBJ7zRG6xc+lF1BzAJU+8qm3T2DCIuiRZeyh+cW5cSDVjirs8BFFdoXtFZiWJK73C7bQn8rDqe+jJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I75LGAVC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3F31C4CEE3;
	Fri, 20 Jun 2025 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750449090;
	bh=enGQ4aWwrJ6GnlC2/iNO0rknwLb2cAAwftwuvIy8kpA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=I75LGAVCdRRQmJQME2cAaJFKFg/yfFWkcugyR5iLkTDKTUiAKWKMeSt6Zf2s5CXOn
	 zflMCjdkFsj347U3hSLniQ/DQ0xR7s7ZQVW1SQaelsgnaKesaJDJrSSh7xFMsI63bZ
	 6aeYTnd1MJz7hHFO7fuhDmxdW2/1cBSCh7dDMmciBK1/tIAqbZaVDkE/+WSJ9sfUaC
	 MGV2y8no7njcZaKEC54cTq4jJrJoORgrA4u3GPNO56zuo/5GwCt4ONuA9JA9smlG6F
	 phfOhcSjIYFHqiwcUTs7vDSbTLkFesH6Z0MoBCbc40m4HPsjgO6xLWWzXvqw2O8eLB
	 gVcpezVatatVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DFAC77B7C;
	Fri, 20 Jun 2025 19:51:30 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Subject: [PATCH 0/3] Add initial device tree for Billion Capture+
Date: Fri, 20 Jun 2025 23:51:38 +0200
Message-Id: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOrXVWgC/x3MywqDMBBG4VeRWXcgDSihryJd5DKpP9goEymC5
 N0NXZ7Fdy6qopBKr+EilR8qttLj+RgoLr58hJF6kzV2NJM1rPhugVFwwK+cOolyqAgn7yY/hpy
 jC9T5rpJx/tfzu7UbtZER4WoAAAA=
X-Change-ID: 20250620-rimob-initial-devicetree-da86a5bffc8b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750456316; l=1013;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=enGQ4aWwrJ6GnlC2/iNO0rknwLb2cAAwftwuvIy8kpA=;
 b=9txIvSHhHEff/6GqSaMoOwr+L9cgzhapHpcRzFbRMjtpQXNqtHkSJOJecH9NswPb+Y57xrruw
 qSws9wi5tJfCTEzhu8K/JLW0WqiGoQM3klV98Gq1RQFD2gbc5CuloTx
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
Cristian Cozzolino (3):
      dt-bindings: vendor-prefixes: Add Flipkart
      dt-bindings: arm: qcom: Add Billion Capture+
      arm64: dts: qcom: msm8953: Add device tree for Billion Capture+

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 251 +++++++++++++++++++++
 4 files changed, 255 insertions(+)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250620-rimob-initial-devicetree-da86a5bffc8b

Best regards,
-- 
Cristian Cozzolino <cristian_ci@protonmail.com>



