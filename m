Return-Path: <linux-arm-msm+bounces-65202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0BFB07310
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5789567B6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066242F49E5;
	Wed, 16 Jul 2025 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NefkaHFR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6072F4338;
	Wed, 16 Jul 2025 10:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752660999; cv=none; b=hmgQCIbXtYfy+6+VoQ/tIg7//qSlyg4nsfvA9yROKc9xt/+ozBajmN0P1+5feiSGOYRJ5Z2CZagRwLq+SfRRBpoTL6/mAIfuctNPNewjUv7xkhEYDGkUtL7YYxuej5kMV5rCyzhp/QwHbQvHT4QBBaDUyesP4tQS61XigYqlaXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752660999; c=relaxed/simple;
	bh=yzWNQLcs7Lwt6DD7p/V1fRiZ01xlkbaqpa3oO6VxBas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jt1tgTyLY+2yDx+pZe1tygFDZikthhXqWnX4YXcrlm1x9/JJIu89cxK+ptFZJA0U1ME5nirm+cyTHsBG1bcClqsOZhYOIRUMbSz5T8W3HmxSrMZ3mWQQc+CkQC6+e1Fy76peJJ6xSjAhaMuXN+PQ26Uom9WmiEpfvr9wf5G5rmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NefkaHFR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A20C4CEF0;
	Wed, 16 Jul 2025 10:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752660998;
	bh=yzWNQLcs7Lwt6DD7p/V1fRiZ01xlkbaqpa3oO6VxBas=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NefkaHFR6S5g0x0GDS++IeHYKPWNJAO489ElZsmLXmWPmNXVZabxVre1ahgGcIiav
	 ZmBcrnWy1VREAZoFoyz4n16y9FNCOksWU6cXbbH7PRKI8AiKHtOLMM02g37hfO4sQm
	 ZDvVwdNSgk/rUTm+TmwtZdHjCES0miji19oc+G0kACm6/qNgaNBep47eRvDJed5ONT
	 Kl03GLzpDR2DuqQjUxPq1UYrsaAcqOCID3hQOLKqcL+z8l/nTuUk85ODyHsx0AScgT
	 Z27xcmfrSUbDHKGcSHcxy3zoCt+dzRty+wYYrqheQXQrDoxMNs/3sXkLHgdInFEGUK
	 al1rjY5eNcc9Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 16 Jul 2025 12:16:09 +0200
Subject: [PATCH v2 3/4] dt-bindings: arm-smmu: Remove sdm845-cheza specific
 entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-topic-goodnight_cheza-v2-3-6fa8d3261813@oss.qualcomm.com>
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
In-Reply-To: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752660979; l=1379;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=If/HtxS4xxNGL8GUie6r+h4GnTXXUuSRIqq3TrpnSUk=;
 b=TZslEKRzA3k6BoNEr8M85s8UXCI/i+n2G3yhNJmsWJ6LNRz8A1+HnOi6lh+8Kh89OcaeVXVQh
 aeaFdj3TK1uBytOC36NJ6IYE5CaN9SNJC5KpJ3RTJvs5w/OPMe8Kzvd
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The firmware on SDM845-based Cheza boards did not provide the same
level of feature support for SMMUs (particularly around the Adreno
GPU integration).

Now that Cheza is being removed from the kernel (almost none exist at
this point in time), retire the entry as well.

Most notably, it's not being marked as deprecated instead, as there is
no indication that any more of those ~7 year old devboards will be
built.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 7b9d5507d6ccd6b845a57eeae59fe80ba75cc652..646814ec7d15f6d8a0136de73b7eaddae232ea64 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -132,10 +132,6 @@ properties:
               - qcom,sm7150-smmu-v2
           - const: qcom,adreno-smmu
           - const: qcom,smmu-v2
-      - description: Qcom Adreno GPUs on Google Cheza platform
-        items:
-          - const: qcom,sdm845-smmu-v2
-          - const: qcom,smmu-v2
       - description: Marvell SoCs implementing "arm,mmu-500"
         items:
           - const: marvell,ap806-smmu-500

-- 
2.50.1


