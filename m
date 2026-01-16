Return-Path: <linux-arm-msm+bounces-89310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF72D2C794
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F1C33064374
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 06:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FD134D4EC;
	Fri, 16 Jan 2026 06:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPu0531P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD8A346A0D;
	Fri, 16 Jan 2026 06:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768544440; cv=none; b=Y8zMd3MeOn7QJc8fCcKtYbQ7DINNLNQVDee25udX0S9guhAt9dBUayg5ef+gmvM7uKZGV5uYadP57lDoBuCkSU7gZ+tfGYtkwrP0FYE6xLbPC33kx419kgzEyROujboU1uAl9X7GJQjzxLcSSQ3cvKmmXFVTOU4CvRGjaL0etN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768544440; c=relaxed/simple;
	bh=ly84ixe5RxVypu7W+U0r4f7IqMlM2yIbUGr2Q83drGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYgG9pBP5kX4g1kRa9KKcILZlMJUbFH9S1hTL1lqkhSLyDpY8kylhkJWbT8W85nPQFEzojNKTaNVJt/FMnAN/4s9cba+jaL1pBuE6tQIZQ5cO6HfN/LfjOQuTx5reDQAHnSN/eh09FB0/DAXZXjKPW9iXWkhNxsHClsi1ekIbIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPu0531P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0DDC2BC86;
	Fri, 16 Jan 2026 06:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768544440;
	bh=ly84ixe5RxVypu7W+U0r4f7IqMlM2yIbUGr2Q83drGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qPu0531PwPkv+yGvWpp4mKlFJG6k6YnXDWr66aao2ajJjKPR+G/mb0dkHdWnnQnj6
	 HqKONcuf54MzXtP7itu+N94TKGXGjJEBp97fOFsAKzQeeymVs3JgC5Zq0MJryExM6A
	 T2fRftVx2v82A517cTM49MVHe1DueAek3EKcZHDDoaOzMk09+41TqmRxQ4CMZw45Fr
	 CDR5DoizX/WJZcmvsYoTzXF8yFxSXAjG+shF2b+aHdIRMlQ0wtbyXXuK4xCaIoZyO+
	 sed+FsDYDXKVw+QhUfZWh2+0TBV6kTGI3BiE6hIMGULNdcnreaDymuAKWJBdYFY5ou
	 /bSLfWvrdMYAA==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	loic.poulain@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v2 2/3] media: dt-bindings: venus: Fix iommus property
Date: Fri, 16 Jan 2026 11:50:03 +0530
Message-ID: <20260116062004.237356-3-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260116062004.237356-1-sumit.garg@kernel.org>
References: <20260116062004.237356-1-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Fix IOMMU DT propety for venus via dropping SMMU stream IDs which
relates to secure context bank. Assigning Linux kernel (HLOS) VMID
to secure context bank stream IDs is incorrect.

The min value is added for iommus property to ensure in future when
secure context bank stream IDs are properly supported then the iommus
property is extensible.

These DT bindings changes should be backwards compatible.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-venus.yaml       | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 3f3ee82fc878..ae6bc0d0bea6 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -42,6 +42,7 @@ properties:
       - const: vcodec0_bus
 
   iommus:
+    minItems: 2
     maxItems: 5
 
   interconnects:
@@ -102,10 +103,7 @@ examples:
         memory-region = <&pil_video_mem>;
 
         iommus = <&apps_smmu 0x860 0x0>,
-                 <&apps_smmu 0x880 0x0>,
-                 <&apps_smmu 0x861 0x04>,
-                 <&apps_smmu 0x863 0x0>,
-                 <&apps_smmu 0x804 0xe0>;
+                 <&apps_smmu 0x880 0x0>;
 
         interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
                          &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
-- 
2.51.0


