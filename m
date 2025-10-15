Return-Path: <linux-arm-msm+bounces-77448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE70BBDFB54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 18:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FF7619A7C1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF463375D3;
	Wed, 15 Oct 2025 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0qBOm0Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907F0299AAF;
	Wed, 15 Oct 2025 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760546514; cv=none; b=aLM/11lzmy5yYO/YynXw50mYKrGOz7lOO0IOLNHdtUWrVJjYiSs+HBiDNrF9ieitZKNp1Cnvf7AF6ZFXrwLPzxoB48RCwln/MIFj6InUaiktk0fYQbkXkBe6z7lqdQUOESMX1NkVISPQAeHRKkj85MBo4cvMCB0pslFde6DBfnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760546514; c=relaxed/simple;
	bh=KlVCyGgUz5XIlqePEJ/OlZrg0uGPQsVNFR1PVeTqCUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DS6KhPU+9o43BTCi20b/+19/5mH252TL3CdNSXNSR/FOoNrm6mXE4ceDCA4gcl/74BzuOvqp3tSa2r+opXg1Z9u0e44Y4vq2OsqUjrrbSwjt38tTo2g/k2LMTeZI1iDgR2EEQgSJQWfXEEGBo6s+1/Kpnl05HfcqWEhuhdvnwCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0qBOm0Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC554C4CEF8;
	Wed, 15 Oct 2025 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760546514;
	bh=KlVCyGgUz5XIlqePEJ/OlZrg0uGPQsVNFR1PVeTqCUM=;
	h=From:Date:Subject:To:Cc:From;
	b=I0qBOm0Z2/tc3sEH2l70njlgETs+j72TRoDCo/fyc9SQCfukvY8tluA2z7iu2gHCD
	 ykBJRXa4zie8ERiNeOiJ2hclx70sV8zt4+csKRHshc+TirQzphz2l2SukEUeoyJDzf
	 QSkNS3UAAGLmxAjmRRK4fHL1f8VORvQW9kbZTkBSngEgn7ztFvLjIhN+m5kN6Kni1b
	 iWXRdOTklyNYg3TmiIRT357AkXOoamEsfgMZI8TaSnRVqq8nJpSXlNAC5l+9JLmJIQ
	 GnqWb+TbIePYnT76aiYMAAGZiCE4q7ON/MvSHldC4ZzbA6ZMwb0CA+3KWKdLAaJnhd
	 StCdkattJvnBg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 15 Oct 2025 18:41:39 +0200
Subject: [PATCH v2] dt-bindings: iommu: qcom_iommu: Allow 'tbu' clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-topic-qciommu_bindings_fix-v2-1-a0f3c705d0f3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMLO72gC/x3MQQ5AMBRF0a3IH2vSFgO2IiJaH2+gpUUkYu8aw
 3MH96HIARypyR4KfCHCuwSdZ2SXwc0sMCaTlrpSUlXi8Bus2C38up69gRvh5thPuEVhpqKWpSy
 VqSkNtsAp//O2e98PmOZ3UmwAAAA=
X-Change-ID: 20251015-topic-qciommu_bindings_fix-3bf3904041b9
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760546510; l=1533;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ukRR5bWJ+aLmleCv/mJOTVQdYgkBJtlLw5GEKWo0h28=;
 b=IZLbwDL1JevtDgudG5xbfB2AjUxhIEwqh6siVzWXJnMJspvnEkgMlKmuedqh1Nm8u2D/LFait
 fFyY02bOc27Bz9Y/vRa0bsmSiKIXknuTvNMg701DbdtX0uG5tKOD3WR
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@linaro.org>

Some IOMMUs on some platforms (there doesn't seem to be a good denominator
for this) require the presence of a third clock, specifically for
accessing the IOMMU's Translation Buffer Unit (TBU). Allow it.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Resending from a 2023 megaseries, no changes

v1: https://lore.kernel.org/lkml/20230627-topic-more_bindings-v1-7-6b4b6cd081e5@linaro.org/
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
base-commit: f5450b214b2440192a238d0c4af9f725810f8e01
change-id: 20251015-topic-qciommu_bindings_fix-3bf3904041b9

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


