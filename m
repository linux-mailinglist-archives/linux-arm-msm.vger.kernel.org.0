Return-Path: <linux-arm-msm+bounces-62558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C76E8AE8F1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 22:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7372D5A1492
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 20:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECC220D4F8;
	Wed, 25 Jun 2025 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ujmi3TUW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A96B1FE47B;
	Wed, 25 Jun 2025 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750881878; cv=none; b=cERq0ZBv2zY2MyxUp5yWam7gAXTk2+N727O8awHh4XututqbMMrq/XwV09jqM1tQO0YHahD4S8BV/XTfawRWaT5Tvgf01wdAuPQAsLg1jVuwMI9DQ8BfIX3Im7UgtXsUG3nI0X0RrK1uywOuxslDas+t7h1sCE3dmOZ9HogZYFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750881878; c=relaxed/simple;
	bh=oi4nmOkgUH8qBiEH7+3hBQBtcU6SViOVAb/7d5YTPNc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H92K1aSBeaEE1kP94BaC1RHGSJyZKG8dD+vY9aoIdVUUHvlyLTZCStC0EijpWBimHxJa51C8Aw6JsrxuUNOX34ztNCJgmPdoGrLg7zgYA2WY1qh2qNKDX/WVUyRR5G3NjMCD67FgEIskEPdyw9DRIMM8lU1EUZfDTyHxV0LknSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ujmi3TUW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDF37C4CEEA;
	Wed, 25 Jun 2025 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750881877;
	bh=oi4nmOkgUH8qBiEH7+3hBQBtcU6SViOVAb/7d5YTPNc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ujmi3TUW3CY6sYw5UsebZIzckZEIxFBhkWPq0/gim7X5uE26yp0tMMpE7XHNCFTWB
	 XkNh2H+x1NdmAqp/g0QcMQOfglEjNdP6C96vt7rSeS3VNYEIn9NduBYPqWyP0DHH5p
	 oFHCRQlV0w2WZircn0YuJIaCaaETFkrnaIgfatq1GqD53meweEZT+r9CWdbhJF6JLn
	 9bkJK7GeN1qhK9yoGqPP8JgfsQ1M38gCTuz0sVhJ3+ESJt94HXsHBVmWMfBPpatOAo
	 3byB21rIktU+nB8t45mpMrpLZ5Olcd/rJATzGzJAiY4vuCrH1w5rWCfexgdpOxGM4r
	 6UvJHtux4jIqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A29C7EE31;
	Wed, 25 Jun 2025 20:04:37 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Subject: [PATCH v3 0/3] Add initial device tree for Billion Capture+
Date: Thu, 26 Jun 2025 00:04:25 +0200
Message-Id: <20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGlyXGgC/43NQQrDIBCF4asE17UYk1jpKvcoXagZm4FEg4q0h
 Ny9JqtCoXT5D7xvVhIhIERyrVYSIGNE70o0p4qYUbkHUBxKE854xwRnNODsNUWHCdVEhzIxkAI
 AHZQUqtPWGqlJmS8BLD4P+nYvPWJMPryOT7ner3+guaaMShDiAorXVvJ+CT55NyuczsbPZJcz/
 9TaHxovWtNawdoOtGnYl7Zt2xuj9rHGEwEAAA==
X-Change-ID: 20250620-rimob-initial-devicetree-da86a5bffc8b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750889075; l=1601;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=oi4nmOkgUH8qBiEH7+3hBQBtcU6SViOVAb/7d5YTPNc=;
 b=8qVk1VlGFAm2TG8RjhqDQ8JZmR+hhMIJO6jSPxyyaszT7QFUf5vuGRrv1N4GRlaVQRc/Jx5lF
 CjI1UgPQEwvCALijkhMquddBF6QaJovxsIPVWIcgk07LIbxMuwjIWkb
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



