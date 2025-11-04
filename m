Return-Path: <linux-arm-msm+bounces-80328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 254EDC319E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 15:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80AFC3BB8CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 14:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BC532E694;
	Tue,  4 Nov 2025 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehE/zfGW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195B5247280;
	Tue,  4 Nov 2025 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762267652; cv=none; b=Ir6+XoTG0zRLd0unEM3yziIl+Fce4oU6bokPYZpMi/G7uutT97SX4fQPdvX9MVVOv1nLZ/UjXn7+2HgOYhtNsQfIdE0geBcTuMmDOV7H4k0hF2ls8+fxldlhlL2QPybTPUaQEC6vKWhIENVIOFcpZCKNb/6EQ3coZsCc3CwQj60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762267652; c=relaxed/simple;
	bh=OV4P0dQlw5eQa4hMgT36AAPIOMd8iH5vmSgWbIqbY4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MEOOunJoe4JG2vA+W9QO+pmDJ764r+4Z1ivtG04I2FV0OYCnqSDLzHfRme14/uDE8HSH0OJofLF5qu7cdx6DZi9EtXc5r6kjKodRGEz/Q9ZjT0KftA80dhEf9mWF5n6mKEEEogH13tcXBny46NuDezx1MR6l2c9Iir9ppI3bLs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehE/zfGW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22102C116C6;
	Tue,  4 Nov 2025 14:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762267651;
	bh=OV4P0dQlw5eQa4hMgT36AAPIOMd8iH5vmSgWbIqbY4k=;
	h=From:Date:Subject:To:Cc:From;
	b=ehE/zfGW7oviD32/eocltTKVSmt7z9hmZsUx1/87iegaZf0nwsZ4KNmLLrqy2f2hq
	 pec0AgwhXm8j43kZjvK9qPqn1pvz0tZACT3Mf6iJz56la1kKXStrBpWwsR14wxjHnN
	 MUOcOeabxXw9I3mwd2WfglDWQ6znfVhgZGYZHgQxeBGRmk7cDECbNNAMRr03O7b6fQ
	 xS1Seuejdy2zKg7ey6CoWiVCR1KEFBa0AZspkk+Yzu0ESiNqubrFEaj7mlhvLnEnfc
	 V5BPguqduKwxsNtbbeQ8Urf1a93M1f7iNRcEJXwyj0qn/XQjUfPykUwUlz40PLtbth
	 3jHqBlM5zKy1w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 04 Nov 2025 15:47:26 +0100
Subject: [PATCH v3] dt-bindings: iommu: qcom_iommu: Allow 'tbu' clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-topic-qciommu_bindings_fix-v3-1-09c52a1e5ffb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP0RCmkC/42NWwqDMBBFtyLz3UgeSrFf3YeIaIw6UBPNqLSIe
 +/UFfRnLudyOXMAuYiO4JEcEN2OhMEzmFsCdmz84AR2zKClzpVUuVjDjFYsFsM0bXWLvkM/UN3
 jW5i2N4XMZKbaAlgwR8f1JS8r5hFpDfFz/dr1r/1Lu2uhRCN7Y+8y7zifgShdtuZleZzygeo8z
 y928K7gywAAAA==
X-Change-ID: 20251015-topic-qciommu_bindings_fix-3bf3904041b9
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762267648; l=2802;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Ao2GpzsTUbbPp3qeDPkivYO7J3zJnsKyZE+xMiE7snU=;
 b=LvZA7Lsa2QhPRHhjFRsSsqTe8uaJw2ig9tJTgmBE0EQJYaC4bLy+/ijbo2uYoG04jNR/cWunR
 3RW4C1hzK+LAKPQ5lncjMja3Xv99pUj1G5OgZzSqZtu5/aU46qiARMm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@linaro.org>

Some IOMMUs on some platforms (there doesn't seem to be a good denominator
for this) require the presence of a third clock, specifically relating
to the instance's Translation Buffer Unit (TBU).

Stephan Gerhold noted [1] that according to Qualcomm Snapdragon 410E
Processor (APQ8016E) Technical Reference Manual, SMMU chapter, section
"8.8.3.1.2 Clock gating", which reads:

For APPS TCU/TBU (TBU to TCU interface is asynchronous)
Software should turn ON clock to APPS TCU
  - During APPS TCU register programming sequence

For GPU TCU/TBU (TBU to TCU interface is synchronous)
Software should turn ON clock to GPU TBU
  - During GPU TLB invalidation sequence <=====================
Software should turn ON clock to GPU TCU
  - During GPU TCU register programming sequence
  - While GPU master clock is Active

The clock should be turned on at least during TLB invalidation on the
GPU SMMU instance. This is corroborated by Commit 5bc1cf1466f6
("iommu/qcom: add optional 'tbu' clock for TLB invalidate").

This is also not to be confused with qcom,sdm845-tbu, which is a
description of a debug interface, absent on the generation of hardware
that this binding describes.

Allow this clock.

[1] https://lore.kernel.org/linux-arm-msm/aPX_cKtial56AgvU@linaro.org/

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v3:
- Expand the commit message
- Link to v2: https://lore.kernel.org/r/20251015-topic-qciommu_bindings_fix-v2-1-a0f3c705d0f3@oss.qualcomm.com
Changes in v2:
- Resending from a 2023 megaseries, no changes
- Link to v1: https://lore.kernel.org/lkml/20230627-topic-more_bindings-v1-7-6b4b6cd081e5@linaro.org/
---
 Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
index 3e5623edd207..93a489025317 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
@@ -32,14 +32,18 @@ properties:
           - const: qcom,msm-iommu-v2
 
   clocks:
+    minItems: 2
     items:
       - description: Clock required for IOMMU register group access
       - description: Clock required for underlying bus access
+      - description: Clock required for Translation Buffer Unit access
 
   clock-names:
+    minItems: 2
     items:
       - const: iface
       - const: bus
+      - const: tbu
 
   power-domains:
     maxItems: 1

---
base-commit: 12132ce56439eaefea25c647d850eeed99179d88
change-id: 20251015-topic-qciommu_bindings_fix-3bf3904041b9

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


