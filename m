Return-Path: <linux-arm-msm+bounces-62926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DC5AECB42
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 06:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A17313B7A6B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 04:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDE31CEEB2;
	Sun, 29 Jun 2025 04:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUakTEYO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C981993A3;
	Sun, 29 Jun 2025 04:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751172311; cv=none; b=RFOZWDm8nuWqdhsvj2xYbidunwxHE4z/tLwULHqriftlgrFQhl1wJ0CqGL0qFxFBKxTSWI1IM0KqRdRCa5K4lm6KiyOyE8TC3Mu+uI3ICOPj25DBQ5Xu7LwAVmjeJalWkiCGTtf7LRc+pBJnMOs73scAWFXQWfUGl/iT75p7XLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751172311; c=relaxed/simple;
	bh=zSHtudQhspfSSyLk8tdd0fX3l7uamn9t+KhKu8UZiCY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WBQCtCSBmozQTxPf7liqLSsAMmOKL+qZ1R2GRrxFPREz78LQ7Y3mceWc0RV3r8tgmGmK//xpFwkv0PULZvcWg8RvYxX5LchwHMh5IeXmmSy9QZfdXxU16/vAr0I4R2ETSFzvsVakcDVc/Qy97AsPOys4lz91y5ftHlaynti7CKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUakTEYO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A3B2C4CEEB;
	Sun, 29 Jun 2025 04:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751172310;
	bh=zSHtudQhspfSSyLk8tdd0fX3l7uamn9t+KhKu8UZiCY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=AUakTEYOrNRL3YRUTzdJ8rMB6j5/WkxQhNFEPQ4g49jgbBZY3rZZFyU4EpCrIuSHv
	 aE0PB4jugiwoBjDkrYpCGR/enVus4FwLuamJYcWuN/b8JoI3rJOk1kmmHI8g2GR6Hb
	 7JqKgBHRapwAsJTHG9nQ/3KJfTH9WWngTlL6zGmNpGXqH5Sq7dY7JCfvZBxKxU4dLo
	 sP93xyjaffny7WnQjvduzWDYiRhsn3gvmCmLSTBR30yM7V+U2QAHHiPd70uYXi77rD
	 C0xjYSFwOm+NtSKA/oCbkMZbkg0Y47wvuEwz7gNutH59EdFMVGqmQW4vKZJyEpLY+3
	 OX+wkQT3r8Ptg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3ACC83026;
	Sun, 29 Jun 2025 04:45:10 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Subject: [PATCH v4 0/3] Add initial device tree for Billion Capture+
Date: Sun, 29 Jun 2025 08:44:36 +0200
Message-Id: <20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANTgYGgC/43NQQqDMBCF4atI1k2JSYy2q96jdBGTSR1QI4lIi
 3j3RldCi3T5D7xvZhIhIERyzWYSYMKIvk8hTxkxje6fQNGmJpzxginOaMDO1xR7HFG31KaJgTE
 AUKsrpYvaOVPVJM2HAA5fG31/pG4wjj68t09Tvl7/QKecMlqBUiVonruK34bgR993Gtuz8R1Z5
 YnvNXmg8aQJ6RSTBdRGsJ+a2GvqQBNJkywvtbk4exH2S1uW5QP44IVpYQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751179514; l=1750;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=zSHtudQhspfSSyLk8tdd0fX3l7uamn9t+KhKu8UZiCY=;
 b=rhvxuydmL5s0TYucKsFuKoDAlvODOBD28ksHeqhEra0+S99uWxSS14Nd9I66CJ80e30IjdeJq
 nxAhVzNGdp5C/W/iMeacQD994ZJE+ffXsAScpapDKT7TawejYIEFNp3
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



